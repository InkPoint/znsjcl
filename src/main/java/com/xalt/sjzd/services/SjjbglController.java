package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjzd.model.SjjbglVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/10/23.
 * 数据级别管理
 */
@Controller
public class SjjbglController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjjbgl() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据级别管理",this.getUserPrincipal().getUserCode(),"sjzd/sjjbgl/initSjjbgl");
        }catch (Exception e){

        }
    }



    /**
     * 数据级别 (下拉菜单)
     */

    public void getSjjbTree() {
        DelegateMapper mapper = getMapper();
        //数据载入数据加载
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjjbglMapper.sjjblist");
        includeJson(vo);
    }

    // 数据级别管理分页查询

    public void sjjblist(SjjbglVo svo,int limit,int offset,String sort,String order) {
        DelegateMapper mapper = getMapper();
        if (svo == null) {
            svo = new SjjbglVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjzd.dao.SjjbglMapper.sjjbAll", param,offset,limit);
        includeJson(vo);
    }

    /**
     * 数据级别管理(新增信息)
     */

    public void adddata(SjjbglVo svo) {
        if (svo == null) {
            svo = new SjjbglVo();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //存储过程(传参)
//        param.put("jbmc", svo.getJbmc());
//        param.put("jbms", svo.getJbms());
//        param.put("bz", svo.getBz());
//        param.put("yxbz", "Y");
//        param.put("cjr", "王子琪");
        mapper.selectList("com.xalt.sjzd.dao.SjjbglMapper.adddata", param);
        includeJson("添加成功!");
    }

    /**
     * 数据级别管理(修改信息)
     */

    public void modifydata(SjjbglVo svo) {
        if (svo == null) {
            svo = new SjjbglVo();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
//        param.put("jbid", svo.getJbid());
//        param.put("jbmc", svo.getJbmc());
//        param.put("jbms", svo.getJbms());
//        param.put("bz", svo.getBz());
        mapper.update("com.xalt.sjzd.dao.SjjbglMapper.modifydata", param);
        includeJson("修改成功!");
    }

    /**
     * 数据级别管理_删除
     */

    public void deleteList(SjjbglVo svo) {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
//        param.put("jbid", svo.getJbid());
        Object obl = mapper.selectOne("com.xalt.sjzd.dao.SjjbglMapper.selectbyid", param);
        int flages = 1;
        if (obl != null) {
            Map m = (Map) obl;
            Object sybzstr = m.get("SYBZ");
            if (sybzstr == null || "".equals(sybzstr)) {
                flages = 0;
            } else {
                mapper.update("com.xalt.sjzd.dao.SjjbglMapper.deleteList", param);
            }
        } else {
            flages = 0;
        }

        includeJson(flages);
    }

    // 校验当前级别名称的唯一性

    public void nameValidation(String levelnames) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        SjjbglVo svo = new SjjbglVo();
        svo.setJbmc(levelnames);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjjbglMapper.nameValidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }
}
