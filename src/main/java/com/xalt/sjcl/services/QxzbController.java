package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjcl.model.GlppgzglVO;
import com.xalt.sjcl.model.QxgzVO;
import com.xalt.sjcl.model.QxzbVO;
import com.xalt.sjcl.model.ZbgzVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.RandomUUID;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 清洗指标管理
 * user controller
 */
@Controller
public class QxzbController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;

    @Inject
    Environment environment;

   //初始化界面

    public void initzb(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"清洗指标管理",this.getUserPrincipal().getUserCode(),"sjcl/qxzb/initzb");
        }catch (Exception e){

        }
    }


    public void  addzb(){

    }

    // 基本分页查询

    public void list(QxzbVO svo, int limit, int offset, int pageNumber,String sort, String order){
        log.debug("limit:"+limit);
        log.debug("offset:"+offset);
        if(svo == null){
            svo = new QxzbVO();
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        //List vo = delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.selectAll", param);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.sjcl.dao.QxzbMapper.selectAll", param,offset,limit);
        log.debug("vo", vo);
        includeJson(vo);

    }


   //添加指标部分

    public void  add(QxzbVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("curuser",this.getUserPrincipal().getUserCode());
        DelegateMapper delegateMapper = getMapper();
        if(svo.getZbid()==null||svo.getZbid().isEmpty()){
            delegateMapper.insert("com.xalt.sjcl.dao.QxzbMapper.insertdata",param);
        }else{
            delegateMapper.update("com.xalt.sjcl.dao.QxzbMapper.updatedata", param);
        }
        includeJson("执行成功!");
    }


    public void  deletes(QxzbVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.delete("com.xalt.sjcl.dao.QxzbMapper.deletes",param);
        delegateMapper.delete("com.xalt.sjcl.dao.QxzbMapper.deleteschildren",param);
        includeJson("执行成功!");
    }

    //查询指标对应规则

    public void zbgzlist(QxzbVO svo, int limit, int offset){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.sjcl.dao.QxzbMapper.zbgzlist", param, offset, limit);
        includeJson(vo);
    }


    //添加和修改指标和规则关系列信息初始化

    public void initadd(QxzbVO svo){
        Map<String, Object> results = Maps.newHashMap();
        if(svo!=null){
            DelegateMapper delegateMapper = getMapper();
            Map<String, Object> param = Maps.newHashMap();
            param.put("svo", svo);
            param.put("curuser",this.getUserPrincipal().getUserCode());
            List basicinfo=delegateMapper.selectList("com.xalt.sjcl.dao.QxzbMapper.basicinfo",param);
            //规则列表
            List gzlist=delegateMapper.selectList("com.xalt.sjcl.dao.QxzbMapper.gzlist",param);
            results.put("gzlist",gzlist);
            results.put("basicinfo",basicinfo);
        }

        includeJson(results);
    }

    //添加模型和模型规则关联数据

    public void savedata(QxzbVO svo){
           DelegateMapper delegateMapper = getMapper();
           Map<String, Object> param = Maps.newHashMap();
           //获取模型id
           String zbid=svo.getZbid();
           String oprflag=svo.getOprflag();
           if(oprflag!=null&&"0".equals(oprflag)){
               zbid=RandomUUID.getUUIDRandoms();
           }

           if(svo!=null){
               svo.setZbid(zbid);
               //保存模型
               String datastr=svo.getDatastr();
               List  myulist= JsonObjectToJava.getListByArray(ZbgzVO.class, datastr);
               String gzstrs="";
               for(Object vo:myulist){
                   ZbgzVO kr=(ZbgzVO)vo;
//                   if("".equals(gzstrs)){
//                       gzstrs=kr.getGzid();
//                   }else{
//                       gzstrs=gzstrs+","+kr.getGzid();
//                   }
                   svo.setGz(kr.getGzid());
                   param.put("svo", svo);
                   param.put("curuser",this.getUserPrincipal().getUserCode());
                   //保存模型
                   if(oprflag!=null&&"0".equals(oprflag)){
                       //添加数据
                       delegateMapper.insert("com.xalt.sjcl.dao.QxzbMapper.insertdata",param);
                   }else{
                       //修改数据
                       delegateMapper.update("com.xalt.sjcl.dao.QxzbMapper.updatedata",param);

                   }
               }


               //保存模型关系信息
               for(Object vo:myulist){
                   ZbgzVO kr=(ZbgzVO)vo;
                   kr.setZbid(zbid);
                   Map<String, Object> param1 = Maps.newHashMap();
                   param1.put("svo",kr);
                   param1.put("curuser",this.getUserPrincipal().getUserCode());
                   if(kr.getZbgzid()==null||kr.getZbgzid().isEmpty()){
                       delegateMapper.insert("com.xalt.sjcl.dao.QxzbMapper.insertzbgz",param1);
                   }else{
                       delegateMapper.update("com.xalt.sjcl.dao.QxzbMapper.updatezbgz",param1);
                   }

               }
           }
           includeJson("执行成功!");
    }


    //循环查询匹配规则信息
    public List Hqppgzlist(List rs,DelegateMapper mapper){
           List  gzlist=new ArrayList();
           for(Object obj:rs){
               if(obj!=null){
                   QxzbVO vo=(QxzbVO)obj;
                   String ppgzs=vo.getGz();
                   String zwppgz="";
                   if(ppgzs!=null&&!ppgzs.isEmpty()){
                       String[] gzs=ppgzs.split(",");
                       for(int i=0;i<gzs.length;i++){
                           //循环查询规则表信息获取规则名称
                           List gzcl=mapper.selectList("com.xalt.sjcl.dao.QxgzMapper.selectAllbygzid",gzs[i]);
                           if(gzcl!=null&&gzcl.size()>0){
                               QxgzVO vos=(QxgzVO)gzcl.get(0);
                               zwppgz=zwppgz+ vos.getGzmc();
                           }
                       }
                   }
                   vo.setPpgzstr(zwppgz);
                   gzlist.add(vo);
               }
           }


           return gzlist;
    }



}
