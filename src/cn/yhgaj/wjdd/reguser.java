package cn.yhgaj.wjdd;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.*;
import java.io.PrintWriter;
import java.util.*;

import org.json.*;


public class reguser extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                Properties pros;
                String configpath=request.getServletContext().getRealPath("/");
                pros=readconfig.getConfigstr(configpath);
                String arealist=pros.getProperty("arealist"); //readconfig.getConfigstr(configpath,"arealist");
                arealist = new String(arealist.getBytes("ISO8859-1"),  "utf-8");
                String stationlist=pros.getProperty("stationlist");//String stationlist=readconfig.getConfigstr(configpath,"stationlist");
                stationlist = new String(stationlist.getBytes("ISO8859-1"),  "utf-8");
                String usertypelist=pros.getProperty("usertypelist");//String usertypelist =readconfig.getConfigstr(configpath,"usertypelist");
                usertypelist = new String(usertypelist.getBytes("ISO8859-1"),  "utf-8");
                JSONObject obj=new JSONObject();
                try{

                    //String name ="arealist";
                    obj.put("arealist",arealist);
                    System.out.print(obj);
                   // name ="stationlist";
                    obj.put("stationlist",stationlist);
                    System.out.print(obj);
                    //name ="usertypelist";
                    obj.put("usertypelist",usertypelist);
                    System.out.print(obj);
                }catch (Exception e)
                {
                    e.printStackTrace();
                }
                out.println(obj);

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
