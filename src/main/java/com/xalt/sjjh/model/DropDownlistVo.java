package com.xalt.sjjh.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/10/24.
 * 下拉菜单
 */
public class DropDownlistVo extends BaseVO {
    //ID
    private String id;
    //文本
    private String text;
    //P id
    private String pid;

    private String wjlx;

    private String wjdx;

    private String pc;

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

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getWjlx() {
        return wjlx;
    }

    public void setWjlx(String wjlx) {
        this.wjlx = wjlx;
    }

    public String getWjdx() {
        return wjdx;
    }

    public void setWjdx(String wjdx) {
        this.wjdx = wjdx;
    }

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc;
    }
}
