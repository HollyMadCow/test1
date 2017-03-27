package cn.yhgaj.wjdd;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by CowBoy on 2017/3/14.
 */
public class distributecase extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        String handlesir=request.getParameter("handlesir");

    }

}
