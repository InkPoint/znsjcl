package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.SjdcVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by CuiHeng on 2018/2/5.
 * 数据导出
 */

@Controller
public class SjdcController extends WebServiceSupport {
    @Inject
    private Logger log;

    @NoLoginValidate
    public void initSjdc(){

    }

    //基本分页查询

    public void selectList(SjdcVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new SjdcVo();
        }
        log.debug("svo---->"+svo);
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjh.dao.SjdcMapper.selectList",param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }
}
