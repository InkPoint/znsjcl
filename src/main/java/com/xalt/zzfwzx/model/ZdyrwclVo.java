package com.xalt.zzfwzx.model;

import com.ts.model.BaseVO;

/**
 * Created by cuiheng on 2018/4/11.
 * 自定义处理任务
 */
public class ZdyrwclVo extends BaseVO{

    //任务ID
    private String rwid;
    //任务名称
    private String rwmc;
    //源数据表
    private String yb;
    //目标表
    private String mbb;
    //执行周期ID
    private String zqid;
    //执行时间
    private String zxsj;
    //运行状态ID
    private String ztid;
    //备注
    private String bz;
    //有效标志
    private String yxbz;
    //最后一次运行时间
    private String lasttime;
    //执行人代码
    private String zxr;
    //job编号
    private String jobid;
    //处理模型
    private String clmx;
    //批次
    private String pc;
    //运行状态
    private String yxzt;
    //job
    private String job;
    //ID
    private String id;
    //文本
    private String text;
    //源表代码
    private String ybdm;
    //目标表代码
    private String mbbdm;
    //批次代码
    private String pcdm;
    //处理模型代码
    private String clmxdm;
    //模型ID
    private String mxid;
    //数据项
    private String sjx;
    //源表
    private String ytable;
    //目标表
    private String mtable;
    //批次名称
    private String pcmc;
    //纳税人信息
    private String nsrxx;
    //规则ID
    private String gzid;
    //指标
    private String zb;
    //清洗算法
    private String qxsf;
    //字段名
    private String fields;
    //指标
    private String indicators;
    //源数据表名英文
    private String ysbmcyw;
    //指标ID
    private String zbid;
    //对象名称英文
    private String dxmcyw;
    //指标名称
    private String zbmc;
    //清洗匹配状态
    private String msg;
    //清洗目标表
    private String qxmbb;
    //创建时间
    private String cjsj;
    //匹配项中文
    private String ppxzw;
    //匹配项英文
    private String ppxyw;
    //原始表英文
    private String ysbyw;
    //序号
    private String xh;
    //规则
    private String gz;
    //匹配说明
    private String ppsm;
    //执行机关代码
    private String zxjgdm;
    //任务类型
    private String rwlx;

    public String getPpsm() {
        return ppsm;
    }

    public void setPpsm(String ppsm) {
        this.ppsm = ppsm;
    }

    public String getYsbyw() {
        return ysbyw;
    }

    public void setYsbyw(String ysbyw) {
        this.ysbyw = ysbyw;
    }

    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

    public String getGz() {
        return gz;
    }

    public void setGz(String gz) {
        this.gz = gz;
    }

    public String getPpxyw() {
        return ppxyw;
    }

    public void setPpxyw(String ppxyw) {
        this.ppxyw = ppxyw;
    }

    public String getPpxzw() {
        return ppxzw;
    }

    public void setPpxzw(String ppxzw) {
        this.ppxzw = ppxzw;
    }

    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getQxmbb() {
        return qxmbb;
    }

    public void setQxmbb(String qxmbb) {
        this.qxmbb = qxmbb;
    }

    public String getZbmc() {
        return zbmc;
    }

    public void setZbmc(String zbmc) {
        this.zbmc = zbmc;
    }

    public String getDxmcyw() {
        return dxmcyw;
    }

    public void setDxmcyw(String dxmcyw) {
        this.dxmcyw = dxmcyw;
    }

    public String getZbid() {
        return zbid;
    }

    public void setZbid(String zbid) {
        this.zbid = zbid;
    }

    public String getYsbmcyw() {
        return ysbmcyw;
    }

    public void setYsbmcyw(String ysbmcyw) {
        this.ysbmcyw = ysbmcyw;
    }

    public String getFields() {
        return fields;
    }

    public void setFields(String fields) {
        this.fields = fields;
    }

    public String getIndicators() {
        return indicators;
    }

    public void setIndicators(String indicators) {
        this.indicators = indicators;
    }

    public String getQxsf() {
        return qxsf;
    }

    public void setQxsf(String qxsf) {
        this.qxsf = qxsf;
    }

    public String getZb() {
        return zb;
    }

    public void setZb(String zb) {
        this.zb = zb;
    }

    public String getGzid() {
        return gzid;
    }

    public void setGzid(String gzid) {
        this.gzid = gzid;
    }

    public String getNsrxx() {
        return nsrxx;
    }

    public void setNsrxx(String nsrxx) {
        this.nsrxx = nsrxx;
    }

    public String getPcmc() {
        return pcmc;
    }

    public void setPcmc(String pcmc) {
        this.pcmc = pcmc;
    }

    public String getYtable() {
        return ytable;
    }

    public void setYtable(String ytable) {
        this.ytable = ytable;
    }

    public String getMtable() {
        return mtable;
    }

    public void setMtable(String mtable) {
        this.mtable = mtable;
    }

    public String getMxid() {
        return mxid;
    }

    public void setMxid(String mxid) {
        this.mxid = mxid;
    }

    public String getSjx() {
        return sjx;
    }

    public void setSjx(String sjx) {
        this.sjx = sjx;
    }

    public String getYbdm() {
        return ybdm;
    }

    public void setYbdm(String ybdm) {
        this.ybdm = ybdm;
    }

    public String getMbbdm() {
        return mbbdm;
    }

    public void setMbbdm(String mbbdm) {
        this.mbbdm = mbbdm;
    }

    public String getPcdm() {
        return pcdm;
    }

    public void setPcdm(String pcdm) {
        this.pcdm = pcdm;
    }

    public String getClmxdm() {
        return clmxdm;
    }

    public void setClmxdm(String clmxdm) {
        this.clmxdm = clmxdm;
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

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
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

    public String getYb() {
        return yb;
    }

    public void setYb(String yb) {
        this.yb = yb;
    }

    public String getMbb() {
        return mbb;
    }

    public void setMbb(String mbb) {
        this.mbb = mbb;
    }

    public String getZqid() {
        return zqid;
    }

    public void setZqid(String zqid) {
        this.zqid = zqid;
    }

    public String getZxsj() {
        return zxsj;
    }

    public void setZxsj(String zxsj) {
        this.zxsj = zxsj;
    }

    public String getZtid() {
        return ztid;
    }

    public void setZtid(String ztid) {
        this.ztid = ztid;
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

    public String getLasttime() {
        return lasttime;
    }

    public void setLasttime(String lasttime) {
        this.lasttime = lasttime;
    }

    public String getZxr() {
        return zxr;
    }

    public void setZxr(String zxr) {
        this.zxr = zxr;
    }

    public String getJobid() {
        return jobid;
    }

    public void setJobid(String jobid) {
        this.jobid = jobid;
    }

    public String getClmx() {
        return clmx;
    }

    public void setClmx(String clmx) {
        this.clmx = clmx;
    }

    public String getPc() {
        return pc;
    }

    public void setPc(String pc) {
        this.pc = pc;
    }

    public String getYxzt() {
        return yxzt;
    }

    public void setYxzt(String yxzt) {
        this.yxzt = yxzt;
    }

    public String getZxjgdm() {
        return zxjgdm;
    }

    public void setZxjgdm(String zxjgdm) {
        this.zxjgdm = zxjgdm;
    }

    public String getRwlx() {
        return rwlx;
    }

    public void setRwlx(String rwlx) {
        this.rwlx = rwlx;
    }
}
