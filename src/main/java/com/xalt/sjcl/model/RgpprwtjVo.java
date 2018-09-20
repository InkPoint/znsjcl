package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

import javax.xml.soap.SAAJMetaFactory;

/**
 * Created by cuiheng on 2018/6/20.
 * 人工匹配任务统计
 */
public class RgpprwtjVo extends BaseVO {

    private String id;
    private String text;
    private String cllx;
    private String ppr;
    private String clsjq;
    private String clsjz;
    private String clr;
    private String hcdw;
    private String sjl;
    private String cllxs;
    private String clsjbegin;
    private String clsjend;
    private String cwl;

    public String getCwl() {
        return cwl;
    }

    public void setCwl(String cwl) {
        this.cwl = cwl;
    }

    private String xfl;

    public String getXfl() {
        return xfl;
    }

    public void setXfl(String xfl) {
        this.xfl = xfl;
    }

    public String getClsjbegin() {
        return clsjbegin;
    }

    public void setClsjbegin(String clsjbegin) {
        this.clsjbegin = clsjbegin;
    }

    public String getClsjend() {
        return clsjend;
    }

    public void setClsjend(String clsjend) {
        this.clsjend = clsjend;
    }

    public String getCllxs() {
        return cllxs;
    }

    public void setCllxs(String cllxs) {
        this.cllxs = cllxs;
    }

    public String getClr() {
        return clr;
    }

    public void setClr(String clr) {
        this.clr = clr;
    }

    public String getHcdw() {
        return hcdw;
    }

    public void setHcdw(String hcdw) {
        this.hcdw = hcdw;
    }

    public String getSjl() {
        return sjl;
    }

    public void setSjl(String sjl) {
        this.sjl = sjl;
    }

    public String getCllx() {
        return cllx;
    }

    public void setCllx(String cllx) {
        this.cllx = cllx;
    }

    public String getPpr() {
        return ppr;
    }

    public void setPpr(String ppr) {
        this.ppr = ppr;
    }

    public String getClsjq() {
        return clsjq;
    }

    public void setClsjq(String clsjq) {
        this.clsjq = clsjq;
    }

    public String getClsjz() {
        return clsjz;
    }

    public void setClsjz(String clsjz) {
        this.clsjz = clsjz;
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
}
