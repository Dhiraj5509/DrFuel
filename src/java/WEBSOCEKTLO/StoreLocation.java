/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WEBSOCEKTLO;

import DBProperties.DBConfig;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StoreLocation {

    public void setDeliveryStatus(String client, String date, String time) {
        String cDate = new DateTime().getDate();
        String cTime = new DateTime().getTime();
        String query = "update serviceDeliveredInfo set status=? , completeTime=? , completeDate=? where clientId=? and requestDate=? and requestTime=?";

        try {
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, "success");
            psmt.setString(2, cTime);
            psmt.setString(3, cDate);
            psmt.setString(4, client);
            psmt.setString(5, date);
            psmt.setString(6, time);
            psmt.executeUpdate();
            con.close();
            psmt.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
    }

    public void setStatus(String email) {
        try {

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/DrFuel", "DrFuel", "DrFuel");
            PreparedStatement psmt = con.prepareStatement("update Location set  status=? where id=?");
            psmt.setString(1, "disconnected");
            psmt.setString(2, email);
            psmt.executeUpdate();
            con.close();
            psmt.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
    }

    public void storeLocation(String latitude, String longitude, String email) {
        DateTime dt = new DateTime();
        String date = dt.getDate();
        String time = dt.getTime();
        try {

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/DrFuel", "DrFuel", "DrFuel");
            PreparedStatement psmt = con.prepareStatement("update Location set latitude=? ,  longitude=? , status=? , date=? , time=? where id=?");
            psmt.setString(1, latitude);
            psmt.setString(2, longitude);
            psmt.setString(3, "connected");
            psmt.setString(4, date);
            psmt.setString(5, time);
            psmt.setString(6, email);
            psmt.executeUpdate();
            con.close();
            psmt.close();
//            System.out.println(latitude +" " +  longitude + " " + date + " " + time + " " + email);
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        }
    }
}
