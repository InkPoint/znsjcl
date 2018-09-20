package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjcl.model.ZdyclrwVo;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.TaskFactory;
import com.xalt.zzfwzx.model.ZdyrwclVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cuiheng on 2018/4/11.
 * 自定义处理任务
 */
@Controller
public class ZdyrwclController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @NoLoginValidate
    public void initZdyrwcl() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—自定义任务处理",this.getUserPrincipal().getUserCode(),"zzfwzx/zdyrwcl/initZdyrwcl");
        }catch (Exception e){

        }
    }

    // (自定义处理任务)表信息查询
    @NoLoginValidate
    public void selectAll(ZdyrwclVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.ZdyrwclMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);

    }

    //自定义处理任务(编辑)
    @NoLoginValidate
    public void modifydata(ZdyrwclVo svo) {
        if (svo == null) {
            svo = new ZdyrwclVo();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.zzfwzx.dao.ZdyrwclMapper.modifyData", param);
        includeJson("修改成功!");
    }

    //自定义处理任务(新增-清洗)
    @NoLoginValidate
    public void newaddition(String datalist, ZdyrwclVo svo) {
        List<ZdyclrwVo> list = JsonObjectToJava.getListByArray(ZdyclrwVo.class, datalist);
        DelegateMapper mapper = getMapper();
        svo.setZxr(this.getUserPrincipal().getUserCode());
        svo.setZxjgdm(this.getUserPrincipal().getOrgCode());
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.zzfwzx.dao.ZdyrwclMapper.newaddition", param);
        //查询任务ID
        List<ZdyrwclVo> rwidlist = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.viewRwid");
        //查询源表英文名
        List<ZdyrwclVo> yblist = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.viewYb", param);
        param.put("dxmcyw", ((ZdyrwclVo) yblist.get(0)).getDxmcyw());
        param.put("rwid", ((ZdyrwclVo) rwidlist.get(0)).getRwid());
        param.put("mxid", svo.getMxid());
        param.put("zbzdlist", list);
        //批量插入数据项、指标
        mapper.insert("com.xalt.zzfwzx.dao.ZdyrwclMapper.addTempdata", param);
        log.debug("批量插入匹配项中文、匹配项英文、数据项参数："+param);
        includeJson("新增成功!");
    }

    //(新增)批次
    @NoLoginValidate
    public void addbatch(ZdyrwclVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.zzfwzx.dao.ZdyrwclMapper.addbatch", param);
        includeJson("新增成功!");
    }

    //删除数据
    @NoLoginValidate
    public void deletedata(ZdyrwclVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.zzfwzx.dao.ZdyrwclMapper.deletesbyid", param);
        includeJson("删除成功!");
    }

    // 启动(任务)
    @NoLoginValidate
    public void bootup(ZdyrwclVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("sjx", svo.getSjx());
        mp.put("ytable", svo.getYtable());
        mp.put("mtable", svo.getMtable());
        mp.put("rwid", svo.getRwid());
        mp.put("nsrxx", "sjzl_dj_nsrxx");
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        log.debug("启动任务获取的参数："+param);
        TaskFactory mr = new TaskFactory();

        if (svo.getClmxdm().indexOf("0") != -1) {
            //执行时间
            delegateMapper.update("com.xalt.zzfwzx.dao.ZdyrwclMapper.performtime", param);
            //清洗模型
            mr.selectList(delegateMapper, "com.xalt.zzfwzx.dao.ZdyrwclMapper.cleaning", mp);
        } else {
            //执行时间
            delegateMapper.update("com.xalt.zzfwzx.dao.ZdyrwclMapper.performtime", param);
            //匹配模型
            mr.selectList(delegateMapper, "com.xalt.zzfwzx.dao.ZdyrwclMapper.matching", mp);
        }
        includeJson("启动成功！");
    }

    //源数据表、目标数据表(下拉菜单)
    @NoLoginValidate
    public void tablemenu() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.tablemenu");
        includeJson(vo);
    }

    //批次(下拉菜单)
    @NoLoginValidate
    public void batch() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.batch");
        includeJson(vo);
    }

    //处理模型(下拉菜单)
    @NoLoginValidate
    public void processingmodel() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.processingmodel");
        includeJson(vo);
    }

    //处理模型(下拉菜单)
    @NoLoginValidate
    public void sjxmenu(SjxVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.sjxmenu", param);
        includeJson(vo);
    }

    //指标(下拉菜单)
    @NoLoginValidate
    public void theindexmenu(ZdyrwclVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //获取模型ID
        List list = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.getzb", param);
        String[] strArray = null;
        String str = list.get(0).toString();
        strArray = str.substring(4, str.length() - 1).split(",");//拆分字符为",",然后将结果交给数组
        //去掉重复的指标id
        List<String> a = new ArrayList<String>();
        for (int i = 0; i < strArray.length; i++) {
            if (!a.contains(strArray[i])) {
                //如果不包含
                a.add(strArray[i]);
            }
        }
        List vo = new ArrayList();
        for (String obj : a) {
            svo.setZbid(obj);
            //获取(指标)
            Map<String, Object> rp = new HashMap<>();
            rp.put("svo", svo);
            List results = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.getqxzhzb", rp);
            vo.add(results.get(0));
        }
        includeJson(vo);
    }

    //获取模型匹配项
    @NoLoginValidate
    public void getamatch(ZdyrwclVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.getamatch", param);
        includeJson(vo);
    }

    //匹配模型（下拉菜单）
    @NoLoginValidate
    public void getmatch() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.matchmenu");
        includeJson(vo);
    }

    //获取源数据表数据项
    //处理模型(下拉菜单)
    @NoLoginValidate
    public void getdataitembyid(SjxVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.getdataitem", param);
        includeJson(vo);
    }

    //自定义处理任务(新增-匹配)
    @NoLoginValidate
    public void newamatchingdata(String datalist, ZdyrwclVo svo) {
        List<ZdyclrwVo> list = JsonObjectToJava.getListByArray(ZdyclrwVo.class, datalist);
        DelegateMapper mapper = getMapper();
        svo.setZxr(this.getUserPrincipal().getUserCode());
        svo.setZxjgdm(this.getUserPrincipal().getOrgCode());
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.zzfwzx.dao.ZdyrwclMapper.newaddition", param);
        //查询任务ID
        List<ZdyrwclVo> rwidlist = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.viewRwid");
        //查询源表英文名
        List<ZdyrwclVo> yblist = mapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.viewYb", param);
        param.put("dxmcyw", ((ZdyrwclVo) yblist.get(0)).getDxmcyw());
        param.put("rwid", ((ZdyrwclVo) rwidlist.get(0)).getRwid());
        param.put("mxid", svo.getMxid());
        param.put("zbzdlist", list);
        //批量插入匹配项中文、匹配项英文、数据项
        mapper.insert("com.xalt.zzfwzx.dao.ZdyrwclMapper.newamatching", param);
        log.debug("批量插入匹配项中文、匹配项英文、数据项参数："+param);
        includeJson("新增成功!");
    }

    //获取匹配说明（根据模型ID）
    @NoLoginValidate
    public void getmatchthat(ZdyrwclVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.zzfwzx.dao.ZdyrwclMapper.getmatchthat", param);
        includeJson(vo);
    }
}
