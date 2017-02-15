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



public class rule {
    private String userid;
    private Connection conn = null;
    private Statement stmt = null;
    private ResultSet rs = null;

    private int page = 0;
    private  int row= 0;
    private String id;
    public void setid(String str/*,int pagestr,int rows*/){

        this.userid=str;
//        this.page= pagestr;
//        this.row=rows;
    }
    public void setpagerow(int pagestr,int rows){
        this.page= pagestr;
        this.row=rows;
    }
    public void setcaseid(String idstr){
        this.id=idstr;
    }

    public String gensqlstr() {
         String sqltempstr=null;
        try{
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            String sqlstr=String.format("SELECT area,usertype,station from user where userid='%s' ",userid);
            String area=null;
            String usertype=null;
            String station=null;

            rs = stmt.executeQuery(sqlstr);
            while(rs.next()){
                area = rs.getString("area");
                usertype = rs.getString("usertype");
                station = rs.getString("station");
            }
            if (usertype!=null)
            {
                switch (usertype)
                {
                    case "办案民警":
                        sqltempstr = String.format("SELECT * from `case` WHERE sumbitbyid='%s' ORDER BY sumbitdate DESC LIMIT %s,%s",userid,page*row,row);
                        break;
                    case "办案单位审核人员":
                        sqltempstr = String.format("SELECT * from `case` WHERE area='%s' ORDER BY sumbitdate DESC",area);

                        break;
                    case  "网警配侦审核人员":
                        sqltempstr = String.format("SELECT * FROM `case` WHERE state!='提交'ORDER BY sumbitdate DESC");

                        break;
                    case "网警配侦人员":
                        sqltempstr = String.format("SELECT * FROM `case` WHERE state!='提交'and state!='待网审'ORDER BY sumbitdate DESC");
                        break;
                    case "局审核人员":
                        sqltempstr = String.format("SELECT * FROM `case` WHERE state='待局审'ORDER BY sumbitdate DESC ");
                        break;
                    default:
                        break;
                }
            }


        } catch (Exception e)
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

        }
        return sqltempstr;

    }
    public String gencountsqlstr() {
         String sqltempstr=null;
        try{
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            String sqlstr=String.format("SELECT area,usertype,station from user where userid='%s' ",userid);
            String area=null;
            String usertype=null;
            String station=null;

            rs = stmt.executeQuery(sqlstr);
            while(rs.next()){
                area = rs.getString("area");
                usertype = rs.getString("usertype");
                station = rs.getString("station");
            }
            if (usertype!=null)
            {
                switch (usertype)
                {
                    case "办案民警":
                        sqltempstr = String.format("SELECT count(caseid) from `case` WHERE sumbitbyid='%s'",userid);
                        break;
                    case "办案单位审核人员":
                        sqltempstr = String.format("SELECT count(caseid) from `case` WHERE area='%s'",area);

                        break;
                    case  "网警配侦审核人员":
                        sqltempstr = String.format("SELECT count(caseid) FROM `case` WHERE state!='提交'");

                        break;
                    case "网警配侦人员":
                        sqltempstr = String.format("SELECT count(caseid) FROM `case` WHERE state!='提交'and state!='待网审'");
                        break;
                    case "局审核人员":
                        sqltempstr = String.format("SELECT count(caseid) FROM `case` WHERE state='待局审'");
                        break;
//                default:
//                        break;
                }
            }



        } catch (Exception e)
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

        }
        return sqltempstr;

    }
    public String Showcasedetail()
    {
        String sqltempstr=null;
        try{
            conn = DatabaseConnection.getConnection();
            stmt = conn.createStatement();
            String sqlstr=String.format("SELECT area,usertype,station from user where userid='%s' ",userid);
            String area=null;
            String usertype=null;
            String station=null;

            ResultSet rs1;

            rs = stmt.executeQuery(sqlstr);
            while(rs.next()){
                area = rs.getString("area");
                usertype = rs.getString("usertype");
                station = rs.getString("station");
            }


            if (usertype!=null)
            {
                switch (usertype)
                {
                    case "办案民警":
                        String tempstr;
                        tempstr=String.format("SELECT count(id) FROM `case` where id=%s AND sumbitbyid='%s' ",id,userid);
                        rs1=stmt.executeQuery(tempstr);
                        int count=0;
                        if(rs1.next()){
                             count = rs1.getInt(1);
                             if (count>0){
                                 sqltempstr=String.format("SELECT * from `case` WHERE id=%s ORDER BY sumbitdate DESC",id);
                             }else {
                                 sqlstr=null;
                             }
                        }
                        break;
                    case "办案单位审核人员":
                        sqltempstr = String.format("SELECT * from `case` WHERE area='%s' ORDER BY sumbitdate DESC",area);

                        break;
                    case  "网警配侦审核人员":
                        sqltempstr = String.format("SELECT * FROM `case` WHERE state!='提交'ORDER BY sumbitdate DESC");

                        break;
                    case "网警配侦人员":
                        sqltempstr = String.format("SELECT * FROM `case` WHERE state!='提交'and state!='待网审'ORDER BY sumbitdate DESC");
                        break;
                    case "局审核人员":
                        sqltempstr = String.format("SELECT * FROM `case` WHERE state='待局审'ORDER BY sumbitdate DESC ");
                        break;
                    default:
                        break;
                }
            }


        } catch (Exception e)
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

        }
        return sqltempstr;
    }
//    public static String myrule(String userid) throws SQLException,IOException{
//        Connection conn = null;
//        Statement stmt = null;
//        ResultSet rs = null;
//        String sqltempstr=null;
//        try{
//            conn = DatabaseConnection.getConnection();
//            stmt = conn.createStatement();
//            String sqlstr=String.format("SELECT area,usertype,station from user where userid='%s'",userid);
//            String area=null;
//            String usertype=null;
//            String station=null;
//
//            rs = stmt.executeQuery(sqlstr);
//            while(rs.next()){
//                area = rs.getString("area");
//                usertype = rs.getString("usertype");
//                station = rs.getString("station");
//            }
//            switch (usertype)
//            {
//                case "办案民警":
//                    sqltempstr = String.format("SELECT * from `case` WHERE sumbitbyid='%s ORDER BY sumbitdate DESC",userid);
//                    break;
//                case "办案单位审核人员":
//                    sqltempstr = String.format("SELECT * from `case` WHERE area='%s' ORDER BY sumbitdate DESC",area);
//
//                    break;
//                case  "网警配侦审核人员":
//                    sqltempstr = String.format("SELECT * FROM `case` WHERE state!='提交'ORDER BY sumbitdate DESC");
//
//                    break;
//                case "网警配侦人员":
//                    sqltempstr = String.format("SELECT * FROM `case` WHERE state!='提交'and state!='待网审'ORDER BY sumbitdate DESC");
//                    break;
//                case "局审核人员":
//                    sqltempstr = String.format("SELECT * FROM `case` WHERE state='待局审'ORDER BY sumbitdate DESC ");
//                    break;
////                default:
////                        break;
//            }
//
//
//
//        } catch (Exception e)
//        {
//            e.printStackTrace();
//        }finally {
//            try {
//                if (rs != null) rs.close();
//                if (stmt != null) stmt.close();
//                if (conn != null) conn.close();
//            } catch (Exception e1) {
//                e1.printStackTrace();
//            }
//
//        }
//        return sqltempstr;
//    }
}
