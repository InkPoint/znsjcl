package com.xalt.sjjh.model;

import com.ts.model.BaseVO;

/**
 * author:WangPengWen
 * Created by win7 on 2017/11/13.
 * 导入状况统计
 */
public class DrzktjVo extends BaseVO {
    //批次代码
    private String pcdm;
    //数据来源id
    private String lyid;
    //数据来源名称
    private String lymc;
    //数据级别id
    private String jbid;
    //数据级别名称
    private String jbmc;
    //部门代码
    private String bm_dm;
    //部门名称
    private String bmmc;
    //数据表
    private String sjb;
    //导入数据量
    private String drsjl;
    //导入时间
    private String drsj;
    //导入时间止
    private String drsjz;
    //导入人代码
    private String drrdm;
    //导入人名称
    private String drrmc;
    //导入方式
    private String drfsmc;
    //导入方式
    private String drfsid;
    //数据类型名称
    private String sjlxmc;
    //有效标志
    private String yxbz;
    private String cjr;//创建人


    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getSjlxmc() {
        return sjlxmc;
    }

    public void setSjlxmc(String sjlxmc) {
        this.sjlxmc = sjlxmc;
    }

    public String getDrsjz() {
        return drsjz;
    }

    public void setDrsjz(String drsjz) {
        this.drsjz = drsjz;
    }

    public String getPcdm() {
        return pcdm;
    }

    public void setPcdm(String pcdm) {
        this.pcdm = pcdm;
    }

    public String getLyid() {
        return lyid;
    }

    public void setLyid(String lyid) {
        this.lyid = lyid;
    }

    public String getLymc() {
        return lymc;
    }

    public void setLymc(String lymc) {
        this.lymc = lymc;
    }

    public String getJbid() {
        return jbid;
    }

    public void setJbid(String jbid) {
        this.jbid = jbid;
    }

    public String getJbmc() {
        return jbmc;
    }

    public void setJbmc(String jbmc) {
        this.jbmc = jbmc;
    }

    public String getBm_dm() {
        return bm_dm;
    }

    public void setBm_dm(String bm_dm) {
        this.bm_dm = bm_dm;
    }

    public String getBmmc() {
        return bmmc;
    }

    public void setBmmc(String bmmc) {
        this.bmmc = bmmc;
    }

    public String getSjb() {
        return sjb;
    }

    public void setSjb(String sjb) {
        this.sjb = sjb;
    }

    public String getDrsjl() {
        return drsjl;
    }

    public void setDrsjl(String drsjl) {
        this.drsjl = drsjl;
    }

    public String getDrsj() {
        return drsj;
    }

    public void setDrsj(String drsj) {
        this.drsj = drsj;
    }

    public String getDrrdm() {
        return drrdm;
    }

    public void setDrrdm(String drrdm) {
        this.drrdm = drrdm;
    }

    public String getDrrmc() {
        return drrmc;
    }

    public void setDrrmc(String drrmc) {
        this.drrmc = drrmc;
    }

    public String getDrfsmc() {
        return drfsmc;
    }

    public void setDrfsmc(String drfsmc) {
        this.drfsmc = drfsmc;
    }

    public String getDrfsid() {
        return drfsid;
    }

    public void setDrfsid(String drfsid) {
        this.drfsid = drfsid;
    }
}
