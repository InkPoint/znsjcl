package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.RwyxfkVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by CuiHeng on 2018/1/31.
 * 任务运行监控
 */

@Controller
public class RwyxjkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initRwyxjk(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"任务运行监控",this.getUserPrincipal().getUserCode(),"sjcl/rwyxjk/initRwyxjk");
        }catch (Exception e){

        }
    }

    //默认基本分页信息查询

    public void list(RwyxfkVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new RwyxfkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.RwyxfkMapper.selectlist",param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

}
