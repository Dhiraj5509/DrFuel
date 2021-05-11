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

public class DeliveryLogModel {

    public void storeLog(String client, String date, String time, String district, String state) {

        try {
            String query;
            query = "insert into DeliveryLog values(?,?,?,?,?)";
            Class.forName(DBConfig.getdName());
            Connection con = DriverManager.getConnection(DBConfig.getUrl(), DBConfig.getUserName(), DBConfig.getPassword());

            PreparedStatement psmt = con.prepareStatement(query);
            psmt.setString(1, client);
            psmt.setString(2, date);
            psmt.setString(3, time);
            psmt.setString(4, district);
            psmt.setString(5, state);
            psmt.executeUpdate();
            con.close();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e);
        } finally {

        }
    }
}
