package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.FxrwdzVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/12/6.
 * 分析任务定制
 * User:CuiHeng
 * The modifier: PengWen Wang
 * Modify the time: 2018/5/11.
 */
@Controller
public class FxrwdzController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initFxrwdz() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"分析任务定制",this.getUserPrincipal().getUserCode(),"sjyj/fxrwdz/initFxrwdz");
        }catch (Exception e){

        }
    }

    //模型列表（下拉框）

    public void selectmxlb() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxrwdzMapper.selectmxlb");
        includeJson(vo);
    }

    //执行周期（下拉框）

    public void selectZxzq() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxrwdzMapper.selectZxzq");
        includeJson(vo);
    }

//    //分析任务监控默认显示
//    @NoLoginValidate
//    public void selectlist(FxrwdzVo svo) {
//        if (svo == null) {
//            svo = new FxrwdzVo();
//        }
//        DelegateMapper delegateMapper = getMapper();
//        Map<String, Object> param = Maps.newHashMap();
//        param.put("svo", svo);
//        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.FxrwdzMapper.selectlist", param);
//        includeJson(vo);
//
//    }

    //基本分页查询

    public void selectList(FxrwdzVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.FxrwdzMapper.selectlist", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //添加任务

    public void insertRw(FxrwdzVo svo) {
        if (svo == null) {
            svo = new FxrwdzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjyj.dao.FxrwdzMapper.insertFxrw", param);
        includeJson("添加成功");
    }


    //编辑任务

    public void updateRw(FxrwdzVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjyj.dao.FxrwdzMapper.updateDrrwdz", param);
        includeJson("修改成功!");
    }


    //删除任务

    public void deleteRw(FxrwdzVo svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.update("com.xalt.sjyj.dao.FxrwdzMapper.deleteDrrwdz", param);
        includeJson("删除成功!");
    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String tjrwmc) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        FxrwdzVo svo = new FxrwdzVo();
        svo.setRwmc(tjrwmc);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxrwdzMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }
}
