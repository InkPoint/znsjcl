package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/12/27.
 */
public class SjpcglVO extends BaseVO{
    private String pcmc;//批次名称
    private String bz;//备注
    private String sybz;//使用标志1表示正在使用 别的表示没有使用
    private String cjsj;//创建时间
    private String pcdm;//批次代码
    private String cjsjbegin;//创建的开始时间
    private String cjsjend;//创建的结束时间
    private String pcdmid;//批次代码的判断吧

    public String getPcdmid() {
        return pcdmid;
    }

    public void setPcdmid(String pcdmid) {
        this.pcdmid = pcdmid;
    }

    public String getPcmc() {
        return pcmc;
    }

    public void setPcmc(String pcmc) {
        this.pcmc = pcmc;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getSybz() {
        return sybz;
    }

    public void setSybz(String sybz) {
        this.sybz = sybz;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getPcdm() {
        return pcdm;
    }

    public void setPcdm(String pcdm) {
        this.pcdm = pcdm;
    }

    public String getCjsjbegin() {
        return cjsjbegin;
    }

    public void setCjsjbegin(String cjsjbegin) {
        this.cjsjbegin = cjsjbegin;
    }

    public String getCjsjend() {
        return cjsjend;
    }

    public void setCjsjend(String cjsjend) {
        this.cjsjend = cjsjend;
    }
}
