package com.xalt.demos.main;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-11-4
 * Time: 下午12:29
 */
public class test {
    public static void main(String[] args){
        String  teststr="王鹏文项目计划.doc"  ;
        String[] testlist=teststr.split(".");
        System.out.println(teststr.indexOf("."));
        for(int i=0;i<testlist.length;i++){
            System.out.println(testlist[i].toString());
        }

    }
}
