package cn.yhgaj.wjdd;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by HollyWin on 2017/3/1.
 */
public class listuser extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doPost(request, response);
        response.setContentType("text/html;charset=UTF-8");
        Connection conn = null;
//        Statement stmt = null;
        //PreparedStatement pstmt=null;
        ResultSet rs = null;
        //ResultSet countrs = null;
        PrintWriter out = response.getWriter();
        JSONObject obj = new JSONObject();
        JSONArray array=new JSONArray();
        String sumbitto=request.getParameter("sumbitto");
        String stringsql = "SELECT realname FROM user WHERE area=? AND usertype=?";
        PreparedStatement pstmt=null;

        try{
            conn = DatabaseConnection.getConnection();
            pstmt = conn.prepareStatement(stringsql);
            pstmt.setString(1,sumbitto);
            pstmt.setString(2,"受理单位配侦人员");
            rs=pstmt.executeQuery();

            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();

            while(rs.next()){
                JSONObject jsonObj = new JSONObject();
//                array.put("姓名：",rs.getString("realname"));
                jsonObj.put("姓名：",rs.getString("realname"));
//                for(int i=1;i<columnCount+1;i++)
//                {
//
//                    String columnName =rsmd.getColumnLabel(i);
//                    String value = rs.getString(columnName);
//                    jsonObj.put(columnName, value);

//                }
                array.put(jsonObj);
                //obj.put(jsonObj);

            }
            //obj.put("count",count);
           // obj.put("data",array);
            out.println(array);
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


