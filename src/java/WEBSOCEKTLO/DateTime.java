/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package WEBSOCEKTLO;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class DateTime {
    public String getDate()
    {
         Date date = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
                String cdate = formatter.format(date);

                return cdate ; 
    }
    public String getTime()
    {
                 Date date = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
                String cdate = formatter.format(date);

                formatter = new SimpleDateFormat("hh:mm:ss");
                String ctime = formatter.format(date);
                return ctime ; 
    }
              
}
