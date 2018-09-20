package com.xalt.sjjg.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/1/17.
 */
public class SjyzVO extends BaseVO{
    private String rwid;//任务ID
    private String yzmc;//验证业务名称
    private String yzjl;//验证结论
    private String uploadpath;//文件上传路径
    private String yzrdm;//验证人代码
    private String bz;//备注
    private String yzsj;//验证时间
    public String getRwid() {
        return rwid;
    }

    public void setRwid(String rwid) {
        this.rwid = rwid;
    }

    public String getYzmc() {
        return yzmc;
    }

    public void setYzmc(String yzmc) {
        this.yzmc = yzmc;
    }

    public String getYzjl() {
        return yzjl;
    }

    public void setYzjl(String yzjl) {
        this.yzjl = yzjl;
    }

    public String getUploadpath() {
        return uploadpath;
    }

    public void setUploadpath(String uploadpath) {
        this.uploadpath = uploadpath;
    }

    public String getYzrdm() {
        return yzrdm;
    }

    public void setYzrdm(String yzrdm) {
        this.yzrdm = yzrdm;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getYzsj() {
        return yzsj;
    }

    public void setYzsj(String yzsj) {
        this.yzsj = yzsj;
    }
}
