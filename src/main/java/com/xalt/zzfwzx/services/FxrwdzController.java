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
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2018/5/9.
 * 分析任务定制
 * User:CuiHeng
 */
@Controller
public class FxrwdzController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @NoLoginValidate
    public void initFxrwdz() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—定制分析任务",this.getUserPrincipal().getUserCode(),"zzfwzx/fxrwdz/initFxrwdz");
        }catch (Exception e){

        }
    }

    //模型列表（下拉框）
    @NoLoginValidate
    public void selectmxlb() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxrwdzMapper.selectmxlb");
        includeJson(vo);
    }

    //执行周期（下拉框）
    @NoLoginValidate
    public void selectZxzq() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxrwdzMapper.selectZxzq");
        includeJson(vo);
    }


    //基本分页查询
    @NoLoginValidate
    public void selectList(FxrwdzVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.FxrwdzMapper.selectlist", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //添加任务
    @NoLoginValidate
    public void insertRw(FxrwdzVo svo) {
        if (svo == null) {
            svo = new FxrwdzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.zzfwzx.dao.FxrwdzMapper.insertFxrw", param);
        includeJson("添加成功");
    }


    //编辑任务
    @NoLoginValidate
    public void updateRw(FxrwdzVo svo) {
        if (svo == null) {
            svo = new FxrwdzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.zzfwzx.dao.FxrwdzMapper.updateDrrwdz", param);
        includeJson("修改成功!");
    }


    //删除任务
    @NoLoginValidate
    public void deleteRw(FxrwdzVo svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.update("com.xalt.zzfwzx.dao.FxrwdzMapper.deleteDrrwdz", param);
        includeJson("删除成功!");
    }

    // 校验当前级别名称的唯一性
    @NoLoginValidate
    public void nameValidation(String tjrwmc) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        FxrwdzVo svo = new FxrwdzVo();
        svo.setRwmc(tjrwmc);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxrwdzMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }
}
