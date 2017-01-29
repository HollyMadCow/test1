package cn.yhgaj.wjdd;


import java.io.IOException;

import java.io.PrintWriter;

import java.sql.*;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import cn.yhgaj.wjdd.DatabaseConnection;

public class pkilogin extends HttpServlet{
    public void init() throws ServletException{
        System.out.print("我是init()方法！用来进行初始化工作");
    }
    public void doGet(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
       // String usercredit=null;
        String userid;
        String useriddatabase= null;
        String userkey = "詹凌伟 331021198209300019";

        String[] split = userkey.split("\\s+");
        //usercredit = split[0];
        userid = split[1];
//        creditinfo=request.getHeader("ssl_client_s_dn_o");

        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        String username = null;


        try{

            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            String sql=String.format("select username,userid from USER WHERE userid='%s'",userid);
            rs = stmt.executeQuery(sql);
            while(rs.next()){
                username = rs.getString("username");
                useriddatabase = rs.getString("userid");
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }catch(Exception e1){
                e1.printStackTrace();
            }
        }


        request.setAttribute("username", username);
        request.setAttribute("userid", userid);
        request.setAttribute("useriddatabase", useriddatabase);
        RequestDispatcher de=request.getRequestDispatcher("/pki/main.jsp");
        de.forward(request, response);

//        System.out.println("我是doGet()方法！用来处理GET请求");
//        response.setContentType("text/html;charset=utf-8");
//        PrintWriter out = response.getWriter();
//        out.println("<HTML>");
//        out.println("<BODY>");
//        out.println("这是Servlet的例子");
//        out.println(userkey);
//        out.println(usercredit);
//        out.println(userid1);
//        out.println(creditinfo);
//        out.println("</BODY>");
//        out.println("</HTML>");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void destroy() {
        super.destroy();
        System.out.println("我是destroy()方法！用来进行销毁实例的工作");
    }
}
