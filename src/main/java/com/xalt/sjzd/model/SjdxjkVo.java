package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/11/13.
 * 数据对象监控
 */
public class SjdxjkVo extends BaseVO {
    private String fqid;//分区id
    private String  wjgl;//未经管理表数量
    private String wzbsl;//未知表数量
    private String ycbsl;//异常表数量
    private String yxbz;//有效标志
    private String fqmc;//分区名称
    private String bs;//标识
    private String tablename;//表英文名
    private String comments;//表中文名
    private String tabletype;//表类型
    private String columnname;//数据项名称（中文）
    private String datatype;//数据项类型
    private String table_name;

    public String getTable_name() {
        return table_name;
    }

    public void setTable_name(String table_name) {
        this.table_name = table_name;
    }

    public String getColumnname() {
        return columnname;
    }

    public void setColumnname(String columnname) {
        this.columnname = columnname;
    }

    public String getDatatype() {
        return datatype;
    }

    public void setDatatype(String datatype) {
        this.datatype = datatype;
    }

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename;
    }

    public String getTabletype() {
        return tabletype;
    }

    public void setTabletype(String tabletype) {
        this.tabletype = tabletype;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }





    public String getBs() {
        return bs;
    }

    public void setBs(String bs) {
        this.bs = bs;
    }

    public String getFqid() {
        return fqid;
    }

    public void setFqid(String fqid) {
        this.fqid = fqid;
    }

    public String getWjgl() {
        return wjgl;
    }

    public void setWjgl(String wjgl) {
        this.wjgl = wjgl;
    }

    public String getWzbsl() {
        return wzbsl;
    }

    public void setWzbsl(String wzbsl) {
        this.wzbsl = wzbsl;
    }

    public String getYcbsl() {
        return ycbsl;
    }

    public void setYcbsl(String ycbsl) {
        this.ycbsl = ycbsl;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getFqmc() {
        return fqmc;
    }

    public void setFqmc(String fqmc) {
        this.fqmc = fqmc;
    }
}
