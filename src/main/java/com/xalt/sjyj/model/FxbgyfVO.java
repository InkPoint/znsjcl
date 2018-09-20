package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/6/6.
 * User:PengWen Wang
 * 分析报告研发
 */
public class FxbgyfVO extends BaseVO {
    private String bgid;       //报告id
    private String mbdm;       //模板代码
    private String yxbz;       //有效标志
    private String cjr;        //创建人代码
    private String bgsqq;      //报告属期起
    private String bgsqz;      //报告属期止
    private String scsj;       //创建时间
    private String ssnf;       //所属年份
    private String kjsq;       //快捷属期
    private String bgmc;       //报告名称
    private String tjlxdm;     //类型代码
    private String tjlxmc;     //类型名称
    private String sqq;        //属期起
    private String sqz;        //属期止
    private String qysds;       //企业所得税(万元)
    private String tdzzs;       //土地增值税(万元)
    private String fcs;         //房产税(万元)
    private String grsds;       //个人所得税(万元)
    private String yhs;         //印花税(万元)
    private String cswhjss;     //城市维护建设税(万元)
    private String cztdsys;      //城镇土地使用税(万元)
    private String swjgdm;       //税务机关代码
    private String swjgmc;       //税务机关名称
    private String externaltaxinfname;// 获取的外部涉税信息名称
    private String providinginfdept;// 提供信息部门
    private String infacquisitionbasis;// 信息获取依据
    private String taxrelated;// 应用涉税信息增加的税收收入（万元）
    private String businesstax;// 营业税
    private String companytax;// 企业所得税
    private String persontax;// 个人所得税
    private String resourcetax;// 资源税
    private String townlandtax;// 城镇土地使用税
    private String citymaintenancetax;// 城市维护建设税
    private String stampstax;// 印花税
    private String landappreciationtax;//土地增值税
    private String housetax;// 房产税
    private String shiptax;// 车船税
    private String farmlandtax;// 耕地占用税
    private String deedtax;// 契税
    private String othertax;// 其他税收收入

    public String getBgid() {
        return bgid;
    }

    public void setBgid(String bgid) {
        this.bgid = bgid;
    }

    public String getMbdm() {
        return mbdm;
    }

