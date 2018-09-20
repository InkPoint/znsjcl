package com.xalt.zzfwzx.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/5/9.
 * 分析结果导出
 */
public class FxjgdcVo extends BaseVO {
    private String resultid;//问题id
    private String taxpayername; //纳税人名称
    private String addr;//生产经营地址
    private String hy;//行业
    private String zclx;//登记注册类型
    private String orgcode;//主管单位代码
    private String swgly;//税收管理员
    private String pccode;//分析批次代码
    private String typecode;//分析大类代码
    private String classcode;//分析小类代码
    private String summary;//疑点描述
    private String summarycontent;//疑点详细
    private String taskamount;//疑点金额
    private String isadd;//数据管税平台是否添加
    private String isss;//是否属实
    private String yxbz;//有效标志
    private String bz;//备注
    private String nsrsbh;//纳税人识别号
    private String id;
    private String text;
    private String fjid;
    private String swjgmc;//税务机关名称

    public String getSwjgmc() {
        return swjgmc;
    }

    public void setSwjgmc(String swjgmc) {
        this.swjgmc = swjgmc;
    }

    public String getFjid() {
        return fjid;
    }

    public void setFjid(String fjid) {
        this.fjid = fjid;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
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

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getResultid() {
        return resultid;
    }

    public void setResultid(String resultid) {
        this.resultid = resultid;
    }

    public String getTaxpayername() {
        return taxpayername;
    }

    public void setTaxpayername(String taxpayername) {
        this.taxpayername = taxpayername;
    }

    public String getAdrr() {
        return addr;
    }

    public void setAdrr(String adrr) {
        this.addr = adrr;
    }

    public String getHy() {
        return hy;
    }

    public void setHy(String hy) {
        this.hy = hy;
    }

    public String getZclx() {
        return zclx;
    }

    public void setZclx(String zclx) {
        this.zclx = zclx;
    }

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }

    public String getSwgly() {
        return swgly;
    }

    public void setSwgly(String swgly) {
        this.swgly = swgly;
    }

    public String getPccode() {
        return pccode;
    }

    public void setPccode(String pccode) {
        this.pccode = pccode;
    }

    public String getTypecode() {
        return typecode;
    }

    public void setTypecode(String typecode) {
        this.typecode = typecode;
    }

    public String getClasscode() {
        return classcode;
    }

    public void setClasscode(String classcode) {
        this.classcode = classcode;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getSummarycontent() {
        return summarycontent;
    }

    public void setSummarycontent(String summarycontent) {
        this.summarycontent = summarycontent;
    }

    public String getTaskamount() {
        return taskamount;
    }

    public void setTaskamount(String taskamount) {
        this.taskamount = taskamount;
    }

    public String getIsadd() {
        return isadd;
    }

    public void setIsadd(String isadd) {
        this.isadd = isadd;
    }

    public String getIsss() {
        return isss;
    }

    public void setIsss(String isss) {
        this.isss = isss;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }
}
