package cn.yhgaj.wjdd;
import java.io.IOException;
import java.io.PrintWriter;

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
        response.setContentType("text/html;charset=UTF-8");

        //将接收到的数据再返回给客户端
        PrintWriter pw = response.getWriter();
        //使用方法getParameter来获取键值对应的value值，这里的Key参数要和客户端传上来的Key值一样！
        pw.println(request.getParameter("caseid"));
        pw.println(request.getParameter("casename"));
        pw.println(request.getParameter("casedetail"));

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //跳转到doGet当中去处理
        doGet(request, response);
    }
}