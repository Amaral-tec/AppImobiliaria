package dao;

import java.sql.*;
import com.mysql.jdbc.Driver;

/**
 *
 * @author leandro.amaral
 */
public class ConnectionFactory {

    String servidor = new Config().servidor;
    String banco = new Config().banco;
    String usuario = new Config().usuario;
    String senha = new Config().senha;

    String con = "jdbc:mysql://" + servidor + "/" + banco + "?useTimezone=true&serverTimezone=UTC&user=" + usuario + "&password=" + senha;

    public Connection conectar() throws SQLExecption {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            //localhost
            return DriverManager.getConnection(con);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
