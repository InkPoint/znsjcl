package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.ExpertDataUtil;
import com.xalt.sjjg.model.GscxVO;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2018/7/10.
 * User:PengWen Wang
 * 个税查询
 */
@Controller
public class GscxController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;
    @Inject
    ExpertDataUtil exportdata;


    public void initGscx() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "个税查询", this.getUserPrincipal().getUserCode(),"sjjg/sjcpzx/initSjcpsy");
        } catch (Exception e) {

        }
    }

    /**
     * 个税查询
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */
    public void SearchAll(GscxVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.GscxMapper.SearchAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }


    /**
     * cuiheng
     * 导出功能
     * 2018-08-10
     */

    //数据导出
    public void sjdc(GscxVO svo) {
        Map parm = new HashMap();
        parm.put("svo",svo);
        DelegateMapper delegateMapper = getMapper();
        List ls = delegateMapper.selectList("com.xalt.sjjg.dao.GscxMapper.SearchAll",parm);
        String[] title = {"单位税务机关名称", "税号", "单位名称", "姓名", "证件类型", "身份证号码", "税款所属期起", "税款所属期止", "收入额", "应纳税额", "项目"};
        String[] columns = {"dwswjgmc", "sh", "dwmc", "xm", "zjlx", "sfzhm", "skssqq", "skssqz", "sre", "ynse","xmmc"};
        try {
            exportdata.doPostExecute(this.getRequest(), this.getResponse(), ls, title, columns);
        } catch (Exception e) {
            log.debug("导出数据异常!");
            e.printStackTrace();
        }
        includeJson("执行成功！");

    }
}
