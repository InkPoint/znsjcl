package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.RgppVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/11/26.
 * 抽样核查
 */
@Controller
public class CyhcController extends WebServiceSupport {
    @Inject
    private Logger log;


    public void initCyhc() {
    }

    //税务机关查询

    public void selectSwjg() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.CyhcMapper.selectZddw");
        includeJson(vo);
    }

    //默认分页查询

    public void list(RgppVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.CyhcMapper.selectall", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);

    }
    //得到匹配信息里面的纳税人名称

    public void getnsrmc(String djxh){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("djxh",djxh);
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.CyhcMapper.getnsrmc", param);
        includeJson(vo);
    }
    /*//模态框原始信息查询
    @NoLoginValidate
    public void selectYsxx(RgppVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjcl.dao.CyhcMapper.selectYsb", param);
        includeJson(vo);
    }*/

    //提交事件(是否匹配成功)

    public void updatefkyj(RgppVo svo){
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjcl.dao.CyhcMapper.updateFkyj", param);
        includeJson("核查成功");
    }

}
