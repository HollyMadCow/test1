package cn.yhgaj.wjdd;

import java.util.Random;

public class autogeneratecode {
    public static String genauthcode(){
        String s="";
        int intcount = 0;
        intcount = (new Random()).nextInt(9999);
        if(intcount<1000)
            intcount+=1000;
        s+=intcount;
        return s;
    }
}
