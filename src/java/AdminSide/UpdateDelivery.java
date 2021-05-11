package AdminSide;

import DBProperties.DBConfig;
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

public class UpdateDelivery extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            try {
                String query = "Update serviceDeliveredInfo set latitude=? , longitude=?  , status=? , serviceId=? , completeTime=? , completeDate=? where clientId=? and requestDate=? and requestTime=?";
                Class.forName(DBConfig.getdName());
                Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                PreparedStatement psmt = con.prepareStatement(query);
                psmt.setString(1, request.getParameter("latitude"));
                psmt.setString(2, request.getParameter("longitude"));
                psmt.setString(3, request.getParameter("status"));
                psmt.setString(4, request.getParameter("serviceId"));
                psmt.setString(5, request.getParameter("ctime"));

                psmt.setString(6, request.getParameter("cdate"));
                psmt.setString(7, request.getParameter("clientId"));
                psmt.setString(8, request.getParameter("rdate"));
                psmt.setString(9, request.getParameter("rtime"));

                psmt.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Successfully Updated');");
                out.println("location='DeliveryInfo.jsp';");
                out.println("</script>");
            } catch (SQLException | ClassNotFoundException e) {
                System.out.println(e);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
