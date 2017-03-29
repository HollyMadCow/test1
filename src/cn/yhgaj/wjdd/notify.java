package cn.yhgaj.wjdd;

import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

/**
 * Created by CowBoy on 2017/3/14.
 */
public class notify extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //PrintWriter out = response.getWriter();
        //String sqlstr;
        Connection conn = null;
        // Statement stmt = null;
        ResultSet rs = null;
        // ResultSet rs1 = null;
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("useridfromdatabase");
        String usertype = (String) session.getAttribute("usertype");
        int state=Integer.parseInt(request.getParameter("state"));
        String stringsql = "SELECT distinct realname FROM user WHERE area=?";
        //String stringsql = "SELECT distinct realname FROM user WHERE area=? AND usertype=?";
        PreparedStatement pstmt=null;
        switch (state){
            case 1:
                break;
            case 2:
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            case 7:
                break;

        }
        try{
            conn = DatabaseConnection.getConnection();
            pstmt = conn.prepareStatement(stringsql);
           // pstmt.setString(1,sumbitto);
            //pstmt.setString(2,"受理单位配侦人员");
            pstmt.executeUpdate();
           // rs=pstmt.executeQuery();

           // ResultSetMetaData rsmd = rs.getMetaData();
            //int columnCount = rsmd.getColumnCount();


            //obj.put("count",count);
            // obj.put("data",array);

            //out.println(obj);
        }catch (Exception e)
        {
            e.printStackTrace();
        }finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e1) {
                e1.printStackTrace();
            }

        }

    }

}