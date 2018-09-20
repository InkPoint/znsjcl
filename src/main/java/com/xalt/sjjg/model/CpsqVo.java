package com.xalt.sjjg.model;

import com.ts.model.BaseVO;



/**
 * Created by CuiHeng on 2018/2/2.
 * 产品申请
 */
public class CpsqVo extends BaseVO {
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String cjr;//创建人
    private String rwsm;//任务说明
    private String savepath;//文件名称
    private String bz;//备注
    private String wcjd;//完成进度
    private String jzrq;//截止日期
    private String xyhjid;//下一环节id
    private String name;
    private String cjsj;//创建时间
    private String fkrwid;
    private String sjb;
    private String ccgc;
    private String ywbm;

    public String getYwbm() {
        return ywbm;
    }

    public void setYwbm(String ywbm) {
        this.ywbm = ywbm;
    }

    public String getSjb() {
        return sjb;
    }

    public void setSjb(String sjb) {
        this.sjb = sjb;
    }

    public String getCcgc() {
        return ccgc;
    }

    public void setCcgc(String ccgc) {
        this.ccgc = ccgc;
    }

    public String getFkrwid() {
        return fkrwid;
    }

    public void setFkrwid(String fkrwid) {
        this.fkrwid = fkrwid;
    }

    private String fkxj;//

    public String getFkxj() {
        return fkxj;
    }

    public void setFkxj(String fkxj) {
        this.fkxj = fkxj;
    }

    public String getRwid() {
        return rwid;
    }

    public void setRwid(String rwid) {
        this.rwid = rwid;
    }

    public String getRwmc() {
        return rwmc;
    }

    public void setRwmc(String rwmc) {
        this.rwmc = rwmc;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getRwsm() {
        return rwsm;
    }

    public void setRwsm(String rwsm) {
        this.rwsm = rwsm;
    }

    public String getSavepath() {
        return savepath;
    }

    public void setSavepath(String savepath) {
        this.savepath = savepath;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getWcjd() {
        return wcjd;
    }

    public void setWcjd(String wcjd) {
        this.wcjd = wcjd;
    }

    public String getJzrq() {
        return jzrq;
    }

    public void setJzrq(String jzrq) {
        this.jzrq = jzrq;
    }

    public String getXyhjid() {
        return xyhjid;
    }

    public void setXyhjid(String xyhjid) {
        this.xyhjid = xyhjid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }
}
