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
 * Created by cuiheng on 2018/7/31.
 * 社保 医疗汇总
 */
@Controller
public class YlhzController extends WebServiceSupport {

    @Inject
    private Logger log;


    @Inject
    ExpertDataUtil exportdata;


    public void initYlhz() {


    }



//    @NoLoginValidate
//    public  void initTz2(){
//
//    }



    public void selectList(YlhzVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.YlhzMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    //数据导出

    public void sjdc() {
        DelegateMapper delegateMapper = getMapper();
        List ls = delegateMapper.selectList("com.xalt.sjjg.dao.YlhzMapper.selectAll");
        String[] title = {"序号", "缴费人识别号", "缴费人名称", "核算机关", "缴费人科所税务机关", "申报数据来源", "数据查看社保经办机构", "社保编码", "征收项目代码", "征收项目",
                "征收品目代码", "征收品目", "征收子目代码",
                "征收子目", "费款所属期起止", "缴费人数", "缴费基数", "缴费比例", "票证号码", "开票经办人",
                "开票经办日期", "电子税票号", "入库日期", "入库销号经办人", "入库销号经办日期", "实缴金额", "类型说明"};
        String[] columns = {"xh", "jfrsbh", "jfrmc", "hsjg", "jfrksswjg", "sbsjly", "sbjbjg", "sbbm", "zsxmdm", "zsxm",
                "zspmdm", "zspm", "zszmdm", "zszm", "fkssrqz", "jfrs", "jfjs", "jfbl", "pzhm", "kpjbr", "kpjbrq", "dzsph", "rkqr", "rkxhjbr", "rkxhjbrq", "jfje", "lxsm",};
        try {
            exportdata.doPostExecute(this.getRequest(), this.getResponse(), ls, title, columns);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");


    }


}
