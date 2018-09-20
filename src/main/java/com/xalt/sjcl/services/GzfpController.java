package com.xalt.sjcl.services;

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
public class GzfpController extends WebServiceSupport{
    @Inject
    private Logger logger;
    @Inject
    Environment environment;

    public void initgzfp(){}
    //查看未匹配数据总量

    public void wppzl(){
        DelegateMapper delegateMapper = getMapper();
        Object wppzl = delegateMapper.selectOne("com.xalt.sjcl.dao.GzfpMapper.wppzl");
        Map<String,Object> vo = Maps.newHashMap();
        vo.put("wppzl",wppzl);
        includeJson(vo);
    }
    //查看未分配数据总量

    public void wfpsj(){
        DelegateMapper delegateMapper = getMapper();
        Object wfpsj = delegateMapper.selectOne("com.xalt.sjcl.dao.GzfpMapper.wfpsj");
        Map<String,Object> vo = Maps.newHashMap();
        vo.put("wfpzl",wfpsj);
        includeJson(vo);
    }
    //查看已分配数据总量
    @NoLoginValidate
    public void yfpsj(){
        DelegateMapper delegateMapper = getMapper();
        Object yfpsj = delegateMapper.selectOne("com.xalt.sjcl.dao.GzfpMapper.yfpsj");
        Map<String,Object> vo = Maps.newHashMap();
        vo.put("yfpzl",yfpsj);
        includeJson(vo);
    }
    //分配起始

    public void fpbegin(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.GzfpMapper.fpbegin");
        includeJson(vo);
    }
    //页面的基本查询

    public void selectAll(int limit, int offset, String sort, String order){
        logger.debug("limit:"+limit);
        logger.debug("offset:"+offset);
        DelegateMapper delegateMapper = getMapper();
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.GzfpMapper.list", "", offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }
    //查看匹配人

    public void ckppr(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.GzfpMapper.ckppr");
        includeJson(vo);
    }
    //查看表名称

    public void selectyb(){
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.GzfpMapper.selectyb");
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

    public void updatappr(String fpend,String ppr,String sjbywm){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("fpend",fpend);
        param.put("sjbywm",sjbywm);
        param.put("ppr",ppr);
        int bz = delegateMapper.update("com.xalt.sjcl.dao.GzfpMapper.updatappr",param);
        if(bz != 0){
            includeJson("分配成功");
        }else{
            includeJson("分配失败");
        }
    }
    //给定条数的wid

    public void sjlwid(String fpend,String fpbegin){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("fpbegin",fpbegin);
        param.put("fpend",fpend);
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.GzfpMapper.sjlwid", param);
        includeJson(vo);
    }
    //查看原表未分配数据量

    public void ybwfpsjl(String sjbmcyw){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = new HashMap<>();
        param.put("ybywm",sjbmcyw);
        int count = (Integer)delegateMapper.selectOne("com.xalt.sjcl.dao.GzfpMapper.ybwfpsjl",param);
        includeJson(count);
    }
}
