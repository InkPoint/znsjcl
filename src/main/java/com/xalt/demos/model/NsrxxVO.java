package com.xalt.demos.model;

import com.ts.model.BaseVO;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-10-31
 * Time: 下午2:51
 */
public class NsrxxVO extends BaseVO {

    private String taxpayername;
    private String taxregcode;
    private String checkattribute;
    private String jurpname ;
    private String acceptdate;


    public void setAcceptdate(String acceptdate) {
        this.acceptdate = acceptdate;
    }

    public String getAcceptdate() {
        return acceptdate;
    }

    public String getTaxpayername() {
        return taxpayername;
    }

    public void setTaxpayername(String taxpayername) {
        this.taxpayername = taxpayername;
    }

    public String getTaxregcode() {
        return taxregcode;
    }

    public void setTaxregcode(String taxregcode) {
        this.taxregcode = taxregcode;
    }

    public String getCheckattribute() {
        return checkattribute;
    }

    public void setCheckattribute(String checkattribute) {
        this.checkattribute = checkattribute;
    }

    public String getJurpname() {
        return jurpname;
    }

    public void setJurpname(String jurpname) {
        this.jurpname = jurpname;
    }
}
