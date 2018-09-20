package com.xalt.sjjh.model;

/**
 * Created by win7 on 2017/10/27.
 */
public class Rwssxj {
    private String sqid;//申请id	Varchar2
    private String bz;//实施内容	Varchar2
    private String gxsj;    //更新时间	Varchar2
    private String yxbz;    //有效标志	Varchar2

    public String getSqid() {
        return sqid;
    }

    public void setSqid(String sqid) {
        this.sqid = sqid;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getGxsj() {
        return gxsj;
    }

    public void setGxsj(String gxsj) {
        this.gxsj = gxsj;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }
}
