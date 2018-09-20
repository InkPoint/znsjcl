package com.xalt.sjjg.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/1/9.
 * User: CuiHeng
 * 加工任务管理
 */
public class JgrwglVo extends BaseVO {
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String rwms;//任务描述
    private String kssj;//任务开始时间
    private String lasttime;//最后一次执行时间
    private String zt;//运行状态
    private String jobid;//job编号
    private String zxr;//执行人代码
    private String mxid;//加工模型id
    private String yxbz;//有效标志
    private String zqmc;//执行周期
    private String ztmc;//状态名称
    private String zqid;//周期id
    private String id;
    private String text;
    private String mxmc;//模型名称
    private String jgmx;//
    private String job;
    private String ywbm;

    public String getYwbm() {
        return ywbm;
    }

    public void setYwbm(String ywbm) {
        this.ywbm = ywbm;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getJgmx() {
        return jgmx;
    }

    public void setJgmx(String jgmx) {
        this.jgmx = jgmx;
    }

    public String getMxmc() {
        return mxmc;
    }

    public void setMxmc(String mxmc) {
        this.mxmc = mxmc;
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

    public String getZqid() {
        return zqid;
    }

    public void setZqid(String zqid) {
        this.zqid = zqid;
    }

    public String getZtmc() {
        return ztmc;
    }

    public void setZtmc(String ztmc) {
        this.ztmc = ztmc;
    }

    public String getZqmc() {
        return zqmc;
    }

    public void setZqmc(String zqmc) {
        this.zqmc = zqmc;
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

    public String getRwms() {
        return rwms;
    }

    public void setRwms(String rwms) {
        this.rwms = rwms;
    }

    public String getKssj() {
        return kssj;
    }

    public void setKssj(String kssj) {
        this.kssj = kssj;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getZt() {
        return zt;
    }

    public void setZt(String zt) {
        this.zt = zt;
    }

    public String getJobid() {
        return jobid;
    }

    public void setJobid(String jobid) {
        this.jobid = jobid;
    }

    public String getZxr() {
        return zxr;
    }

    public void setZxr(String zxr) {
        this.zxr = zxr;
    }

    public String getMxid() {
        return mxid;
    }

    public void setMxid(String mxid) {
        this.mxid = mxid;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }
}
