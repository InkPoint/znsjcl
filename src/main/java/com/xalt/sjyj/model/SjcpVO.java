package com.xalt.sjyj.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/1/5.
 * 数据产品
 */
public class SjcpVO extends BaseVO{
    private String cpid;//产品id
    private String cpmc;//产品名称
    private String cpms;//产品描述
    private String cpcxjb;//产品对应查询脚本
    private String cpbt;//cpbt
    private String cjrdm;//创建人代码
    private String cjsj;//创建时间
    private String yxbz;//有效标志
    private String cjsjbegin;//创建时间开始
    private String cjsjend;//创建时间终止
    private String cpbtzw;//产品表头中文

    public String getCpbtzw() {
        return cpbtzw;
    }

    public void setCpbtzw(String cpbtzw) {
        this.cpbtzw = cpbtzw;
    }

    public String getCjsjbegin() {
        return cjsjbegin;
    }

    public void setCjsjbegin(String cjsjbegin) {
        this.cjsjbegin = cjsjbegin;
    }

    public String getCjsjend() {
        return cjsjend;
    }

    public void setCjsjend(String cjsjend) {
        this.cjsjend = cjsjend;
    }

    public String getCpid() {
        return cpid;
    }

    public void setCpid(String cpid) {
        this.cpid = cpid;
    }

    public String getCpmc() {
        return cpmc;
    }

    public void setCpmc(String cpmc) {
        this.cpmc = cpmc;
    }

    public String getCpms() {
        return cpms;
    }

    public void setCpms(String cpms) {
        this.cpms = cpms;
    }

    public String getCpcxjb() {
        return cpcxjb;
    }

    public void setCpcxjb(String cpcxjb) {
        this.cpcxjb = cpcxjb;
    }

    public String getCpbt() {
        return cpbt;
    }

    public void setCpbt(String cpbt) {
        this.cpbt = cpbt;
    }

    public String getCjrdm() {
        return cjrdm;
    }

    public void setCjrdm(String cjrdm) {
        this.cjrdm = cjrdm;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getYxbz() {
        return yxbz;
    }

    public void setYxbz(String yxbz) {
        this.yxbz = yxbz;
    }
}
