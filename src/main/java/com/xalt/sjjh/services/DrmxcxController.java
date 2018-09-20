package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.DrzktjVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;


/**
 * author:WangPengWen
 * Created by win7 on 2017/11/14.
 * 导入明细查询
 */
@Controller
public class DrmxcxController extends WebServiceSupport {
    @Inject
    private Logger log;


    public void initDrmxcx() {
        log.debug("-------------导入明细查询页面开始加载---->");
    }
    // 导入状况统计分页查询

    public void drmxcxAll(DrzktjVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper  =getMapper();
        if (svo == null) {
            svo = new DrzktjVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjjh.dao.DrmxcxMapper.drmxcxAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);

    }

    // （根据表代码_查看数据）基本分页查询

    public void viewthedata(DrzktjVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper  =getMapper();
        if (svo == null) {
            svo = new DrzktjVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjjh.dao.DrmxcxMapper.viewthedata", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }
}
