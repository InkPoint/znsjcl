package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjzd.model.YjglVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/12/7.
 * User:WangPengWen
 * 元件管理
 */
@Controller
public class YjglController extends WebServiceSupport {
    @Inject
    private Logger log;

    @NoLoginValidate
    public void initYjgl() {
    }

    //  zTree树初始化

    public void list() {
        DelegateMapper delegateMapper = getMapper();
        List<YjglVo> vo = delegateMapper.selectList("com.xalt.sjzd.dao.YjglMapper.getZtree", "");
        Map<String, Object> rs = new HashMap<>();
        rs.put("rows", vo);
        YjglVo paramvo = new YjglVo();
        for (YjglVo obj : vo) {
            if (obj.getPyjdm() == null || "".equals(obj.getPyjdm())) {
                paramvo = obj;
            }
        }
        Map<String, Object> parm = new HashMap<>();
        parm.put("svo", paramvo);
        List<YjglVo> svo = delegateMapper.selectList("com.xalt.sjzd.dao.YjglMapper.gettargetinfo", parm);
        rs.put("svo", (YjglVo) svo.get(0));
        includeJson(rs);
    }

    // 查询所有根节点对应的子节点列表信息

    public void selectAll(YjglVo svo) {
        if (svo == null) {
            svo = new YjglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.sjzd.dao.YjglMapper.selectAll", param);
        includeJson(vo);
    }

    //标签信息查询

    public void targetinfo(YjglVo svo) {
        if (svo == null) {
            svo = new YjglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询该子节点信息
        List vo = delegateMapper.selectList("com.xalt.sjzd.dao.YjglMapper.getchildrens", param);
        includeJson(vo);
    }

    //新增

    public void insertlable(YjglVo svo) {
        if (svo == null) {
            svo = new YjglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjzd.dao.YjglMapper.insertlable", param);
    }

    //删除

    public void deleteList(YjglVo svo) {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjzd.dao.YjglMapper.deleteByid", param);
        includeJson("删除成功!");
    }
    //编辑

    public void modifydata(YjglVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjzd.dao.YjglMapper.modifydata", param);
        includeJson("修改成功!");
    }
    //查看_描述

    public void viewDescribe(YjglVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.sjzd.dao.YjglMapper.viewDescribe", param);
        includeJson(vo);
    }
    //业务标签树形菜单

    public void getYwbqTree() {
        //数据载入数据加载
        DelegateMapper mapper  =getMapper();
        List vo = mapper.selectList("com.xalt.sjzd.dao.YjglMapper.ywbqztree");
        includeJson(vo);
    }
}
