package com.xalt.sjjg.model;

import com.ts.model.BaseVO;

/**
 * Created by win7 on 2018/1/9.
 * User:WangPengWen
 * 元件模型研发
 */
public class YjmxyfVO extends BaseVO {
    //申请ID
    private String sqid;
    //任务名称
    private String rwmc;
    //任务名称
    private String rwsm;
    //创建人
    private String cjr;
    //状态名称
    private String ztmc;
    //研发状态
    private String yfzt;
    //研发进度
    private String yfjd;
    //研发结果
    private String yfjg;
    //研发开始时间
    private String kssj;
    //备注
    private String bz;
    //有效标志
    private String yxbz;
    //(Select2)ID
    private String id;
    //(Select2)文本
    private String text;
    private String shzt;

    private String yjmc;
    private String yjid;
    private String sjb;
    private String ccgc;

    public String getSjb() {
        return sjb;
    }

    public void setSjb(String sjb) {
        this.sjb = sjb;
    }

    public String getCcgc() {
        return ccgc;
    }

    public void setCcgc(String ccgc) {
        this.ccgc = ccgc;
    }

    public String getYjmc() {
        return yjmc;
    }

    public void setYjmc(String yjmc) {
        this.yjmc = yjmc;
    }

    public String getYjid() {
        return yjid;
    }

    public void setYjid(String yjid) {
        this.yjid = yjid;
    }

    public String getShzt() {
        return shzt;
    }

    public void setShzt(String shzt) {
        this.shzt = shzt;
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

    public String getRwmc() {
        return rwmc;
    }

    public void setRwmc(String rwmc) {
        this.rwmc = rwmc;
    }

    public String getRwsm() {
        return rwsm;
    }

    public void setRwsm(String rwsm) {
        this.rwsm = rwsm;
    }

    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    public String getZtmc() {
        return ztmc;
    }

    public void setZtmc(String ztmc) {
        this.ztmc = ztmc;
    }

    public String getSqid() {
        return sqid;
    }

    public void setSqid(String sqid) {
        this.sqid = sqid;
    }

    public String getYfzt() {
        return yfzt;
    }

    public void setYfzt(String yfzt) {
        this.yfzt = yfzt;
    }

    public String getYfjd() {
        return yfjd;
    }

    public void setYfjd(String yfjd) {
        this.yfjd = yfjd;
    }

    public String getYfjg() {
        return yfjg;
    }

    public void setYfjg(String yfjg) {
        this.yfjg = yfjg;
    }

    public String getKssj() {
        return kssj;
    }

    public void setKssj(String kssj) {
        this.kssj = kssj;
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


    private String lcid;//流程id
    private String rwid;//任务id
    private String wcjd;//完成进度
    private String cjsj;//创建时间
    private String jzrq;//截止日期
    private String name;//用户名
    private String xyhjid;//下一环节id

    public String getLcid() {
        return lcid;
    }

    public void setLcid(String lcid) {
        this.lcid = lcid;
    }

    public String getRwid() {
        return rwid;
    }

    public void setRwid(String rwid) {
        this.rwid = rwid;
    }

    public String getWcjd() {
        return wcjd;
    }

    public void setWcjd(String wcjd) {
        this.wcjd = wcjd;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getJzrq() {
        return jzrq;
    }

    public void setJzrq(String jzrq) {
        this.jzrq = jzrq;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getXyhjid() {
        return xyhjid;
    }

    public void setXyhjid(String xyhjid) {
        this.xyhjid = xyhjid;
    }
}
