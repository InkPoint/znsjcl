package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.sjjg.model.SyYlGxVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2018/7/31.
 * 医疗和生育保险费分征收局、分经办机构收入统计表--高新区社会保险基金管理中心
 */


@Controller
public class SyylgxController extends WebServiceSupport {


    @Inject
    private Logger log;

    @Inject
    ExpertDataUtil exportdata;


    public void initSyYlgx(){

    }




    public void selectList(SyYlGxVo svo,int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.SyYlGxMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //数据导出

    public void sjdc() {
        DelegateMapper delegateMapper = getMapper();
        List ls = delegateMapper.selectList("com.xalt.sjjg.dao.SyYlGxMapper.selectAll");
        String bt1="医疗和生育保险费分征收局、分经办机构收入统计表";
        String bt2 = "主管经办机构：高新区社会保险基金管理中心";



        String[] title = {"征收单位", "基本医疗保险", "大额医疗保险", "滞纳金", "利息", "医疗保险费合计", "生育保险", "生育保险滞纳金", "生育保险利息", "生育保险合计"};
        String[] columns = {"hsjg", "jbylbx", "deylbx", "znj", "lx", "ylbxhj", "sybx", "sybxznj", "sybxlx", "sybxhj"};
        try {
            exportdata.doPostExecute1(this.getRequest(), this.getResponse(), ls, title, columns,bt1,bt2);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");


    }

}
