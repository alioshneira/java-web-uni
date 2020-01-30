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
//        Class.forName("org.apache.derby.jdbc.ClientDriver");
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
    /*
    public static void backup() throws SQLException{
        
        boolean backup = true;
        Connection conn = null;
        if(backup)
        {
        //jdbc:derby://localhost:1527/test is the database connection,
        //test is the database name
        String connectionURL = "jdbc:derby://localhost:1527/ IS2560";

        //username and password should be specified in getConnection()
        //test, test are username and password in this case
        conn = DriverManager.getConnection(connectionURL, "IS2560", "IS2560");
        String sqlstmt = "CALL SYSCS_UTIL.SYSCS_BACKUP_DATABASE(?)";
        CallableStatement cs = conn.prepareCall(sqlstmt);

        //backup the database to ," /Users/ComputerName/dbbackups/
        cs.setString(1,"/Users/ComputerName/dbbackups/");
        cs.execute();
        cs.close();
        conn.close();
        }
    }*/
}
