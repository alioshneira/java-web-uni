package uni.database;

//import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class AccesoDB {

    public AccesoDB() {
    }

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        Connection cn;
        //cargar el driver en memoria
        //Class.forName("oracle.jdbc.OracleDriver");
        Class.forName("com.mysql.jdbc.Driver");

        // url de la base de datos
        //String url = "jdbc:oracle:thin:@localhost:1521:XE";
        // obtener objto conecion
        //cn = DriverManager.getConnection(url, "neptuno", "admin");

        
        //String dbURL = "jdbc:mysql://10.1.1.64/neptuno";
        String dbURL = "jdbc:mysql://35.232.97.201/neptuno";
        
        //String dbURL = "jdbc:derby://localhost/neptuno";
        String user = "admin";
        String password = "neptuno";
        cn = DriverManager.getConnection(dbURL, user, password);
        
        if (cn == null){
            System.out.println("error al conectar bd");
        }
        return cn;
    }

}
