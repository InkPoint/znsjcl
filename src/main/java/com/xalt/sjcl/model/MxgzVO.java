package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 *  模型规则对应关联字段表
 */
public class MxgzVO extends BaseVO {


    //映射对象
    //关联id
    private String mxgzid;
    //模型id
    private String mxid;
    //源表字段英文
    private String ywzdmc_yb;
    //源表字段中文
    private String zwzdmc_yb;
    //目标表字段英文
    private String ywzdmc_mbb;
    //目标表字段中文
    private String zwzdmc_mbb;

    //源表字段英文
    private String ywzdmcyb;
    //源表字段中文
    private String zwzdmcyb;
    //目标表字段英文
    private String ywzdmcmbb;
    //目标表字段中文
    private String zwzdmcmbb;

    //规则id
    private String gzid;
    //执行顺序
    private String zxsx;
    //规则名称
    private String gzmc;

    public String getMxgzid() {
        return mxgzid;
    }

    public void setMxgzid(String mxgzid) {
        this.mxgzid = mxgzid;
    }

    public String getMxid() {
        return mxid;
    }

    public void setMxid(String mxid) {
        this.mxid = mxid;
    }

    public String getYwzdmc_yb() {
        return ywzdmc_yb;
    }

    public void setYwzdmc_yb(String ywzdmc_yb) {
        this.ywzdmc_yb = ywzdmc_yb;
    }

    public String getZwzdmc_yb() {
        return zwzdmc_yb;
    }

    public void setZwzdmc_yb(String zwzdmc_yb) {
        this.zwzdmc_yb = zwzdmc_yb;
    }

    public String getYwzdmc_mbb() {
        return ywzdmc_mbb;
    }

    public void setYwzdmc_mbb(String ywzdmc_mbb) {
        this.ywzdmc_mbb = ywzdmc_mbb;
    }

    public String getZwzdmc_mbb() {
        return zwzdmc_mbb;
    }

    public void setZwzdmc_mbb(String zwzdmc_mbb) {
        this.zwzdmc_mbb = zwzdmc_mbb;
    }

    public String getGzid() {
        return gzid;
    }

    public void setGzid(String gzid) {
        this.gzid = gzid;
    }

    public String getZxsx() {
        return zxsx;
    }

    public void setZxsx(String zxsx) {
        this.zxsx = zxsx;
    }

    public String getGzmc() {
        return gzmc;
    }

    public void setGzmc(String gzmc) {
        this.gzmc = gzmc;
    }

    public String getYwzdmcyb() {
        return ywzdmcyb;
    }

    public void setYwzdmcyb(String ywzdmcyb) {
        this.ywzdmcyb = ywzdmcyb;
    }

    public String getZwzdmcyb() {
        return zwzdmcyb;
    }

    public void setZwzdmcyb(String zwzdmcyb) {
        this.zwzdmcyb = zwzdmcyb;
    }

    public String getYwzdmcmbb() {
        return ywzdmcmbb;
    }

    public void setYwzdmcmbb(String ywzdmcmbb) {
        this.ywzdmcmbb = ywzdmcmbb;
    }

    public String getZwzdmcmbb() {
        return zwzdmcmbb;
    }

    public void setZwzdmcmbb(String zwzdmcmbb) {
        this.zwzdmcmbb = zwzdmcmbb;
    }
}
