package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/12/12.
 * 数据来源管理
 */
public class SjlyglVo extends BaseVO {
    private String lyid;//来源id
    private String lymc;//来源名称
    private String lyms;//来源描述
    private String cjsj;//创建时间
    private String cjr;//创建人
    private String xh;//序号
    private String plyid;//父类来源id
    private String bz;//备注
    private String yxbz;//有效标志

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
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

    public String getLyms() {
        return lyms;
    }

    public void setLyms(String lyms) {
        this.lyms = lyms;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

    public String getPlyid() {
        return plyid;
    }

    public void setPlyid(String plyid) {
        this.plyid = plyid;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }
}
