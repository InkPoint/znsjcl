package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.DzxtdsclrwVo;
import com.xalt.sjcl.model.ZdyclrwVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/11/22.
 * User:WangPengWen
 * 定制系统定时处理任务
 */
@Controller
public class DzxtdsclrwController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    //定制系统定时处理任务

    public void initDzxtdsclrw() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "定制系统定时处理任务", this.getUserPrincipal().getUserCode(),"sjcl/dzxtdsclrw/initDzxtdsclrw");
        } catch (Exception e) {

        }
    }

    // (定制系统定时处理任务)表信息查询

    public void selectAll(DzxtdsclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.DzxtdsclrwMapper.selectAll", param);
        includeJson(vo);
    }

    //模型名称（下拉菜单）

    public void getMenu() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.DzxtdsclrwMapper.modelname");
        includeJson(vo);
    }

    //执行周期（下拉菜单）

    public void getcycle() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.DzxtdsclrwMapper.cycle");
        includeJson(vo);
    }

    //清洗模型（下拉菜单）

    public void getpurging() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.DzxtdsclrwMapper.purging");
        includeJson(vo);
    }

    //匹配模型（下拉菜单）

    public void getmatch() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.DzxtdsclrwMapper.matchmenu");
        includeJson(vo);
    }

    //定制系统定时处理任务(编辑)

    public void modifydata(DzxtdsclrwVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.modifyData", param);
        includeJson("修改成功!");
    }

    //定制系统定时处理任务(新增)

    public void newaddition(DzxtdsclrwVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.newaddition", param);
        //获取任务名称
        String nametak = svo.getRwmc();
        Map<String, Object> map = Maps.newHashMap();
        //根据任务名称查(任务ID)
        map.put("nametak", nametak);
        List rwid = mapper.selectList("com.xalt.sjcl.dao.DzxtdsclrwMapper.missionid", map);
        //得到任务id
        DzxtdsclrwVo dzxtdsclrwVo = (DzxtdsclrwVo) rwid.get(0);
        svo.setRwid(dzxtdsclrwVo.getRwid());
        //param.put("svo", svo);
        //获取周期
        String cucle = svo.getZqid();
        if (cucle.equals("20171122115802")) {
            //创建job(每天执行一次)
            mapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.everyday");
        } else if (cucle.equals("20171122115803")) {
            //创建job(每周一凌晨2点执行)
            mapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.perweek");
        } else if (cucle.equals("20171122115804")) {
            //创建job(每月一日凌晨1点执行)
            mapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.amonth");
        } else if (cucle.equals("20171122115801")) {
            //创建job(季度的第一天凌晨0点执行)
            mapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.everyquarter");
        }
        //获取job ID
        List job = null;
        try {
            job = mapper.selectList("com.xalt.sjcl.dao.DzxtdsclrwMapper.viewid", param);
            //添加jobid
            DzxtdsclrwVo zv1 = (DzxtdsclrwVo) job.get(0);
            svo.setJobid(zv1.getJob());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            param.put("svo", svo);
            //更新任务状态为（正在运行）
            mapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.starttask", param);
        }
        includeJson("新增成功!");
    }

    //删除数据

    public void deletedata(DzxtdsclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjcl.dao.DzxtdsclrwMapper.deletesbyid", param);
        //删除job
        delegateMapper.update("com.xalt.sjcl.dao.DzxtdsclrwMapper.deletejob", param);
        includeJson("删除成功!");
    }

    // 启动(任务)

    public void bootup(ZdyclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        String plandate = "2017-12-12";
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("plandate", plandate);
        //创建job
        delegateMapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.addjob", mp);
        //获取job ID
        List job = delegateMapper.selectList("com.xalt.sjcl.dao.ZdyclrwMapper.viewid");
        Map<String, Object> param = Maps.newHashMap();
        ZdyclrwVo zv1 = (ZdyclrwVo) job.get(0);
        svo.setJobid(zv1.getJob());
        param.put("svo", svo);
        //更新任务状态为（正在运行）
        delegateMapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.starttask", param);
        //任务开始
        delegateMapper.update("com.xalt.sjcl.dao.ZdyclrwMapper.taskstart", param);
    }

}
