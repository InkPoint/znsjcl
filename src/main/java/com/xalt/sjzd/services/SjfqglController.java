package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjzd.model.SjfqglVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 数据分区管理
 * User:CuiHeng
 */

@Controller
public class SjfqglController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjfqgl(){
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据分区管理",this.getUserPrincipal().getUserCode(),"sjzd/sjfqgl/initSjfqgl");
        }catch (Exception e){

        }
    }

    //基本分压查询

    public void selectList(SjfqglVo svo, int limit, int offset, String sort, String order){
        if (svo == null){
            svo = new SjfqglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjzd.dao.SjfqglMapper.selectList", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //数据分区查询（下拉框）

    public void selectzsfj() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjfqglMapper.selectsjfq");
        includeJson(vo);
    }

    //添加

    public void insertSjfq(SjfqglVo svo){
        if (svo == null){
            svo = new SjfqglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("cjr", this.getUserPrincipal().getUserCode());
        delegateMapper.insert("com.xalt.sjzd.dao.SjfqglMapper.insertSjfq", param);
        includeJson("添加成功");
    }

    //编辑

    public void updateSjfq(SjfqglVo svo){
        if(svo == null){
            svo = new SjfqglVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjzd.dao.SjfqglMapper.updateSjfq", param);
            includeJson("修改成功!");
    }

    //删除

    public void deleteSjfq(SjfqglVo svo){
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.update("com.xalt.sjzd.dao.SjfqglMapper.deleteSjfq", param);
        includeJson("删除成功!");
    }

    // 校验当前级别名称的唯一性
    @NoLoginValidate
    public void nameValidation(String jyname) {
        boolean result=true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        SjfqglVo svo = new SjfqglVo();
        svo.setFqmc(jyname);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjfqglMapper.nameValidation", param);
        if (vo != null&&vo.size()>0) {
            result=false;
        }
        Map<String,Boolean> map=new HashMap<>();
        map.put("valid",result);
        includeJson(map);
    }
}
