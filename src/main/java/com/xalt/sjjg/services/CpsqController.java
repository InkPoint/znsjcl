package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.CpsqVo;

import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 *  产品申请
 * Created by Cuiheng on 2018/2/2.
 */

@Controller
public class CpsqController extends WebServiceSupport {
    @Inject
    private Logger log;


    public void initCpsq(){

    }

//    @NoLoginValidate
//    public void initRwssfk(){
//
//    }


    //基本分页查询

    public void selectList(CpsqVo svo, int limit, int offset, String sort, String order) {
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

    
    //修改产品申请
    public void updateCpsq(CpsqVo svo) {
        if (svo == null) {
            svo = new CpsqVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjjg.dao.CpsqMapper.updateCpsq", param);
        includeJson("修改成功!");
    }

    //完成进度修改事件//标签信息编辑

    public void updateLable(String rwid, String sliding) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("rwid", rwid);
        param.put("sliding", sliding);
        delegateMapper.update("com.xalt.sjjg.dao.CpsqMapper.updateWcjd", param);
        includeJson("success!");
    }
}
