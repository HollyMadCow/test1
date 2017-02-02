package cn.yhgaj.wjdd;

import java.io.*;
import java.util.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.ServletContext;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class uploadimg extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        File file1 = null;
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> list = upload.parseRequest(request); //解析request请求

            for (FileItem fileItem : list) {
//                System.out.println(fileItem.getFieldName());
                if (fileItem.getFieldName().equals("caseregfile"))
                {
                    file1 = new File(getServletContext().getRealPath("uploadimage"), fileItem.getName());
                    file1.getParentFile().mkdirs();
                    file1.createNewFile();
//                    System.out.println(fileItem.getName() + " psd");
                    InputStream ins = fileItem.getInputStream();
                    OutputStream ous = new FileOutputStream(file1);
                    try {
                        byte[] buffer = new byte[1024];
                        int len = 0;
                        while ((len = ins.read(buffer)) > -1)
                            ous.write(buffer, 0, len);
                    } finally {
                        ous.close();
                        ins.close();
                    }
                }


            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }


        JSONObject jsonObject = new JSONObject();
        try {
            jsonObject.put("result", "ok");
        } catch (JSONException e) {
            e.printStackTrace();
        }

        response.getWriter().write(jsonObject.toString());
    }
}
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        String jsonStr = "{\"name\":\"fly\",\"type\":\"虫子\"}";
//        //将接收到的数据再返回给客户端
//        JSONObject jsonObject = new JSONObject();
//        String a="test";
//        String b="OK";
//        try{
//            jsonObject.put(a,b);
//
//            JSONArray jsonArray = new JSONArray();
//            jsonArray.put(jsonObject);
////            System.out.println(jsonArray);
//            PrintWriter out = response.getWriter();
//            out.write(jsonStr);
//
//        }
//        catch (Exception e)
//        {
//            e.printStackTrace();
//        }
//
//
//        //使用方法getParameter来获取键值对应的value值，这里的Key参数要和客户端传上来的Key值一样！
//
////        pw.println(request.getParameter("casename"));
////        pw.println(request.getParameter("casedetail"));
//    }
//        final String allowFileSuffix = "jpg,png,gif";
//        String basePath ="D:" + File.separator + "upload";
//        File tmpDir = new File(basePath);// 初始化上传文件的临时存放目录
//        JSONArray jsonArry = new JSONArray();
//        if (!tmpDir.exists()) {
//            tmpDir.mkdirs();
//        }
//        if (ServletFileUpload.isMultipartContent(request)) {
//            DiskFileItemFactory dff = new DiskFileItemFactory();
//            // 创建该对象
//            dff.setRepository(tmpDir);// 指定上传文件的临时目录
//            dff.setSizeThreshold(1024000);// 指定在内存中缓存数据大小,单位为byte
//            ServletFileUpload sfu = new ServletFileUpload(dff);// 创建该对象 //
//            sfu.setFileSizeMax(5000000);//指定单个上传文件的最大尺寸
//            sfu.setSizeMax(10000000);// 指定一次上传多个文件的总尺寸
//            sfu.setHeaderEncoding("utf-8");
//            String type = null;
//            List<FileItem> fileItems = new ArrayList<FileItem>();
//            try {
//                fileItems = sfu.parseRequest(request);
//            }
//            catch (FileUploadException e1)
//            {
//                System.out.println("文件上传发生错误" + e1.getMessage());
//            }
//            String fullPath = null;
//            String fileName = null;
//            for (FileItem fileItem : fileItems) { // 判断该表单项是否是普通类型
//                 if (fileItem.isFormField()) {
//                     String name = fileItem.getFieldName();// 控件名
//                     String value = fileItem.getString();
//                     if (name.equals("excelType")) {
//                         type = value;
//                     }
//                 } else {
//                     String filePath = fileItem.getName();
//                     if (filePath == null || filePath.trim().length() == 0)
//                         continue;
//                     fileName = filePath.substring(filePath .lastIndexOf(File.separator) + 1);
//                     String extName = filePath.substring(filePath .lastIndexOf(".") + 1);
//                     fullPath = basePath + File.separator + fileName;
//                     if (allowFileSuffix.indexOf(extName) != -1) {
//                         try {
//                             fileItem.write(new File(fullPath));
//                         } catch (Exception e) {
//                             e.printStackTrace();
//                         }
//                     } else {
//                         throw new FileUploadException("文件格式不正确");
//                     }
//                 }
//                 if (type.equals("station")) {
//                     jsonArry = readExcel(fullPath, fileName);
//                 } else if (type.equals("line")) {
//                     System.out.println("===============:line");
//                 } else if (type.equals("pipeline")) {
//                     System.out.println("===============:pipeline");
//                 } else if (type.equals("jdj")) {
//                     System.out.println("===============:jdj");
//                 }
//            }
//            return jsonArry;
//
//    }

