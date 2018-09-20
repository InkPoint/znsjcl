package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/12/15.
 * 结果验证
 */

public class JgyzVo extends BaseVO {
    private String rwid;//任务id
    private String rwmc;//任务名称
    private String id;
    private String text;
    private String yzmc;//验证名称
    private String yzjl;//验证结论
    private String yzsj;//颜值时间
    private String yxbz;//有效标志
    private String uploadpath;//文件上传路径

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

    public String getYzsj() {
        return yzsj;
    }

    public void setYzsj(String yzsj) {
        this.yzsj = yzsj;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getUploadpath() {
        return uploadpath;
    }

    public void setUploadpath(String uploadpath) {
        this.uploadpath = uploadpath;
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
}
