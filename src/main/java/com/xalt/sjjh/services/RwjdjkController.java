package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.RwjdjkVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;


/**
 * author:WangPengWen
 * Created by win7 on 2017/11/10.
 * 任务进度监控
 */
@Controller
public class RwjdjkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initRwjdjk() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"任务进度监控",this.getUserPrincipal().getUserCode(),"sjjh/rwjdjk/initRwjdjk");
        }catch (Exception e){

        }
    }


    // Table data

    public void rwjdjkAll(RwjdjkVo svo, int limit, int offset,String sort, String order) {
        DelegateMapper mapper  =getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjjh.dao.RwjdjkMapper.rwjdjkAll", param,offset,limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //查询任务中的表数量

    public void selectRwxx(RwjdjkVo svo, int limit, int offset,String sort, String order){
        DelegateMapper mapper  =getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjjh.dao.RwjdjkMapper.selectRwxx", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


}
