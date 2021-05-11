package Registration;

import DBProperties.DBConfig;
import EncryptionDecryption.Crypto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class VerifyOTPModel {

    public boolean insertUserRecord(String email, String password) {

        String iv = "0123456789123456"; // This has to be 16 characters
        String secretKey = "abcdDr.FuelIShere";
        Crypto crypto = new Crypto();
        String encryptedData = crypto.encrypt(password, iv, secretKey);
        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            String query = "insert into users values(?,?,?)";
            PreparedStatement psmt = con.prepareStatement(query);

            psmt.setString(1, email);
            psmt.setString(2, encryptedData);
            psmt.setString(3, "guest");
            psmt.executeUpdate();
            return true;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
            return false;
        }
    }
}
