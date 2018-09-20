package com.xalt.main.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/6/25.
 */
public class PermissionVO extends BaseVO{
    private String id;
    private String text;
    private String modeid;
    private String usercode;
    private String menuid;
    private String username;
    private String menuname;
    private String yxbz;
    private String baks;
    private String modename;
    private String qxid;
    public String getMenuid() {
        return menuid;
    }

    public void setMenuid(String menuid) {
        this.menuid = menuid;
    }


    public String getModeid() {
        return modeid;
    }

    public void setModeid(String modeid) {
        this.modeid = modeid;
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

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMenuname() {
        return menuname;
    }

    public void setMenuname(String menuname) {
        this.menuname = menuname;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getBaks() {
        return baks;
    }

    public void setBaks(String baks) {
        this.baks = baks;
    }

    public String getModename() {
        return modename;
    }

    public void setModename(String modename) {
        this.modename = modename;
    }

    public String getQxid() {
        return qxid;
    }

    public void setQxid(String qxid) {
        this.qxid = qxid;
    }

}
