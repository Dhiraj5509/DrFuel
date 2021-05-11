package ModifyPswd;

import DBProperties.DBConfig;
import EncryptionDecryption.Crypto;
import SendMailAPI.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class resetPassword extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String password = request.getParameter("password");
            HttpSession session = request.getSession();

            User user = (User) session.getAttribute("otp_verify");

            String email = user.getEmail();

            String iv = "0123456789123456"; // This has to be 16 characters
            String secretKey = "abcdDr.FuelIShere";
            Crypto crypto = new Crypto();
            String encryptedData = crypto.encrypt(password, iv, secretKey);

            try {
                Class.forName(DBConfig.getdName());
                Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                String query = String.format("update users set password = '%s' where email='%s'", encryptedData, email);

                PreparedStatement pst = con.prepareStatement(query);

                pst.executeUpdate();
            } catch (ClassNotFoundException | SQLException cne) {
                out.println(cne);
            }

            out.println("<html><head> <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n"
                    + "</head><body>");
            out.println("<h1 align=\"center\">Password updated  successfully</h1>");
            out.println("<div style=\"width:150px; margin:0 auto;\"><button type=\"button\" onclick=\"window.location.href='Login.html';\" class=\"btn btn-primary\">Login now!</button></div>");

            out.println("</body></html>");
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
