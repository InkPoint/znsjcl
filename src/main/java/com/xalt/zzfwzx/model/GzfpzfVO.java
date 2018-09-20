package com.xalt.zzfwzx.model;

import com.ts.model.BaseVO;

/**
 * Created by ld on 2018/2/5.
 */
public class GzfpzfVO extends BaseVO{
    private String id;
    private String text;
    private String ybywm;
    private String ybzd;
    private String ppz;
    private int wid;

    public String getYbywm() {
        return ybywm;
    }

    public void setYbywm(String ybywm) {
        this.ybywm = ybywm;
    }

    public String getYbzd() {
        return ybzd;
    }

    public void setYbzd(String ybzd) {
        this.ybzd = ybzd;
    }

    public String getPpz() {
        return ppz;
    }

    public void setPpz(String ppz) {
        this.ppz = ppz;
    }

    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
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
}
