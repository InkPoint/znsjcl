package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.FxmxyfVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by win7 on 2017/11/30.
 * User:cuiheng
 * 分析模型研发
 * The modifier: PengWen Wang
 */
@Controller
public class FxmxyfController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initFxmxyf() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "分析模型研发", this.getUserPrincipal().getUserCode(),"sjyj/fxmxyf/initFxmxyf");
        } catch (Exception e) {

        }
    }

    // (分析模型研发)表信息查询

    public void selectAll(FxmxyfVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.FxmxyfMapper.selectAll", param);
        includeJson(vo);
    }

    //分析模型(下拉菜单)

    public void yjlistdata() {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.FxmxyfMapper.yjlistdata");
        includeJson(vo);
    }

    /**
     * 选取模型
     *
     * @param svo
     */

    public void selectTheModel(FxmxyfVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        svo.setYfr(this.getUserPrincipal().getUserCode());
        map.put("svo", svo);
        int i = (int) delegateMapper.selectOne("com.xalt.sjyj.dao.FxmxyfMapper.queryTheModel", map);
        if (i > 0) {
            delegateMapper.update("com.xalt.sjyj.dao.FxmxyfMapper.editTheModel", map);
        } else {
            delegateMapper.selectList("com.xalt.sjyj.dao.FxmxyfMapper.selectTheModel", map);
        }
        includeJson("Success");
    }


    //完成进度修改事件//标签信息编辑

    public void updateLable(String rwid, String sliding) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("rwid", rwid);
        param.put("sliding", sliding);
        int i = (int) delegateMapper.selectOne("com.xalt.sjyj.dao.FxmxyfMapper.selectId", param);
        if (i > 0) {
            delegateMapper.update("com.xalt.sjyj.dao.FxmxyfMapper.updateWcjd", param);
        } else {
            delegateMapper.insert("com.xalt.sjyj.dao.FxmxyfMapper.insertWcjd", param);
        }
        includeJson("success!");
    }

    //添加文件名称

    public void insertWjmc(FxmxyfVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.sjyj.dao.FxmxyfMapper.insertSavepath", param);
        includeJson("添加成功");
    }

    /**
     * 获得一个UUID
     *
     * @return
     */
    public static String getUUID() {
        String uuid = UUID.randomUUID().toString();
        //去掉"-"符号
        return uuid.replaceAll("-", "");
    }

}
