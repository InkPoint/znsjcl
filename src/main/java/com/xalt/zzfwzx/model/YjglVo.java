package com.xalt.zzfwzx.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/12/7.
 * User:WangPengWen
 */
public class YjglVo extends BaseVO {
    //元件id
    private String yjid;
    //元件名称
    private String yjmc;
    //父类元件ID
    private String pyjdm;
    //元件口径
    private String yjkj;
    //关键字
    private String gjz;
    //标签ID
    private String bqid;
    //备注
    private String bz;
    //有效标志
    private String yxbz;
    //创建时间
    private String cjsj;
    //创建人
    private String cjr;
    //元件来源表
    private String yjly;
    //对应来源字段
    private String lyzd;
    //标签名称
    private String bqmc;

    public String getBqmc() {
        return bqmc;
    }

    public void setBqmc(String bqmc) {
        this.bqmc = bqmc;
    }

    public String getYjid() {
        return yjid;
    }

    public void setYjid(String yjid) {
        this.yjid = yjid;
    }

    public String getYjmc() {
        return yjmc;
    }

    public void setYjmc(String yjmc) {
        this.yjmc = yjmc;
    }

    public String getPyjdm() {
        return pyjdm;
    }

    public void setPyjdm(String pyjdm) {
        this.pyjdm = pyjdm;
    }

    public String getYjkj() {
        return yjkj;
    }

    public void setYjkj(String yjkj) {
        this.yjkj = yjkj;
    }

    public String getGjz() {
        return gjz;
    }

    public void setGjz(String gjz) {
        this.gjz = gjz;
    }

    public String getBqid() {
        return bqid;
    }

    public void setBqid(String bqid) {
        this.bqid = bqid;
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

    public String getYjly() {
        return yjly;
    }

    public void setYjly(String yjly) {
        this.yjly = yjly;
    }

    public String getLyzd() {
        return lyzd;
    }

    public void setLyzd(String lyzd) {
        this.lyzd = lyzd;
    }
}
