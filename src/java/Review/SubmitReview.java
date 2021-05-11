package Review;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SubmitReview extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String rdate = request.getParameter("rdate");
        String rtime = request.getParameter("rtime");
        String rating = request.getParameter("rating");

        try (PrintWriter out = response.getWriter()) {
            boolean isInserted = ReviewModel.storeReview(email, rdate, rtime, rating);
            if (isInserted) {
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
                out.println("swal({"
                        + "title: 'Review Recorded!',"
                        + "text: 'Thanks for your feedback',"
                        + "icon: 'success',})"
                        + ".then(function(){"
                        + "window.location.href='Home.jsp'});");
                out.println("</script>");
            }
            else
            {
                out.println(".");
                    out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                    out.println("<script type=\"text/javascript\">");
                    out.println("swal({"
                            + "title: 'Oops!',"
                            + "text: 'Cant record your review',"
                            + "icon: 'failure',})"
                            + ".then(function(){"
                            + "window.location.href='Home.jsp'});");
                    out.println("</script>");
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
