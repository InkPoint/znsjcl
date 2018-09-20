package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.RwssfkVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by CuiHeng on 2018/1/26.
 * 任务实施反馈
 */

@Controller
public class RwssfkController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initRwssfk() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"任务实施反馈",this.getUserPrincipal().getUserCode(),"sjjh/rwssfk/initRwssfk");
        }catch (Exception e){

        }
    }

    //任务实施反馈基本分页查询

    public void list(RwssfkVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new RwssfkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjh.dao.RwssfkMapper.selectlist", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //任务实施细节（模态框）查询

    public void selectRwssxj_model(RwssfkVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new RwssfkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjh.dao.RwssfkMapper.selectRwssxj_model", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //完成进度修改事件//标签信息编辑

    public void updateLable(String rwid, String sliding) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("rwid", rwid);
        param.put("sliding", sliding);
        delegateMapper.update("com.xalt.sjjh.dao.RwssfkMapper.updateWcjd", param);
        includeJson("success!");
    }

    //添加任务实施细节

    public void insertSsxj(RwssfkVo svo) {
        if (svo == null) {
            svo = new RwssfkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjjh.dao.RwssfkMapper.insertSsxj", param);
        includeJson("添加成功");
    }

    //删除任务实施细节

    public void deleteRwssxj(RwssfkVo svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.update("com.xalt.sjjh.dao.RwssfkMapper.deleteRwssxj", param);
        includeJson("删除成功!");
    }

    //表名称(下拉框)

    public void selectBmc() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjh.dao.RwssfkMapper.selectBmc");
        includeJson(vo);
    }


    //任务实施细节校验

    public void nameValidation(String rwid, String bzwmc) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        RwssfkVo svo = new RwssfkVo();
        svo.setRwid(rwid);
        svo.setBzwm(bzwmc);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjjh.dao.RwssfkMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }

}
