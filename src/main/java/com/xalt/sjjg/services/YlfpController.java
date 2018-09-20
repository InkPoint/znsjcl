package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.sjjg.model.YlfpVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 养老封皮
 * Created by cuiheng on 2018/8/14.
 */


@Controller
public class YlfpController extends WebServiceSupport {

    @Inject
    private Logger log;


    @Inject
    ExpertDataUtil exportdata;

    @NoLoginValidate
    public void initYlfp(){

    }

    //医疗封皮默认信息查询
    @NoLoginValidate
    public void selectAll(YlfpVo svo, int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.YlfpMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //医疗封皮导出
    public void sjdc() {
        DelegateMapper delegateMapper = getMapper();
        List ls = delegateMapper.selectList("com.xalt.sjjg.dao.YlfpMapper.selectAll");
        String bt1="西安市税务局养老保险费税务入库明细表集中传递";
        String[] title = {" ", "单位缴费基数", "个人缴费基数", "缴费人数", "单位实缴金额", "个人实缴金额", "滞纳金", "其它（个人缴费)", "罚款", "利息", "入库额"};
        String[] columns = {"zgsbjg", "dwjfjs", "grjfjs", "jfrs", "dwsjje", "grsjje", "znj", "qt", "fk", "lx","rke"};
        try {
            exportdata.doPostExecute2(this.getRequest(), this.getResponse(), ls, title, columns,bt1);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");


    }


}
