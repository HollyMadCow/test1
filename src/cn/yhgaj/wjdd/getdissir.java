package cn.yhgaj.wjdd;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

/**
 * Created by CowBoy on 2017/3/14.
 */
public class getdissir extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection conn = null;
//        Statement stmt = null;
        //PreparedStatement pstmt=null;
        ResultSet rs = null;
        //ResultSet countrs = null;
        PrintWriter out = response.getWriter();
        int id=Integer.parseInt(request.getParameter("id"));
//        String sumbitto=request.getParameter("sumbitto");
        String stringsql = "SELECT handlesir FROM `case` where id=?";
//        String stringsql1 = "SELECT longcellphone,shortcellphone FROM user where realname=? and area=?;";
        JSONArray array=new JSONArray();
        PreparedStatement pstmt=null;
//        PreparedStatement pstmt1=null;
        String realname=null;
        try{
            conn = DatabaseConnection.getConnection();
            pstmt = conn.prepareStatement(stringsql);
            pstmt.setInt(1,id);
            rs=pstmt.executeQuery();

            ResultSetMetaData rsmd = rs.getMetaData();
            //int columnCount = rsmd.getColumnCount();

            while(rs.next()){
//                JSONObject jsonObj = new JSONObject();
//                array.put("姓名：",rs.getString("realname"));
//                jsonObj.put("姓名：",rs.getString("handlesir"));
                realname=rs.getString("handlesir");
//                for(int i=1;i<columnCount+1;i++)
//                {
//
//                    String columnName =rsmd.getColumnLabel(i);
//                    String value = rs.getString(columnName);
//                    jsonObj.put(columnName, value);

//                }
//                array.put(jsonObj);
                //obj.put(jsonObj);

            }
            out.println(realname);
            //obj.put("count",count);
            // obj.put("data",array);
//            out.println(array);
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