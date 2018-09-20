package com.xalt.sjsplc.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/11/6.
 * 申请审批流程日志vo
 */
public class SqlogVo extends BaseVO {
    //数据标题
    private String lcid;
    private String rwid;
    private String hjid;
    private String clyj;
    private String rlsj;
    private String clsj;
    private String xhjid;
    private String clrid;

    public String getLcid() {
        return lcid;
    }

    public void setLcid(String lcid) {
        this.lcid = lcid;
    }

    public String getRwid() {
        return rwid;
    }

    public void setRwid(String rwid) {
        this.rwid = rwid;
    }

    public String getHjid() {
        return hjid;
    }

    public void setHjid(String hjid) {
        this.hjid = hjid;
    }

    public String getClyj() {
        return clyj;
    }

    public void setClyj(String clyj) {
        this.clyj = clyj;
    }

    public String getRlsj() {
        return rlsj;
    }

    public void setRlsj(String rlsj) {
        this.rlsj = rlsj;
    }

    public String getClsj() {
        return clsj;
    }

    public void setClsj(String clsj) {
        this.clsj = clsj;
    }

    public String getXhjid() {
        return xhjid;
    }

    public void setXhjid(String xhjid) {
        this.xhjid = xhjid;
    }

    public String getClrid() {
        return clrid;
    }

    public void setClrid(String clrid) {
        this.clrid = clrid;
    }
}
