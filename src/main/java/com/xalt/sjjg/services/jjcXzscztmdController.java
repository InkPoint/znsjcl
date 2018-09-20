package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.CpzxVo;
import com.xalt.sjjg.model.JjcXzscztmdVo;
import com.xalt.sjzd.model.ExpertDataUtil;
import com.xalt.sjzd.model.SjdxglVo;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 产品申请
 * Created by ChengZhang on 2018/2/2.
 */

@Controller
public class jjcXzscztmdController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjcpXzscztmd() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "基金处新增市场主体名单明细查询", this.getUserPrincipal().getUserCode(),"sjjg/sjcpzx/initSjcpsy");
        } catch (Exception e) {

        }
    }

//    初始化数据说明

    public void querySjsm(JjcXzscztmdVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.selectOne("com.xalt.sjjg.dao.JjcXzscztmdMapper.querySjsm",param);
        String sjsm = svo.getSjsm();
        includeJson(sjsm);
    }

//
//    //查询产品列表
//    @NoLoginValidate
//    public void selectlist(CpzxVo svo, int limit, int offset, String sort, String order) {
//        DelegateMapper delegateMapper = getMapper();
//        Map<String, Object> param = Maps.newHashMap();
//        param.put("svo", svo);
//        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.SjcpzxMapper.selectAll", param, offset, limit);
//        Map<String, Object> results = new HashMap<String, Object>();
//        results.put("total", vo.getPageCount());
//        results.put("rows", vo.getRows());
//        includeJson(vo);
//    }
//
//
//
    //分页查询明细统计

    public void viewthedata(JjcXzscztmdVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = null;
        String flag = svo.getSearchFalg();
        if ("qyydjxh".equals(flag)||flag=="qyydjxh"){
            vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JjcXzscztmdMapper.qyydjxh", param, offset, limit);
        }else if ("qywdjxh".equals(flag)||flag=="qywdjxh"){
            vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JjcXzscztmdMapper.qywdjxh", param, offset, limit);
        }else if ("gtydjxh".equals(flag)||flag=="gtydjxh"){
            vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JjcXzscztmdMapper.gtydjxh", param, offset, limit);
        }else if ("gtwdjxh".equals(flag)||flag=="gtwdjxh"){
            vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JjcXzscztmdMapper.gtwdjxh", param, offset, limit);
        }else if ("gxfjhx".equals(flag)||flag=="gxfjhx"){
            vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.JjcXzscztmdMapper.gxfjhx", param, offset, limit);
        }
        includeJson(vo);
    }

    //导出到Excel

    public void exportToExcel(JjcXzscztmdVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        String flag = svo.getSearchFalg();
        String pcmc = svo.getPcmc();
        String fileName = "";
        List dataList = null;
        if ("qyydjxh".equals(flag)||flag=="qyydjxh"){
            fileName = "企业有登记序号" + "（" + pcmc + "）";
            dataList = delegateMapper.selectList("com.xalt.sjjg.dao.JjcXzscztmdMapper.qyydjxh", param);
        }else if ("qywdjxh".equals(flag)||flag=="qywdjxh"){
            fileName = "企业无登记序号" + "（" + pcmc + "）";
            dataList = delegateMapper.selectList("com.xalt.sjjg.dao.JjcXzscztmdMapper.qywdjxh", param);
        }else if ("gtydjxh".equals(flag)||flag=="gtydjxh"){
            fileName = "个体有登记序号" + "（" + pcmc + "）";
            dataList = delegateMapper.selectList("com.xalt.sjjg.dao.JjcXzscztmdMapper.gtydjxh", param);
        }else if ("gtwdjxh".equals(flag)||flag=="gtwdjxh"){
            fileName = "个体无登记序号" + "（" + pcmc + "）";
            dataList = delegateMapper.selectList("com.xalt.sjjg.dao.JjcXzscztmdMapper.gtwdjxh", param);
        }else if ("gxfjhx".equals(flag)||flag=="gxfjhx"){
            fileName = "高新分局和企业名称为“星星”" + "（" + pcmc + "）";
            dataList = delegateMapper.selectList("com.xalt.sjjg.dao.JjcXzscztmdMapper.gxfjhx", param);
        }

        log.debug("Excel文件名：" + fileName);
        log.debug("表数据集合：" + dataList);
        //表头
        String[] title = {"原表序号","企业名称","注册登记号","统一社会信用代码","注册地址","登记机关","注册登记（迁入）时间","主体类型","批次名称","登记序号"};
        String[] columns = {"XH","MC","ZCDJH","TYSHXYDM","ZCDZ","DJJG","ZCSJ","LX","PCMC","DJXH"};

        try {
            ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), dataList, title, columns, fileName);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
    }

//批次查询

    public void queryBatch() {
        DelegateMapper delegateMapper = getMapper();
        List batchList = delegateMapper.selectList("com.xalt.sjjg.dao.JjcXzscztmdMapper.queryBatch");
        includeJson(batchList);
    }

}
