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
import com.xalt.sjcl.model.QxmxVO;
import com.xalt.sjcl.model.MxzbVO;
import com.xalt.sjcl.model.QxzbVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.DateUtils;
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
 * 清洗模型管理
 * user controller
 */
@Controller
public class QxmxController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;

    @Inject
    Environment environment;

   //初始化清洗模型界面

    public void initmx(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"清洗模型管理",this.getUserPrincipal().getUserCode(),"sjcl/qxmx/initmx");
        }catch (Exception e){

        }
    }


    public void  addmx(){

    }

    // 初始化模型查询

    public void list(QxmxVO svo, int limit, int offset, int pageNumber,String sort, String order){
        log.debug("limit:"+limit);
        log.debug("offset:"+offset);
        if(svo == null){
            svo = new QxmxVO();
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        //List vo = delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.selectAll", param);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.sjcl.dao.QxmxMapper.selectAll", param,offset,limit);
        List strr=Hqppgzlist(vo.getRows(),delegateMapper);
        log.debug("vo", vo);
        includeJson(vo);

    }


   //添加指标部分

    public void  add(QxmxVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("curuser",this.getUserPrincipal().getUserCode());
        DelegateMapper delegateMapper = getMapper();
        if(svo.getMxid()==null||svo.getMxid().isEmpty()){
            delegateMapper.insert("com.xalt.sjcl.dao.QxmxMapper.insertdata",param);
        }else{
            delegateMapper.update("com.xalt.sjcl.dao.QxmxMapper.updatedata", param);
        }
        includeJson("执行成功!");
    }


    public void  deletes(QxmxVO svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.delete("com.xalt.sjcl.dao.QxmxMapper.deletes",param);
        delegateMapper.delete("com.xalt.sjcl.dao.QxmxMapper.deleteschildren",param);
        includeJson("执行成功!");
    }

    //查询模型对应规则

    public void mxzblist(QxmxVO svo, int limit, int offset){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.sjcl.dao.QxmxMapper.zbgzlist", param, offset, limit);
        includeJson(vo);
    }


    //添加和修改指标和规则关系列信息初始化

    public void initadd(QxmxVO svo){
        Map<String, Object> results = Maps.newHashMap();
        if(svo!=null){
            DelegateMapper delegateMapper = getMapper();
            Map<String, Object> param = Maps.newHashMap();
            param.put("svo", svo);
            param.put("curuser",this.getUserPrincipal().getUserCode());
            List basicinfo=delegateMapper.selectList("com.xalt.sjcl.dao.QxmxMapper.basicinfo",param);
            //规则列表
            List zblist=delegateMapper.selectList("com.xalt.sjcl.dao.QxmxMapper.zblist",param);
            results.put("zblist",zblist);
            results.put("basicinfo",basicinfo);
        }

        includeJson(results);
    }

    //添加模型和模型规则关联数据

    public void savedata(QxmxVO svo){
           DelegateMapper delegateMapper = getMapper();
           Map<String, Object> param = Maps.newHashMap();
           //获取模型id
           String mxid=svo.getMxid();
           String oprflag=svo.getOprflag();
           if(oprflag!=null&&"0".equals(oprflag)){
               mxid=RandomUUID.getUUIDRandoms();
           }

           if(svo!=null){
               svo.setMxid(mxid);
               //保存模型
               String datastr=svo.getDatastr();
               List  myulist= JsonObjectToJava.getListByArray(MxzbVO.class, datastr);
               String zbstrs="";
               for(Object vo:myulist){
                   MxzbVO kr=(MxzbVO)vo;
                   if("".equals(zbstrs)){
                       zbstrs=kr.getZbid();
                   }else{
                       zbstrs=zbstrs+","+kr.getZbid();
                   }
               }
               svo.setZb(zbstrs);
               param.put("svo", svo);
               param.put("curuser",this.getUserPrincipal().getUserCode());
               //保存模型
               if(oprflag!=null&&"0".equals(oprflag)){
                   //添加数据
                   delegateMapper.insert("com.xalt.sjcl.dao.QxmxMapper.insertdata",param);
               }else{
                   //修改数据
                   delegateMapper.update("com.xalt.sjcl.dao.QxmxMapper.updatedata",param);

               }

               //保存模型关系信息
               //删除表信息
               delegateMapper.insert("com.xalt.sjcl.dao.QxmxMapper.delmxzb",param);
               for(Object vo:myulist){
                   MxzbVO kr=(MxzbVO)vo;
                   kr.setMxid(mxid);
                   Map<String, Object> param1 = Maps.newHashMap();
                   kr.setMxzbid(DateUtils.getNowDateStr());
                   param1.put("svo",kr);
                   param1.put("curuser",this.getUserPrincipal().getUserCode());
                   delegateMapper.insert("com.xalt.sjcl.dao.QxmxMapper.insertzbgz",param1);

               }
           }
           includeJson("执行成功!");
    }


    //循环查询匹配规则信息
    public List Hqppgzlist(List rs,DelegateMapper mapper){
           List  zblist=new ArrayList();
           for(Object obj:rs){
               if(obj!=null){
                   QxmxVO vo=(QxmxVO)obj;
                   String qxzbs=vo.getZb();
                   String zwqxzb="";
                   if(qxzbs!=null&&!qxzbs.isEmpty()){
                       String[] zbs=qxzbs.split(",");
                       for(int i=0;i<zbs.length;i++){
                           //循环查询规则表信息获取规则名称
                           String zbid= zbs[i];
                           List gzcl=mapper.selectList("com.xalt.sjcl.dao.QxzbMapper.basicinfo1",zbid);
                           if(gzcl!=null&&gzcl.size()>0){
                               QxzbVO vos=(QxzbVO)gzcl.get(0);
                               if("".equals(zwqxzb)){
                                   zwqxzb=vos.getZbmc();
                               }else{
                                   zwqxzb=zwqxzb+","+ vos.getZbmc();
                               }

                           }
                       }
                   }
                   vo.setPpzbstr(zwqxzb);
                   zblist.add(vo);
               }
           }


           return zblist;
    }



}
