package com.xalt.sjzd.model;

import java.util.List;

/**
 * Created by win7 on 2017/10/25.
 * 数据来源树形菜单
 */
public class SjlyTree {
    //树对象ID
    private String id;
    //树对象名称
    private String text;
    //子类对象
    private List<SjlyTree> children;

    public SjlyTree(String id, String text) {
        this.id = id;
        this.text = text;
    }

    public SjlyTree(String id, String text, List<SjlyTree> children) {
        this.id = id;
        this.text = text;
        this.children = children;
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

    public List<SjlyTree> getChildren() {
        return children;
    }

    public void setChildren(List<SjlyTree> children) {
        this.children = children;
    }
}
