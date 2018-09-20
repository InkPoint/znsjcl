package com.xalt.common.model;

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
}
