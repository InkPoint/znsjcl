package com.xalt.sjzd.model;

/**
 * Created by win7 on 2017/10/25.
 * 数据来源树形菜单
 */
public class DymicVO {
    //列字段名
    private String field;
    //复选框
    private String checkbox;
    //列名
    private String title;
    //bootstrap-table单元格内容是否居中
    private String align;
    //halign指定如何对齐表格标题，‘左’，‘右’，‘中间’
    private String halign;

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getCheckbox() {
        return checkbox;
    }

    public void setCheckbox(String checkbox) {
        this.checkbox = checkbox;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAlign() {
        return align;
    }

    public void setAlign(String align) {
        this.align = align;
    }

    public String getHalign() {
        return halign;
    }

    public void setHalign(String halign) {
        this.halign = halign;
    }
}
