package com.xalt.sjsplc.model;

import com.ts.model.BaseVO;

import java.util.Date;

/**
 * Created by win7 on 2017/10/23.
 * 数据导入申请
 */
public class SjdrsqVo extends BaseVO {
    private String sqid;//申请id
    private String sqbt;//申请标题
    private String sqnr;//申请内容
    private String sqr_dm;//申请人代码
    private String sqr;
    private String pc;//批次
    private String sqsj;//申请时间
    private String shr_dm;//审核人代码
    private String shyj;//审核意见
    private String shsj;//审核时间
    private String wcjd;//完成进度
    private String jdfksj;//进度反馈时间
    private String wcsj; //完成时间
    private String fkry;//反馈人员代码
    private String sqlxid;//申请类型id
    private String yxbz;//有效标志
    private String bmdm;//部门代码
    private String sqsjq;//申请时间起
    private String sqsjz;//申请时间止
    private String sqlxmc; //申请类型名称
    private String shbz;//审核标志
    private String xyhjid;//下一环节id
    private String shzt;//审核状态
    private String cjsjbegin;//时间起
    private String cjsjend;//时间止

    public String getCjsjbegin() {
        return cjsjbegin;
    }

    public void setCjsjbegin(String cjsjbegin) {
        this.cjsjbegin = cjsjbegin;
    }

    public String getCjsjend() {
        return cjsjend;
    }

    public void setCjsjend(String cjsjend) {
        this.cjsjend = cjsjend;
    }

    public String getShzt() {
        return shzt;
    }

    public void setShzt(String shzt) {
        this.shzt = shzt;
    }

    public String getXyhjid() {
        return xyhjid;
    }

    public void setXyhjid(String xyhjid) {
        this.xyhjid = xyhjid;
    }

    public String getShbz() {
        return shbz;
    }

    public void setShbz(String shbz) {
        this.shbz = shbz;
    }

    public String getSqr() {
        return sqr;
    }

    public void setSqr(String sqr) {
        this.sqr = sqr;
    }

    public String getSqlxmc() {
        return sqlxmc;
    }

    public void setSqlxmc(String sqlxmc) {
        this.sqlxmc = sqlxmc;
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

    public String getBmdm() {
        return bmdm;
    }

    public void setBmdm(String bmdm) {
        this.bmdm = bmdm;
    }

    public String getSqsjq() {
        return sqsjq;
    }

    public void setSqsjq(String sqsjq) {
        this.sqsjq = sqsjq;
    }

    public String getSqsjz() {
        return sqsjz;
    }

    public void setSqsjz(String sqsjz) {
        this.sqsjz = sqsjz;
    }

    /**
     *
     *
     *
     */
    private String lcid;//流程id
    private String lcmc;//流程名称
    private String id;//
    private String text;//
    private String hjid;//环节id
    private String minhjid;//最小环节id
    private String bz;//标志
    private String rwmc;//任务命长
    private String rwsm;//任务说明
    private String cjsj;//创建时间
    private String cjr;//创建人
    private String userId;//登录人id
    private String rwid;//任务id
    private String gwid;//岗位id
    private String clgw;//处理岗位
    private String scbz;//上传标志
    private String xzbz;//下载标志
    private String dqhjid;//当前环节id
    private String zz;
    private  String fileinput;//文件名称
    private String wjmc;//文件名称
    private String sqrscwj;//申请人上传文件

    private String hjmc;//环节名称
    private String shjid;//上环节id
    private String savepath;//文件名称
    private String jzrq;//处理截止日期

    private String user_name;//申请人
    private String username;//
    private String user_code;//申请人代码
    private String sfsh;//是否审核



    public String getSfsh() {
        return sfsh;
    }

    public void setSfsh(String sfsh) {
        this.sfsh = sfsh;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_code() {
        return user_code;
    }

    public void setUser_code(String user_code) {
        this.user_code = user_code;
    }

    public String getJzrq() {
        return jzrq;
    }

    public void setJzrq(String jzrq) {
        this.jzrq = jzrq;
    }

    public String getSavepath() {
        return savepath;
    }

    public void setSavepath(String savepath) {
        this.savepath = savepath;
    }

    public String getHjmc() {
        return hjmc;
    }

    public void setHjmc(String hjmc) {
        this.hjmc = hjmc;
    }

    public String getShjid() {
        return shjid;
    }

    public void setShjid(String shjid) {
        this.shjid = shjid;
    }

    public String getSqrscwj() {
        return sqrscwj;
    }

    public void setSqrscwj(String sqrscwj) {
        this.sqrscwj = sqrscwj;
    }

    public String getWjmc() {
        return wjmc;
    }

    public void setWjmc(String wjmc) {
        this.wjmc = wjmc;
    }

    public String getFileinput() {
        return fileinput;
    }

    public void setFileinput(String fileinput) {
        this.fileinput = fileinput;
    }

    public String getZz() {
        return zz;
    }

    public void setZz(String zz) {
        this.zz = zz;
    }

    public String getDqhjid() {
        return dqhjid;
    }

    public void setDqhjid(String dqhjid) {
        this.dqhjid = dqhjid;
    }

    public String getXzbz() {
        return xzbz;
    }

    public void setXzbz(String xzbz) {
        this.xzbz = xzbz;
    }

    public String getScbz() {
        return scbz;
    }

    public void setScbz(String scbz) {
        this.scbz = scbz;
    }

    public String getClgw() {
        return clgw;
    }

    public void setClgw(String clgw) {
        this.clgw = clgw;
    }

    public String getGwid() {
        return gwid;
    }

    public void setGwid(String gwid) {
        this.gwid = gwid;
    }

    public String getRwid() {
        return rwid;
    }

    public void setRwid(String rwid) {
        this.rwid = rwid;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
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

    public String getMinhjid() {
        return minhjid;
    }

    public void setMinhjid(String minhjid) {
        this.minhjid = minhjid;
    }

    public String getHjid() {
        return hjid;
    }

    public void setHjid(String hjid) {
        this.hjid = hjid;
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

    public String getLcid() {
        return lcid;
    }

    public void setLcid(String lcid) {
        this.lcid = lcid;
    }

    public String getLcmc() {
        return lcmc;
    }

    public void setLcmc(String lcmc) {
        this.lcmc = lcmc;
    }
}
