package Registration;

import SendMailAPI.User;
import SendMailAPI.SendMail;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignupServletController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String username = request.getParameter("username");
            String pass1 = request.getParameter("password");
            HttpSession session = request.getSession();
            boolean isValidUser = new SignUpModel().searchAccount(username, pass1);
            if (isValidUser == false) {
                response.sendRedirect(request.getContextPath() + "/AccountExist.html");
            } else {
                session.setAttribute("password", pass1);
                SendMail sm = new SendMail();

                String code = sm.getRandom();

                User user = new User(username, code);

                boolean test = sm.sendEmail(user);

                if (test) {
                    session.setAttribute("code_verify", user);
                    response.sendRedirect("VerifyCode.jsp");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sorry! Couldn't send the mail);");
                    out.println("location='index.html';");
                    out.println("</script>");
                }
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
