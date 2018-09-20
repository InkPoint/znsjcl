package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.DrrwdzVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by win7 on 2017/11/20.
 * 导入任务监控
 */

@Controller
public class DrrwjkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initDrrwjk(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"导入任务监控",this.getUserPrincipal().getUserCode(),"sjjh/drrwjk/initDrrwjk");
        }catch (Exception e){

        }
    }


    //查看日志

    public void selectRz(DrrwdzVo svo,int limit, int offset, String sort, String order){
        if (svo == null){
            svo = new DrrwdzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjh.dao.DrrwjkMapper.selectRz", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);


    }




}