    public void setMbdm(String mbdm) {
        this.mbdm = mbdm;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getBgsqq() {
        return bgsqq;
    }

    public void setBgsqq(String bgsqq) {
        this.bgsqq = bgsqq;
    }

    public String getBgsqz() {
        return bgsqz;
    }

    public void setBgsqz(String bgsqz) {
        this.bgsqz = bgsqz;
    }

    public String getScsj() {
        return scsj;
    }

    public void setScsj(String scsj) {
        this.scsj = scsj;
    }

    public String getSsnf() {
        return ssnf;
    }

    public void setSsnf(String ssnf) {
        this.ssnf = ssnf;
    }

    public String getKjsq() {
        return kjsq;
    }

    public void setKjsq(String kjsq) {
        this.kjsq = kjsq;
    }

    public String getBgmc() {
        return bgmc;
    }

    public void setBgmc(String bgmc) {
        this.bgmc = bgmc;
    }

    public String getTjlxdm() {
        return tjlxdm;
    }

    public void setTjlxdm(String tjlxdm) {
        this.tjlxdm = tjlxdm;
    }

    public String getTjlxmc() {
        return tjlxmc;
    }

    public void setTjlxmc(String tjlxmc) {
        this.tjlxmc = tjlxmc;
    }

    public String getSqq() {
        return sqq;
    }

    public void setSqq(String sqq) {
        this.sqq = sqq;
    }

    public String getSqz() {
        return sqz;
    }

    public void setSqz(String sqz) {
        this.sqz = sqz;
    }

    public String getQysds() {
        return qysds;
    }

    public void setQysds(String qysds) {
        this.qysds = qysds;
    }

    public String getTdzzs() {
        return tdzzs;
    }

    public void setTdzzs(String tdzzs) {
        this.tdzzs = tdzzs;
    }

    public String getFcs() {
        return fcs;
    }

    public void setFcs(String fcs) {
        this.fcs = fcs;
    }

    public String getGrsds() {
        return grsds;
    }

    public void setGrsds(String grsds) {
        this.grsds = grsds;
    }

    public String getYhs() {
        return yhs;
    }

    public void setYhs(String yhs) {
        this.yhs = yhs;
    }

    public String getCswhjss() {
        return cswhjss;
    }

    public void setCswhjss(String cswhjss) {
        this.cswhjss = cswhjss;
    }

    public String getCztdsys() {
        return cztdsys;
    }

    public void setCztdsys(String cztdsys) {
        this.cztdsys = cztdsys;
    }

    public String getSwjgdm() {
        return swjgdm;
    }

    public void setSwjgdm(String swjgdm) {
        this.swjgdm = swjgdm;
    }

    public String getSwjgmc() {
        return swjgmc;
    }

    public void setSwjgmc(String swjgmc) {
        this.swjgmc = swjgmc;
    }

    public String getExternaltaxinfname() {
        return externaltaxinfname;
    }

    public void setExternaltaxinfname(String externaltaxinfname) {
        this.externaltaxinfname = externaltaxinfname;
    }

    public String getProvidinginfdept() {
        return providinginfdept;
    }

    public void setProvidinginfdept(String providinginfdept) {
        this.providinginfdept = providinginfdept;
    }

    public String getInfacquisitionbasis() {
        return infacquisitionbasis;
    }

    public void setInfacquisitionbasis(String infacquisitionbasis) {
        this.infacquisitionbasis = infacquisitionbasis;
    }

    public String getTaxrelated() {
        return taxrelated;
    }

    public void setTaxrelated(String taxrelated) {
        this.taxrelated = taxrelated;
    }

    public String getBusinesstax() {
        return businesstax;
    }

    public void setBusinesstax(String businesstax) {
        this.businesstax = businesstax;
    }

    public String getCompanytax() {
        return companytax;
    }

    public void setCompanytax(String companytax) {
        this.companytax = companytax;
    }

    public String getPersontax() {
        return persontax;
    }

    public void setPersontax(String persontax) {
        this.persontax = persontax;
    }

    public String getResourcetax() {
        return resourcetax;
    }

    public void setResourcetax(String resourcetax) {
        this.resourcetax = resourcetax;
    }

    public String getTownlandtax() {
        return townlandtax;
    }

    public void setTownlandtax(String townlandtax) {
        this.townlandtax = townlandtax;
    }

    public String getCitymaintenancetax() {
        return citymaintenancetax;
    }

    public void setCitymaintenancetax(String citymaintenancetax) {
        this.citymaintenancetax = citymaintenancetax;
    }

    public String getStampstax() {
        return stampstax;
    }

    public void setStampstax(String stampstax) {
        this.stampstax = stampstax;
    }

    public String getLandappreciationtax() {
        return landappreciationtax;
    }

    public void setLandappreciationtax(String landappreciationtax) {
        this.landappreciationtax = landappreciationtax;
    }

    public String getHousetax() {
        return housetax;
    }

    public void setHousetax(String housetax) {
        this.housetax = housetax;
    }

    public String getShiptax() {
        return shiptax;
    }

    public void setShiptax(String shiptax) {
        this.shiptax = shiptax;
    }

    public String getFarmlandtax() {
        return farmlandtax;
    }

    public void setFarmlandtax(String farmlandtax) {
        this.farmlandtax = farmlandtax;
    }

    public String getDeedtax() {
        return deedtax;
    }

    public void setDeedtax(String deedtax) {
        this.deedtax = deedtax;
    }

    public String getOthertax() {
        return othertax;
    }

    public void setOthertax(String othertax) {
        this.othertax = othertax;
    }
}
