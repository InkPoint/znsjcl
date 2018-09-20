package com.xalt.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-12-26
 * Time: 下午6:10
 */
public class DateUtils {
//    返回时间字符串
    public static String getNowDateStr(){
        Date curdate=new Date();
        SimpleDateFormat sf=new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString=sf.format(curdate);
        return dateString;
    }



    //日期差
    public static int  getDateRqcs(Date starttime,Date endtime){
       return  (int)(endtime.getTime()- starttime.getTime())/1000;
    }

    public static void main(String[] args){
        String[] aa=  "a0.YJDM".split("\\.");
        System.out.println(aa.length);

    }
}
