package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.QxgzVO;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 清洗匹配规则管理
 * user controller
 */
@Controller
public class QxgzController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @Inject
    Environment environment;

   //初始化清洗规则界面

    public void initgzgl(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"清洗规则管理",this.getUserPrincipal().getUserCode(),"sjcl/qxgz/initgzgl");
        }catch (Exception e){

        }
    }

    // 清洗规则列表分页查询

    public void list(QxgzVO svo, int limit, int offset, String sort, String order){
        log.debug("limit:"+limit);
        log.debug("offset:"+offset);
        if(svo == null){
            svo = new QxgzVO();
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        //List vo = delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.selectAll", param);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.sjcl.dao.QxgzMapper.selectAll", param,offset,limit);
        Map<String,Object> results=new HashMap<String,Object>();
        includeJson(vo);

    }

//    添加清洗规则

    public void  add(QxgzVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("curuser",this.getUserPrincipal().getUserCode());
        DelegateMapper delegateMapper = getMapper();
        if(svo.getGzid()==null||svo.getGzid().isEmpty()){
            delegateMapper.insert("com.xalt.sjcl.dao.QxgzMapper.insertdata",param);
        }else{
            delegateMapper.update("com.xalt.sjcl.dao.QxgzMapper.updatedata",param);
        }
        includeJson("执行成功!");
    }

//    删除清洗规则

    public void  deletes(QxgzVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.delete("com.xalt.sjcl.dao.QxgzMapper.deletes", param);
        includeJson("执行成功!");
    }

//    获取算法列表

    public void  sflist(QxgzVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        List sflist=delegateMapper.selectList("com.xalt.sjcl.dao.QxgzMapper.sflist",param);
        includeJson(sflist);
    }

}
