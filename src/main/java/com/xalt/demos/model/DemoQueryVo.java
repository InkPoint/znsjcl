package com.xalt.demos.model;

import com.ts.model.BaseVO;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * Time: 下午5:07
 * To change this template use File | Settings | File Templates.
 */
public class DemoQueryVo extends BaseVO{
    //查询条件  文本框里的内容

    private String nsrmc;
    private String gldm;
    private String fr;



    public void setFr(String fr) {
        this.fr = fr;
    }
    public String getFr() {
        return fr;
    }

    public void setGldm(String gldm) {
        this.gldm = gldm;
    }

    public String getGldm() {
        return gldm;
    }

    public String getNsrmc() {
        return nsrmc;
    }
    public void setNsrmc(String nsrmc) {
        this.nsrmc = nsrmc;
    }
}
