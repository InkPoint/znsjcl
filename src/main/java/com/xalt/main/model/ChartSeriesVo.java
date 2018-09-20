package com.xalt.main.model;

import com.google.common.collect.Lists;
import com.google.gson.JsonObject;

import java.util.List;

/**
 *   图形  series 对象
 */

public class ChartSeriesVo {

    //名称
    private String name;
    //类型
    private String type;
    //数据
    private List<Object> data= Lists.newArrayList();
    //
    private boolean smooth=true;
    //
    private ItemStyleVo itemStyle=new ItemStyleVo() ;


    public boolean isSmooth() {
        return smooth;
    }

    public void setSmooth(boolean smooth) {
        this.smooth = smooth;
    }

    public ItemStyleVo getItemStyle() {
        return itemStyle;
    }

    public void setItemStyle(ItemStyleVo itemStyle) {
        this.itemStyle = itemStyle;
    }

    public ChartSeriesVo(String name, String type) {
        this.name = name;
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public List<Object> getData() {
        return data;
    }

    public void addData(Object data){
        this.data.add(data)      ;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setData(List<Object> data) {
        this.data = data;
    }
}