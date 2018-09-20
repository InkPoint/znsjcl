package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 *  指标规则对应关联字段表
 */
public class ZbgzVO extends BaseVO {
    //映射对象
    //关联id
    private String zbgzid;
    //指标id
    private String zbid;
    //规则id
    private String gzid;
    //规则名称
    private String gzmc;
    //序号
    private String xh;
    //备注
    private String bz;


    public String getGzmc() {
        return gzmc;
    }

    public void setGzmc(String gzmc) {
        this.gzmc = gzmc;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getZbgzid() {
        return zbgzid;
    }

    public void setZbgzid(String zbgzid) {
        this.zbgzid = zbgzid;
    }

    public String getZbid() {
        return zbid;
    }

    public void setZbid(String zbid) {
        this.zbid = zbid;
    }

    public String getGzid() {
        return gzid;
    }

    public void setGzid(String gzid) {
        this.gzid = gzid;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }
}
