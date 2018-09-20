package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.FxbgyfVO;
import com.xalt.sjyj.model.FxjgdcVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by win7 on 2018/6/6.
 * 分析报告研发
 * User:PengWen Wang
 */
@Controller
public class FxbgyfController extends WebServiceSupport {

    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    //分析报告研发
    public void initfxbgyf() {
    }

    //生成报告(页)
    public void initScbg() {
    }

    //快捷查询报告类型
    public void querybglxlist() {
        DelegateMapper delegateMapper = getMapper();
        List lists = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.bglxlist");
        includeJson(lists);
    }

    //已生成报告

    public void selectAll(FxbgyfVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.FxbgyfMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //快捷查询(柱形图)

    public void theReport(FxbgyfVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //根据类型代码查询属期起
        List<FxbgyfVO> theDateOfSince = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theDateOfSince", param);
        svo.setSqq(svo.getSsnf() + "-" + ((FxbgyfVO) theDateOfSince.get(0)).getSqq());
        //根据类型代码查询属期止
        List<FxbgyfVO> theDateOfCheck = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theDateOfCheck", param);
        svo.setSqz(svo.getSsnf() + "-" + ((FxbgyfVO) theDateOfCheck.get(0)).getSqz());
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theReport", param);
        includeJson(list);
    }

    //属期查询

    public void isPeriod(FxbgyfVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theReport", param);
        includeJson(list);
    }

    /**
     * 表一（快捷查询）
     *
     * @param svo
     */
    public void tableA(FxbgyfVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("svo", svo);
        //根据类型代码查询属期起
        List<FxbgyfVO> theDateOfSince = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theDateOfSince", map);
        svo.setSqq(svo.getSsnf() + "-" + ((FxbgyfVO) theDateOfSince.get(0)).getSqq());
        //根据类型代码查询属期止
        List<FxbgyfVO> theDateOfCheck = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theDateOfCheck", map);
        svo.setSqz(svo.getSsnf() + "-" + ((FxbgyfVO) theDateOfCheck.get(0)).getSqz());
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.tableA", map);
        includeJson(list);
    }

    /**
     * 表一（自定义属期查询）
     *
     * @param svo
     */
    public void tableB(FxbgyfVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        map.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.tableA", map);
        includeJson(list);
    }

    /**
     * 保存报告(快捷)
     *
     * @param svo
     */

    public void svaeTheReport(FxbgyfVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        String usercode = this.getUserPrincipal().getUserCode();
        map.put("svo", svo);
        //根据类型代码查询属期起
        List<FxbgyfVO> theDateOfSince = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theDateOfSince", map);
        svo.setSqq(svo.getSsnf() + "-" + ((FxbgyfVO) theDateOfSince.get(0)).getSqq());
        //根据类型代码查询属期止
        List<FxbgyfVO> theDateOfCheck = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.theDateOfCheck", map);
        svo.setSqz(svo.getSsnf() + "-" + ((FxbgyfVO) theDateOfCheck.get(0)).getSqz());
        svo.setBgid(getUUID());
        svo.setCjr(usercode);
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.svaeTheReport", map);
        includeJson(list);
    }

    /**
     * 自定义保存报告(属期)
     * @param svo
     */

    public void customSaveReport(FxbgyfVO svo){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> map = Maps.newHashMap();
        String usercode = this.getUserPrincipal().getUserCode();
        svo.setBgid(getUUID());
        svo.setCjr(usercode);
        map.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.svaeTheReport", map);
        includeJson(list);
    }

    //查询属期

    public void queryIsperiod(){
        DelegateMapper delegateMapper = getMapper();
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.FxbgyfMapper.queryIsperiod");
        includeJson(list);
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
