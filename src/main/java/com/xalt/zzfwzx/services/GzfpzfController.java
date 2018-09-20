package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by ld on 2018/2/2.
 */
@Controller
public class GzfpzfController extends WebServiceSupport{
    @Inject
    private Logger logger;
    @Inject
    Environment environment;
    @NoLoginValidate
    public void initRgppclgzfp(){}
    //查看未匹配数据总量
    @NoLoginValidate
    public void wppzl(){
        DelegateMapper delegateMapper = getMapper();
        Object wppzl = delegateMapper.selectOne("com.xalt.zzfwzx.dao.GzfpzfMapper.wppzl");
        Map<String,Object> vo = Maps.newHashMap();
        vo.put("wppzl",wppzl);
        includeJson(vo);
    }
    //查看未分配数据总量
    @NoLoginValidate
    public void wfpsj(){
        DelegateMapper delegateMapper = getMapper();
        Object wfpsj = delegateMapper.selectOne("com.xalt.zzfwzx.dao.GzfpzfMapper.wfpsj");
        Map<String,Object> vo = Maps.newHashMap();
        vo.put("wfpzl",wfpsj);
        includeJson(vo);
    }
    //查看已分配数据总量
    @NoLoginValidate
    public void yfpsj(){
        DelegateMapper delegateMapper = getMapper();
        Object yfpsj = delegateMapper.selectOne("com.xalt.zzfwzx.dao.GzfpzfMapper.yfpsj");
        Map<String,Object> vo = Maps.newHashMap();
        vo.put("yfpzl",yfpsj);
        includeJson(vo);
    }
    //分配起始
    @NoLoginValidate
    public void fpbegin(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.zzfwzx.dao.GzfpzfMapper.fpbegin");
        includeJson(vo);
    }
    //页面的基本查询
    @NoLoginValidate
    public void selectAll(int limit, int offset, String sort, String order){
        logger.debug("limit:"+limit);
        logger.debug("offset:"+offset);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.GzfpzfMapper.list", "", offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }
    //查看匹配人
    @NoLoginValidate
    public void ckppr(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.zzfwzx.dao.GzfpzfMapper.ckppr");
        includeJson(vo);
    }
    /*//分配结束
    @NoLoginValidate
    public void fpend(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.GzfpMapper.fpend");
        includeJson(vo);
    }*/
    //更新未匹配信息表里面的匹配人
    @NoLoginValidate
    public void updatappr(String fpbegin,String fpend,String ppr){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("fpbegin",fpbegin);
        param.put("fpend",fpend);
        param.put("ppr",ppr);
        int bz = delegateMapper.update("com.xalt.zzfwzx.dao.GzfpzfMapper.updatappr",param);
        if(bz != 0){
            includeJson("分配成功");
        }else{
            includeJson("分配失败");
        }
    }
    //给定条数的wid
    @NoLoginValidate
    public void sjlwid(String fpend,String fpbegin){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("fpbegin",fpbegin);
        param.put("fpend",fpend);
        List vo = delegateMapper.selectList("com.xalt.zzfwzx.dao.GzfpzfMapper.sjlwid", param);
        includeJson(vo);
    }
}
