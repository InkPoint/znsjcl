package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.SjmxjsVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by win7 on 2017/11/30.
 * 数据模型检索
 */
@Controller
public class SjmxjsController extends WebServiceSupport {

    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjmxjs(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据模型检索",this.getUserPrincipal().getUserCode(),"sjyj/sjmxjs/initSjmxjs");
        }catch (Exception e){

        }
    }

    //基本分页查询

    public void list(SjmxjsVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new SjmxjsVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.SjmxjsMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

}
