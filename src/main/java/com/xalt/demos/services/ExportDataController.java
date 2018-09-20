package com.xalt.demos.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.model.NsrxxVO;
import com.xalt.demos.model.QueryVO;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.demos.util.JsonObjectToJava;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 查询基本使用办法
 * user controller
 */
@Controller
public class ExportDataController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @Inject
    ExpertDataUtil exportdata;

    @NoLoginValidate
    public void initinfo(){
    }



    // 基本分页查询
    @NoLoginValidate
    public void list(){
        DelegateMapper delegateMapper = getMapper();
        List lists=delegateMapper.selectList("com.xalt.demos.dao.ExportDataMapper.selectAll");
        String[] title = {"对象id","对象英文名称","对象名称中文","类型id"};
        String[] columns = {"DXID","DXMCYW","DXMCZW","LXID"};
        try{
            exportdata.doPostExecute(this.getRequest(),this.getResponse(),lists,title,columns);
        }catch(Exception e){
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");

    }


}
