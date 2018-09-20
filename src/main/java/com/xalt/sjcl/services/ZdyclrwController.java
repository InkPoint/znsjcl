package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
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
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: WangPengWen
 * Date: 2017-11-14
 * 自定义处理任务
 * user controller
 */
@Controller
public class ZdyclrwController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @Inject
    Environment environment;

    //自定义处理任务界面

    public void initZdyclrw() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自定义处理任务",this.getUserPrincipal().getUserCode(),"sjcl/zdyclrw/initZdyclrw");
        }catch (Exception e){

        }
    }

    // (自定义处理任务)表信息查询

    public void selectAll(ZdyclrwVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.ZdyclrwMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);

    }

    //自定义处理任务(编辑)

    public void modifydata(ZdyclrwVo svo) {
        if (svo == null) {
            svo = new ZdyclrwVo();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.modifyData", param);
        includeJson("修改成功!");
    }

    //自定义处理任务(新增-清洗)

    public void newaddition(String datalist, ZdyclrwVo svo) {
        List<ZdyclrwVo> list = JsonObjectToJava.getListByArray(ZdyclrwVo.class, datalist);
        DelegateMapper mapper = getMapper();
        svo.setZxr(this.getUserPrincipal().getUserCode());
        svo.setZxjgdm(this.getUserPrincipal().getOrgCode());
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.newaddition", param);
        //查询任务ID
        List<ZdyclrwVo> rwidlist = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.viewRwid");
        //查询源表英文名
        List<ZdyclrwVo> yblist = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.viewYb", param);
        param.put("dxmcyw", ((ZdyclrwVo) yblist.get(0)).getDxmcyw());
        param.put("rwid", ((ZdyclrwVo) rwidlist.get(0)).getRwid());
        param.put("mxid", svo.getMxid());
        param.put("zbzdlist", list);
        //批量插入数据项、指标
        mapper.insert("com.xalt.sjcl.dao.ZdyclrwMapper.addTempdata", param);
        includeJson("新增成功!");
    }

    //(新增)批次

    public void addbatch(ZdyclrwVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.addbatch", param);
        includeJson("新增成功!");
    }

    //删除数据

    public void deletedata(ZdyclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjcl.dao.ZdyclrwMapper.deletesbyid", param);
        includeJson("删除成功!");
    }

    // 启动(任务)

    public void bootup(ZdyclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("sjx", svo.getSjx());
        mp.put("ytable", svo.getYtable());
        mp.put("mtable", svo.getMtable());
        mp.put("rwid", svo.getRwid());
        mp.put("nsrxx", "sjzl_dj_nsrxx");
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        TaskFactory mr = new TaskFactory();

        if (svo.getClmxdm().indexOf("0") != -1) {
            //执行时间
            delegateMapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.performtime", param);
            //清洗模型
            mr.selectList(delegateMapper, "com.xalt.sjcl.dao.ZdyclrwMapper.cleaning", mp);
        } else {
            //执行时间
            delegateMapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.performtime", param);
            //匹配模型
            mr.selectList(delegateMapper, "com.xalt.sjcl.dao.ZdyclrwMapper.matching", mp);
        }
        includeJson("启动成功！");
    }

    //源数据表、目标数据表(下拉菜单)

    public void tablemenu() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.tablemenu");
        includeJson(vo);
    }

    //批次(下拉菜单)

    public void batch() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.batch");
        includeJson(vo);
    }

    //处理模型(下拉菜单)

    public void processingmodel() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.processingmodel");
        includeJson(vo);
    }

    //处理模型(下拉菜单)

    public void sjxmenu(SjxVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.sjxmenu", param);
        includeJson(vo);
    }

    //指标(下拉菜单)

    public void theindexmenu(ZdyclrwVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //获取模型ID
        List list = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.getzb", param);
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
            List results = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.getqxzhzb", rp);
            vo.add(results.get(0));
        }
        includeJson(vo);
    }

    //获取模型匹配项

    public void getamatch(ZdyclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.getamatch", param);
        includeJson(vo);
    }

    //匹配模型（下拉菜单）

    public void getmatch() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.matchmenu");
        includeJson(vo);
    }

    //获取源数据表数据项
    //处理模型(下拉菜单)

    public void getdataitembyid(SjxVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.getdataitem", param);
        includeJson(vo);
    }

    //自定义处理任务(新增-匹配)

    public void newamatchingdata(String datalist, ZdyclrwVo svo) {
        List<ZdyclrwVo> list = JsonObjectToJava.getListByArray(ZdyclrwVo.class, datalist);
        DelegateMapper mapper = getMapper();
        svo.setZxr(this.getUserPrincipal().getUserCode());
        svo.setZxjgdm(this.getUserPrincipal().getOrgCode());
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.newaddition", param);
        //查询任务ID
        List<ZdyclrwVo> rwidlist = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.viewRwid");
        //查询源表英文名
        List<ZdyclrwVo> yblist = mapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.viewYb", param);
        param.put("dxmcyw", ((ZdyclrwVo) yblist.get(0)).getDxmcyw());
        param.put("rwid", ((ZdyclrwVo) rwidlist.get(0)).getRwid());
        param.put("mxid", svo.getMxid());
        param.put("zbzdlist", list);
        //批量插入匹配项中文、匹配项英文、数据项
        mapper.insert("com.xalt.sjcl.dao.ZdyclrwMapper.newamatching", param);
        includeJson("新增成功!");
    }

    //获取匹配说明（根据模型ID）

    public void getmatchthat(ZdyclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.getmatchthat", param);
        includeJson(vo);
    }
}
