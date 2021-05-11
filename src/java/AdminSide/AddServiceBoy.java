package AdminSide;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddServiceBoy extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            boolean shouldEnter = CheckExist.checkExist(email);

            if (shouldEnter == false) {
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
                out.println("swal({"
                        + "title: 'Oops!',"
                        + "text: 'Account Already Exist',"
                        + "icon: 'warning',})"
                        + ".then(function(){"
                        + "window.location.href='Admin.html'});");
                out.println("</script>");
            } else {
                boolean dataEntered = ServiceEntry.enterData(email, password);

                if (dataEntered == true) {
                    out.println(".");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("swal({"
                            + "title: 'Hurrah!',"
                            + "text: 'Account Created',"
                            + "icon: 'success',})"
                            + ".then(function(){"
                            + "window.location.href='Admin.html'});");
                    out.println("</script>");
                } else {
                    out.println(".");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("swal({"
                            + "title: 'Oops!',"
                            + "text: 'Cant Created Account,"
                            + "icon: 'failure',})"
                            + ".then(function(){"
                            + "window.location.href='Admin.html'});");
                    out.println("</script>");
                }
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
