package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/12/5.
 * 分析结果导出
 */
public class FxjgfkmxVo extends BaseVO {
    /**
     * 房地产行业_房管备案信息
     */
    private String djxh;//登记序号
    private String analystaxpayername; //纳税人名称
    private String lpmc;//楼盘名称
    private String bsrq;//报送日期
    private String zts;//总套数
    private String xszje;//总金额（万元）
    private String analysbatch;//批次名称
    private String fcdz;//房产地址
    /**
     * 房地产行业_国、地税缴纳“销售不动产”相关品目增值税（营业税）信息
     */
//    private String nsrsbh;//纳税人识别号
//    private String nsrmc ;//纳税人名称
//    private String ssdabh;//税收档案编号
    private String shxydm;//社会信用代码
    private String zsxmmc;//征收项目
    private String zspmmc;//征收品目
    private String nssbrq;//申报日期
    private String rkrq  ;//入库日期
    private String skssqq;//所属期起
    private String skssqz;//所属期止
    private String jsyj  ;//计税依据（元）
    private String ynse  ;//应纳（元）
    private String jmse  ;//减免（元）
    private String ybtse ;//应补退税额（元）
    /**
     * 房地产行业_国税开具“销售不动产”相关发票
     */
    private String nsrsbh ;//纳税人识别号
    private String nsrmc  ;//纳税人名称
    private String ssdabh ;//税收档案编号
    private String fddbrxm;//法人
    private String scjydz ;//生产经营地址
    private String fpdm   ;//发票代码
    private String fphm   ;//发票号码
    private String kprq   ;//开票日期
    private String je     ;//开票金额（元）
    private String se     ;//税额（元）
    private String gfsbh  ;//购方识别号
    private String gfmc   ;//购方名称
    private String swjgmc ;//国税税务机关
    /**
     * 契税（土地）_疑似取得土地后未足额申报契税
     * 城镇土地使用税_疑似未申报城镇土地使用税
     */
    private String zybh;//资源编号
    private String jdr ;//竞得人
    private String cjj ;//成交价格（万元）
    private String cjsj;//成交时间
    private String dkwz;//地块位置
    private String sjly;//数据来源

    /**
     * “资金账簿“印花税漏征分析_原始信息
     * “产权转移书据”印花税漏征分析_原始信息
     */
//    private String taxpayername  ;//纳税人名称
    private String regnumber     ;//工商注册号
    private String updatetime    ;//变更时间
    private String beforchangecon;//变更前内容
    private String afterchangecon;//变更后内容
    /**
     * “资金账簿“印花税漏征分析_拆分信息
     */
    private String taxpayername;//纳税人名称
    private String updatedate  ;//变更时间
    private String payperson   ;//变更前股东
    private String confirmpay  ;//认缴（万元）
    private String finalpay    ;//实缴（万元）
    private String payperson1  ;//变更后股东
    private String confirmpay1 ;//认缴（万元）
    private String finalpay1   ;//实缴（万元）

    /**
     *
     */
//    private String taxpayername;//纳税人名称
//    private String updatedate  ;//变更时间
//    private String payperson   ;//变更前股东
//    private String confirmpay  ;//认缴（万元）
//    private String finalpay    ;//实缴（万元）
//    private String payperson1  ;//变更后股东
//    private String confirmpay1 ;//认缴（万元）
//    private String finalpay1   ;//实缴（万元）
    private String datastatus;//买卖行为
    private String mre       ;//买入额（万元）
    private String mce       ;//卖出额（万元）

    /**
     *其他参数
     */
    private String queryFlag;
    private String djxhOrNsrmc;
    private String pcdm;

    public String getQueryFlag() {
        return queryFlag;
    }

    public void setQueryFlag(String queryFlag) {
        this.queryFlag = queryFlag;
    }

    public String getDjxhOrNsrmc() {
        return djxhOrNsrmc;
    }

    public void setDjxhOrNsrmc(String djxhOrNsrmc) {
        this.djxhOrNsrmc = djxhOrNsrmc;
    }

    public String getPcdm() {
        return pcdm;
    }

    public void setPcdm(String pcdm) {
        this.pcdm = pcdm;
    }

    public String getDjxh() {
        return djxh;
    }

    public void setDjxh(String djxh) {
        this.djxh = djxh;
    }

    public String getAnalystaxpayername() {
        return analystaxpayername;
    }

    public void setAnalystaxpayername(String analystaxpayername) {
        this.analystaxpayername = analystaxpayername;
    }

    public String getLpmc() {
        return lpmc;
    }

    public void setLpmc(String lpmc) {
        this.lpmc = lpmc;
    }

    public String getBsrq() {
        return bsrq;
    }

    public void setBsrq(String bsrq) {
        this.bsrq = bsrq;
    }

    public String getZts() {
        return zts;
    }

    public void setZts(String zts) {
        this.zts = zts;
    }

    public String getXszje() {
        return xszje;
    }

    public void setXszje(String xszje) {
        this.xszje = xszje;
    }

    public String getAnalysbatch() {
        return analysbatch;
    }

    public void setAnalysbatch(String analysbatch) {
        this.analysbatch = analysbatch;
    }

    public String getFcdz() {
        return fcdz;
    }

    public void setFcdz(String fcdz) {
        this.fcdz = fcdz;
    }

    public String getShxydm() {
        return shxydm;
    }

    public void setShxydm(String shxydm) {
        this.shxydm = shxydm;
    }

    public String getZsxmmc() {
        return zsxmmc;
    }

    public void setZsxmmc(String zsxmmc) {
        this.zsxmmc = zsxmmc;
    }

    public String getZspmmc() {
        return zspmmc;
    }

    public void setZspmmc(String zspmmc) {
        this.zspmmc = zspmmc;
    }

