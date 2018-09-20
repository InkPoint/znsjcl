package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.zzfwzx.model.YjglVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 自助服务中心-元件检索
 * Created by cuiheng on 2018/4/13.
 */

@Controller
public class YjjsController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @NoLoginValidate
    public void initYjjs() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—数据元件目录检索",this.getUserPrincipal().getUserCode(),"zzfwzx/yjjs/initYjjs");
        }catch (Exception e){

        }
    }

    //  zTree树初始化
    @NoLoginValidate
    public void list() {
        DelegateMapper delegateMapper = getMapper();
        List<YjglVo> vo = delegateMapper.selectList("com.xalt.zzfwzx.dao.YjjsMapper.getZtree", "");
        Map<String, Object> rs = new HashMap<>();
        rs.put("rows", vo);
        YjglVo paramvo = new YjglVo();
        for (YjglVo obj : vo) {
            if (obj.getPyjdm() == null || "".equals(obj.getPyjdm())) {
                paramvo = obj;
            }
        }
        Map<String, Object> parm = new HashMap<>();
        parm.put("svo", paramvo);
        List<YjglVo> svo = delegateMapper.selectList("com.xalt.zzfwzx.dao.YjjsMapper.gettargetinfo", parm);
        rs.put("svo", (YjglVo) svo.get(0));
        includeJson(rs);
    }

    // 查询所有根节点对应的子节点列表信息
    @NoLoginValidate
    public void selectAll(YjglVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.zzfwzx.dao.YjjsMapper.selectAll", param);
        includeJson(vo);
    }

    //标签信息查询
    @NoLoginValidate
    public void targetinfo(YjglVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询该子节点信息
        List vo = delegateMapper.selectList("com.xalt.sjjs.dao.YjjsMapper.getchildrens", param);
        includeJson(vo);
    }

    //业务标签树形菜单
    @NoLoginValidate
    public void getYwbqTree() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjs.dao.YjjsMapper.ywbqztree");
        includeJson(vo);
    }
}
