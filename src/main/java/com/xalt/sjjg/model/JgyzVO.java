package com.xalt.sjjg.model;

/**
 * Created by win7 on 2017/11/27.
 * User:WangPengWen
 * 结果验证
 */
public class JgyzVO {
    private String id;
    private String text;
    //任务ID
    private String rwid;
    //验证业务名称
    private String yzmc;
    //验证功能结论
    private String yzjl;
    //文件上传路径
    private String uploadpath;
    //验证人代码
    private String yzrdm;
    //对应业务类型
    private String dyyw;
    //备注
    private String bz;
    //有效标志
    private String yxbz;
    //验证时间
    private String yzsj;
    //业务类型ID
    private String ywlxid;
    //类型ID
    private String lxid;
    //类型名称
    private String lxmc;

    public String getLxmc() {
        return lxmc;
    }

    public void setLxmc(String lxmc) {
        this.lxmc = lxmc;
    }

    public String getLxid() {
        return lxid;
    }

    public void setLxid(String lxid) {
        this.lxid = lxid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

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

    public String getDyyw() {
        return dyyw;
    }

    public void setDyyw(String dyyw) {
        this.dyyw = dyyw;
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

    public String getYzsj() {
        return yzsj;
    }

    public void setYzsj(String yzsj) {
        this.yzsj = yzsj;
    }

    public String getYwlxid() {
        return ywlxid;
    }

    public void setYwlxid(String ywlxid) {
        this.ywlxid = ywlxid;
    }
}
