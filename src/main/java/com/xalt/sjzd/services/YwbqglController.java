package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjzd.model.YwbqglVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 业务标签管理
 * User:CuiHeng
 */

@Controller
public class YwbqglController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initYwbqgl() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"业务标签管理",this.getUserPrincipal().getUserCode(),"sjzd/ywbqgl/initYwbqgl");
        }catch (Exception e){

        }
    }

    //  zTree树初始化

    public void list() {
        DelegateMapper delegateMapper = getMapper();
        List<YwbqglVo> vo = delegateMapper.selectList("com.xalt.sjzd.dao.YwbqglMapper.selectZtree", "");
        Map<String,Object> rs=new HashMap<>();
        rs.put("rows",vo);
        YwbqglVo paramvo=new YwbqglVo();
        for(YwbqglVo obj:vo){
            if(obj.getPbqid()==null||"".equals(obj.getPbqid())){
                paramvo=obj;
            }
        }
        Map<String,Object> parm=new HashMap<>();
        parm.put("svo",paramvo);

        List<YwbqglVo> svo = delegateMapper.selectList("com.xalt.sjzd.dao.YwbqglMapper.gettargetinfo", parm);
        rs.put("svo",(YwbqglVo)svo.get(0));
        includeJson(rs);
    }

    // 查询所有根节点对应的子节点列表信息

    public void selectAll(YwbqglVo svo) {
        if (svo == null) {
            svo = new YwbqglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjzd.dao.YwbqglMapper.selectAll", param);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        log.debug("vo", vo);
        includeJson(vo.getRows());
    }

    //标签信息查询

    public void targetinfo(YwbqglVo svo) {
        if (svo == null) {
            svo = new YwbqglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询父节点信息
        List ls = delegateMapper.selectList("com.xalt.sjzd.dao.YwbqglMapper.gettargetinfo", param);
        Map<String, Object> results = new HashMap<String, Object>();
        if (ls != null && ls.size() > 0) {
            YwbqglVo pvo = (YwbqglVo) ls.get(0);
            results.put("pvo", pvo);
            //查询该子节点
            List<YwbqglVo> childrens = delegateMapper.selectList("com.xalt.sjzd.dao.YwbqglMapper.getchildrens", param);
            results.put("childrens", childrens);
        } else {
            return;
        }
        includeJson(results);
    }

    //标签信息添加

    public void insertlable(YwbqglVo svo) {
        if (svo == null) {
            svo = new YwbqglVo();
        }
//        svo.setCjr("崔衡");
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("cjr", this.getUserPrincipal().getUserCode());
        delegateMapper.insert("com.xalt.sjzd.dao.YwbqglMapper.insertlable", param);
        includeJson("添加成功！");
    }

    //标签信息编辑

    public void updateLable(YwbqglVo svo) {
        if (svo == null) {
            svo = new YwbqglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjzd.dao.YwbqglMapper.updateLable", param);
        includeJson("success!");
    }

    //标签信息删除

    public void deleteLable(YwbqglVo svo){
        if (svo == null){
            svo = new YwbqglVo();
        }
        Map<String,Object> rs=new HashMap<>();
        DelegateMapper delegateMapper= getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List isnulls=delegateMapper.selectList("com.xalt.sjzd.dao.YwbqglMapper.selectbq", param);
        if(isnulls==null||isnulls.isEmpty()){
            rs.put("flags","1");
            delegateMapper.update("com.xalt.sjzd.dao.YwbqglMapper.deleteLable", param);
        }else{
            rs.put("flags","0");
            rs.put("rss","不能删除含有子标签的标签，请先删除子标签！");
        }
        includeJson("mp",rs);
    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String yzbq) {
        boolean result=true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        YwbqglVo svo = new YwbqglVo();
        svo.setBqmc(yzbq);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjzd.dao.YwbqglMapper.nameValidation", param);
        if (vo != null&&vo.size()>0) {
            result=false;
        }
        Map<String,Boolean> map=new HashMap<>();
        map.put("valid",result);
        includeJson(map);
    }
}
