package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/6/6.
 * User:PengWen Wang
 * 保障性住房资格连审信息
 */
public class BzxzfzglsVO extends BaseVO {
    private String sqbh;       //申请编号
    private String sqr;       //申请人呢
    private String xm;       //姓名
    private String xb;        //性别
    private String gx;      //与申请人关系
    private String sfzhm;      //身份证号码
    private String ykzpsr;       //可支配收入
    private String jsr;       //约均收入
    private String ze;       //个人所得税总额

    public String getSqbh() {
        return sqbh;
    }

    public void setSqbh(String sqbh) {
        this.sqbh = sqbh;
    }

    public String getSqr() {
        return sqr;
    }

    public void setSqr(String sqr) {
        this.sqr = sqr;
    }

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm;
    }

    public String getXb() {
        return xb;
    }

    public void setXb(String xb) {
        this.xb = xb;
    }

    public String getGx() {
        return gx;
    }

    public void setGx(String gx) {
        this.gx = gx;
    }

    public String getSfzhm() {
        return sfzhm;
    }

    public void setSfzhm(String sfzhm) {
        this.sfzhm = sfzhm;
    }

    public String getYkzpsr() {
        return ykzpsr;
    }

    public void setYkzpsr(String ykzpsr) {
        this.ykzpsr = ykzpsr;
    }

    public String getJsr() {
        return jsr;
    }

    public void setJsr(String jsr) {
        this.jsr = jsr;
    }

    public String getZe() {
        return ze;
    }

    public void setZe(String ze) {
        this.ze = ze;
    }
}
