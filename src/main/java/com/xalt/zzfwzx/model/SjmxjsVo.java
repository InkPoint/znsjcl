package com.xalt.zzfwzx.model;

import com.ts.model.BaseVO;

/**
 *
 * 数据模型检索
 * Created by cuiheng on 2018/4/20.
 */
public class SjmxjsVo extends BaseVO {
    private String mxid;//模型id
    private String mxmc;//模型名称
    private String mxms;//模型描述
    private String sjyj;//数据元件
    private String zdygs;//自定义分析公式
    private String fxjg;//分析结果
    private String cjsj;//创建时间
    private String cjr;//创建人代码
    private String bz;//备注
    private String bbh;//版本号
    private String yxbz;//有效标志

    public String getMxid() {
        return mxid;
    }

    public void setMxid(String mxid) {
        this.mxid = mxid;
    }

    public String getMxmc() {
        return mxmc;
    }

    public void setMxmc(String mxmc) {
        this.mxmc = mxmc;
    }

    public String getMxms() {
        return mxms;
    }

    public void setMxms(String mxms) {
        this.mxms = mxms;
    }

    public String getSjyj() {
        return sjyj;
    }

    public void setSjyj(String sjyj) {
        this.sjyj = sjyj;
    }

    public String getZdygs() {
        return zdygs;
    }

    public void setZdygs(String zdygs) {
        this.zdygs = zdygs;
    }

    public String getFxjg() {
        return fxjg;
    }

    public void setFxjg(String fxjg) {
        this.fxjg = fxjg;
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

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getBbh() {
        return bbh;
    }

    public void setBbh(String bbh) {
        this.bbh = bbh;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }
}
