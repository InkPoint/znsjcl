package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 *  清洗模型
 */
public class QxmxVO extends BaseVO {
     //查询用参数
    //模型名称
    private String con_mxmc;
    //模型描述
    private String con_mxms;
    //匹配指标
    private String con_zb;
    //模型创建日期起
    private String con_cjrqstart;
    //模型创建日期止
    private String con_cjrqend;
    //查询结果
    private List querylist;

    //操作标志  0  添加  1 编辑   2  删除
    private String oprflag;

    private String datastr;


    //映射对象
    //指标id
    private String mxid;
    //模型名称
    private String mxmc;
    //匹配指标
    private String zb;
    //匹配指标中文字符串
    private String ppzbstr;
    //模型描述
    private String mxms;
    //备注
    private String bz;
    //创建人
    private String cjr;
    //创建时间
    private String cjsj;
    //清洗方式
    private String qxfs;

    public String getQxfs() {
        return qxfs;
    }

    public void setQxfs(String qxfs) {
        this.qxfs = qxfs;
    }

    public String getCon_mxmc() {
        return con_mxmc;
    }

    public void setCon_mxmc(String con_mxmc) {
        this.con_mxmc = con_mxmc;
    }

    public String getCon_mxms() {
        return con_mxms;
    }

    public void setCon_mxms(String con_mxms) {
        this.con_mxms = con_mxms;
    }

    public String getCon_zb() {
        return con_zb;
    }

    public void setCon_zb(String con_zb) {
        this.con_zb = con_zb;
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

    public String getMxid() {
        return mxid;
    }

    public void setMxid(String mxid) {
        this.mxid = mxid;
    }

    public String getMxmc() {
        return mxmc;
    }

    public void setMxmc(String mxmc) {
        this.mxmc = mxmc;
    }

    public String getZb() {
        return zb;
    }

    public void setZb(String zb) {
        this.zb = zb;
    }

    public String getPpzbstr() {
        return ppzbstr;
    }

    public void setPpzbstr(String ppzbstr) {
        this.ppzbstr = ppzbstr;
    }

    public String getMxms() {
        return mxms;
    }

    public void setMxms(String mxms) {
        this.mxms = mxms;
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
