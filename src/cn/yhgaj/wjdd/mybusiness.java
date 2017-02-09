package cn.yhgaj.wjdd;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;


public class mybusiness extends HttpServlet {
    @Override
    //客户端的连接被封装到request这个对象中，参数的提取也是从这个对象中拿
    //而反馈给客户端的内容封装在response这个对象中，比如返回数据也是通过这个对象来完成

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        String userid = (String) session.getAttribute("useridfromdatabase");
//        String sqlstr=rule.myrule(userid);
    }
}
