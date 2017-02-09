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
                //Properties pros;
                String configpath=request.getServletContext().getRealPath("/");
                String arealist=readconfig.getConfigstr(configpath,"arealist");
                String stationlist=readconfig.getConfigstr(configpath,"stationlist");
                String usertypelist=readconfig.getConfigstr(configpath,"usertypelist");

                JSONObject obj=new JSONObject();
                try{

                    //String name ="arealist";
                    obj.put("arealist",arealist);
                   // System.out.print(obj);
                   // name ="stationlist";
                    obj.put("stationlist",stationlist);
                   //System.out.print(obj);
                    //name ="usertypelist";
                    obj.put("usertypelist",usertypelist);
                    //System.out.print(obj);
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