    public String getNssbrq() {
        return nssbrq;
    }

    public void setNssbrq(String nssbrq) {
        this.nssbrq = nssbrq;
    }

    public String getRkrq() {
        return rkrq;
    }

    public void setRkrq(String rkrq) {
        this.rkrq = rkrq;
    }

    public String getSkssqq() {
        return skssqq;
    }

    public void setSkssqq(String skssqq) {
        this.skssqq = skssqq;
    }

    public String getSkssqz() {
        return skssqz;
    }

    public void setSkssqz(String skssqz) {
        this.skssqz = skssqz;
    }

    public String getJsyj() {
        return jsyj;
    }

    public void setJsyj(String jsyj) {
        this.jsyj = jsyj;
    }

    public String getYnse() {
        return ynse;
    }

    public void setYnse(String ynse) {
        this.ynse = ynse;
    }

    public String getJmse() {
        return jmse;
    }

    public void setJmse(String jmse) {
        this.jmse = jmse;
    }

    public String getYbtse() {
        return ybtse;
    }

    public void setYbtse(String ybtse) {
        this.ybtse = ybtse;
    }

    public String getNsrsbh() {
        return nsrsbh;
    }

    public void setNsrsbh(String nsrsbh) {
        this.nsrsbh = nsrsbh;
    }

    public String getNsrmc() {
        return nsrmc;
    }

    public void setNsrmc(String nsrmc) {
        this.nsrmc = nsrmc;
    }

    public String getSsdabh() {
        return ssdabh;
    }

    public void setSsdabh(String ssdabh) {
        this.ssdabh = ssdabh;
    }

    public String getFddbrxm() {
        return fddbrxm;
    }

    public void setFddbrxm(String fddbrxm) {
        this.fddbrxm = fddbrxm;
    }

    public String getScjydz() {
        return scjydz;
    }

    public void setScjydz(String scjydz) {
        this.scjydz = scjydz;
    }

    public String getFpdm() {
        return fpdm;
    }

    public void setFpdm(String fpdm) {
        this.fpdm = fpdm;
    }

    public String getFphm() {
        return fphm;
    }

    public void setFphm(String fphm) {
        this.fphm = fphm;
    }

    public String getKprq() {
        return kprq;
    }

    public void setKprq(String kprq) {
        this.kprq = kprq;
    }

    public String getJe() {
        return je;
    }

    public void setJe(String je) {
        this.je = je;
    }

    public String getSe() {
        return se;
    }

    public void setSe(String se) {
        this.se = se;
    }

    public String getGfsbh() {
        return gfsbh;
    }

    public void setGfsbh(String gfsbh) {
        this.gfsbh = gfsbh;
    }

    public String getGfmc() {
        return gfmc;
    }

    public void setGfmc(String gfmc) {
        this.gfmc = gfmc;
    }

    public String getSwjgmc() {
        return swjgmc;
    }

    public void setSwjgmc(String swjgmc) {
        this.swjgmc = swjgmc;
    }

    public String getZybh() {
        return zybh;
    }

    public void setZybh(String zybh) {
        this.zybh = zybh;
    }

    public String getJdr() {
        return jdr;
    }

    public void setJdr(String jdr) {
        this.jdr = jdr;
    }

    public String getCjj() {
        return cjj;
    }

    public void setCjj(String cjj) {
        this.cjj = cjj;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getDkwz() {
        return dkwz;
    }

    public void setDkwz(String dkwz) {
        this.dkwz = dkwz;
    }

    public String getSjly() {
        return sjly;
    }

    public void setSjly(String sjly) {
        this.sjly = sjly;
    }

    public String getRegnumber() {
        return regnumber;
    }

    public void setRegnumber(String regnumber) {
        this.regnumber = regnumber;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getBeforchangecon() {
        return beforchangecon;
    }

    public void setBeforchangecon(String beforchangecon) {
        this.beforchangecon = beforchangecon;
    }

    public String getAfterchangecon() {
        return afterchangecon;
    }

    public void setAfterchangecon(String afterchangecon) {
        this.afterchangecon = afterchangecon;
    }

    public String getTaxpayername() {
        return taxpayername;
    }

    public void setTaxpayername(String taxpayername) {
        this.taxpayername = taxpayername;
    }

    public String getUpdatedate() {
        return updatedate;
    }

    public void setUpdatedate(String updatedate) {
        this.updatedate = updatedate;
    }

    public String getPayperson() {
        return payperson;
    }

    public void setPayperson(String payperson) {
        this.payperson = payperson;
    }

    public String getConfirmpay() {
        return confirmpay;
    }

    public void setConfirmpay(String confirmpay) {
        this.confirmpay = confirmpay;
    }

    public String getFinalpay() {
        return finalpay;
    }

    public void setFinalpay(String finalpay) {
        this.finalpay = finalpay;
    }

    public String getPayperson1() {
        return payperson1;
    }

    public void setPayperson1(String payperson1) {
        this.payperson1 = payperson1;
    }

    public String getConfirmpay1() {
        return confirmpay1;
    }

    public void setConfirmpay1(String confirmpay1) {
        this.confirmpay1 = confirmpay1;
    }

    public String getFinalpay1() {
        return finalpay1;
    }

    public void setFinalpay1(String finalpay1) {
        this.finalpay1 = finalpay1;
    }

    public String getDatastatus() {
        return datastatus;
    }

    public void setDatastatus(String datastatus) {
        this.datastatus = datastatus;
    }

    public String getMre() {
        return mre;
    }

    public void setMre(String mre) {
        this.mre = mre;
    }

    public String getMce() {
        return mce;
    }

    public void setMce(String mce) {
        this.mce = mce;
    }
}
