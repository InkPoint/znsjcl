package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/11/29.
 * 清洗处理状况统计
 */
public class QxclzktjVo extends BaseVO {
    private String cll;//处理率
    private String ybsjl;//原表数据量
    private String clsjl;//处理数据量
    private String clsj;//处理时间
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String mxmc;//模型名称

    public String getCll() {
        return cll;
    }

    public void setCll(String cll) {
        this.cll = cll;
    }

    public String getYbsjl() {
        return ybsjl;
    }

    public void setYbsjl(String ybsjl) {
        this.ybsjl = ybsjl;
    }

    public String getClsjl() {
        return clsjl;
    }

    public void setClsjl(String clsjl) {
        this.clsjl = clsjl;
    }

    public String getClsj() {
        return clsj;
    }

    public void setClsj(String clsj) {
        this.clsj = clsj;
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

    public String getMxmc() {
        return mxmc;
    }

    public void setMxmc(String mxmc) {
        this.mxmc = mxmc;
    }
}
