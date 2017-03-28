package cn.yhgaj.wjdd;

import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

/**
 * Created by CowBoy on 2017/3/14.
 */
public class distributecase extends HttpServlet {
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
        int caseid=Integer.parseInt(request.getParameter("id"));
        String handlesir=request.getParameter("handlesir");
        String stringsql = "SELECT count(id) FROM user WHERE usertype=? AND userid=?";
        PreparedStatement pstmt=null;


        try{
            conn = DatabaseConnection.getConnection();
            pstmt = conn.prepareStatement(stringsql);
            pstmt.setString(1,usertype);
            pstmt.setString(2,userid);
            rs=pstmt.executeQuery();
            int count;
            //ResultSetMetaData rsmd = rs.getMetaData();
            if (rs.next()){
                count = rs.getInt(1);
                if (count>0){
                   String stringsql1="UPDATE `case` SET handlesir=?,state=? where id=?";
                    pstmt = conn.prepareStatement(stringsql1);
                    pstmt.setString(1,handlesir);
                    pstmt.setString(2,"配侦中");
                    pstmt.setInt(3,caseid);
                    pstmt.executeUpdate();

                }
            }


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
