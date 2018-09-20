package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.DzxtdsclrwVo;
import com.xalt.sjjh.model.DrrwdzVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/11/15.
 * 导入任务定制
 * User:CuiHeng
 */
@Controller
public class DrrwdzController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initDrrwdz() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"导入任务定制",this.getUserPrincipal().getUserCode(),"sjjh/drrwdz/initDrrwdz");
        }catch (Exception e){

        }
    }

    //下拉框查询（数据源表）

    public void selectYb() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.DrrwdzMapper.selectYb");
        includeJson(vo);
    }

    //下拉框（执行周期）

    public void selectZxzq() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.DrrwdzMapper.selectZxzq");
        includeJson(vo);
    }

    //默认信息查询

    public void list(DrrwdzVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new DrrwdzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("zxr", this.getUserPrincipal().getUserCode());
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.DrrwdzMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //定制任务编辑

    public void updateDrrw(DrrwdzVo svo) {
        if (svo == null) {
            svo = new DrrwdzVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjcl.dao.DrrwdzMapper.updateDrrwdz", param);
        includeJson("修改成功!");
    }

    //删除任务

    public void deleteDrrw(DrrwdzVo svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.update("com.xalt.sjcl.dao.DrrwdzMapper.deleteDrrwdz", param);
        delegateMapper.update("com.xalt.sjcl.dao.DrrwdzMapper.deletejob", param);
        includeJson("删除成功!");
    }

    //添加定制任务及job

    public void newaddition(DzxtdsclrwVo svo) {
        //当前用户执行人
        svo.setZxr(this.getUserPrincipal().getUserCode());
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.insert("com.xalt.sjcl.dao.DrrwdzMapper.insertDrrwdz", param);
        //获取任务名称
        String nametak = svo.getRwmc();
        Map<String, Object> map = Maps.newHashMap();
        //根据任务名称查(任务ID)
        map.put("nametak", nametak);
        List list = mapper.selectList("com.xalt.sjcl.dao.DzxtdsclrwMapper.missionid", map);
        //得到任务id
        DzxtdsclrwVo dzxtdsclrwVo = (DzxtdsclrwVo) list.get(0);
        map.put("myrwid", ((DzxtdsclrwVo) list.get(0)).getRwid());
        svo.setRwid(dzxtdsclrwVo.getRwid());
        //获取周期
        String cucle = svo.getZqid();
        if (cucle.equals("20171122115802")) {
            //创建job(每天执行一次)
            mapper.update("com.xalt.sjcl.dao.DrrwdzMapper.everyday", map);
        } else if (cucle.equals("20171122115803")) {
            //创建job(每周一凌晨2点执行)
            mapper.update("com.xalt.sjcl.dao.DrrwdzMapper.perweek", map);
        } else if (cucle.equals("20171122115804")) {
            //创建job(每月一日凌晨1点执行)
            mapper.update("com.xalt.sjcl.dao.DrrwdzMapper.amonth", map);
        } else if (cucle.equals("20171122115801")) {
            //创建job(季度的第一天凌晨0点执行)
            mapper.update("com.xalt.sjcl.dao.DrrwdzMapper.everyquarter", map);
        }
        //获取job ID
        List job = mapper.selectList("com.xalt.sjcl.dao.DrrwdzMapper.viewid",param);
        //添加jobid
        DzxtdsclrwVo zv1 = (DzxtdsclrwVo) job.get(0);
        svo.setJobid(zv1.getJob());
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.DrrwdzMapper.updateJobid", param);
        includeJson("新增成功!");
    }


    //删除数据

    public void deletedata(DzxtdsclrwVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjcl.dao.DrrwdzMapper.deleteDrrwdz", param);
        //删除job
        delegateMapper.update("com.xalt.sjcl.dao.DrrwdzMapper.deletejob", param);
        includeJson("删除成功!");
    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String yzmc) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        DrrwdzVo svo = new DrrwdzVo();
        svo.setRwmc(yzmc);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjcl.dao.DrrwdzMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }


    //根据数据源表显示数据项
    public void selectSjx(DrrwdzVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List<DrrwdzVo> list1 = delegateMapper.selectList("com.xalt.sjcl.dao.DrrwdzMapper.selectSjx", param);
        svo.setDxmcyw(list1.get(0).getDxmcyw());
        List list = delegateMapper.selectList("com.xalt.sjcl.dao.DrrwdzMapper.selectColumns", param);
        includeJson(list);
    }
}
