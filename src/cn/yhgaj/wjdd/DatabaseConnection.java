package cn.yhgaj.wjdd;
import java.sql.*;
import javax.naming.*;
import javax.sql.DataSource;

public class DatabaseConnection {
    public static Connection getConnection() throws SQLException,NamingException
    {
        try
        {

            Context initCtx = new javax.naming.InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource)envCtx.lookup("jdbc/ConnectionPool");

            return ds.getConnection();
        }
        catch(SQLException e)
        {
            throw e;
        }


    }
}
