package com.xalt.sjjg.model;

import com.ts.model.BaseVO;

/**
 * Created by PengWen Wang on 2018/7/10.
 * 个税查询
 */
public class GscxVO extends BaseVO {
    private String dwswjgmc;    //单位税务机关名称
    private String sh;          //税号
    private String dwmc;        //单位名称
    private String xm;          //姓名
    private String zjlx;        //证件类型
    private String sfzhm;       //身份证号码
    private String skssqq;      //税款所属期起
    private String skssqz;      //税款所属期止
    private String sre;         //收入额
    private String ynse;        //应纳税额
    private String xmmc;        //项目

    public String getDwswjgmc() {
        return dwswjgmc;
    }

    public void setDwswjgmc(String dwswjgmc) {
        this.dwswjgmc = dwswjgmc;
    }

    public String getSh() {
        return sh;
    }

    public void setSh(String sh) {
        this.sh = sh;
    }

    public String getDwmc() {
        return dwmc;
    }

    public void setDwmc(String dwmc) {
        this.dwmc = dwmc;
    }

    public String getXm() {
        return xm;
    }

    public void setXm(String xm) {
        this.xm = xm;
    }

    public String getZjlx() {
        return zjlx;
    }

    public void setZjlx(String zjlx) {
        this.zjlx = zjlx;
    }

    public String getSfzhm() {
        return sfzhm;
    }

    public void setSfzhm(String sfzhm) {
        this.sfzhm = sfzhm;
    }

    public String getSkssqq() {
        return skssqq;
    }

    public void setSkssqq(String skssqq) {
        this.skssqq = skssqq;
    }

    public String getSkssqz() {
        return skssqz;
    }

    public void setSkssqz(String skssqz) {
        this.skssqz = skssqz;
    }

    public String getSre() {
        return sre;
    }

    public void setSre(String sre) {
        this.sre = sre;
    }

    public String getYnse() {
        return ynse;
    }

    public void setYnse(String ynse) {
        this.ynse = ynse;
    }

    public String getXmmc() {
        return xmmc;
    }

    public void setXmmc(String xmmc) {
        this.xmmc = xmmc;
    }
}
