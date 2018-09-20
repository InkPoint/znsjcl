package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

/**
 * Created by CuiHeng on 2018/1/31.
 * 任务实施反馈
 */
public class RwyxfkVo extends BaseVO {
    private String lcid;//流程id
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String cjsj;//创建时间
    private String cjr;//创建人
    private String rwsm;//任务说明
    private String savepath;//文件名称
    private String bz;//备注
    private String wcjd;//完成进度
    private String jzrq;//截止日期
    private String xyhjid;//下一环节id
    private String name;//用户名
    private String shzt;//审核状态
    private String yjmc;//元件名称

    public String getYjmc() {
        return yjmc;
    }

    public void setYjmc(String yjmc) {
        this.yjmc = yjmc;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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
}
