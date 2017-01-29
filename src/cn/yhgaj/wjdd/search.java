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
import org.json.*;

public class search extends HttpServlet {
    //服务器端代码
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        response.setContentType("application/x-json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;


        try {
            String searchkeyword = request.getParameter("keyword");
//            String teststring = String.format("{'name':%s}",searchkeyword);
            if (searchkeyword == null) {
                out.println("用户名不能为空");
            } else {
                Context initCtx = new InitialContext();
                Context ctx = (Context) initCtx.lookup("java:comp/env");
//获取连接池对象
                DataSource ds =(DataSource)ctx.lookup("jdbc/ConnectionPool");
//创建连接
                conn = ds.getConnection();
                stmt = conn.createStatement();
                String sql=String.format("select username,userid from USER WHERE userid='%s'","331021198209300019");
                rs = stmt.executeQuery(sql);
                JSONArray array = new JSONArray();
                ResultSetMetaData rsmd = rs.getMetaData();
                int columnCount = rsmd.getColumnCount();


                while(rs.next())
                {
                    JSONObject jsonObj = new JSONObject();
                    for(int i=1;i<columnCount+1;i++)
                    {

                        String columnName =rsmd.getColumnLabel(i);
                        String value = rs.getString(columnName);
                        jsonObj.put(columnName, value);

                    }
                    //System.out.println();
                    array.put(jsonObj);
                }

                out.println(array);

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

        }
        catch(Exception e){
            e.printStackTrace();
        }finally {
            try{
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(conn != null) conn.close();
            }catch(Exception e1){
                e1.printStackTrace();
            }
            out.close();
        }
    }
}