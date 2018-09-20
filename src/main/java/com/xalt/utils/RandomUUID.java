package com.xalt.utils;

import com.ts.util.uuid.UUID;
import org.springframework.format.datetime.DateFormatter;

import java.util.Date;
import java.util.Locale;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-11-9
 * Time: 下午5:32
 */
public class RandomUUID {
    //获取随机的UUID
    public static String getUUIDRandoms(){

         //获取当前日期,格式如:yyyymmdd
         DateFormatter  df=new     DateFormatter("yyyyMMddHHmmss");
         String mydate=df.print(new Date(), Locale.CHINA);
         String myuuids=UUID.generateUUID().substring(0,6);
         System.out.println("mydate:"+mydate);
         System.out.println("myuuids:"+myuuids);
         return mydate+""+myuuids;
    }

    public static void main(String[] args){
        System.out.println(getUUIDRandoms());
    }
}
