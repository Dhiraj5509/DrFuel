package WEBSOCEKTLO;

import DBProperties.DBConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ServiceAvailable {

    public void storeService(String client, String service, String date, String time) {
        try {
            String query = "update serviceDeliveredInfo set serviceId=? where clientId=? and requestDate=? and requestTime=?";
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, service);
            psmt.setString(2, client);
            psmt.setString(3, date);
            psmt.setString(4, time);
            psmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
    }

    public void storeClient(String client, String latitude, String longitude, String date, String time, String price, String quantity, String timeLimit) {
        try {
            String query = "insert into serviceDeliveredInfo(ClientId ,RequestDate , RequestTime , latitude , longitude , price , quantity , timelimit) values(?,?,?,?,?,?,?,?)";
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/DrFuel", "DrFuel", "DrFuel");
            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, client);
            psmt.setString(2, date);
            psmt.setString(3, time);
            psmt.setString(4, latitude);
            psmt.setString(5, longitude);
            psmt.setDouble(6, Double.parseDouble(price));
            psmt.setDouble(7, Double.parseDouble(quantity));
            psmt.setString(8, timeLimit);
            psmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
    }

    public String getEmail(String latitude, String longitude) {
        boolean status = false;
        double latitudeC = Double.parseDouble(latitude);
        double longitudeC = Double.parseDouble(longitude);
        double minDistance = 1000000000;
        String serviceBoy = null;
        Distance d = new Distance();
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/DrFuel", "DrFuel", "DrFuel");
            Statement psmt = con.createStatement();
            ResultSet rs = psmt.executeQuery("select * from location");
            while (rs.next()) {
                if (rs.getString(3).equals("connected")) {
                    status = true;
                    double latitudeS = Double.parseDouble(rs.getString(1));
                    double longitudeS = Double.parseDouble(rs.getString(2));
                    String email = rs.getString(4);
                    double temp = d.getDistance(latitudeC, latitudeS, longitudeC, longitudeS);
                    System.out.println(temp);
                    if (temp < minDistance) {
                        serviceBoy = email;
                        minDistance = temp;
                    }
                }
            }
            con.close();
            psmt.close();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        if (status == true) {
            return serviceBoy;
        } else {
            return null;
        }
    }
}
