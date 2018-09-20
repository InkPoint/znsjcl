package com.xalt.utils;

import com.ts.persistence.dao.DelegateMapper;

import java.util.HashMap;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 18-1-16
 * Time: 上午9:20
 *
 */
public class MyRunnable implements  Runnable{
    private DelegateMapper  delegateMapper;
    //查询sql命名空间路径
    private String sqlpath;
    //参数集合
    private Map<String,Object> map=new HashMap<String,Object>();
    //执行结果对象
    private Object results;
    //执行语句类型 添加删除修改查询
    private String excutflag="";
    //含参构造
    public MyRunnable(DelegateMapper dm,String sqlpath,Map<String,Object> map,String excutflag){
            this.delegateMapper=dm;
            this.sqlpath=sqlpath;
            this.map=map;
            this.excutflag=excutflag;
    }

    public String getExcutflag() {
        return excutflag;
    }

    public void setExcutflag(String excutflag) {
        this.excutflag = excutflag;
    }

    public DelegateMapper getDelegateMapper() {
        return delegateMapper;
    }

    public void setDelegateMapper(DelegateMapper delegateMapper) {
        this.delegateMapper = delegateMapper;
    }

    public String getSqlpath() {
        return sqlpath;
    }

    public void setSqlpath(String sqlpath) {
        this.sqlpath = sqlpath;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }

    public Object getResults() {
        return results;
    }

    public void setResults(Object results) {
        this.results = results;
    }

    //多线程方法
    @Override
    public void run() {
        String sss=this.getClass().getMethods().toString();
        System.out.print("线程启动了。。。。");
        if("selectList".equals(excutflag)){
            //查询
            System.out.print("执行查询语句。。。。");
            results=delegateMapper.selectList(sqlpath,map);
        }else  if("insert".equals(excutflag)){
            //添加
            System.out.print("执行插入语句。。。。");
            results=delegateMapper.insert(sqlpath, map);
        } else  if("update".equals(excutflag)){
            //修改
            System.out.print("执行修改语句。。。。");
            results=delegateMapper.update(sqlpath, map);
        }else  if("delete".equals(excutflag)){
            //删除
            System.out.print("执行删除语句。。。。");
            results=delegateMapper.delete(sqlpath, map);
        }
        System.out.print("线程结束了。。。。");
    }


}
