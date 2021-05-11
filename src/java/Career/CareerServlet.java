package Career;

import DBProperties.DBConfig;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.sql.SQLException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CareerServlet extends HttpServlet {

    static String fname;
    static String lname;
    static String location;
    static String shift_preference;
    static String contact;
    static String experience;
    static String email;
    static String cdate;
    static String ctime;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                fname = request.getParameter("fname");
                lname = request.getParameter("lname");
                location = request.getParameter("plocation");
                shift_preference = request.getParameter("time");
                contact = request.getParameter("contact");
                experience = request.getParameter("experience");
                email = request.getParameter("email");
                System.out.println(fname + lname + location + shift_preference + contact + experience + email);

                Date date = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
                cdate = formatter.format(date);

                formatter = new SimpleDateFormat("hh:mm:ss");
                ctime = formatter.format(date);
                Class.forName(DBConfig.getdName());
                Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

                PreparedStatement psmt = con.prepareStatement("insert into careers values(?,?,?,?,?,?,?,?,?)");

                psmt.setString(1, fname);
                psmt.setString(2, lname);
                psmt.setString(3, location);
                psmt.setString(4, shift_preference);
                psmt.setString(5, contact);
                psmt.setString(6, experience);

                psmt.setString(7, ctime);
                psmt.setString(8, cdate);
                psmt.setString(9, email);
                psmt.executeUpdate();
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
                out.println("swal({"
                        + "title: 'Great!',"
                        + "text: 'We noted your response , we will shortly contact you',"
                        + "icon: 'success',})"
                        + ".then(function(){"
                        + "window.location.href='Home.jsp'});");
                out.println("</script>");
            } catch (ClassNotFoundException | SQLException e) {
                out.println(".");
                out.println("<script src='https://unpkg.com/sweetalert/dist/sweetalert.min.js'></script>");
                out.println("<script type=\"text/javascript\">");
                out.println("swal({"
                        + "title: 'Oops!',"
                        + "text: 'Cant note your response..Try again after some time',"
                        + "icon: 'warning',})"
                        + ".then(function(){"
                        + "window.location.href='Home.jsp'});");
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
