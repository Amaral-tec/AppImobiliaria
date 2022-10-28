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

    /* private static Connection connection;

    private ConnectionFactory(Connection connection) {

    }

    public static Connection connection() throws SQLException {
        if (connection == null) {
            connection = initConnection();
            return connection;
        } else if (connection.isClosed()) {
            connection = initConnection();
            return connection;
        } else {
            return connection;
        }
    }

    private static Connection initConnection() {
        try {
            return DriverManager.getConnection(
            "jdbc:mysql://localhost/imobiliaria?useTimezone=true&serverTimezone=UTC&user=root&password=");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    } */
}
