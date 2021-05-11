package Inbox;

import DBProperties.DBConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Delivery {

    public int getBadges(String email) {
        int badges = 0;
        try {
            String query = "select count(*) from serviceDeliveredInfo where clientId=? and status=?";
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, email);
            psmt.setString(2, "pending");
            ResultSet rs = psmt.executeQuery();
            if (rs.next()) {

                badges = rs.getInt(1);
            }

            con.close();
            psmt.close();
            return badges;

        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return 00;
    }
}
