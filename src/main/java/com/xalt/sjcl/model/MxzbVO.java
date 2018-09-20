package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 *  模型指标对应关联字段表
 */
public class MxzbVO extends BaseVO {
    //映射对象
    //关联id
    private String mxzbid;
    //模型id
    private String mxid;
    //指标id
    private String zbid;
    //源表
    private String  yb;
    //源表字段
    private String ybzd;
    //目标表
    private String mbb;
    //目标表字段
    private String mbbzd;
    //序号
    private String xh;
    //备注
    private String bz;
    //指标名称
    private String zbmc;

    public String getZbmc() {
        return zbmc;
    }

    public void setZbmc(String zbmc) {
        this.zbmc = zbmc;
    }

    public String getMxzbid() {
        return mxzbid;
    }

    public String getMxid() {
        return mxid;
    }

    public void setMxid(String mxid) {
        this.mxid = mxid;
    }

    public void setMxzbid(String mxzbid) {
        this.mxzbid = mxzbid;
    }

    public String getZbid() {
        return zbid;
    }

    public void setZbid(String zbid) {
        this.zbid = zbid;
    }

    public String getYb() {
        return yb;
    }

    public void setYb(String yb) {
        this.yb = yb;
    }

    public String getYbzd() {
        return ybzd;
    }

    public void setYbzd(String ybzd) {
        this.ybzd = ybzd;
    }

    public String getMbb() {
        return mbb;
    }

    public void setMbb(String mbb) {
        this.mbb = mbb;
    }

    public String getMbbzd() {
        return mbbzd;
    }

    public void setMbbzd(String mbbzd) {
        this.mbbzd = mbbzd;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }
}
