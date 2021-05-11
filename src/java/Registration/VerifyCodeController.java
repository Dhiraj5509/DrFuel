package Registration;


import SendMailAPI.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class VerifyCodeController extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("otp_verify");
            String code = request.getParameter("otp");
            
            if (code.equals(user.getCode())) {
                
                 response.sendRedirect(request.getContextPath() + "/resetPassword.html");

                    
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Incorrect verification code');");
                out.println("location='Forgot.html';");
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
