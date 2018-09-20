package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.JgmxglVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2018/1/9.
 * User:CuiHeng
 */
@Controller
public class JgmxglController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initJgmxgl() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"加工模型管理",this.getUserPrincipal().getUserCode(),"sjjg/jgmxgl/initJgmxgl");
        }catch (Exception e){

        }
    }


    //基本分页查询

    public void selectList(JgmxglVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new JgmxglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JgmxglMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //数据元件（下拉框）

    public void selectSjyj() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjg.dao.JgmxglMapper.selectSjyj");
        includeJson(vo);
    }

    //添加任务

    public void insertRw(JgmxglVo svo) {
        if (svo == null) {
            svo = new JgmxglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjjg.dao.JgmxglMapper.insertJgmx", param);
        includeJson("添加成功");
    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String tjrwmc) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        JgmxglVo svo = new JgmxglVo();
        svo.setMxmc(tjrwmc);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjjg.dao.JgmxglMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }

    //编辑加工模型

    public void updateJgmx(JgmxglVo svo) {
        if (svo == null) {
            svo = new JgmxglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjjg.dao.JgmxglMapper.updateJgmx", param);
        includeJson("修改成功!");
    }

    //删除加工模型

    public void deleteJgmx(JgmxglVo svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.update("com.xalt.sjjg.dao.JgmxglMapper.deleteJgmx", param);
        includeJson("删除成功!");
    }

}
