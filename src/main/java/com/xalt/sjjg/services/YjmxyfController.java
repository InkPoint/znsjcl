package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.RwyxfkVo;
import com.xalt.sjjg.model.YjmxyfVO;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2018/1/9.
 * User:WangPengWen
 * 元件模型研发
 */
@Controller
public class YjmxyfController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initYjmxyf() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"元件模型研发",this.getUserPrincipal().getUserCode(),"sjjg/yjmxyf/initYjmxyf");
        }catch (Exception e){

        }
    }

    //默认基本分页信息查询

    public void list(RwyxfkVo svo, int limit, int offset, String sort, String order){
        if (svo == null) {
            svo = new RwyxfkVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.YjmxyfMapper.selectlist",param, offset, limit);
        includeJson(vo);
    }


    //数据元件下拉列表
    public void yjlistdata(){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        List vo = delegateMapper.selectList("com.xalt.sjjg.dao.YjmxyfMapper.yjlistdata");
        includeJson(vo);
    }

    //保存元件模型对应的元件信息
    public void saveYjdata(String yjid,String sqid){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("yjid",yjid);
        param.put("sqid",sqid);
        delegateMapper.delete("com.xalt.sjjg.dao.YjmxyfMapper.delylinfo",param);
        int vo = delegateMapper.insert("com.xalt.sjjg.dao.YjmxyfMapper.updateylinfo",param);
        delegateMapper.update("com.xalt.sjjg.dao.YjmxyfMapper.updatejgb",param);
        includeJson(vo);
    }


}
