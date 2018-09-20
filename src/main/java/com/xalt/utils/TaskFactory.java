package com.xalt.utils;

import com.ts.persistence.dao.DelegateMapper;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 18-1-18
 * Time: 上午9:54
 */
public class TaskFactory {
    //接口
    private MyRunnable mr;
    //线程类
    private Thread thread;


    //启用线程查询
    public  void selectList(DelegateMapper dm,String sqlpath,Map<String,Object> param){
        if(checkDmOrSqlpath(dm,sqlpath)==1){System.out.println("查询线程启动失败！");return;}
        mr=new MyRunnable(dm,sqlpath,param,"selectList");
        thread=new Thread(mr);
        thread.start();
    }
    //启用线程插入
    public  void insert(DelegateMapper dm,String sqlpath,Map<String,Object> param){
        if(checkDmOrSqlpath(dm,sqlpath)==1){System.out.println("插入线程启动失败！");return;}
        mr=new MyRunnable(dm,sqlpath,param,"insert");
        thread=new Thread(mr);
        thread.start();
    }
    //启用线程更新数据
    public  void update(DelegateMapper dm,String sqlpath,Map<String,Object> param){
        if(checkDmOrSqlpath(dm,sqlpath)==1){System.out.println("修改数据线程启动失败！");return;}
        mr=new MyRunnable(dm,sqlpath,param,"update");
        thread=new Thread(mr);
        thread.start();
    }

    //启用线程删除数据
    public  void delete(DelegateMapper dm,String sqlpath,Map<String,Object> param){
        if(checkDmOrSqlpath(dm,sqlpath)==1){System.out.println("删除数据线程启动失败！");return;}
        mr=new MyRunnable(dm,sqlpath,param,"delete");
        thread=new Thread(mr);
        thread.start();
    }

    //判断DelegateMapper是否为空或者sqlpath是否为空
    public int  checkDmOrSqlpath(DelegateMapper dm,String sqlpath){
          int r=0;
          if(dm==null||sqlpath.isEmpty()){
              r=1;
          }
          return r;
    }
}
