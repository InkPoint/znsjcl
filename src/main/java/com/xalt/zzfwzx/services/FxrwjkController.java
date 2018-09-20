package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.zzfwzx.model.FxrwdzVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by win7 on 2015/5/9.
 * 分析任务监控
 * User:CuiHeng
 */
@Controller
public class FxrwjkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @NoLoginValidate
    public void initFxrwjk() {

        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—任务运行监控",this.getUserPrincipal().getUserCode(),"zzfwzx/fxrwjk/initFxrwjk");
        }catch (Exception e){

        }
    }

    /**
     * 分析任务监控(表)数据
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */
    @NoLoginValidate
    public void selectList(FxrwdzVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.FxrwjkMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }
}
