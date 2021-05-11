
package DBProperties;

/**
 *
 * @author LENOVO
 */
public class DBConfig {
     private static final String dName = "org.apache.derby.jdbc.ClientDriver";
     private static final String url = "jdbc:derby://localhost:1527/DrFuel" ;
     private  static final String userName = "DrFuel" ;
     private static final String password = "DrFuel" ;

    public static String getdName() {
        return dName;
    }

    public static String getUrl() {
        return url;
    }

    public static String getUserName() {
        return userName;
    }

    public static String getPassword() {
        return password;
    }
     
     
}
