package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/1/15.
 */
public class SjcpcxtjVO extends BaseVO {
    private String swjg_dm;//代码
    private String swjgmc;//名称
    private String id;
    private String text;
    private String nsrzt_dm;//纳税人状态
    private String nsrztmc;//纳税人状态名称
    private String cxl;//查询列 拼装好的
    private String gltj;
    private String pztj;
    private String out_sql;
    private String yjid;
    private String yjmc;
    private String yjly;
    private String yxbz;
    private String producetheproduct;//元件名称
    private String djjgdm;//机关代码
    private String zgswskfjdm;//科所代码
    private String nsrztdm;//纳税人状态

    public String getGltj() {
        return gltj;
    }

    public void setGltj(String gltj) {
        this.gltj = gltj;
    }

    public String getPztj() {
        return pztj;
    }

    public void setPztj(String pztj) {
        this.pztj = pztj;
    }

    public String getOut_sql() {
        return out_sql;
    }

    public void setOut_sql(String out_sql) {
        this.out_sql = out_sql;
    }

    public String getCxl() {
        return cxl;
    }

    public void setCxl(String cxl) {
        this.cxl = cxl;
    }

    public String getNsrztmc() {
        return nsrztmc;
    }

    public void setNsrztmc(String nsrztmc) {
        this.nsrztmc = nsrztmc;
    }

    public String getNsrzt_dm() {
        return nsrzt_dm;
    }

    public void setNsrzt_dm(String nsrzt_dm) {
        this.nsrzt_dm = nsrzt_dm;
    }

    public String getSwjg_dm() {
        return swjg_dm;
    }

    public void setSwjg_dm(String swjg_dm) {
        this.swjg_dm = swjg_dm;
    }

    public String getSwjgmc() {
        return swjgmc;
    }

    public void setSwjgmc(String swjgmc) {
        this.swjgmc = swjgmc;
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

    public String getYjly() {
        return yjly;
    }

    public void setYjly(String yjly) {
        this.yjly = yjly;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getProducetheproduct() {
        return producetheproduct;
    }

    public void setProducetheproduct(String producetheproduct) {
        this.producetheproduct = producetheproduct;
    }

    public String getDjjgdm() {
        return djjgdm;
    }

    public void setDjjgdm(String djjgdm) {
        this.djjgdm = djjgdm;
    }

    public String getZgswskfjdm() {
        return zgswskfjdm;
    }

    public void setZgswskfjdm(String zgswskfjdm) {
        this.zgswskfjdm = zgswskfjdm;
    }

    public String getNsrztdm() {
        return nsrztdm;
    }

    public void setNsrztdm(String nsrztdm) {
        this.nsrztdm = nsrztdm;
    }
}
