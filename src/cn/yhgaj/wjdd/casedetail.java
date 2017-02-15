package cn.yhgaj.wjdd;


import org.json.JSONArray;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class casedetail extends HttpServlet{
    @Override
    //客户端的连接被封装到request这个对象中，参数的提取也是从这个对象中拿
    //而反馈给客户端的内容封装在response这个对象中，比如返回数据也是通过这个对象来完成

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //doPost(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String sqlstr;
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("useridfromdatabase");
        String usertype = (String) session.getAttribute("usertype");
        String caseid=request.getParameter("id");
        rule userrule=new rule();
        userrule.setid(userid);
        userrule.setcaseid(caseid);
        sqlstr=userrule.Showcasedetail();
//        sqlstr=String.format("select * from `case` where id='%s'",caseid);

        //Properties pros;
//        String configpath=request.getServletContext().getRealPath("/");
//        String arealist=readconfig.getConfigstr(configpath,"arealist");
//        String stationlist=readconfig.getConfigstr(configpath,"stationlist");
        // String usertypelist=readconfig.getConfigstr(configpath,"usertypelist");
        //JSONArray array=new JSONArray();
        JSONObject obj=new JSONObject();
        try{
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            rs=stmt.executeQuery(sqlstr);
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCount = rsmd.getColumnCount();
            while(rs.next()){
//                JSONObject jsonObj = new JSONObject();
                for(int i=1;i<columnCount+1;i++)
                {

                    String columnName =rsmd.getColumnLabel(i);
                    String value = rs.getString(columnName);
                    obj.put(columnName, value);

                }
                //array.put(obj);

            }
            out.println(obj);

            //String name ="arealist";
//            obj.put("arealist",arealist);
//            // System.out.print(obj);
//            // name ="stationlist";
//            obj.put("stationlist",stationlist);
            //System.out.print(obj);
            //name ="usertypelist";
            //obj.put("usertypelist",usertypelist);
            //System.out.print(obj);
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
