package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjcl.model.MxzbVO;
import com.xalt.sjcl.model.QxmxVO;
import com.xalt.sjcl.model.QxzbVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.DateUtils;
import com.xalt.utils.RandomUUID;
import com.xalt.zzfwzx.model.QxmxglVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by cuiheng on 2018/3/9.
 *
 * 清洗模型管理
 */
@Controller
public class QxmxglController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @NoLoginValidate
    public void initQxmxgl(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—清洗模型定制",this.getUserPrincipal().getUserCode(),"zzfwzx/qxmxgl/initQxmxgl");
        }catch (Exception e){

        }
    }

    @NoLoginValidate
    public void  addmx(){

    }

    // 初始化模型查询
    @NoLoginValidate
    public void list(QxmxglVo svo, int limit, int offset, int pageNumber,String sort, String order){
        log.debug("limit:"+limit);
        log.debug("offset:"+offset);
        if(svo == null){
            svo = new QxmxglVo();
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);

        //List vo = delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.selectAll", param);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.QxmxglMapper.selectAll", param,offset,limit);
        List strr=Hqppgzlist(vo.getRows(),delegateMapper);
        log.debug("vo", vo);
        includeJson(vo);

    }


    //添加指标部分
    @NoLoginValidate
    public void  add(QxmxglVo svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("curuser",this.getUserPrincipal().getUserCode());
        DelegateMapper delegateMapper = getMapper();
        if(svo.getMxid()==null||svo.getMxid().isEmpty()){
            delegateMapper.insert("com.xalt.zzfwzx.dao.QxmxglMapper.insertdata",param);
        }else{
            delegateMapper.update("com.xalt.zzfwzx.dao.QxmxglMapper.updatedata", param);
        }
        includeJson("执行成功!");
    }

    @NoLoginValidate
    public void  deletes(QxmxglVo svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.delete("com.xalt.zzfwzx.dao.QxmxglMapper.deletes",param);
        delegateMapper.delete("com.xalt.zzfwzx.dao.QxmxglMapper.deleteschildren",param);
        includeJson("执行成功!");
    }

    //查询模型对应规则
    @NoLoginValidate
    public void mxzblist(QxmxglVo svo, int limit, int offset){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.QxmxglMapper.zbgzlist", param, offset, limit);
        includeJson(vo);
    }


    //添加和修改指标和规则关系列信息初始化
    @NoLoginValidate
    public void initadd(QxmxglVo svo){
        Map<String, Object> results = Maps.newHashMap();
        if(svo!=null){
            DelegateMapper delegateMapper = getMapper();
            Map<String, Object> param = Maps.newHashMap();
            param.put("svo", svo);
            param.put("curuser",this.getUserPrincipal().getUserCode());
            List basicinfo=delegateMapper.selectList("com.xalt.zzfwzx.dao.QxmxglMapper.basicinfo",param);
            //规则列表
            List zblist=delegateMapper.selectList("com.xalt.zzfwzx.dao.QxmxglMapper.zblist",param);
            results.put("zblist",zblist);
            results.put("basicinfo",basicinfo);
        }

        includeJson(results);
    }

    //添加模型和模型规则关联数据
    @NoLoginValidate
    public void savedata(QxmxglVo svo){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        //获取模型id
        String mxid=svo.getMxid();
        String oprflag=svo.getOprflag();
        if(oprflag!=null&&"0".equals(oprflag)){
            mxid= RandomUUID.getUUIDRandoms();
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
                delegateMapper.insert("com.xalt.zzfwzx.dao.QxmxglMapper.insertdata",param);
            }else{
                //修改数据
                delegateMapper.update("com.xalt.zzfwzx.dao.QxmxglMapper.updatedata",param);

            }

            //保存模型关系信息
            //删除表信息
            delegateMapper.insert("com.xalt.zzfwzx.dao.QxmxglMapper.delmxzb",param);
            for(Object vo:myulist){
                MxzbVO kr=(MxzbVO)vo;
                kr.setMxid(mxid);
                Map<String, Object> param1 = Maps.newHashMap();
                kr.setMxzbid(DateUtils.getNowDateStr());
                param1.put("svo",kr);
                param1.put("curuser",this.getUserPrincipal().getUserCode());
                delegateMapper.insert("com.xalt.zzfwzx.dao.QxmxglMapper.insertzbgz",param1);

            }
        }
        includeJson("执行成功!");
    }


    //循环查询匹配规则信息
    public List Hqppgzlist(List rs,DelegateMapper mapper){
        List  zblist=new ArrayList();
        for(Object obj:rs){
            if(obj!=null){
                QxmxglVo vo=(QxmxglVo)obj;
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
