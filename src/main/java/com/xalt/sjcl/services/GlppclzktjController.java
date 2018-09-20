package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.ClmxcxVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by win7 on 2017/11/28.
 * 关联匹配处理状况统计
 *
 */
@Controller
public class GlppclzktjController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initGlppclzktj(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"智能匹配处理状况统计",this.getUserPrincipal().getUserCode(),"sjcl/glppclzktj/initGlppclzktj");
        }catch (Exception e){

        }
    }

    public void initGlppclzktjView(){}

    //基本分页查询

    public void list(ClmxcxVo svo,int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new ClmxcxVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.GlppclzktjMapper.selectlist", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

//    //详细信息查询
//    @NoLoginValidate
//    public void selectlist(ClmxcxVo svo,int limit, int offset, String sort, String order){
//        if (svo == null) {
//            svo = new ClmxcxVo();
//        }
//        DelegateMapper delegateMapper = getMapper();
//        Map<String, Object> param = Maps.newHashMap();
//        param.put("svo", svo);
//        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.GlppclzktjMapper.selectall", param, offset, limit);
//        Map<String, Object> results = new HashMap<String, Object>();
//        results.put("total", vo.getPageCount());
//        results.put("rows", vo.getRows());
//        includeJson(vo);
//    }
}
