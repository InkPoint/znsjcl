package com.ts.acl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.persistence.dao.DelegateMapper;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.List;

/**
 * Created by Administrator on 16-12-5.
 */
@Controller
public class UtilsController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void initUtils(){
    }

    public void getCurDate(){
        DelegateMapper spMapper = getMapper();

        //当前时间
        List lsCurDate = spMapper.selectList("com.ts.acl.dao.UtilsMapper.getCurDate");

        String curDate = "";
        if(lsCurDate != null){
            curDate = lsCurDate.get(0).toString();
        }
        log.debug("curDate==" + curDate);
        includeJson(curDate);
    }

    public void getCurDateFD(){
        DelegateMapper spMapper = getMapper();

        //当月的第一天
        List lsCurDateFD = spMapper.selectList("com.ts.acl.dao.UtilsMapper.getCurDateFd");
        String curDateFD = "";
        if(lsCurDateFD !=null){
            curDateFD = lsCurDateFD.get(0).toString();
        }
        log.debug("curDateFD==" + curDateFD);
        includeJson(curDateFD);
    }

    public String getCurDateStr(){
        DelegateMapper spMapper = getMapper();

        //当前时间
        List lsCurDate = spMapper.selectList("com.ts.acl.dao.UtilsMapper.getCurDate");

        String curDate = "";
        if(lsCurDate != null){
            curDate = lsCurDate.get(0).toString();
        }
        log.debug("curDate==" + curDate);
        return curDate;
    }

    public String getCurDateFDStr(){
        DelegateMapper spMapper = getMapper();

        //当月的第一天
        List lsCurDateFD = spMapper.selectList("com.ts.acl.dao.UtilsMapper.getCurDateFd");
        String curDateFD = "";
        if(lsCurDateFD !=null){
            curDateFD = lsCurDateFD.get(0).toString();
        }
        log.debug("curDateFD==" + curDateFD);
        return curDateFD;
    }
}
