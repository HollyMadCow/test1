package cn.yhgaj.wjdd;

import org.json.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addcase extends HttpServlet {
    @Override
    //客户端的连接被封装到request这个对象中，参数的提取也是从这个对象中拿
    //而反馈给客户端的内容封装在response这个对象中，比如返回数据也是通过这个对象来完成

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



        doPost(request, response);


    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //跳转到doGet当中去处理
//        doGet(request, response);
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        JSONArray array=new JSONArray();
        //todo 将提交的数据写入数据库，其中数组的先排列成JSON格式写入数据库
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        //将接收到的数据再返回给客户端
        PrintWriter pw = response.getWriter();
        //使用方法getParameter来获取键值对应的value值，这里的Key参数要和客户端传上来的Key值一样！
        pw.println(request.getParameter("caseid"));
        pw.println(request.getParameter("casename"));
        pw.println(request.getParameter("casedetail"));
        pw.println(request.getParameter("caseregno"));
        pw.println(request.getParameter("caseregfilename"));
        String caseid=request.getParameter("caseid");
        String casename=request.getParameter("casename");
        String casedetail=request.getParameter("casedetail");
        String caseregno=request.getParameter("caseregno");
        String caseregfilename=request.getParameter("caseregfilename");
        String station=request.getParameter("station");
        String area=request.getParameter("area");
        String caseby=request.getParameter("caseby");
        String officerphone=request.getParameter("officerphone");
        String state="提交";

        String [] addrequestdetail = /*(String [])*/request.getParameterValues("addrequestdetail[]");
        String [] mytext = /*(String [])*/request.getParameterValues("mytext[]");
        try
        {
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();

            if (addrequestdetail.length == mytext.length )
            {
                JSONObject obj=new JSONObject();
                for (int i=0;i<addrequestdetail.length;i++)
                {

                    obj.put(addrequestdetail[i],mytext[i]);
//
//                    pw.println(addrequestdetail[i]);
//                    pw.println(mytext[i]);

                }
                array.put(obj);
                pw.println(array);
            }
            String sql=String.format("insert into `case` " +
                    "(caseid,casename,casedetail,request, area, caseby, officerphone, state,caseregno, caseregfilename) " +
                    "VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s');",
                    caseid,casename,casedetail,array,area,caseby,officerphone,state,caseregno,caseregfilename);
                stmt.execute(sql);
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
            pw.close();
        }
    }
}
