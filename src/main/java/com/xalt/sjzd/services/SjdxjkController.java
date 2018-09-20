package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjzd.model.SjdxjkVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.Map;

/**
 * User:CuiHeng
 * 数据对象监控
 */
@Controller
public class SjdxjkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjdxjk() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据对象监控",this.getUserPrincipal().getUserCode(),"sjzd/sjdxjk/initSjdxjk");
        }catch (Exception e){

        }
    }

    //默认信息查询

    public void selectlist(SjdxjkVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjdxjkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询前调用存储过程
        delegateMapper.selectList("com.xalt.sjzd.dao.SjdxjkMapper.callprocedure");
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjzd.dao.SjdxjkMapper.selectList", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //表信息查询

    public void selectBxx(SjdxjkVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjdxjkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjzd.dao.SjdxjkMapper.selectBxx", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //数据项信息查询

    public void selectSjx(SjdxjkVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjdxjkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjzd.dao.SjdxjkMapper.selectSjx", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        System.out.printf(" vo.getTotal() = "+ vo.getTotal());
        includeJson(vo);
    }
}
