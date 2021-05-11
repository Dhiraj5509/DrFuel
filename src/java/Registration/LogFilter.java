package Registration;

import SendMailAPI.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LogFilter implements Filter {

    public void init(FilterConfig arg0) throws ServletException {
    }

    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {

        PrintWriter out = resp.getWriter();
        System.out.println("filter is invoked before");

        chain.doFilter(req, resp);//sends request to next resource  

        System.out.println("filter is invoked after");

        HttpServletRequest request = (HttpServletRequest) req;
        String status = (String) request.getAttribute("status");
        System.out.println(status);
        if ( status.equals("success")) {
            String ipAddress = request.getRemoteAddr();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("code_verify");
            boolean enteredLog = LogModel.storeLog(ipAddress, user.getEmail());
        }

    }

    public void destroy() {
    }
}
