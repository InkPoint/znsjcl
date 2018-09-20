package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.sjjg.model.GsdzdVo;
import com.xalt.sjjg.model.YlfpVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cuiheng on 2018/8/15.
 * 工伤对账单
 */
@Controller
public class GsdzdController extends WebServiceSupport {

    @Inject
    private Logger log;


    @Inject
    ExpertDataUtil exportdata;

    @NoLoginValidate
    public void initGsdzd(){

    }


    //医疗封皮默认信息查询
    @NoLoginValidate
    public void selectAll(GsdzdVo svo, int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.GsdzdMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //数据导出

    public void sjdc() {
        DelegateMapper delegateMapper = getMapper();
        List ls = delegateMapper.selectList("com.xalt.sjjg.dao.GsdzdMapper.selectAll");
        String bt1="工伤保险费到账明细";
        String bt2 = "工伤保险费收入金额 7180480.44（元）";
        String[] title = {"其他", "单位", "实缴金额"};
        String[] columns = {"sbjbjg", "dw", "sjje"};
        try {
            exportdata.doPostExecute3(this.getRequest(), this.getResponse(), ls, title, columns, bt1,bt2);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");


    }


}
