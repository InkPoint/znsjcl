package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/12/15.
 * 金三数据字典
 */

public class JinSanVo extends BaseVO {
    private String ywbm;//任务id
    private String zwbm;//任务名称
    private String sjl;

    public String getYwbm() {
        return ywbm;
    }

    public void setYwbm(String ywbm) {
        this.ywbm = ywbm;
    }

    public String getZwbm() {
        return zwbm;
    }

    public void setZwbm(String zwbm) {
        this.zwbm = zwbm;
    }

    public String getSjl() {
        return sjl;
    }

    public void setSjl(String sjl) {
        this.sjl = sjl;
    }
}
