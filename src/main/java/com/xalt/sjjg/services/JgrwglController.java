package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.JgmxglVo;
import com.xalt.sjjg.model.JgrwglVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by win7 on 2018/1/9.
 * User:CuiHeng
 * 加工任务管理
 */

@Controller
public class JgrwglController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initJgrwgl(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"加工任务管理",this.getUserPrincipal().getUserCode(),"sjjg/jgrwgl/initJgrwgl");
        }catch (Exception e){

        }

    }

    //基本分页查询

    public void selectList(JgrwglVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new JgrwglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JgrwglMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //执行周期（下拉框）

    public void selectZxzq() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjg.dao.JgrwglMapper.selectZxzq");
        includeJson(vo);
    }

    //模型列表（下拉框）

    public void selectMx(){
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjg.dao.JgrwglMapper.selectjgmx");
        includeJson(vo);
    }

//    //添加任务
//    @NoLoginValidate
//    public void insertJgrw(JgrwglVo svo) {
//        if (svo == null) {
//            svo = new JgrwglVo();
//        }
//        DelegateMapper delegateMapper = getMapper();
//        Map<String, Object> param = Maps.newHashMap();
//        param.put("svo", svo);
//        delegateMapper.insert("com.xalt.sjjg.dao.JgrwglMapper.insertJgrw", param);
//        includeJson("添加成功");
//    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String tjrwmc) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        JgrwglVo svo = new JgrwglVo();
        svo.setRwmc(tjrwmc);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjjg.dao.JgrwglMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }

//    //编辑加工任务
//    @NoLoginValidate
//    public void updateJgmx(JgrwglVo svo) {
//        if (svo == null) {
//            svo = new JgrwglVo();
//        }
//        DelegateMapper delegateMapper = getMapper();
//        Map<String, Object> param = Maps.newHashMap();
//        param.put("svo", svo);
//        delegateMapper.update("com.xalt.sjjg.dao.JgrwglMapper.updateJgmx", param);
//        includeJson("修改成功!");
//    }



//    //启动任务
//    @NoLoginValidate
//    public void starttask(JgrwglVo svo) {
//        Map<String, Object> param = Maps.newHashMap();
//        param.put("svo", svo);
//        DelegateMapper delegateMapper = getMapper();
//        //修改运行状态
//        delegateMapper.update("com.xalt.sjjg.dao.JgrwglMapper.starttask", param);
//        //调用存储过程
//        delegateMapper.update("com.xalt.sjjg.dao.JgrwglMapper.calltask", param);
//        includeJson("启动成功!");
//    }

    //添加任务及创建job

    public void insertRw(JgrwglVo svo){
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("rwid",UUID.randomUUID().toString().replaceAll("-",""));
        mapper.insert("com.xalt.sjjg.dao.JgrwglMapper.insertJgrw", param);
        //获取周期
        String cucle = svo.getZqid();
        if (cucle.equals("20171122115802")) {
            //创建job(每天执行一次)
            mapper.update("com.xalt.sjjg.dao.JgrwglMapper.everyday",param);
        } else if (cucle.equals("20171122115803")) {
            //创建job(每周一凌晨2点执行)
            mapper.update("com.xalt.sjjg.dao.JgrwglMapper.perweek",param);
        } else if (cucle.equals("20171122115804")) {
            //创建job(每月一日凌晨1点执行)
            mapper.update("com.xalt.sjjg.dao.JgrwglMapper.amonth",param);
        } else if (cucle.equals("20171122115801")) {
            //创建job(季度的第一天凌晨0点执行)
            mapper.update("com.xalt.sjjg.dao.JgrwglMapper.everyquarter",param);
        }
        //获取job ID
        List job = mapper.selectList("com.xalt.sjjg.dao.JgrwglMapper.viewid",param);
        //添加jobid
        JgrwglVo zv1 = (JgrwglVo) job.get(0);
        String jobid= zv1.getJob();
        param.put("jobid", jobid);
        mapper.update("com.xalt.sjjg.dao.JgrwglMapper.updateJobid", param);
        includeJson("新增成功!");
    }


    //删除加工模型及job

    public void deleteJgmx(JgrwglVo svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.update("com.xalt.sjjg.dao.JgrwglMapper.deleteJgrw", param);
        //删除job
        delegateMapper.update("com.xalt.sjjg.dao.JgrwglMapper.deletejob", param);
        includeJson("删除成功!");
    }


}
