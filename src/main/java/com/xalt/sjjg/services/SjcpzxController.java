package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.CpzxVo;
import com.xalt.sjzd.model.ExpertDataUtil;
import com.xalt.sjzd.model.SjdxglVo;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.DateUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 产品申请
 * Created by ChengZhang on 2018/2/2.
 */

@Controller
public class SjcpzxController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjcpzx() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "数据产品查询", this.getUserPrincipal().getUserCode(),"sjjg/sjcpzx/initSjcpsy");
        } catch (Exception e) {

        }
    }


    public void initSjcpsy() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "数据产品处室页", this.getUserPrincipal().getUserCode(),"sjjg/sjcpzx/initSjcpsy");
        } catch (Exception e) {

        }
    }

    //查询产品列表

    public void selectlist(CpzxVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.SjcpzxMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    // 查询表头信息

    public void getheader(SjdxglVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        // 查询表头信息
        mapper.selectOne("com.xalt.sjjg.dao.SjcpzxMapper.getheader", param);
        svo.getColumnname();
        log.debug("数据表头：" + svo.getColumnname());
        includeJson(svo.getColumnname());
    }

    //分页查询明细统计

    public void viewthedata(CpzxVo svo, int limit, int offset, String sort, String order) {
        String startDate = svo.getQsj().replaceAll("-", "/");
        String endDate = svo.getZsj().replaceAll("-", "/");
        log.debug("格式化后的起时间：" + startDate);
        log.debug("格式化后的止时间：" + endDate);
        svo.setQsj(startDate);
        svo.setZsj(endDate);
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        log.debug("产品ID：" + svo.getCpid());
//        String cpcxjb = (String)delegateMapper.selectOne("com.xalt.sjjg.dao.SjcpzxMapper.selectCpcxjb",param);
        PaginatedVO vo = delegateMapper.selectPaginated(svo.getCpcxjb(), param, offset, limit);
        includeJson(vo);
    }

    //不分页查询明细统计

    public void viewthedetail(CpzxVo svo) {
        String startDate = svo.getQsj().replaceAll("-", "/");
        String endDate = svo.getZsj().replaceAll("-", "/");
        log.debug("格式化后的起时间：" + startDate);
        log.debug("格式化后的止时间：" + endDate);
        svo.setQsj(startDate);
        svo.setZsj(endDate);
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        log.debug("产品ID：" + svo.getCpid());
        List dataList =  delegateMapper.selectList(svo.getCpcxjb(), param);
        Map<String, Object> rows = Maps.newHashMap();
        rows.put("rows",dataList);
        includeJson(rows);
    }


    //导出到Excel

    public void exportToExcel(CpzxVo svo, String cpmc) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        log.debug("产品名称：" + cpmc);
        log.debug("产品查询路径：" + svo.getCpcxjb());
//        String nowDate = DateUtils.getNowDateStr();
        String fileName = cpmc + "（" + svo.getQsj() + "至" + svo.getZsj() + "）";
        log.debug("Excel文件名：" + fileName);
        //表数据
        List dataList = delegateMapper.selectList(svo.getCpcxjb(), param);
        log.debug("表数据集合：" + dataList);
        //表头
        List sjbt = delegateMapper.selectList("com.xalt.sjjg.dao.SjcpzxMapper.selectSjbtcx", param);
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
                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), dataList, title, columns, fileName);
            } catch (Exception e) {
                log.debug("导出数据异常!");
                e.printStackTrace();
            }
        }
    }

    //处室查询

    public void cpztlist(CpzxVo svo) {
        if (svo == null) {
            svo = new CpzxVo();
        }
        log.debug("svo---->" + svo);
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        List vo = delegateMapper.selectList("com.xalt.sjjg.dao.SjcpzxMapper.cpztlist", param);
        includeJson(vo);
    }

    //查询有数据的处室

    public void csidcx(CpzxVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        String sfygcs = (String) delegateMapper.selectOne("com.xalt.sjjg.dao.SjcpzxMapper.csidcx", param);
        log.debug("是否有该处室数据："+sfygcs);
        includeJson(sfygcs);
    }


    public void queryPc(CpzxVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = new HashMap<>();
        param.put("svo", svo);
        String sfygcs = (String) delegateMapper.selectOne("com.xalt.sjjg.dao.SjcpzxMapper.csidcx", param);
        log.debug("是否有该处室数据："+sfygcs);
        includeJson(sfygcs);
    }

}
