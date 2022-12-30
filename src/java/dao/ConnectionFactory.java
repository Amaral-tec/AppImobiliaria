package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author leandro.amaral
 */
public class ConnectionFactory {

    public static Connection initConnection() throws SQLException, ClassNotFoundException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");

            String con = "jdbc:mysql://" + Config.server + "/" + Config.database + "?useTimezone=true&serverTimezone=UTC";

            return DriverManager.getConnection(con, Config.user, Config.password);
            
        }catch(ClassNotFoundException e){
            throw new RuntimeException(e);
        }
    }
}
