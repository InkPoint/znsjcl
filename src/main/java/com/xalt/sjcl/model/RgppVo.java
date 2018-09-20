package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

/**
 * Created by CuiHeng on 2017/11/20.
 * 人工匹配
 */
public class RgppVo extends BaseVO {
    private String nsrmc;//纳税人名称
    private String djxh;//金三登记序号
    private String jsnsrmc;//金三纳税人名称
    private String bz;//备注
    private String yxbz;//有效标志
    private String ppfs;//匹配方式
    private String ppr;//匹配人
    private String ppsj;//匹配时间
    private String hcr;//核查人
    private String hcsj;//核查时间
    private String hcdw;//核查单位代码
    private String nsrsbh;//纳税人识别号
    private String ysb;//原始表
    private String orgcode;//指定单位
    private String id;
    private String text;
    private String zcdz;//注册地址
    private String clsj;//成立时间
    private String nsezt;//纳税人状态
    private String nsrlb;//纳税人类别
    private String djrq;//登记日期
    private String nsrzt_dm;//纳税人状态代码
    private String djzclc_dm;//登记注册类型代码
    private String nsrztmc;//纳税人状态名称
    private String djzclxmc;//登记注册类型名称
    private String keycolumn;
    private String taxregcode;//管理代码
    private String remark;//备注
    private String residence;//注册地址
    private String taxpayername;//纳税人名称
    private String jurpname;//法人
    private String swjgmc;//税务机关名称
    private String cgbz;//成功标志
    private String ybywm;//原表英文名
    private String ybzd;//原表字段
    private String ppz;//匹配值
    private String sjxmczw;//数据项名称中文
    private String dxmczw;//数据对象名称中文
    private int wid;//id值
    private String pprname;//匹配人姓名
    private String hcdm;//核查代码

    public String getHcdm() {
        return hcdm;
    }

    public void setHcdm(String hcdm) {
        this.hcdm = hcdm;
    }

    public String getPprname() {
        return pprname;
    }

    public void setPprname(String pprname) {
        this.pprname = pprname;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public String getSjxmczw() {
        return sjxmczw;
    }

    public void setSjxmczw(String sjxmczw) {
        this.sjxmczw = sjxmczw;
    }

    public String getDxmczw() {
        return dxmczw;
    }

    public void setDxmczw(String dxmczw) {
        this.dxmczw = dxmczw;
    }

    public String getYbywm() {
        return ybywm;
    }

    public void setYbywm(String ybywm) {
        this.ybywm = ybywm;
    }

    public String getYbzd() {
        return ybzd;
    }

    public void setYbzd(String ybzd) {
        this.ybzd = ybzd;
    }

    public String getPpz() {
        return ppz;
    }

    public void setPpz(String ppz) {
        this.ppz = ppz;
    }

    public String getCgbz() {
        return cgbz;
    }

    public void setCgbz(String cgbz) {
        this.cgbz = cgbz;
    }

    public String getSwjgmc() {
        return swjgmc;
    }

    public void setSwjgmc(String swjgmc) {
        this.swjgmc = swjgmc;
    }

    public String getJurpname() {
        return jurpname;
    }

    public void setJurpname(String jurpname) {
        this.jurpname = jurpname;
    }

    public String getTaxpayername() {
        return taxpayername;
    }

    public void setTaxpayername(String taxpayername) {
        this.taxpayername = taxpayername;
    }

    public String getResidence() {
        return residence;
    }

    public void setResidence(String residence) {
        this.residence = residence;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getTaxregcode() {
        return taxregcode;
    }

    public void setTaxregcode(String taxregcode) {
        this.taxregcode = taxregcode;
    }

    public String getKeycolumn() {
        return keycolumn;
    }

    public void setKeycolumn(String keycolumn) {
        this.keycolumn = keycolumn;
    }

    public String getNsrztmc() {
        return nsrztmc;
    }

    public void setNsrztmc(String nsrztmc) {
        this.nsrztmc = nsrztmc;
    }

    public String getDjzclxmc() {
        return djzclxmc;
    }

    public void setDjzclxmc(String djzclxmc) {
        this.djzclxmc = djzclxmc;
    }

    public String getDjrq() {
        return djrq;
    }

    public void setDjrq(String djrq) {
        this.djrq = djrq;
    }

    public String getNsrzt_dm() {
        return nsrzt_dm;
    }

    public void setNsrzt_dm(String nsrzt_dm) {
        this.nsrzt_dm = nsrzt_dm;
    }

    public String getDjzclc_dm() {
        return djzclc_dm;
    }

    public void setDjzclc_dm(String djzclc_dm) {
        this.djzclc_dm = djzclc_dm;
    }

    public String getZcdz() {
        return zcdz;
    }

    public void setZcdz(String zcdz) {
        this.zcdz = zcdz;
    }

    public String getClsj() {
        return clsj;
    }

    public void setClsj(String clsj) {
        this.clsj = clsj;
    }

    public String getNsezt() {
        return nsezt;
    }

    public void setNsezt(String nsezt) {
        this.nsezt = nsezt;
    }

    public String getNsrlb() {
        return nsrlb;
    }

    public void setNsrlb(String nsrlb) {
        this.nsrlb = nsrlb;
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

    public String getNsrsbh() {
        return nsrsbh;
    }

    public void setNsrsbh(String nsrsbh) {
        this.nsrsbh = nsrsbh;
    }

    public String getYsb() {
        return ysb;
    }

    public void setYsb(String ysb) {
        this.ysb = ysb;
    }

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }

    public String getNsrmc() {
        return nsrmc;
    }

    public void setNsrmc(String nsrmc) {
        this.nsrmc = nsrmc;
    }

    public String getDjxh() {
        return djxh;
    }

    public void setDjxh(String djxh) {
        this.djxh = djxh;
    }

    public String getJsnsrmc() {
        return jsnsrmc;
    }

    public void setJsnsrmc(String jsnsrmc) {
        this.jsnsrmc = jsnsrmc;
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

    public String getPpfs() {
        return ppfs;
    }

    public void setPpfs(String ppfs) {
        this.ppfs = ppfs;
    }

    public String getPpr() {
        return ppr;
    }

    public void setPpr(String ppr) {
        this.ppr = ppr;
    }

    public String getPpsj() {
        return ppsj;
    }

    public void setPpsj(String ppsj) {
        this.ppsj = ppsj;
    }

    public String getHcr() {
        return hcr;
    }

    public void setHcr(String hcr) {
        this.hcr = hcr;
    }

    public String getHcsj() {
        return hcsj;
    }

    public void setHcsj(String hcsj) {
        this.hcsj = hcsj;
    }

    public String getHcdw() {
        return hcdw;
    }

    public void setHcdw(String hcdw) {
        this.hcdw = hcdw;
    }
}
