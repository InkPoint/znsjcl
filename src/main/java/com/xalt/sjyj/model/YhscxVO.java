package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created with IntelliJ IDEA.
 * User: WangPengWen
 * Date: 2018-4-20
 * 一户式查询
 */
public class YhscxVO extends BaseVO {
    //登记序号
    private String djxh;
    //纳税人名称
    private String nsrmc;
    //纳税人识别号
    private String nsrsbh;
    //联系人
    private String lxr;
    //联系方式
    private String lxfs;
    //法人
    private String fddbrxm;
    //纳税人状态
    private String nsrztmc;
    //注册地址
    private String zcdz;
    //生产经营地址
    private String scjydz;
    //登记注册类型
    private String djzclxmc;
    //行业
    private String hymc;
    //分局
    private String fj;
    //科所
    private String ks;
    //税收管理员
    private String swryxm;
    //跨区财产税主体登记标志
    private String kqccsztdjbz;
    //条件(1或 2且)
    private String conditions;
    //部门名称
    private String bm;
    //表名
    private String tabname;

    public String getDjxh() {
        return djxh;
    }

    public void setDjxh(String djxh) {
        this.djxh = djxh;
    }

    public String getNsrmc() {
        return nsrmc;
    }

    public void setNsrmc(String nsrmc) {
        this.nsrmc = nsrmc;
    }

    public String getNsrsbh() {
        return nsrsbh;
    }

    public void setNsrsbh(String nsrsbh) {
        this.nsrsbh = nsrsbh;
    }

    public String getLxr() {
        return lxr;
    }

    public void setLxr(String lxr) {
        this.lxr = lxr;
    }

    public String getLxfs() {
        return lxfs;
    }

    public void setLxfs(String lxfs) {
        this.lxfs = lxfs;
    }

    public String getFddbrxm() {
        return fddbrxm;
    }

    public void setFddbrxm(String fddbrxm) {
        this.fddbrxm = fddbrxm;
    }

    public String getNsrztmc() {
        return nsrztmc;
    }

    public void setNsrztmc(String nsrztmc) {
        this.nsrztmc = nsrztmc;
    }

    public String getZcdz() {
        return zcdz;
    }

    public void setZcdz(String zcdz) {
        this.zcdz = zcdz;
    }

    public String getScjydz() {
        return scjydz;
    }

    public void setScjydz(String scjydz) {
        this.scjydz = scjydz;
    }

    public String getDjzclxmc() {
        return djzclxmc;
    }

    public void setDjzclxmc(String djzclxmc) {
        this.djzclxmc = djzclxmc;
    }

    public String getHymc() {
        return hymc;
    }

    public void setHymc(String hymc) {
        this.hymc = hymc;
    }

    public String getFj() {
        return fj;
    }

    public void setFj(String fj) {
        this.fj = fj;
    }

    public String getKs() {
        return ks;
    }

    public void setKs(String ks) {
        this.ks = ks;
    }

    public String getSwryxm() {
        return swryxm;
    }

    public void setSwryxm(String swryxm) {
        this.swryxm = swryxm;
    }

    public String getKqccsztdjbz() {
        return kqccsztdjbz;
    }

    public void setKqccsztdjbz(String kqccsztdjbz) {
        this.kqccsztdjbz = kqccsztdjbz;
    }

    public String getConditions() {
        return conditions;
    }

    public void setConditions(String conditions) {
        this.conditions = conditions;
    }

    public String getBm() {
        return bm;
    }

    public void setBm(String bm) {
        this.bm = bm;
    }

    public String getTabname() {
        return tabname;
    }

    public void setTabname(String tabname) {
        this.tabname = tabname;
    }
}
