package AdminSide;

import DBProperties.DBConfig;
import EncryptionDecryption.Crypto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ServiceEntry {

    public static boolean enterData(String email, String password) {
        String iv = "0123456789123456"; // This has to be 16 characters
        String secretKey = "abcdDr.FuelIShere";
        Crypto crypto = new Crypto();
        String encryptedData = crypto.encrypt(password, iv, secretKey);
        boolean dataEntered = false;
        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement("insert into users values(?,?,?)");
            psmt.setString(1, email);
            psmt.setString(2, encryptedData);
            psmt.setString(3, "service boy");

            psmt.executeUpdate();

            psmt = con.prepareStatement("insert into Location values(?,?,?,?,?,?)");
            psmt.setString(1, "-1");
            psmt.setString(2, "-1");
            psmt.setString(3, "disconnected");
            psmt.setString(4, email);
            psmt.setString(5, "0/0/0");
            psmt.setString(6, "00:00:00");
            psmt.executeUpdate();
            dataEntered = true;
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
        return dataEntered;
    }
}
