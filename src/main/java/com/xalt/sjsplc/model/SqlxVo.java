package com.xalt.sjsplc.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/11/6.
 * 申请类型
 */
public class SqlxVo extends BaseVO {
    //数据标题
    private String sqbt;
    private String sqlxid;//申请类型ID
    private String sqlxmc;//申请类型名称
    private String yxbz;// 有效标志
    private String id;
    private String text;

    public String getSqbt() {
        return sqbt;
    }

    public void setSqbt(String sqbt) {
        this.sqbt = sqbt;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getSqlxid() {
        return sqlxid;
    }

    public void setSqlxid(String sqlxid) {
        this.sqlxid = sqlxid;
    }

    public String getSqlxmc() {
        return sqlxmc;
    }

    public void setSqlxmc(String sqlxmc) {
        this.sqlxmc = sqlxmc;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }
}
