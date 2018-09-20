package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.FxjgdcVo;
import com.xalt.sjzd.model.ExpertDataUtil;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.DateUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/12/6.
 * //分析结果导出
 * User:CuiHeng
 */
@Controller
public class FxjgdcController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initFxjgdc() {

        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "分析结果导出", this.getUserPrincipal().getUserCode(),"sjyj/fxjgdc/initFxjgdc");
        } catch (Exception e) {

        }
    }


    //基本分页查询

    public void selectList(FxjgdcVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new FxjgdcVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.FxjgdcMapper.selectList", param, offset, limit);
        log.debug("总数据条数：" + vo.getTotal());
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //征收分局（下拉列表）

    public void selectzsfj() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectfj");
        includeJson(vo);
    }

    //税务管理科所查询(下拉列表)

    public void selectKs(FxjgdcVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectKs", param);
        includeJson(vo);
    }

    //下发批次（下拉列表）

    public void selectXfpc(FxjgdcVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectXfpc", param);
        includeJson(vo);
    }

    //分析大类（下拉列表）

    public void selectFxdl(FxjgdcVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectFxdl", param);
        includeJson(vo);
    }

    //分析小类（下拉列表）

    public void selectFxxl(FxjgdcVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectFxxl", param);
        includeJson(vo);
    }

    //税务管理科所（下拉列表）

    public void selectSwglks() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.FxjgdcMapper.selectSwglks");
        includeJson(vo);
    }

    //导出到Excel

    public void exportToExcel(FxjgdcVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        String nowDate = DateUtils.getNowDateStr();
        log.debug("获取的参数：" + param);
        String sjcxlj = (String) delegateMapper.selectOne("com.xalt.sjyj.dao.FxjgfkMapper.selectSjcxlj", param);
        //表数据
        List dataList = delegateMapper.selectList(sjcxlj, param);
        log.debug("表数据集合：" + dataList);
        //表头
        List sjbt = delegateMapper.selectList("com.xalt.sjyj.dao.FxjgfkMapper.selectSjbtcx", param);
        log.debug("表头集合：" + sjbt);

        if (sjbt != null && sjbt.size() > 0) {
            String[] title = new String[sjbt.size()];
            String[] columns = new String[sjbt.size()];
            for (int i = 0; i < sjbt.size(); i++) {
                SjxVo vo = (SjxVo) sjbt.get(i);
                title[i] = vo.getSjxmczw();
                columns[i] = vo.getSjxmcyw();
//                columns[i] = "";
            }
            try {
                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), dataList, title, columns, svo.getFileName());
                includeJson("导出数据成功！");
            } catch (Exception e) {
                log.debug("导出数据异常!");
                e.printStackTrace();
            }
        }
    }
}
