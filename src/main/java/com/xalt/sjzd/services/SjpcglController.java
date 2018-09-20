package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjzd.model.SjpcglVO;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/12/27.
 */
@Controller
public class SjpcglController extends WebServiceSupport {
    //日志
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    //初始化页面

    public void initSjpcgl() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据批次管理",this.getUserPrincipal().getUserCode(),"sjzd/sjpcgl/initSjpcgl");
        }catch (Exception e){

        }
    }

    //基本的分页查询

    public void list(SjpcglVO svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjpcglVO();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjzd.dao.SjpcglMapper.list", param, offset, limit);
        Map<String, Object> results = new HashMap<>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //插入数据的写法

    public void insertSjpc(SjpcglVO svo) {
        if (svo == null) {
            svo = new SjpcglVO();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjzd.dao.SjpcglMapper.insertSjpc", param);
        includeJson("数据插入成功");
    }

    //更新

    public void updateSjpc(SjpcglVO svo) {
        if (svo == null) {
            svo = new SjpcglVO();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjzd.dao.SjpcglMapper.updateSjpc", param);
        includeJson("修改成功");
    }

    //对批次代码唯一性的校验

    public void pcdmValidation(String validpcdm) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        SjpcglVO svo = new SjpcglVO();
        svo.setPcdm(validpcdm);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjpcglMapper.pcdmValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }

    //删除

    public void deleteSjpc(SjpcglVO svo) {
        if (svo == null) {
            svo = new SjpcglVO();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjzd.dao.SjpcglMapper.deleteSjpc", param);
        includeJson("删除成功");
    }
}
