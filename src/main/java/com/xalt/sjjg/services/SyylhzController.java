package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.sjjg.model.SyylhzVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cuihegn on 2018/7/31.
 * 生育医疗汇总
 */

@Controller
public class SyylhzController extends WebServiceSupport {

    @Inject
    private Logger log;


    @Inject
    ExpertDataUtil exportdata;


    public void initSyylhz(){

    }


    public void selectList(SyylhzVo svo,int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.SyylhzMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //数据导出

    public void sjdc() {
        DelegateMapper delegateMapper = getMapper();
        List ls = delegateMapper.selectList("com.xalt.sjjg.dao.SyylhzMapper.selectAll");
        String bt1="医疗和生育保险费收入汇总统计表";

        String[] title = {"征收品目", "西安市航天基地社保中心", "高新区社会保险基金管理中心", "经开区社会保障基金管理中心", "小计"};
        String[] columns = {"zspm", "htjdsb", "gxsb", "jksb", "xj"};
        try {
            exportdata.doPostExecute2(this.getRequest(), this.getResponse(), ls, title, columns,bt1);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");


    }

}
