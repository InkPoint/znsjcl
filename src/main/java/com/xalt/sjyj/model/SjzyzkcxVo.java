package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/11/28.
 * 数据资源状况查询
 */
public class SjzyzkcxVo extends BaseVO {
    //中文表名
    private String zwbm;
    //英文表名
    private String ywbm;
    //数据量
    private String sjl;
    //匹配数量
    private String ppsl;
    //统计时间
    private String tjsj;
    //有效标志
    private String yxbz;
    //单位名称
    private String dwmc;
    //匹配率
    private String ppl;
    //级别ID
    private String jbid;
    //数据级别
    private String sjjb;
    //来源ID
    private String lyid;
    //数据来源
    private String sjly;
    //中英文表名
    private String zywbm;
    //匹配数据项
    private String ppsjx;
    private String id;
    private String text;
    private String field;
    private String checkbox;
    private String title;
    private String align;

    public String getSjjb() {
        return sjjb;
    }

    public void setSjjb(String sjjb) {
        this.sjjb = sjjb;
    }

    public String getSjly() {
        return sjly;
    }

    public void setSjly(String sjly) {
        this.sjly = sjly;
    }

    public String getZwbm() {
        return zwbm;
    }

    public void setZwbm(String zwbm) {
        this.zwbm = zwbm;
    }

    public String getYwbm() {
        return ywbm;
    }

    public void setYwbm(String ywbm) {
        this.ywbm = ywbm;
    }

    public String getSjl() {
        return sjl;
    }

    public void setSjl(String sjl) {
        this.sjl = sjl;
    }

    public String getPpsl() {
        return ppsl;
    }

    public void setPpsl(String ppsl) {
        this.ppsl = ppsl;
    }

    public String getTjsj() {
        return tjsj;
    }

    public void setTjsj(String tjsj) {
        this.tjsj = tjsj;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getDwmc() {
        return dwmc;
    }

    public void setDwmc(String dwmc) {
        this.dwmc = dwmc;
    }

    public String getPpl() {
        return ppl;
    }

    public void setPpl(String ppl) {
        this.ppl = ppl;
    }

    public String getJbid() {
        return jbid;
    }

    public void setJbid(String jbid) {
        this.jbid = jbid;
    }

    public String getLyid() {
        return lyid;
    }

    public void setLyid(String lyid) {
        this.lyid = lyid;
    }

    public String getZywbm() {
        return zywbm;
    }

    public void setZywbm(String zywbm) {
        this.zywbm = zywbm;
    }

    public String getPpsjx() {
        return ppsjx;
    }

    public void setPpsjx(String ppsjx) {
        this.ppsjx = ppsjx;
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

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getCheckbox() {
        return checkbox;
    }

    public void setCheckbox(String checkbox) {
        this.checkbox = checkbox;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAlign() {
        return align;
    }

    public void setAlign(String align) {
        this.align = align;
    }
}
