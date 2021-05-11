package Registration;

import SendMailAPI.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class VerifyOTPController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("code_verify");
            String code = request.getParameter("otp");
            request.setAttribute("status", "failure");

            String email = user.getEmail();
            String password = (String) session.getAttribute("password");
            if (code.equals(user.getCode())) {
                boolean insertedOrNot = new VerifyOTPModel().insertUserRecord(email, password);
                if (insertedOrNot) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('verification success!');");
                    out.println("location='Login.html';");
                    out.println("</script>");
                    request.setAttribute("status", "success");
                }
                else
                {
                    System.out.println("error while dealing with db");
                }

            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Incorrect verification code');");
                out.println("location='index.html';");
                out.println("</script>");
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
