package Review;

import DBProperties.DBConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ReviewModel {

    public static boolean storeReview(String email, String rdate, String rtime, String rating) {
        boolean reviewsInserted = false;
        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement("insert into userrating  values(?,?,?,?)");
            psmt.setString(1, email);
            psmt.setString(2, rdate);
            psmt.setString(3, rtime);
            psmt.setString(4, rating);
            psmt.executeUpdate();
            reviewsInserted = true;

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return reviewsInserted;
    }

}
