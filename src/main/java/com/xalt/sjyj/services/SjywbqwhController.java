package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjyj.model.FxjgdcVo;
import com.xalt.sjyj.model.SjdxbqVo;
import com.xalt.sjyj.model.SjywbqwhVo;
import com.xalt.utils.DateUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.*;

/**
 * 数据业务标签维护
 * Created by cuiheng on 2018/4/18.
 */
@Controller
public class SjywbqwhController extends WebServiceSupport {
    @Inject
    private Logger log;

    //页面初始化

    public void initSjywbqwh() {

    }

    //业务标签下拉框查询

    public void selectYwbqhn() {
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        List vo = mapper.selectList("com.xalt.sjyj.dao.SjbqwhMapper.selectYwbqhn", mp);
        includeJson(vo);
    }

    //数据类别下拉框查询

    public void selectSjlb() {
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        List vo = mapper.selectList("com.xalt.sjyj.dao.SjbqwhMapper.selectSjlb", mp);
        includeJson(vo);
    }

    //默认表数据查询

    public void selectAll(SjywbqwhVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.SjbqwhMapper.selectAll", param, offset, limit);
        includeJson(vo);
    }

    //添加标签id
    public void insertbqid(String nsrxxlist, String bqstr) {
        DelegateMapper mapper = getMapper();
        List  myulist= JsonObjectToJava.getListByArray(SjdxbqVo.class, nsrxxlist);
        String bqid=bqstr;
        if(myulist!=null&&myulist.size()>0){
            for(Object vo:myulist){
                SjdxbqVo svo=(SjdxbqVo)vo;
                //生成主表uuid
                String mainid= UUID.randomUUID().toString();
                Map<String, Object> param = Maps.newHashMap();
                param.put("svo", svo);
                svo.setBid(mainid);
                svo.setTjr(this.getUserPrincipal().getUserCode());
                svo.setTjsj(DateUtils.getNowDateStr());
                //插入主表信息
                mapper.selectList("com.xalt.sjyj.dao.SjbqwhMapper.insertmaininfo", param);
                //循环插入附表信息
                if(bqid!=null&&!"".equals(bqid)){
                    String[] str1=bqid.split(",");
                    for(int i=0;i<str1.length;i++){
                        String bqidev=str1[i];
                        String fbdataid= UUID.randomUUID().toString();
                        Map<String,Object> paramschild=new HashMap<String,Object>();
                        paramschild.put("sjid",fbdataid);
                        paramschild.put("bqid",bqidev);
                        paramschild.put("pid",mainid);
                        mapper.selectList("com.xalt.sjyj.dao.SjbqwhMapper.insertbqid", paramschild);
                    }
                }
            }
        }
        includeJson("添加成功!");
    }

    //修改标签id
    public void updateBqid(SjdxbqVo svo,String bqstr){
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //编辑数据的时候首先删除原有数据
        mapper.delete("com.xalt.sjyj.dao.SjbqwhMapper.delfbinfo", param);
        mapper.delete("com.xalt.sjyj.dao.SjbqwhMapper.delmaininfo", param);
        //生成主表uuid
        String mainid= UUID.randomUUID().toString();
        svo.setBid(mainid);
        svo.setTjr(this.getUserPrincipal().getUserCode());
        svo.setTjsj(DateUtils.getNowDateStr());
        //插入主表信息
        mapper.insert("com.xalt.sjyj.dao.SjbqwhMapper.insertmaininfo",param);
        //插入附表信息
        if(bqstr!=null&&!"".equals(bqstr)){
            String[] str1=bqstr.split(",");
            for(int i=0;i<str1.length;i++){
                String bqidev=str1[i];
                String fbdataid= UUID.randomUUID().toString();
                Map<String,Object> paramschild=new HashMap<String,Object>();
                paramschild.put("sjid",fbdataid);
                paramschild.put("bqid",bqidev);
                paramschild.put("pid",mainid);
                mapper.selectList("com.xalt.sjyj.dao.SjbqwhMapper.insertbqid", paramschild);
            }
        }
        mapper.insert("com.xalt.sjyj.dao.SjbqwhMapper.insertbqid",param);
        includeJson("修改成功!");
    }

}
