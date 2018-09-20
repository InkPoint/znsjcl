package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.DrzktjVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * author:WangPengWen
 * Created by win7 on 2017/11/14.
 * 导入状况统计
 */
@Controller
public class DrzktjController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initDrzktj() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"导入状况统计",this.getUserPrincipal().getUserCode(),"sjjh/drzktj/initDrzktj");
        }catch (Exception e){

        }
    }


    // 导入状况统计分页查询

    public void drzktjAll(DrzktjVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper  =getMapper();
        if (svo == null) {
            svo = new DrzktjVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("cjr", this.getUserPrincipal().getUserCode());
        mapper.selectList("com.xalt.sjjh.dao.DrzktjMapper.callprocedure");
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjjh.dao.DrzktjMapper.drzktjAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);

    }
    /**
     * 导入类型 (下拉菜单)
     */

    public void getDrlxTree() {
        DelegateMapper mapper  =getMapper();
        //数据载入数据加载
        List vo = mapper.selectList("com.xalt.sjjh.dao.DrzktjMapper.drlxlist");
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

        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjjh.dao.DrzktjMapper.viewthedata", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }
}
