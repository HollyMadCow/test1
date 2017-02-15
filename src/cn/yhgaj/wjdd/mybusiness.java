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
        ResultSet countrs = null;
        int count= 0;
         int page = 0;
         int rows =20;

        if (request.getParameter("page")!=null)
        {
            page=Integer.parseInt(request.getParameter("page"))-1;
        }

        if (request.getParameter("page")==null || page<0)
        {
            page =0;
        }

        if (request.getParameter("rows")!=null)
        {
            rows=Integer.parseInt(request.getParameter("rows"));
        }
        if (request.getParameter("rows")==null || rows<0)
        {
            rows =20;
        }


         //String sqltempstr=null;

        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("useridfromdatabase");
//        String sqlstr=rule.myrule(userid);
        rule userrule = new rule();
        userrule.setid(userid);//,page,rows);
        userrule.setpagerow(page,rows);
        String sqlstr = userrule.gensqlstr();
        String countsqlstr=userrule.gencountsqlstr();
        //sqlquery queryrs=new sqlquery();
        //queryrs.setquerysql(sqlstr);

        JSONArray array=new JSONArray();

        JSONObject obj = new JSONObject();

        try{
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            countrs = stmt.executeQuery(countsqlstr);
            while(countrs.next())
            {
                count = countrs.getInt(1); // count = rs.getInt("result");
            }
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
            obj.put("count",count);
            obj.put("data",array);
            //out.println(array);
            out.println(obj);
        }catch (Exception e)
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

    }
}
