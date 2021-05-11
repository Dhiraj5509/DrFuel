package AdminSide;

import DBProperties.DBConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckExist {

    public static boolean checkExist(String email) {
        boolean shouldEnter = false;
        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement("select * from users where email=?");
            psmt.setString(1, email);
            ResultSet rs = psmt.executeQuery();
            shouldEnter = !rs.next();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return shouldEnter;
    }
}
