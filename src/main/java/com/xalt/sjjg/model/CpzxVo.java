package com.xalt.sjjg.model;

import com.ts.model.BaseVO;

import java.util.List;


/**
 * Created by ChengZhang on 2018/3/28.
 * 数据产品中心
 */
public class CpzxVo extends BaseVO {
    private String cpid;//产品ID
    private String cpmc;//产品名称
    private String cpms;//产品描述
    private String cpcxjb;//产品查询脚本
    private String cpbt;//产品表头
    private String cjrdm;//创建人代码
    private String cjr;//创建人
    private String cjsj;//创建时间
    private String yxbz;//有效标志
    private String cpbtzw;//产品表头中文
    private String qsj;//起时间
    private String zsj;//止时间
    private String cpmxcxlj;//产品查询路径
    private List<?> dateList;//查询的数据

    private String swjg_dm;//税务机关代码

    private String ztid;//主题id
    private String ztmc;//主题名称
    private String ztms;//主题描述
    private String csid;//处室ID

    public String getCsid() {
        return csid;
    }

    public void setCsid(String csid) {
        this.csid = csid;
    }

    public String getZtid() {
        return ztid;
    }

    public void setZtid(String ztid) {
        this.ztid = ztid;
    }

    public String getZtmc() {
        return ztmc;
    }

    public void setZtmc(String ztmc) {
        this.ztmc = ztmc;
    }

    public String getZtms() {
        return ztms;
    }

    public void setZtms(String ztms) {
        this.ztms = ztms;
    }

    public String getSwjg_dm() {
        return swjg_dm;
    }

    public void setSwjg_dm(String swjg_dm) {
        this.swjg_dm = swjg_dm;
    }

    public String getCpid() {
        return cpid;
    }

    public void setCpid(String cpid) {
        this.cpid = cpid;
    }

    public String getCpmc() {
        return cpmc;
    }

    public void setCpmc(String cpmc) {
        this.cpmc = cpmc;
    }

    public String getCpms() {
        return cpms;
    }

    public void setCpms(String cpms) {
        this.cpms = cpms;
    }

    public String getCpcxjb() {
        return cpcxjb;
    }

    public void setCpcxjb(String cpcxjb) {
        this.cpcxjb = cpcxjb;
    }

    public String getCpbt() {
        return cpbt;
    }

    public void setCpbt(String cpbt) {
        this.cpbt = cpbt;
    }

    public String getCjrdm() {
        return cjrdm;
    }

    public void setCjrdm(String cjrdm) {
        this.cjrdm = cjrdm;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getCpbtzw() {
        return cpbtzw;
    }

    public void setCpbtzw(String cpbtzw) {
        this.cpbtzw = cpbtzw;
    }

    public String getQsj() {
        return qsj;
    }

    public void setQsj(String qsj) {
        this.qsj = qsj;
    }

    public String getZsj() {
        return zsj;
    }

    public void setZsj(String zsj) {
        this.zsj = zsj;
    }

    public String getCpmxcxlj() {
        return cpmxcxlj;
    }

    public void setCpmxcxlj(String cpmxcxlj) {
        this.cpmxcxlj = cpmxcxlj;
    }

    public List<?> getDateList() {
        return dateList;
    }

    public void setDateList(List<?> dateList) {
        this.dateList = dateList;
    }
}
