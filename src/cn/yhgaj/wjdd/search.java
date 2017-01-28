package cn.yhgaj.wjdd;

import java.io.IOException;

import java.io.PrintWriter;

import java.sql.*;

import javax.naming.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;


public class search extends HttpServlet {
    //服务器端代码
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String searchkeyword = request.getParameter("keyword");
            if (searchkeyword == null) {
                out.println("用户名不能为空");
            } else {
                out.println(searchkeyword);
//                response.getWriter().println(searchkeyword);
//                RequestDispatcher de=request.getRequestDispatcher("/pki/search.jsp");
//                de.forward(request, response);
//                String name = new String(old.getBytes("ISO8859-1"), "UTF-8");
//                //String name = URLDecoder.decode(old,"utf-8");
//                System.out.println(name);
//                if (name.equals("j")) {
//                    out.println("用户名[" + name + "]已经存在，请使用其他用户名");
//                } else {
//                    out.println("用户名[" + name + "]尚未存在，可以使用");
//                }
//                //out.println("<a href=\"classic.html\">返回校验页面</a>");
            }

        } finally {
            out.close();
        }
    }
}