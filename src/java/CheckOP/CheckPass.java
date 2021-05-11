package CheckOP;

import DBProperties.DBConfig;
import EncryptionDecryption.Crypto;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckPass extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String oldPassword = request.getParameter("oldpassword");
            String iv = "0123456789123456"; // This has to be 16 characters
            String secretKey = "abcdDr.FuelIShere";
            Crypto crypto = new Crypto();
            String encryptedData = crypto.encrypt(oldPassword, iv, secretKey);
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");

            String query = "select * from users where email=?";
            try {
                String actualPassword;
                Class.forName(DBConfig.getdName());
                Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                PreparedStatement psmt = con.prepareStatement(query);
                psmt.setString(1, email);

                ResultSet rs = psmt.executeQuery();
                if (rs.next()) {
                    if (rs.getString(2).equals(encryptedData)) {
                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("swal({"
                                + "text: 'Verification success',"
                                + "icon: 'info',})"
                                + ".then(function(){"
                                + "window.location.href='ModifyPass.html'});");
                        out.println("</script>");
                    } else {
                        out.println(".");
                        out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                        out.println("<script type=\"text/javascript\">");
                        out.println("swal({"
                                + "text: 'Verification Failed',"
                                + "icon: 'error',})"
                                + ".then(function(){"
                                + "window.location.href='ChangePassword.html'});");
                        out.println("</script>");
                    }
                }
            } catch (ClassNotFoundException cle) {
                out.println(cle);
            } catch (SQLException sqle) {
                out.println(sqle);

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
