package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/3/12.
 */
public class SjzyzkbgVO extends BaseVO{
    private String zyid;//资源id
    private String zylj;//资源路径
    private String filename;//文件名称
    private String uploadtime;//文件上传时间
    private String uploaduser;//文件上传人代码
    private String bgbt;//报告标题
    private String bgms;//报告描述
    private String yxbz;//有效标志
    private String username;//用户名称

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getZyid() {
        return zyid;
    }

    public void setZyid(String zyid) {
        this.zyid = zyid;
    }

    public String getZylj() {
        return zylj;
    }

    public void setZylj(String zylj) {
        this.zylj = zylj;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getUploadtime() {
        return uploadtime;
    }

    public void setUploadtime(String uploadtime) {
        this.uploadtime = uploadtime;
    }

    public String getUploaduser() {
        return uploaduser;
    }

    public void setUploaduser(String uploaduser) {
        this.uploaduser = uploaduser;
    }

    public String getBgbt() {
        return bgbt;
    }

    public void setBgbt(String bgbt) {
        this.bgbt = bgbt;
    }

    public String getBgms() {
        return bgms;
    }

    public void setBgms(String bgms) {
        this.bgms = bgms;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }
}
