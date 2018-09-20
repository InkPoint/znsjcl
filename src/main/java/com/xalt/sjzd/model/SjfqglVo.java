package com.xalt.sjzd.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2017/12/11.
 * 数据分区管理
 */
public class SjfqglVo extends BaseVO {

    private String fqid;//分区id
    private String fqmc;//分区名称
    private String fqms;//分区描述
    private String cjsj;//创建时间
    private String flfqid;//父类分区id
    private String xh;//序号
    private String bz;//备注
    private String yxbz;//有效标志
    private String id;
    private String text;
    private String cjr;//创建人

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
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

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }

    public String getFqid() {
        return fqid;
    }

    public void setFqid(String fqid) {
        this.fqid = fqid;
    }

    public String getFqmc() {
        return fqmc;
    }

    public void setFqmc(String fqmc) {
        this.fqmc = fqmc;
    }

    public String getFqms() {
        return fqms;
    }

    public void setFqms(String fqms) {
        this.fqms = fqms;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getFlfqid() {
        return flfqid;
    }

    public void setFlfqid(String flfqid) {
        this.flfqid = flfqid;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }
}
