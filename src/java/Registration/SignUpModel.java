package Registration;

import DBProperties.DBConfig;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SignUpModel {

    public boolean searchAccount(String username, String pass1) throws FileNotFoundException, IOException {
        boolean isValidUser = true;
        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            Statement psmt = con.createStatement();
            ResultSet rs = psmt.executeQuery("select * from users");

            while (rs.next()) {
                if (username.equals(rs.getString(1))) {
                    isValidUser = false;
                    break;
                }
            }
            System.out.println("here under signup model");
            return isValidUser;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
            return false;
        }
    }
}
