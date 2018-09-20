package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.SjzyzkcxVo;
import com.xalt.sjzd.model.ExpertDataUtil;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.ExpertData;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/11/28.
 * 金三数据字典查询
 */
@Controller
public class JinsansjzdcxController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initJssjzdcx() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"金三数据字典查询",this.getUserPrincipal().getUserCode(),"sjyj/jinsansjzdcx/initJssjzdcx");
        }catch (Exception e){

        }
    }

    public void alltabs() {}

    //查询金三所有字典表信息

    public void  tabLists(String ywmc,String zwmc, int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param=new HashMap<>();
        param.put("ywmc",ywmc);
        param.put("zwmc",zwmc);
        //查询交换数据
        PaginatedVO list=delegateMapper.selectPaginated("com.xalt.main.dao.MainsMapper.jinsantablist",param,offset,limit);
        includeJson(list);

    }

    //导出数据

    public void exportdata(String ywmc,String zwmc,HttpServletRequest req,HttpServletResponse resp){
        String[] columns={"YWBM","ZWBM","SJL"};
        String[] titless={"英文表名","中文表名","数据量"};
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param=new HashMap<>();
        param.put("ywmc",ywmc==null||"".equals(ywmc)?"":ywmc.toUpperCase());
        param.put("zwmc",zwmc);
        //查询交换数据
        List list=delegateMapper.selectList("com.xalt.main.dao.MainsMapper.jinsantablist1",param);
        //return ExpertData.getDataToExcels("金三数据字典",columns,titless,list,this.getResponse());
        ExpertDataUtil exportdata=new ExpertDataUtil();
        try{
            exportdata.doPostExecute(req,resp,list,titless,columns,"金三数据字典");
        }catch(Exception e){
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");

    }
    //查询金三所有字典表信息

    public void  querydetail(String ywmc,int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param=new HashMap<>();
        param.put("ywmc",ywmc);
        //查询交换数据
        PaginatedVO list=delegateMapper.selectPaginated("com.xalt.main.dao.MainsMapper.querydetail",param,offset,limit);
        includeJson(list);

    }
}
