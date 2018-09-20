package com.xalt.sjcl.services;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/2/12.
 */
public class RwbVO extends BaseVO{
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String zxsj;//执行时间
    private String yb;//原表英文名
    private String mxid;//模型id
    private String yxzt;//运行状态
    private String ztmc;//状态名称
    private String mxmc;//模型名称
    private String qxcgl;//清洗成功率
    private String wysjl;//无用数据量
    private String kysjl;//可用数据量
    private String qxqsjl;//清洗前数据量;

    public String getQxcgl() {
        return qxcgl;
    }

    public void setQxcgl(String qxcgl) {
        this.qxcgl = qxcgl;
    }

    public String getWysjl() {
        return wysjl;
    }

    public void setWysjl(String wysjl) {
        this.wysjl = wysjl;
    }

    public String getKysjl() {
        return kysjl;
    }

    public void setKysjl(String kysjl) {
        this.kysjl = kysjl;
    }

    public String getQxqsjl() {
        return qxqsjl;
    }

    public void setQxqsjl(String qxqsjl) {
        this.qxqsjl = qxqsjl;
    }

    public String getRwid() {
        return rwid;
    }

    public void setRwid(String rwid) {
        this.rwid = rwid;
    }

    public String getRwmc() {
        return rwmc;
    }

    public void setRwmc(String rwmc) {
        this.rwmc = rwmc;
    }

    public String getZxsj() {
        return zxsj;
    }

    public void setZxsj(String zxsj) {
        this.zxsj = zxsj;
    }

    public String getYb() {
        return yb;
    }

    public void setYb(String yb) {
        this.yb = yb;
    }

    public String getMxid() {
        return mxid;
    }

    public void setMxid(String mxid) {
        this.mxid = mxid;
    }

    public String getYxzt() {
        return yxzt;
    }

    public void setYxzt(String yxzt) {
        this.yxzt = yxzt;
    }

    public String getZtmc() {
        return ztmc;
    }

    public void setZtmc(String ztmc) {
        this.ztmc = ztmc;
    }

    public String getMxmc() {
        return mxmc;
    }

    public void setMxmc(String mxmc) {
        this.mxmc = mxmc;
    }
    /*t.rwid,
    t.rwmc,
    to_char(t.zxsj, 'yyyy-mm-dd HH:mi:ss') ,
    t.yb,
    t.mxid,
    t.yxzt,
    t1.ztmc,
    t2.mxmc*/
}
