package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/10/23.
 * 数据级别管理
 */
public class SjjbglVo extends BaseVO {
    //级别ID
    private String jbid;
    //级别名称
    private String jbmc;
    //级别描述
    private String jbms;
    //创建时间
    private String cjsj;
    //创建人代码
    private String cjr;
    //备注
    private String bz;
    //有效标志
    private String yxbz;
    //ID
    private String id;
    //文本
    private String text;

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

    public SjjbglVo() {
    }


    public String getJbid() {
        return jbid;
    }

    public void setJbid(String jbid) {
        this.jbid = jbid;
    }

    public String getJbmc() {
        return jbmc;
    }

    public void setJbmc(String jbmc) {
        this.jbmc = jbmc;
    }

    public String getJbms() {
        return jbms;
    }

    public void setJbms(String jbms) {
        this.jbms = jbms;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
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
}
