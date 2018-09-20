package com.xalt.sjjh.model;

import com.ts.model.BaseVO;

/**
 * author:WangPengWen
 * Created by win7 on 2017/11/10.
 * 任务进度监控
 */
public class RwjdjkVo extends BaseVO {
    //申请ID
    private String sqid;
    //申请标题
    private String sqbt;
    //申请内容
    private String sqnr;
    //申请人代码
    private String sqrdm;
    //批次
    private String pc;
    //申请时间
    private String sqsj;
    //申请时间止
    private String sqsjz;
    //审核人代码
    private String shrdm;
    //审核意见
    private String shyj;
    //审核时间
    private String shsj;
    //完成进度
    private String wcjd;
    //进度反馈时间
    private String jdfksj;
    //完成时间
    private String wcsj;
    //反馈人员代码
    private String fkry;
    //备注
    private String bz;
    //申请类型ID
    private String sqlxid;
    //有效标志
    private String yxbz;
    //时限要求
    private String sxyq;
    //审核状态
    private String shzt;

    public String getShzt() {
        return shzt;
    }

    public void setShzt(String shzt) {
        this.shzt = shzt;
    }

    public String getYwmc() {
        return ywmc;
    }

    public void setYwmc(String ywmc) {
        this.ywmc = ywmc;
    }

    public String getZwmc() {
        return zwmc;
    }

    public void setZwmc(String zwmc) {
        this.zwmc = zwmc;
    }

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

    public String getSqrdm() {
        return sqrdm;
    }

    public void setSqrdm(String sqrdm) {
        this.sqrdm = sqrdm;
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

    public String getSqsjz() {
        return sqsjz;
    }

    public void setSqsjz(String sqsjz) {
        this.sqsjz = sqsjz;
    }

    public String getShrdm() {
        return shrdm;
    }

    public void setShrdm(String shrdm) {
        this.shrdm = shrdm;
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

    public String getSxyq() {
        return sxyq;
    }

    public void setSxyq(String sxyq) {
        this.sxyq = sxyq;
    }


    private String lcid;//流程id
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String cjsj;//创建时间
    private String rwsm;//任务说明
    private String savepath;//文件名称
    private String xyhjid;//下一环节id
    private String jzrq;//截止日期
    private String name;//申请人名称

    private String tablename; //表名称中文
    private String comments;//表名称英文
    private String tabletype;//表数量
    private String ywmc;//英文名词
    private String zwmc;//中文名称

    public String getTablename() {
        return tablename;
    }

    public void setTablename(String tablename) {
        this.tablename = tablename;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getTabletype() {
        return tabletype;
    }

    public void setTabletype(String tabletype) {
        this.tabletype = tabletype;
    }

    public String getLcid() {
        return lcid;
    }

    public void setLcid(String lcid) {
        this.lcid = lcid;
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

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
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

    public String getXyhjid() {
        return xyhjid;
    }

    public void setXyhjid(String xyhjid) {
        this.xyhjid = xyhjid;
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
