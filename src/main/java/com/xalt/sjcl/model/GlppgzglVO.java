package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 * To change this template use File | Settings | File Templates.
 */
public class GlppgzglVO extends BaseVO {
     //查询用参数
    //规则名称
    private String con_gzmc;
    //规则描述
    private String con_gzms;
    //规则创建日期起
    private String con_cjrqstart;
    //规则创建日期止
    private String con_cjrqend;
    //查询结果
    private List querylist;

    //操作标志  0  添加  1 编辑   2  删除
    private String oprflag;

    //映射对象
    //规则id
    private String gzid;
    //规则名称
    private String gzmc;
    //规则描述
    private String gzms;
    //匹配度
    private String ppd;
    //优先级
    private String yxj;
    //匹配说明
    private String ppsm;
    //创建人
    private String cjr;
    //创建时间
    private String cjsj;
    //匹配算法
    private String ppsf;

    public String getOprflag() {
        return oprflag;
    }

    public void setOprflag(String oprflag) {
        this.oprflag = oprflag;
    }

    public String getPpsf() {
        return ppsf;
    }

    public void setPpsf(String ppsf) {
        this.ppsf = ppsf;
    }

    public String getCon_gzmc() {
        return con_gzmc;
    }

    public void setCon_gzmc(String con_gzmc) {
        this.con_gzmc = con_gzmc;
    }

    public String getCon_gzms() {
        return con_gzms;
    }

    public void setCon_gzms(String con_gzms) {
        this.con_gzms = con_gzms;
    }

    public String getCon_cjrqstart() {
        return con_cjrqstart;
    }

    public void setCon_cjrqstart(String con_cjrqstart) {
        this.con_cjrqstart = con_cjrqstart;
    }

    public String getCon_cjrqend() {
        return con_cjrqend;
    }

    public void setCon_cjrqend(String con_cjrqend) {
        this.con_cjrqend = con_cjrqend;
    }

    public List getQuerylist() {
        return querylist;
    }

    public void setQuerylist(List querylist) {
        this.querylist = querylist;
    }

    public String getGzid() {
        return gzid;
    }

    public void setGzid(String gzid) {
        this.gzid = gzid;
    }

    public String getGzmc() {
        return gzmc;
    }

    public void setGzmc(String gzmc) {
        this.gzmc = gzmc;
    }

    public String getGzms() {
        return gzms;
    }

    public void setGzms(String gzms) {
        this.gzms = gzms;
    }

    public String getPpd() {
        return ppd;
    }

    public void setPpd(String ppd) {
        this.ppd = ppd;
    }

    public String getYxj() {
        return yxj;
    }

    public void setYxj(String yxj) {
        this.yxj = yxj;
    }

    public String getPpsm() {
        return ppsm;
    }

    public void setPpsm(String ppsm) {
        this.ppsm = ppsm;
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
}
