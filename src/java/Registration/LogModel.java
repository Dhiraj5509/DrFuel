package Registration;

import DBProperties.DBConfig;
import WEBSOCEKTLO.DateTime;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogModel {

    public static boolean storeLog(String ip, String email) {
        boolean enteredSuccessfully = false;
        DateTime dt = new DateTime();
        String date = dt.getDate();
        String time = dt.getTime();
        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement("insert into log values(?,?,?,?) ");
            psmt.setString(1, email);
            psmt.setString(2, ip);
            psmt.setString(3, date);
            psmt.setString(4, time);
            psmt.executeUpdate();
            enteredSuccessfully = true;

        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        return enteredSuccessfully;
    }
}
