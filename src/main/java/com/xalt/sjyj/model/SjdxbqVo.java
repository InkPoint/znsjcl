package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 *
 * 数据业务标签
 * Created by cuiheng on 2018/4/18.
 */
public class SjdxbqVo extends BaseVO {
    //主表传参
    private String bid;
    private String bzwmc;
    private String bywmc;
    private String bsjl;
    private String sjly;
    private String tjr;
    private String tjsj;
    //附表传参
    private String sjid;
    private String bqid;
    private String pid;

    //后台接受页面参数
    private String bqidstr;
    //是否含有标签flag
    private String bqflag;


    private String id;
    private String text;
    private String value;
    private String pbqid;
    private String bqmc;
    private String yxbz;
    private String lbmc;
    private String name;
    private String pId;
    private String zbid;


    public String getBqflag() {
        return bqflag;
    }

    public void setBqflag(String bqflag) {
        this.bqflag = bqflag;
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

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getPbqid() {
        return pbqid;
    }

    public void setPbqid(String pbqid) {
        this.pbqid = pbqid;
    }

    public String getBqmc() {
        return bqmc;
    }

    public void setBqmc(String bqmc) {
        this.bqmc = bqmc;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getLbmc() {
        return lbmc;
    }

    public void setLbmc(String lbmc) {
        this.lbmc = lbmc;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getZbid() {
        return zbid;
    }

    public void setZbid(String zbid) {
        this.zbid = zbid;
    }

    public String getBqidstr() {
        return bqidstr;
    }

    public void setBqidstr(String bqidstr) {
        this.bqidstr = bqidstr;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid;
    }

    public String getBzwmc() {
        return bzwmc;
    }

    public void setBzwmc(String bzwmc) {
        this.bzwmc = bzwmc;
    }

    public String getBywmc() {
        return bywmc;
    }

    public void setBywmc(String bywmc) {
        this.bywmc = bywmc;
    }

    public String getBsjl() {
        return bsjl;
    }

    public void setBsjl(String bsjl) {
        this.bsjl = bsjl;
    }

    public String getSjly() {
        return sjly;
    }

    public void setSjly(String sjly) {
        this.sjly = sjly;
    }

    public String getTjr() {
        return tjr;
    }

    public void setTjr(String tjr) {
        this.tjr = tjr;
    }

    public String getTjsj() {
        return tjsj;
    }

    public void setTjsj(String tjsj) {
        this.tjsj = tjsj;
    }

    public String getSjid() {
        return sjid;
    }

    public void setSjid(String sjid) {
        this.sjid = sjid;
    }

    public String getBqid() {
        return bqid;
    }

    public void setBqid(String bqid) {
        this.bqid = bqid;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
