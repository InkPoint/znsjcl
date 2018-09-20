package com.xalt.sjsplc.model;

import com.ts.model.BaseVO;

/**
 * author:WangPengWen
 * Created by win7 on 2018/4/10.
 * 信息采集
 */

public class LogVO extends BaseVO {
    // 类型ID
    private String id;
    // 工作类型
    private String text;
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
    //操作时间
    private String operatingtime;
    //文件路径
    private String filepath;
    //UUID
    private String uuid;
    // 工作类型
    private String type;

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

    public String getOperatingtime() {
        return operatingtime;
    }

    public void setOperatingtime(String operatingtime) {
        this.operatingtime = operatingtime;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
