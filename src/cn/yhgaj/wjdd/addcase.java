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
import static cn.yhgaj.wjdd.sendmail.sendmsgmail;

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
//        doGet(request, response);
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
//        JSONArray array= new JSONArray();
        JSONObject obj=new JSONObject();
        Date currentTime = new Date();

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
//        String configpath=request.getServletContext().getRealPath("/");
        String caseid=request.getParameter("caseid");
        String casename=request.getParameter("casename");
        String casedetail=request.getParameter("casedetail");
        String caseregno=request.getParameter("caseregno");
        String caseregfilename=request.getParameter("caseregfilename");
        String station=request.getParameter("station");
        String area=request.getParameter("area");
        String caseby=request.getParameter("caseby");
        String officerphone=request.getParameter("officerphone");
        String email=request.getParameter("email");
        String detailfrom=request.getParameter("detailfrom");
        String sumbitdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(currentTime);
        String accesscode = autogeneratecode.genauthcode();
        String state="提交";
//        String sqlstr=readconfig.getConfigstr(configpath,"ip");

        String mailtitle;
        String mailcontent;

        mailtitle=String.format("%s提交案件%s等待您的审批，一次性审批授权码为：%s",caseby,casename,accesscode);
        mailcontent= String.format("%s%s于%s提交的案件编号：%s，案件名称为：%s等待您的审批，一次性审批授权码为：%s，请尽快处理。",area,caseby,sumbitdate,caseid,casename,accesscode);

        String [] addrequestdetail = /*(String [])*/request.getParameterValues("addrequestdetail[]");
        String [] mytext = /*(String [])*/request.getParameterValues("mytext[]");

        ////构造SQL查询语句并查询
        try
        {
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            if(addrequestdetail !=null && mytext !=null)
            {
                if (addrequestdetail.length == mytext.length  )
                {
                    for (int i=0;i<addrequestdetail.length;i++)
                    {
                        obj.put(addrequestdetail[i],mytext[i]);
                    }
                    pw.println(obj);
                }
            }

            String sql=String.format("insert into `case` " +
                    "(caseid,casename,casedetail,request, area, caseby, officerphone, state,caseregno, caseregfilename,email,sumbitdate,accesscode,detailfrom,station) " +
                    "VALUES ('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s');",
                    caseid,casename,casedetail,/*array*/obj,area,caseby,officerphone,state,caseregno,caseregfilename,email,sumbitdate,accesscode,detailfrom,station);
                stmt.executeUpdate(sql);
                ///子线程发送通知邮件
                mailthread sendmailthread = new mailthread();
                sendmailthread.setinfo("zlwh2y@163.com",mailtitle,mailcontent);
                Thread sendthread = new Thread(sendmailthread);
                sendthread.start();
//                sendmsgmail("zlwh2y@163.com",mailtitle,mailcontent);
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
