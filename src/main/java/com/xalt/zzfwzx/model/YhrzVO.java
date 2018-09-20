package com.xalt.zzfwzx.model;

import com.ts.model.BaseVO;

/**
 * author:PengWen Wang
 * Created by win7 on 2018/6/19.
 * 用户日志
 */

public class YhrzVO extends BaseVO {

    //主题
    private String theme;
    //日志ID
    private String logid;
    //文本
    private String thetext;
    //用户代码
    private String usercode;
    //用户名称
    private String username;
    //文件名称(附件)
    private String filename;
    //有效标志
    private String mark;
    //录入时间
    private String entrytime;
    //文件路径
    private String filepath;
    //UUID
    private String uuid;

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getLogid() {
        return logid;
    }

    public void setLogid(String logid) {
        this.logid = logid;
    }

    public String getThetext() {
        return thetext;
    }

    public void setThetext(String thetext) {
        this.thetext = thetext;
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

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }

    public String getEntrytime() {
        return entrytime;
    }

    public void setEntrytime(String entrytime) {
        this.entrytime = entrytime;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
