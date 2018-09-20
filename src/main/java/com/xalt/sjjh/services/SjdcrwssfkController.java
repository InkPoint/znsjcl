package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.sjdcrwssfk;
import com.xalt.sjjh.model.Rwssxj;
import org.slf4j.Logger;

import java.util.List;
import java.util.Map;
import java.util.HashMap;
import com.google.common.collect.Maps;

import javax.inject.Inject;

/**
 * Created by win7 on 2017/10/27.
 */
@Controller
public class SjdcrwssfkController extends WebServiceSupport {
    @Inject
    private Logger log;


    @Inject
    Environment environment;


    public void sjdcrwssfk(){
    }


    // 获取基本信息

    public void getTableData(String sqbt,String sqsjbegin,String sqsjend){

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("sqbt", sqbt);
        param.put("sqsjbegin", sqsjbegin);
        param.put("sqsjend", sqsjend);
        List<sjdcrwssfk> dataList = delegateMapper.selectList("com.xalt.sjdc.dao.SjdcrwssfkMapper.search", param);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("childrens", dataList);
        includeJson(dataList);
    }


    //保存完成进度数据

    public void saveWcjdData(String editsqid,String editwcjd){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("sqid", editsqid);
        param.put("wcjd", editwcjd);
        delegateMapper.update("com.xalt.sjdc.dao.SjdcrwssfkMapper.saveWcjdData", param);
        getTableData("","","");

    }


    // 获取任务实施细节

    public void getRwssjx(String sqid){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("sqid", sqid);
        List<Rwssxj> dataList = delegateMapper.selectList("com.xalt.sjdc.dao.SjdcrwssfkMapper.getRwssjx", param);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("childrens", dataList);
        includeJson(dataList);

    }

    //删除任务实施细节

    public void delRwssjx(String sqid){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("sqid", sqid);
        delegateMapper.delete("com.xalt.sjdc.dao.SjdcrwssfkMapper.delRwssjx", param);
        getRwssjx(sqid);

    }


    //插入任务实施细节

    public void insertRwssjx(String sqid,String bz){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("sqid", sqid);
        param.put("bz", bz);
        delegateMapper.insert("com.xalt.sjdc.dao.SjdcrwssfkMapper.insertRwssjx", param);
        getRwssjx(sqid);
    }



}