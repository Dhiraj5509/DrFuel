package Review;

import DBProperties.DBConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckReviewAvailableModel {

    public static boolean checkReviewAvailable(String email, String rdate, String rtime) {
        boolean checkAvailable = false;
        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement("select * from userrating where emailid=? and requestDate=? and requestTime=?");
            psmt.setString(1, email);
            psmt.setString(2, rdate);
            psmt.setString(3, rtime);
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {
                checkAvailable = true;
            }
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("checkAvailable");
            System.out.println(e);
        }
        return checkAvailable;
    }
}
