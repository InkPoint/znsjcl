package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjzd.model.SjlyglVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/12/12.
 * 数据来源管理
 * User:CuiHeng
 */

@Controller
public class SjlyglController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjlygl() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据来源管理",this.getUserPrincipal().getUserCode(),"sjzd/sjlygl/initSjlygl");
        }catch (Exception e){

        }
    }

    //  zTree树初始化

    public void list() {
        DelegateMapper delegateMapper = getMapper();
        List<SjlyglVo> vo = delegateMapper.selectList("com.xalt.sjzd.dao.SjlyglMapper.selectZtree");
        Map<String, Object> rs = new HashMap<>();
        rs.put("rows", vo);
        SjlyglVo paramvo = new SjlyglVo();
        for (SjlyglVo obj : vo) {
            if (obj.getPlyid() == null || "".equals(obj.getPlyid())) {
                paramvo = obj;
            }
        }
        Map<String, Object> parm = new HashMap<>();
        parm.put("svo", paramvo);
        List<SjlyglVo> svo = delegateMapper.selectList("com.xalt.sjzd.dao.SjlyglMapper.gettargetinfo", parm);
        rs.put("svo", (SjlyglVo) svo.get(0));
        includeJson(rs);
    }

    // 查询所有根节点对应的子节点列表信息

    public void selectAll(SjlyglVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjlyglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjzd.dao.SjlyglMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo.getRows());
    }

    //标签信息查询

    public void targetinfo(SjlyglVo svo) {
        if (svo == null) {
            svo = new SjlyglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询父节点信息
        List ls = delegateMapper.selectList("com.xalt.sjzd.dao.SjlyglMapper.gettargetinfo", param);
        Map<String, Object> results = new HashMap<String, Object>();
        if (ls != null && ls.size() > 0) {
            SjlyglVo pvo = (SjlyglVo) ls.get(0);
            results.put("pvo", pvo);
            //查询该子节点
            List<SjlyglVo> childrens = delegateMapper.selectList("com.xalt.sjzd.dao.SjlyglMapper.getchildrens", param);
            results.put("childrens", childrens);
        } else {
            return;
        }
        includeJson(results);
    }

    //标签信息添加

    public void insertlable(SjlyglVo svo) {
        if (svo == null) {
            svo = new SjlyglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("cjr", this.getUserPrincipal().getUserCode());
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjzd.dao.SjlyglMapper.insertlable", param);
        includeJson("添加成功！");
    }

    //标签信息编辑

    public void updateLable(SjlyglVo svo) {
        if (svo == null) {
            svo = new SjlyglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjzd.dao.SjlyglMapper.updateLable", param);
        includeJson("success!");
    }

    //标签信息删除

    public void deleteLable(SjlyglVo svo) {
        if (svo == null) {
            svo = new SjlyglVo();
        }
        Map<String, Object> rs = new HashMap<>();
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List isnulls = delegateMapper.selectList("com.xalt.sjzd.dao.SjlyglMapper.selectbq", param);
        if (isnulls == null || isnulls.isEmpty()) {
            rs.put("flags", "1");
            delegateMapper.update("com.xalt.sjzd.dao.SjlyglMapper.deleteLable", param);
        } else {
            rs.put("flags", "0");
            rs.put("rss", "不能删除含有子标签的标签，请先删除子标签！");
        }
        includeJson("mp", rs);
    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String yzlymc) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        SjlyglVo svo = new SjlyglVo();
        svo.setLymc(yzlymc);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjlyglMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }

}
