package com.xalt.sjcl.model;

import com.ts.model.BaseVO;

/**
 * Created by ld on 2018/2/5.
 */
public class GzfpVO extends BaseVO{
    private String id;
    private String text;
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
