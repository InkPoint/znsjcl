package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.zzfwzx.model.FxjgdcVo;
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

    @NoLoginValidate
    public void initFxjgdc() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—分析结果查询导出",this.getUserPrincipal().getUserCode(),"zzfwzx/fxjgdc/initFxjgdc");
        }catch (Exception e){

        }
    }

    //基本分页查询
    @NoLoginValidate
    public void selectList(FxjgdcVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new FxjgdcVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.zzfwzx.dao.FxjgdcMapper.selectList", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //征收分局（下拉列表）
    @NoLoginValidate
    public void selectzsfj() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxjgdcMapper.selectfj");
        includeJson(vo);
    }

    //税务管理科所查询(下拉列表)
    @NoLoginValidate
    public void selectKs(FxjgdcVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxjgdcMapper.selectKs", param);
        includeJson(vo);
    }

    //下发批次（下拉列表）
    @NoLoginValidate
    public void selectXfpc() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxjgdcMapper.selectXfpc");
        includeJson(vo);
    }

    //分析大类（下拉列表）
    @NoLoginValidate
    public void selectFxdl() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxjgdcMapper.selectFxdl");
        includeJson(vo);
    }

    //分析小类（下拉列表）
    @NoLoginValidate
    public void selectFxxl() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxjgdcMapper.selectFxxl");
        includeJson(vo);
    }

    //税务管理科所（下拉列表）
    @NoLoginValidate
    public void selectSwglks() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.FxjgdcMapper.selectSwglks");
        includeJson(vo);
    }

//    // 导出
//    @NoLoginValidate
//    public void exportData(FxjgdcVo svo) {
//        DelegateMapper delegateMapper = getMapper();
//        if (svo == null) {
//            svo = new FxjgdcVo();
//        }
//        log.debug("===== svo {}", svo);
//        Map<String, Object> param = Maps.newHashMap();
//        param.put("svo", svo);
//        List lists = delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.exportData", param);
//        List sjxxx = delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.sjxinfo", param);
//        if (sjxxx != null && sjxxx.size() > 0) {
//            String[] title = new String[sjxxx.size()];
//            String[] columns = new String[sjxxx.size()];
//            for (int i = 0; i < sjxxx.size(); i++) {
//                SjxVo vo = (SjxVo) sjxxx.get(i);
//                title[i] = vo.getSjxmczw();
//                columns[i] = vo.getSjxmcyw();
//            }
//            try {
//                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), lists, title, columns);
//            } catch (Exception e) {
//                log.debug("导出数据异常!");
//                e.printStackTrace();
//            }
//        }
//        includeJson("执行成功！");
//    }

}
