package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.CpsqVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by win7 on 2018/5/17.
 *
 * 数据加工--任务进度监控
 */

@Controller
public class RwjdjkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initRwjdjk(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据加工-任务进度监控",this.getUserPrincipal().getUserCode(),"sjjg/rwjdjk/initRwjdjk");
        }catch (Exception e){

        }
    }

    //默认信息查询

    public void selectaAll(CpsqVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new CpsqVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.CpsqMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

}
