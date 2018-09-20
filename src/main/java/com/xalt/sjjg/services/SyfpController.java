package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.sjjg.model.YlhzVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cuiheng on 2018/8/15
 *
 * 失业封皮.
 */

@Controller
public class SyfpController extends WebServiceSupport {


    @Inject
    private Logger log;

    @Inject
    ExpertDataUtil exportdata;

    @NoLoginValidate
    public void initSyfp(){

    }

    @NoLoginValidate
    public void sellectList(YlhzVo svo, int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.SyfpMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //数据导出

    public void sjdc() {
        DelegateMapper delegateMapper = getMapper();
        List ls = delegateMapper.selectList("com.xalt.sjjg.dao.SyfpMapper.selectAll");
        String[] title = {"社保经办机构", "单位缴费基数", "个人缴费基数", "单位实缴金额", "个人实缴金额", "滞纳金", "罚款", "利息", "社保经办机构"};
        String[] columns = {"sbjbjg", "dwjfjs", "grjfjs", "dwsjje", "grsjje", "znj", "fk", "lx", "rke"};
        String bt1="西安市税务局失业保险费税务入库明细表集中传递";
        try {
            exportdata.doPostExecute2(this.getRequest(), this.getResponse(), ls, title, columns, bt1);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");


    }

}
