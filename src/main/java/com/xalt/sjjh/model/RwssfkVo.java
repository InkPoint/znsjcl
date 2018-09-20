package com.xalt.sjjh.model;

import com.ts.model.BaseVO;

/**
 * Created by CuiHeng on 2018/1/26.
 * 任务实施反馈
 */
public class RwssfkVo extends BaseVO {

    private String rwid;//任务id
    private String rwmc;// 任务名称
    private String lcid;//流程id
    private String cjsj;//创建时间
    private String username;//创建人
    private String rwsm;//任务说明
    private String bz;//备注
    private String xyhjid;//下一环节id
    private String jzrq;//截止日期
    private String sqid;//申请id
    private String bzwm;//表中文名
    private String bywm;//表英文名
    private String gxsj;//更新时间
    private String wcjd;//完成进度
    private String sliding;
    private String id;
    private String text;
    private String dxmcyw;//对象名称英文
    private String dxmczw;//对象名称中文
    private String shzt;//
    private  String bzwmc;

    public String getBzwmc() {
        return bzwmc;
    }

    public void setBzwmc(String bzwmc) {
        this.bzwmc = bzwmc;
    }

    public String getShzt() {
        return shzt;
    }

    public void setShzt(String shzt) {
        this.shzt = shzt;
    }

    public String getDxmczw() {
        return dxmczw;
    }

    public void setDxmczw(String dxmczw) {
        this.dxmczw = dxmczw;
    }

    public String getDxmcyw() {
        return dxmcyw;
    }

    public void setDxmcyw(String dxmcyw) {
        this.dxmcyw = dxmcyw;
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

    public String getSliding() {
        return sliding;
    }

    public void setSliding(String sliding) {
        this.sliding = sliding;
    }

    public String getWcjd() {
        return wcjd;
    }

    public void setWcjd(String wcjd) {
        this.wcjd = wcjd;
    }

    public String getSqid() {
        return sqid;
    }

    public void setSqid(String sqid) {
        this.sqid = sqid;
    }

    public String getBzwm() {
        return bzwm;
    }

    public void setBzwm(String bzwm) {
        this.bzwm = bzwm;
    }

    public String getBywm() {
        return bywm;
    }

    public void setBywm(String bywm) {
        this.bywm = bywm;
    }

    public String getGxsj() {
        return gxsj;
    }

    public void setGxsj(String gxsj) {
        this.gxsj = gxsj;
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

    public String getLcid() {
        return lcid;
    }

    public void setLcid(String lcid) {
        this.lcid = lcid;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRwsm() {
        return rwsm;
    }

    public void setRwsm(String rwsm) {
        this.rwsm = rwsm;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
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
}
