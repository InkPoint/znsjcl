package com.xalt.demos.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 * To change this template use File | Settings | File Templates.
 */
public class QueryVO extends BaseVO {
    //查询条件
    //文本框
    private String wbkvalue;
    //下拉列表
    private List xllist;
    //下拉选项
    private String xlvalue;
    //时间组件
    private String datevalues;

    //表格数据list
    private List tabdatas;



    //查询结果
    private List resultlist;


    public List getTabdatas() {
        return tabdatas;
    }

    public void setTabdatas(List tabdatas) {
        this.tabdatas = tabdatas;
    }

    public String getWbkvalue() {
        return wbkvalue;
    }

    public void setWbkvalue(String wbkvalue) {
        this.wbkvalue = wbkvalue;
    }

    public List getXllist() {
        return xllist;
    }

    public void setXllist(List xllist) {
        this.xllist = xllist;
    }

    public String getXlvalue() {
        return xlvalue;
    }

    public void setXlvalue(String xlvalue) {
        this.xlvalue = xlvalue;
    }

    public String getDatevalues() {
        return datevalues;
    }

    public void setDatevalues(String datevalues) {
        this.datevalues = datevalues;
    }

    public List getResultlist() {
        return resultlist;
    }

    public void setResultlist(List resultlist) {
        this.resultlist = resultlist;
    }
}
