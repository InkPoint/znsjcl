package com.xalt.sjjg.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/1/9.
 * User:CuiHeng
 * 加工模型
 */
public class JgmxglVo extends BaseVO {

    private String mxid;//模型id
    private String mxmc;//模型名称
    private String cwmc;//产物名称
    private String ccgc;//存储过程
    private String yjid;//元件id
    private String cjr;//创建人
    private String cjsj;//创建时间
    private String bz;//备注
    private String yxbz;//有效标志
    private String bbh;//版本号
    private String id;
    private String text;
    private String yjmc;//元件名称
    private String sjyj;//数据元件
    private String jobid;
    private String job;

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getJobid() {
        return jobid;
    }

    public void setJobid(String jobid) {
        this.jobid = jobid;
    }

    public String getSjyj() {
        return sjyj;
    }

    public void setSjyj(String sjyj) {
        this.sjyj = sjyj;
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

    public String getYjmc() {
        return yjmc;
    }

    public void setYjmc(String yjmc) {
        this.yjmc = yjmc;
    }

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

    public String getCwmc() {
        return cwmc;
    }

    public void setCwmc(String cwmc) {
        this.cwmc = cwmc;
    }

    public String getCcgc() {
        return ccgc;
    }

    public void setCcgc(String ccgc) {
        this.ccgc = ccgc;
    }

    public String getYjid() {
        return yjid;
    }

    public void setYjid(String yjid) {
        this.yjid = yjid;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getBbh() {
        return bbh;
    }

    public void setBbh(String bbh) {
        this.bbh = bbh;
    }
}
