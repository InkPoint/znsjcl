package com.xalt.demos.model;

import com.ts.model.BaseVO;


/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-11-20
 * Time: 下午5:49
 */
public class DemoVO extends BaseVO {

    private String name;
    private int sex;
    private String rs;
    private String myuuid;
    private String data1;
    private String data2;
    private byte[] data3;

    public String getMyuuid() {
        return myuuid;
    }

    public void setMyuuid(String myuuid) {
        this.myuuid = myuuid;
    }

    public String getData1() {
        return data1;
    }

    public void setData1(String data1) {
        this.data1 = data1;
    }

    public String getData2() {
        return data2;
    }

    public void setData2(String data2) {
        this.data2 = data2;
    }

    public byte[] getData3() {
        return data3;
    }

    public void setData3(byte[] data3) {
        this.data3 = data3;
    }

    public String getRs() {
        return rs;
    }

    public void setRs(String rs) {
        this.rs = rs;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }
}
