package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.alibaba.fastjson.JSONObject;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.GlppgzglVO;
import com.xalt.sjcl.model.GlppgzglVO;
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
 * 关联匹配规则管理
 * user controller
 */
@Controller
public class GlppgzglController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @Inject
    private CharCloudyUtil utils;

   //初始化匹配规则界面

    public void initgzgl(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"匹配规则管理",this.getUserPrincipal().getUserCode(),"sjcl/glppgzgl/initgzgl");
        }catch (Exception e){

        }
    }

    // 基本分页查询

    public void list(GlppgzglVO svo, int limit, int offset, String sort, String order){
        log.debug("limit:"+limit);
        log.debug("offset:"+offset);
        if(svo == null){
            svo = new GlppgzglVO();
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        //List vo = delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.selectAll", param);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.sjcl.dao.GlppgzglMapper.selectAll", param,offset,limit);
        Map<String,Object> results=new HashMap<String,Object>();
        results.put("total",vo.getPageCount());
        results.put("rows",vo.getRows());
        log.debug("vo", vo);
        includeJson(vo);

    }


    public void  savedata(String  nsrxxlist,String nsrmc){
        log.debug("nsrxxlist:"+nsrxxlist);
        log.debug("nsrmc:"+nsrmc);
//        List<NsrxxVO> list = JSONObject.parseObject(nsrxxlist,List.class);
        includeJson("执行成功!");
    }


    public void  add(GlppgzglVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("curuser",this.getUserPrincipal().getUserCode());
        DelegateMapper delegateMapper = getMapper();
        if(svo.getGzid()==null||svo.getGzid().isEmpty()){
            delegateMapper.insert("com.xalt.sjcl.dao.GlppgzglMapper.insertdata",param);
        }else{
            delegateMapper.update("com.xalt.sjcl.dao.GlppgzglMapper.updatedata",param);
        }
        includeJson("执行成功!");
    }


    public void  deletes(GlppgzglVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.insert("com.xalt.sjcl.dao.GlppgzglMapper.deletes",param);
        includeJson("执行成功!");
    }

}
