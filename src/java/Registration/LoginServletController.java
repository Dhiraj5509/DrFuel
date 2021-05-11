package Registration;

import DBProperties.DBConfig;
import EncryptionDecryption.Crypto;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServletController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) 
        {
            String username = request.getParameter("username");
            String pass = request.getParameter("password");
            String iv = "0123456789123456"; // This has to be 16 characters
            String secretKey = "abcdDr.FuelIShere";
            Crypto crypto = new Crypto();
            String encryptedData = crypto.encrypt(pass, iv, secretKey);
            HttpSession session = request.getSession();

            boolean isValidUser = true;
            boolean isAccountExist = false;
            try {
                Class.forName(DBConfig.getdName());
                Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());
                Statement psmt = con.createStatement();
                ResultSet rs = psmt.executeQuery("select * from users");
                System.out.println("under signup model");
                while (rs.next()) {
                    if (username.equals(rs.getString(1))) {
                        isAccountExist = true;
                        if (encryptedData.equals(rs.getString(2))) {

                            if (rs.getString(3).equals("admin")) {
                                response.sendRedirect(request.getContextPath() + "/Admin.html");
                            } else if (rs.getString(3).equalsIgnoreCase("guest")) {
                                session.setAttribute("email", username);
                                response.sendRedirect(request.getContextPath() + "/Home.jsp");

                            } else if (rs.getString(3).equals("service boy")) {
//                                response.sendRedirect(request.getContextPath() + "/Service.jsp") ; 
                                RequestDispatcher rd = request.getRequestDispatcher("Service.jsp");
                                request.setAttribute("emailId", username);
                                rd.forward(request, response);

                            }

                        } else {
                            isValidUser = false;
                            break;
                        }
                    }
                }
                if (isAccountExist == false) {

                    response.sendRedirect(request.getContextPath() + "/AccountNotExist.html");
                } else if (isAccountExist == true && isValidUser == false) {

                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Invalid email or password');");
                    out.println("location='Login.html';");
                    out.println("</script>");
                }
            } catch (SQLException e) {

                out.println("Error occured while dealing with Data base");
            } catch (ClassNotFoundException e) {
                out.println("Can't load data base ");
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
