package cn.yhgaj.wjdd;

import org.json.*;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class rule {
    public static String myrule(String userid) throws SQLException,IOException{
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try{
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            String sqlstr=String.format("SELECT area,usertype,station from user where userid='%s'",userid);
            String area;
            String usertype;
            String station;
            rs = stmt.executeQuery(sqlstr);
            while(rs.next()){
                area = rs.getString("area");
                usertype = rs.getString("usertype");
                station = rs.getString("station");
            }


        }
        catch (Exception e)
        {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e1) {
                e1.printStackTrace();
            }

        }
        return "ok";
    }
}
