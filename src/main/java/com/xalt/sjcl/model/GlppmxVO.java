package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 *  管理匹配模型
 */
public class GlppmxVO extends BaseVO {
     //查询用参数
    //规则名称
    private String con_mxmc;
    //规则描述
    private String con_mxms;
    //匹配规则
    private String con_ppgz;
    //规则创建日期起
    private String con_cjrqstart;
    //规则创建日期止
    private String con_cjrqend;
    //查询结果
    private List querylist;

    //操作标志  0  添加  1 编辑   2  删除
    private String oprflag;

    private String datastr;
    //ID
    private String id;
    //文本
    private String text;
    //映射对象
    //规则id
    private String mxid;
    //模型名称
    private String mxmc;
    //源表
    private String yb;
    //目标表
    private String mbb;
    //匹配规则
    private String ppgz;
    //匹配规则中文字符串
    private String ppgzstr;
    //匹配说明
    private String ppsm;
    //匹配方式
    private String ppfs;
    //创建人
    private String cjr;
    //创建时间
    private String cjsj;
    //版本号
    private String bbh;

    private String ppjgb;
    //匹配项中文
    private String ppxzw;
    //匹配项英文
    private String ppxyw;
    //规则ID
    private String gzid;
    //序号
    private String xh;
    //匹配项
    private String ppx;

    public String getPpx() {
        return ppx;
    }

    public void setPpx(String ppx) {
        this.ppx = ppx;
    }

    public String getPpxzw() {
        return ppxzw;
    }

    public void setPpxzw(String ppxzw) {
        this.ppxzw = ppxzw;
    }

    public String getPpxyw() {
        return ppxyw;
    }

    public void setPpxyw(String ppxyw) {
        this.ppxyw = ppxyw;
    }

    public String getGzid() {
        return gzid;
    }

    public void setGzid(String gzid) {
        this.gzid = gzid;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
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

    public String getPpjgb() {
        return ppjgb;
    }

    public void setPpjgb(String ppjgb) {
        this.ppjgb = ppjgb;
    }

    public String getDatastr() {
        return datastr;
    }

    public void setDatastr(String datastr) {
        this.datastr = datastr;
    }

    public String getPpgzstr() {
        return ppgzstr;
    }

    public void setPpgzstr(String ppgzstr) {
        this.ppgzstr = ppgzstr;
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

    public String getCon_ppgz() {
        return con_ppgz;
    }

    public void setCon_ppgz(String con_ppgz) {
        this.con_ppgz = con_ppgz;
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

    public String getYb() {
        return yb;
    }

    public void setYb(String yb) {
        this.yb = yb;
    }

    public String getMbb() {
        return mbb;
    }

    public void setMbb(String mbb) {
        this.mbb = mbb;
    }

    public String getPpgz() {
        return ppgz;
    }

    public void setPpgz(String ppgz) {
        this.ppgz = ppgz;
    }

    public String getPpsm() {
        return ppsm;
    }

    public void setPpsm(String ppsm) {
        this.ppsm = ppsm;
    }

    public String getPpfs() {
        return ppfs;
    }

    public void setPpfs(String ppfs) {
        this.ppfs = ppfs;
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

    public String getBbh() {
        return bbh;
    }

    public void setBbh(String bbh) {
        this.bbh = bbh;
    }
}
