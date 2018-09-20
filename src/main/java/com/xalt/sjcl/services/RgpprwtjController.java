package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.RgpprwtjVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cuihegn on 2018/6/20.
 * 人工匹配-任务统计
 */
@Controller
public class RgpprwtjController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initRgpprwtj(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"人工匹配任务统计",this.getUserPrincipal().getUserCode(),"sjcl/rgpprwtj/initRgpprwtj");
        }catch (Exception e){

        }
    }

    //处理人下拉框查询

    public void selectClr(){
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.RgpprwtjMapper.selectClr");
        includeJson(vo);
    }


    //默认表信息查询

    public void selectList(RgpprwtjVo svo, int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.RgpprwtjMapper.selectList", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

}
