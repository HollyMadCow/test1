package cn.yhgaj.wjdd;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;
import javax.servlet.ServletConfig;
import javax.servlet.http.*;

public class readconfig {
    public static String getConfigstr(String path,String str) throws IOException{
        String getstr =null;
        Properties p = new Properties();
        p.load(new FileInputStream(path + "\\WEB-INF\\config\\config.properties" ));
        getstr = p.getProperty(str);
        getstr = new String(getstr.getBytes("ISO8859-1"),  "utf-8");
        return getstr;
    }
}
