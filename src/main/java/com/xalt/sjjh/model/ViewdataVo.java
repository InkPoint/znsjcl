package com.xalt.sjjh.model;

import com.ts.model.BaseVO;

/**
 * author:WangPengWen
 * Created by win7 on 2017/11/14.
 * 导入状况统计（查看数据）
 */
public class ViewdataVo extends BaseVO {
    //单位名称
    private String dwmc;
    //单位性质
    private String dwxz;
    //经费形式
    private String jfxs;
    //编制数
    private String bzs;
    //法人代表
    private String frdb;
    //单位详细地址
    private String address;
    //所属级次
    private String ssjc;
    //数据类型名称
    private String sjlxmc;

    public String getSjlxmc() {
        return sjlxmc;
    }

    public void setSjlxmc(String sjlxmc) {
        this.sjlxmc = sjlxmc;
    }

    public String getDwmc() {
        return dwmc;
    }

    public void setDwmc(String dwmc) {
        this.dwmc = dwmc;
    }

    public String getDwxz() {
        return dwxz;
    }

    public void setDwxz(String dwxz) {
        this.dwxz = dwxz;
    }

    public String getJfxs() {
        return jfxs;
    }

    public void setJfxs(String jfxs) {
        this.jfxs = jfxs;
    }

    public String getBzs() {
        return bzs;
    }

    public void setBzs(String bzs) {
        this.bzs = bzs;
    }

    public String getFrdb() {
        return frdb;
    }

    public void setFrdb(String frdb) {
        this.frdb = frdb;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getSsjc() {
        return ssjc;
    }

    public void setSsjc(String ssjc) {
        this.ssjc = ssjc;
    }
}
