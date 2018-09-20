package com.xalt.sjjh.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/11/15.
 * 导入任务定制
 * User:cuiheng
 */
public class DrrwdzVo extends BaseVO {
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String yb;//数据源表
    private String mbb;//目标表
    private String zqid; //执行周期id
    private String jobid;//jobid
    private String zxsj;//开始时间
    private String lasttime;//最后一次执行时间
    private String zxr;//执行人代码
    private String bz;//备注
    private String yxbz;//有效标志
    private String id;
    private String text;
    private String zqmc;//周期名称
    private String yxzt;//运行状态
    private String sqsj;//申请时间
    private String job;//
    private String dxmcyw;//对象名称英文
    private String dxmczw;//对象民称中文
    private String ztmc; //状态名称
    private String dxid;//对象id
    private String mbyb;//目标源表
    private String ybzwm;//源表中文名
    private String mbbzwm;//目标表中文名
    private String name;//执行人
    private String sjx;//数据项
    private String scjstime;//上次结束时间

    private String sctime;//上次执行时间
    private String xctime;//下次执行时间
    private String cjsj;//创建时间

    public String getScjstime() {
        return scjstime;
    }

    public void setScjstime(String scjstime) {
        this.scjstime = scjstime;
    }

    public String getSctime() {
        return sctime;
    }

    public void setSctime(String sctime) {
        this.sctime = sctime;
    }

    public String getXctime() {
        return xctime;
    }

    public void setXctime(String xctime) {
        this.xctime = xctime;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getSjx() {
        return sjx;
    }

    public void setSjx(String sjx) {
        this.sjx = sjx;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMbbzwm() {
        return mbbzwm;
    }

    public void setMbbzwm(String mbbzwm) {
        this.mbbzwm = mbbzwm;
    }

    public String getYbzwm() {
        return ybzwm;
    }

    public void setYbzwm(String ybzwm) {
        this.ybzwm = ybzwm;
    }

    public String getDxid() {
        return dxid;
    }

    public void setDxid(String dxid) {
        this.dxid = dxid;
    }

    public String getMbyb() {
        return mbyb;
    }

    public void setMbyb(String mbyb) {
        this.mbyb = mbyb;
    }

    public String getDxmczw() {
        return dxmczw;
    }

    public void setDxmczw(String dxmczw) {
        this.dxmczw = dxmczw;
    }

    public String getZtmc() {
        return ztmc;
    }

    public void setZtmc(String ztmc) {
        this.ztmc = ztmc;
    }

    public String getDxmcyw() {
        return dxmcyw;
    }

    public void setDxmcyw(String dxmcyw) {
        this.dxmcyw = dxmcyw;
    }

    public String getJobid() {
        return jobid;
    }

    public void setJobid(String jobid) {
        this.jobid = jobid;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getSqsj() {
        return sqsj;
    }

    public void setSqsj(String sqsj) {
        this.sqsj = sqsj;
    }

    public String getYxzt() {

        return yxzt;
    }

    public void setYxzt(String yxzt) {
        this.yxzt = yxzt;
    }

    public String getZqmc() {
        return zqmc;
    }

    public void setZqmc(String zqmc) {
        this.zqmc = zqmc;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getYb() {
        return yb;
    }

    public void setYb(String yb) {
        this.yb = yb;
    }

    public String getMbb() {
        return mbb;
    }

    public void setMbb(String mbb) {
        this.mbb = mbb;
    }

    public String getZqid() {
        return zqid;
    }

    public void setZqid(String zqid) {
        this.zqid = zqid;
    }


    public String getZxsj() {
        return zxsj;
    }

    public void setZxsj(String zxsj) {
        this.zxsj = zxsj;
    }

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getZxr() {
        return zxr;
    }

    public void setZxr(String zxr) {
        this.zxr = zxr;
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
}
