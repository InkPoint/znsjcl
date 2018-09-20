package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.sjyj.model.BdccxVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cuiheng on 2018/8/20.
 * 不动产查询
 */
@Controller
public class BdccxController extends WebServiceSupport {

    @Inject
    private Logger log;

    @Inject
    ExpertDataUtil exportdata;

    @NoLoginValidate
    public void initBdccx(){

    }


    @NoLoginValidate
    public void selectlist(BdccxVo svo, int limit, int offset, String sort, String order){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.BdccxMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    public void sjdc(BdccxVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo",svo);
        List ls = delegateMapper.selectList("com.xalt.sjyj.dao.BdccxMapper.selectAll", param);
        String[] title = {"序号", "幢号", "单元", "层", "房号", "产权证号", "产权人（最新）", "共有情况", "房屋坐落", "商品房初始登记时间",
                "商品房转移登记时间", "二手房转移登记时间（最新）", "商品房交易金额","二手房交易金额（最新）",
                "房屋来源", "房屋用途", "建筑结构", "建筑面积", "商品房网签买受人", "商品房网签备案时间", "产权人登记序号",
                "买受人登记序号"};
        String[] columns = {"XH", "DH", "DY", "C", "FH", "CQZH", "CQR", "GYQK", "FWZL", "SPFCSDJSJ",
                "SPFZYDJSJ", "ESFZYDJSJ", "SPFJYJE", "ESFJYJE",
                "FWLY", "FWYT", "JZJG", "JZMJ", "SPFWQMSR", "SPFWQBASJ","CQR_DJXH",
                "MSR_DJXH"};
        try {
            exportdata.doPostExecute(this.getRequest(), this.getResponse(), ls, title, columns);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");


    }
}
