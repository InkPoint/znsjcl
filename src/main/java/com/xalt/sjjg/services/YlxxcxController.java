package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import com.google.common.collect.Maps;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.YlxxcxVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.ExportExcel;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2018/8/13.
 * User:PengWen Wang
 * 养老信息查询
 */
@Controller
public class YlxxcxController extends WebServiceSupport {
    @Inject
    private Logger logger;
    @Inject
    private CharCloudyUtil utils;


    public void initYlxxcx() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "养老信息查询", this.getUserPrincipal().getUserCode(), "sjjg/ylxxcx/initYlxxcx");
        } catch (Exception e) {

        }
    }

    public void initYl(){}

    /**
     * 养老信息汇总
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */
    public void countAll(YlxxcxVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.YlxxcxMapper.countAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    /**
     * 核算机关 (机关菜单)
     */

    public void organMenu() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjg.dao.YlxxcxMapper.organMenu");
        includeJson(vo);
    }

    /**
     * 经办机构 (机构菜单)
     */

    public void mechanismMenu() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjg.dao.YlxxcxMapper.mechanismMenu");
        includeJson(vo);
    }

    /**
     * 使用POI生成导出Excel
     *
     * @param svo
     * @throws Exception
     */
    public Download exportExcel(YlxxcxVO svo,HttpServletResponse response) throws Exception {
        List<HashMap<String, Object>> listMap = new ArrayList<>();

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List listData = delegateMapper.selectList("com.xalt.sjjg.dao.YlxxcxMapper.exportCountAll", param);
        if (listData.size() > 65000) {
            includeJson("所要导出的数据量不得大于65536，解释权归开发者所有！");
            return null;
        }

        for (Object obj : listData) {
            Map map = (Map) obj;
            HashMap<String, Object> dataMap = new HashMap<>();
            // dataMap.put("XH", map.get("XH"));
            dataMap.put("JFRSBH", map.get("JFRSBH"));
            dataMap.put("SBBH", map.get("SBBH"));
            dataMap.put("JFDWMC", map.get("JFDWMC"));
            dataMap.put("HSJG", map.get("HSJG"));
            dataMap.put("ZGSBJG", map.get("ZGSBJG"));
            dataMap.put("KPRQ", map.get("KPRQ"));
            dataMap.put("ZSSQ", map.get("ZSSQ"));
            dataMap.put("DWJFJS", map.get("DWJFJS"));
            dataMap.put("GRJFJS", map.get("GRJFJS"));
            dataMap.put("JFRS", map.get("JFRS"));
            dataMap.put("DWSJJE", map.get("DWSJJE"));
            dataMap.put("GRSJJE", map.get("GRSJJE"));
            dataMap.put("ZNJ", map.get("ZNJ"));
            dataMap.put("QTGRJF", map.get("QTGRJF"));
            dataMap.put("FK", map.get("FK"));
            dataMap.put("LX", map.get("LX"));
            dataMap.put("RKE", map.get("RKE"));
            dataMap.put("RKRQ", map.get("RKRQ"));
            dataMap.put("PH", map.get("PH"));
            listMap.add(dataMap);
        }

        String title = "tableName";
        String[] rowsName = new String[]{"序号", "缴费人识别号", "社保编码", "缴费单位名称", "核算机关",
                "主管社保机构", "开票日期", "征收属期", "单位缴费基数", "个人缴费基数", "缴费人数",
                "单位实缴金额", "个人实缴金额", "滞纳金", "其它个人缴费", "罚款", "利息",
                "入库额", "入库日期", "票号"};
        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] objs = null;
        for (int i = 0; i < listMap.size(); i++) {
            HashMap<String, Object> data = listMap.get(i);
            objs = new Object[rowsName.length];
            objs[0] = i;
            objs[1] = data.get("JFRSBH");
            objs[2] = data.get("SBBH");
            objs[3] = data.get("JFDWMC");
            objs[4] = data.get("HSJG");
            objs[5] = data.get("ZGSBJG");
            objs[6] = data.get("KPRQ");
            objs[7] = data.get("ZSSQ");
            objs[8] = data.get("DWJFJS");
            objs[9] = data.get("GRJFJS");
            objs[10] = data.get("JFRS");
            objs[11] = data.get("DWSJJE");
            objs[12] = data.get("GRSJJE");
            objs[13] = data.get("ZNJ");
            objs[14] = data.get("QTGRJF");
            objs[15] = data.get("FK");
            objs[16] = data.get("LX");
            objs[17] = data.get("RKE");
            objs[18] = data.get("RKRQ");
            objs[19] = data.get("PH");

            dataList.add(objs);
        }
        ExportExcel ex = new ExportExcel(title, rowsName, dataList);
        return ex.export(response);
        //includeJson("已成功导出数据！");
    }
}
