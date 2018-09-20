package com.xalt.utils;

import java.io.*;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-11-17
 * Time: 上午11:50
 */
public class FileUtils {

    //将文件输入流转化为文件输出流
    public static FileOutputStream instreamTooutputstream(InputStream is,String filepath) throws IOException{
        FileOutputStream  os=new FileOutputStream(filepath);
        if(is!=null){
            int i=0;
            int lengths=0;
            byte[] b=new byte[204800];
           while((lengths=is.read(b))!=-1){
               os.write(b,0,lengths);
           }
        }
        os.close();
        is.close();
        return os;
    }

    public String getCurPath(){
           return this.getClass().getResource("/").getPath();
    }
    public static void main(String[] args){
//        try{
//            FileInputStream  fs=new FileInputStream(new File("D://test.xls"));
//            FileOutputStream fos= instreamTooutputstream(fs,"D://testcopy.xls");
//            System.out.println("执行完成！");
//        }catch(IOException e){
//            e.printStackTrace();
//        }
        FileUtils fu=new FileUtils();
        String pathss=fu.getCurPath().split("znsjcls")[0];
        String parentpath=  pathss.substring(1,pathss.length()-1);
        System.out.println(parentpath+"znsjcls/");
     }


}
