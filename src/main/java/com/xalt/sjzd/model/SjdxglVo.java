package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created by win7 on 2017/10/24.
 * 数据对象管理
 */
public class SjdxglVo extends BaseVO {
    //对象ID
    private String dxid;
    //对象名称(中文)
    private String dxmczw;
    //对象类型ID（表、视图）
    private String lxid;
    //对象描述
    private String dxms;
    //创建时间
    private String cjsj;
    //创建人代码
    private String cjr;
    //业务标签ID
    private String bqid;
    //数据来源ID
    private String lyid;
    //数据分区ID
    private String fqid;
    //备注
    private String bz;
    //有效标志 Y有效 N无效
    private String yxbz;
    //对象名称英文
    private String dxmcyw;
    //数据项名称
    private String sjxmczw;
    //数据项英文
    private String sjxmcyw;
    //数据项list
    private List sjxlist;
    //数据对象名称英文
    private String sjdxmcyw;
    //旧列名
    private String oldcolumn;
    //登记序号-列名称
    private String columnname;
    //表名
    private String table_name;
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
    //数据级别
    private String sjjb;
    private String ywbm;

    public String getYwbm() {
        return ywbm;
    }

    public void setYwbm(String ywbm) {
        this.ywbm = ywbm;
    }

    public String getOldcolumn() {
        return oldcolumn;
    }

    public void setOldcolumn(String oldcolumn) {
        this.oldcolumn = oldcolumn;
    }

    public String getSjdxmcyw() {
        return sjdxmcyw;
    }

    public void setSjdxmcyw(String sjdxmcyw) {
        this.sjdxmcyw = sjdxmcyw;
    }

    public String getDxmczw() {
        return dxmczw;
    }

    public void setDxmczw(String dxmczw) {
        this.dxmczw = dxmczw;
    }

    public List getSjxlist() {
        return sjxlist;
    }

    public void setSjxlist(List sjxlist) {
        this.sjxlist = sjxlist;
    }

    public String getDxmcyw() {
        return dxmcyw;
    }

    public void setDxmcyw(String dxmcyw) {
        this.dxmcyw = dxmcyw;
    }

    public String getDxid() {
        return dxid;
    }

    public void setDxid(String dxid) {
        this.dxid = dxid;
    }

    public String getLxid() {
        return lxid;
    }

    public void setLxid(String lxid) {
        this.lxid = lxid;
    }

    public String getDxms() {
        return dxms;
    }

    public void setDxms(String dxms) {
        this.dxms = dxms;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getBqid() {
        return bqid;
    }

    public void setBqid(String bqid) {
        this.bqid = bqid;
    }

    public String getLyid() {
        return lyid;
    }

    public void setLyid(String lyid) {
        this.lyid = lyid;
    }

    public String getFqid() {
        return fqid;
    }

    public void setFqid(String fqid) {
        this.fqid = fqid;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getSjxmczw() {
        return sjxmczw;
    }

    public void setSjxmczw(String sjxmczw) {
        this.sjxmczw = sjxmczw;
    }

    public String getSjxmcyw() {
        return sjxmcyw;
    }

    public void setSjxmcyw(String sjxmcyw) {
        this.sjxmcyw = sjxmcyw;
    }

    public String getColumnname() {
        return columnname;
    }

    public void setColumnname(String columnname) {
        this.columnname = columnname;
    }

    public String getTable_name() {
        return table_name;
    }

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

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

    public String getSjjb() {
        return sjjb;
    }

    public void setSjjb(String sjjb) {
        this.sjjb = sjjb;
    }
}
