package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/10/26.
 * 业务标签管理Ztree树
 */
public class YwbqglTree extends BaseVO {
    //标签ID
    private String bqid;
    //标签名称
    private String bqmc;
    //标签描述
    private String bqms;
    //创建时间
    private String cjsj;
    //创建人代码
    private String cjr;
    //父类标签ID
    private String pbqid;
    //序号
    private String xh;
    //备注
    private String bz;
    //有效标志
    private String yxbz;

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

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
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
}
