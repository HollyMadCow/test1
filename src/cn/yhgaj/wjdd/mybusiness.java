package cn.yhgaj.wjdd;

import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


public class mybusiness extends HttpServlet {
    @Override
    //客户端的连接被封装到request这个对象中，参数的提取也是从这个对象中拿
    //而反馈给客户端的内容封装在response这个对象中，比如返回数据也是通过这个对象来完成
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,IOException {
        response.setContentType("text/html;charset=UTF-8");
         Connection conn = null;
         Statement stmt = null;
         ResultSet rs = null;
         //String sqltempstr=null;

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("useridfromdatabase");
//        String sqlstr=rule.myrule(userid);
        rule userrule = new rule();
        userrule.setid(userid);
        String sqlstr = userrule.gensqlstr();
        //sqlquery queryrs=new sqlquery();
        //queryrs.setquerysql(sqlstr);

        JSONArray array=new JSONArray();

        //JSONObject obj = new JSONObject();

        try{
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sqlstr);

            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();

            while(rs.next()){
                JSONObject jsonObj = new JSONObject();
                for(int i=1;i<columnCount+1;i++)
                {

                    String columnName =rsmd.getColumnLabel(i);
                    String value = rs.getString(columnName);
                    jsonObj.put(columnName, value);

                }
                array.put(jsonObj);
            }
            out.println(array);
        }catch (Exception e)
        {
            e.printStackTrace();
        }

    }
}
