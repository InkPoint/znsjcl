package com.xalt.sjjh.model;

/**
 * Created by win7 on 2017/10/27.
 */
public class sjdcrwssfk {
    private String sqid	;//申请id	Varchar2
    private String sqbt	;//申请标题	Varchar2
    private String sqnr;	//申请内容	Varchar2
    private String sqr_dm;	//申请人代码	Varchar2
    private String pc	;//批次	Varchar2
    private String sqsj	;//申请时间	date
    private String shr_dm;	//审核人代码	Varchar2
    private String shyj	;//审核意见	Varchar2
    private String shsj	;//审核时间	date
    private String wcjd	;//完成进度	Varchar2
    private String jdfksj;	//进度反馈时间	date
    private String wcsj	;//完成时间	date
    private String fkry	;//反馈人员代码	Varchar2
    private String bz	;//备注	Varchar2
    private String sqlxid	;//申请类型id	Varchar2
    private String yxbz	;//有效标志	Char(1)
    private String sqsjbegin	;//申请开始时间	date
    private String sqsjend	;//申请结束时间	date

    public String getSqid() {
        return sqid;
    }

    public void setSqid(String sqid) {
        this.sqid = sqid;
    }

    public String getSqbt() {
        return sqbt;
    }

    public void setSqbt(String sqbt) {
        this.sqbt = sqbt;
    }

    public String getSqnr() {
        return sqnr;
    }

    public void setSqnr(String sqnr) {
        this.sqnr = sqnr;
    }

    public String getSqr_dm() {
        return sqr_dm;
    }

    public void setSqr_dm(String sqr_dm) {
        this.sqr_dm = sqr_dm;
    }

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc;
    }

    public String getSqsj() {
        return sqsj;
    }

    public void setSqsj(String sqsj) {
        this.sqsj = sqsj;
    }

    public String getShr_dm() {
        return shr_dm;
    }

    public void setShr_dm(String shr_dm) {
        this.shr_dm = shr_dm;
    }

    public String getShyj() {
        return shyj;
    }

    public void setShyj(String shyj) {
        this.shyj = shyj;
    }

    public String getShsj() {
        return shsj;
    }

    public void setShsj(String shsj) {
        this.shsj = shsj;
    }

    public String getWcjd() {
        return wcjd;
    }

    public void setWcjd(String wcjd) {
        this.wcjd = wcjd;
    }

    public String getJdfksj() {
        return jdfksj;
    }

    public void setJdfksj(String jdfksj) {
        this.jdfksj = jdfksj;
    }

    public String getWcsj() {
        return wcsj;
    }

    public void setWcsj(String wcsj) {
        this.wcsj = wcsj;
    }

    public String getFkry() {
        return fkry;
    }

    public void setFkry(String fkry) {
        this.fkry = fkry;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getSqlxid() {
        return sqlxid;
    }

    public void setSqlxid(String sqlxid) {
        this.sqlxid = sqlxid;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getSqsjbegin() {
        return sqsjbegin;
    }

    public void setSqsjbegin(String sqsjbegin) {
        this.sqsjbegin = sqsjbegin;
    }

    public String getSqsjend() {
        return sqsjend;
    }

    public void setSqsjend(String sqsjend) {
        this.sqsjend = sqsjend;
    }



    private String rwid;//任务id
    private String rwmc;//任务名称
    private String rwsm;//任务说明
    private String lcid;//流程id
    private String xyhjid;//下一环节id
    private String cjsj;//穿件时间
    private String jzrq;//截止日期

    private String name;//

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

    public String getRwsm() {
        return rwsm;
    }

    public void setRwsm(String rwsm) {
        this.rwsm = rwsm;
    }

    public String getLcid() {
        return lcid;
    }

    public void setLcid(String lcid) {
        this.lcid = lcid;
    }

    public String getXyhjid() {
        return xyhjid;
    }

    public void setXyhjid(String xyhjid) {
        this.xyhjid = xyhjid;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getJzrq() {
        return jzrq;
    }

    public void setJzrq(String jzrq) {
        this.jzrq = jzrq;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
