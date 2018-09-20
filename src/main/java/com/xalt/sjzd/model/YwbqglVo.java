package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

import java.util.Date;

/**
 * 业务标签管理
 * Created by win7 on 2017/10/23.
 */


public class YwbqglVo extends BaseVO {
    private String bqid;//标签id
    private String bqmc;//标签名称
    private String bqms;//标签描述
    private String cjsj;//创建时间
    private String cjr;//创建人代码
    private String pbqid;//父类标签id;
    private String bz;//备注
    private String yxbz;//有效标志
    private String xh;//序号

    public String getBqid() {
        return bqid;
    }

    public void setBqid(String bqid) {
        this.bqid = bqid;
    }

    public String getBqmc() {
        return bqmc;
    }

    public void setBqmc(String bqmc) {
        this.bqmc = bqmc;
    }

    public String getBqms() {
        return bqms;
    }

    public void setBqms(String bqms) {
        this.bqms = bqms;
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

    public String getPbqid() {
        return pbqid;
    }

    public void setPbqid(String pbqid) {
        this.pbqid = pbqid;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }
}
