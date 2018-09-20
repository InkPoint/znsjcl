package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.YhscxVO;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: WangPengWen
 * Date: 2018-4-20
 * 一户式查询
 */
@Controller
public class YhscxController extends WebServiceSupport {
    @Inject
    private Logger log;


    public void initYhscx() {
    }


    public void initViewDetail() {
    }

    /**
     * 纳税人信息表
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */

    public void taxdata(YhscxVO svo, int limit, int offset, String sort, String order) {
        String[] columne = {"nsrmc", "nsrsbh", "fddbrxm", "nsrztmc", "zcdz", "scjydz", "djzclxmc", "hymc", "fj", "ks", "swryxm", "kqccsztdjbz"};
        if (svo.getNsrmc() != null) {
            String[] strings = svo.getNsrmc().split("\\s+");
            String conditions = "";
            for (int k = 0; k < strings.length; k++) {
                String s = "";
                for (int i = 0; i < columne.length; i++) {
                    if (columne[i] != null && !"".equals(columne[i])) {
                        if (i == 0) {
                            s = "(" + columne[i] + " like '%" + strings[k] + "%'  ";
                        } else if (i == columne.length - 1) {
                            s = s + "or " + columne[i] + " like '%" + strings[k] + "%'  )";
                        } else {
                            s = s + "or " + columne[i] + " like '%" + strings[k] + "%'  ";
                        }
                    }
                }
                if (k == 0) {
                    conditions = s;
                } else {
                    conditions = conditions + " " + svo.getConditions() + " " + s;
                }
            }
            svo.setNsrmc(conditions);
            log.debug("conditions:" + conditions);
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjyj.dao.YhscxMapper.taxdata", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    /**
     * 获取表名
     *
     * @param svo
     */
    public void getTableName(YhscxVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.sjyj.dao.YhscxMapper.getTableName", param);
        includeJson(list);
    }

    /**
     * 一户式(明细)
     *
     * @param
     */

    public void checkTheDetails(YhscxVO svo) {
        try {
            DelegateMapper delegateMapper = getMapper();
            Map<String, Object> param = Maps.newHashMap();
            param.put("svo", svo);
            List ss = delegateMapper.selectList("com.xalt.sjyj.dao.YhscxMapper.checkTheDetails",param);
            List ss1 = new ArrayList();
            Map<String, Object> m1 = new HashMap<String, Object>();
            if (ss != null && ss.size() > 0) {
                for (Object m : ss) {
                    Map mm = (Map) m;
                    Map<String, Object> mk = new HashMap<String, Object>();
                    mk.put("bm", mm.get("BM") == null ? "" : mm.get("BM").toString());
                    mk.put("tabname", mm.get("TABNAME") == null ? "" : URLEncoder.encode(mm.get("TABNAME").toString(), "UTF-8"));
                    ss1.add(mk);
                }
            }
            includeJson(ss1);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取Model中的bootstrap-table表列名
     *
     * @param svo
     */

    public void getHeader(YhscxVO svo)throws NullPointerException{
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询列名
        List header = null;
        try {
            header = mapper.selectList("com.xalt.sjyj.dao.YhscxMapper.columnName", param);
        } catch (Exception e) {
            e.printStackTrace();
        }
        includeJson(header);
    }

    /**
     * 动态获取Model中的bootstrap-table表数据
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */

    public void presentData(YhscxVO svo, int limit, int offset, String sort, String order)throws NullPointerException{
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //获取表数据信息
        PaginatedVO alldatas = null;
        try {
            alldatas = mapper.selectPaginated("com.xalt.sjyj.dao.YhscxMapper.presentData", param, offset, limit);
        } catch (Exception e) {
            e.printStackTrace();
        }
        includeJson(alldatas);
    }
}
