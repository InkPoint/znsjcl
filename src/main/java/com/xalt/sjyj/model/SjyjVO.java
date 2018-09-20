package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by liduo on 2018/1/8.
 */
//数据元件vo 数据元件添加弹出条件vo
public class SjyjVO extends BaseVO{
    private String yjid;//元件id
    private String yjmc;//元件名称
    private String pyjdm;//父类元件id
    private String yjkj;//元件口径元件描述
    private String gjz;//关键字
    private String bqid;//标签id
    private String bz;//备注
    private String yxbz;//有效标志  Y  有效  N 无效
    private String cjsj;//创建时间
    private String cjr;//创建人
    private String yjly;//元件来源表
    private String lyzd;//对应来源字段
    //数据元件弹出条件
    private String yjdm;//元件代码
    private String csdm;//参数代码
    private String csmc;//参数名称
    private String cslx;//参数类型
    private String cszdm;//参数字段名
    private String dmb;//代码表
    private String sjcsdm;//上级参数代码
    private String dmbmczd;//代码表名称字段
    private String sjcsdmzdm;//上级参数代码字段名
    private String id;
    private String text;

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

    public String getYjdm() {
        return yjdm;
    }

    public void setYjdm(String yjdm) {
        this.yjdm = yjdm;
    }

    public String getCsdm() {
        return csdm;
    }

    public void setCsdm(String csdm) {
        this.csdm = csdm;
    }

    public String getCsmc() {
        return csmc;
    }

    public void setCsmc(String csmc) {
        this.csmc = csmc;
    }

    public String getCslx() {
        return cslx;
    }

    public void setCslx(String cslx) {
        this.cslx = cslx;
    }

    public String getCszdm() {
        return cszdm;
    }

    public void setCszdm(String cszdm) {
        this.cszdm = cszdm;
    }

    public String getDmb() {
        return dmb;
    }

    public void setDmb(String dmb) {
        this.dmb = dmb;
    }

    public String getSjcsdm() {
        return sjcsdm;
    }

    public void setSjcsdm(String sjcsdm) {
        this.sjcsdm = sjcsdm;
    }

    public String getDmbmczd() {
        return dmbmczd;
    }

    public void setDmbmczd(String dmbmczd) {
        this.dmbmczd = dmbmczd;
    }

    public String getSjcsdmzdm() {
        return sjcsdmzdm;
    }

    public void setSjcsdmzdm(String sjcsdmzdm) {
        this.sjcsdmzdm = sjcsdmzdm;
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
