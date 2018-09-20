package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 *  清洗指标
 */
public class QxzbVO extends BaseVO {
     //查询用参数
    //规则名称
    private String con_zbmc;
    //规则描述
    private String con_zbms;
    //匹配规则
    private String con_gz;
    //规则创建日期起
    private String con_cjrqstart;
    //规则创建日期止
    private String con_cjrqend;
    //查询结果
    private List querylist;

    //操作标志  0  添加  1 编辑   2  删除
    private String oprflag;

    private String datastr;


    //映射对象
    //指标id
    private String zbid;
    //指标名称
    private String zbmc;
    //匹配规则
    private String gz;
    //匹配规则中文字符串
    private String ppgzstr;
    //指标描述
    private String zbms;
    //备注
    private String bz;
    //创建人
    private String cjr;
    //创建时间
    private String cjsj;

    public String getCon_zbmc() {
        return con_zbmc;
    }

    public void setCon_zbmc(String con_zbmc) {
        this.con_zbmc = con_zbmc;
    }

    public String getCon_zbms() {
        return con_zbms;
    }

    public void setCon_zbms(String con_zbms) {
        this.con_zbms = con_zbms;
    }

    public String getCon_gz() {
        return con_gz;
    }

    public void setCon_gz(String con_gz) {
        this.con_gz = con_gz;
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

    public String getOprflag() {
        return oprflag;
    }

    public void setOprflag(String oprflag) {
        this.oprflag = oprflag;
    }

    public String getDatastr() {
        return datastr;
    }

    public void setDatastr(String datastr) {
        this.datastr = datastr;
    }

    public String getZbid() {
        return zbid;
    }

    public void setZbid(String zbid) {
        this.zbid = zbid;
    }

    public String getZbmc() {
        return zbmc;
    }

    public void setZbmc(String zbmc) {
        this.zbmc = zbmc;
    }

    public String getGz() {
        return gz;
    }

    public void setGz(String gz) {
        this.gz = gz;
    }

    public String getPpgzstr() {
        return ppgzstr;
    }

    public void setPpgzstr(String ppgzstr) {
        this.ppgzstr = ppgzstr;
    }

    public String getZbms() {
        return zbms;
    }

    public void setZbms(String zbms) {
        this.zbms = zbms;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
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
