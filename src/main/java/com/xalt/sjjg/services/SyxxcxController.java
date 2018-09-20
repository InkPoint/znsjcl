package com.xalt.sjjg.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjg.model.SyxxcxVO;
import com.xalt.sjzd.model.ExpertDataUtil;
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
 * Created by win7 on 2018/7/30.
 * User:PengWen Wang
 * 失业信息查询
 */
@Controller
public class SyxxcxController extends WebServiceSupport {
    @Inject
    private Logger logger;
    @Inject
    private CharCloudyUtil utils;


    public void initSyxxcx() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "失业信息查询", this.getUserPrincipal().getUserCode(), "sjjg/syxxcx/initSyxxcx");
        } catch (Exception e) {

        }
    }

    public void initSy(){}

    /**
     * 失业信息汇总
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */
    public void countAll(SyxxcxVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjjg.dao.SyxxcxMapper.countAll", param, offset, limit);
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
        List vo = mapper.selectList("com.xalt.sjjg.dao.SyxxcxMapper.organMenu");
        includeJson(vo);
    }

    /**
     * 经办机构 (机构菜单)
     */

    public void mechanismMenu() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjjg.dao.SyxxcxMapper.mechanismMenu");
        includeJson(vo);
    }

    /**
     * 导出
     *
     * @param svo
     */

    public void exportDate(SyxxcxVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List list = delegateMapper.selectList("com.xalt.sjjg.dao.SyxxcxMapper.countAll", param);
        String[] title = {"序号", "征收UUID", "缴费人识别号", "缴费人名称", "核算机关", "缴费人科所税务机关",
                "申报数据来源", "社保经办机构", "社保编码", "征收项目代码", "征收项目", "征收品目代码",
                "征收品目", "征收子目代码", "征收子目", "费款所属期起止", "缴费人数", "缴费基数", "缴费比例",
                "票证号码", "开票经办人", "开票经办日期", "电子税票号", "入库日期", "入库销号经办人",
                "入库销号经办日期", "实缴金额", "类型说明"};
        String[] columns = {"xh", "zsuuid", "jfrsbh", "jfrmc", "hsjg", "jfrksswjg", "sbsjly", "sbjbjg", "sbbm", "zsxmdm",
                "zsxm", "zspmdm", "zspm", "zszmdm", "zszm", "fkssqz", "jfrs", "jfjs", "jfbl", "pzhm", "kpjbr", "kpjbrq",
                "dzsph", "rkrq", "rkxhjbr", "rkxhjbrq", "sjje", "lxsm"};
        try {
            ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), list, title, columns, "tableName");
        } catch (Exception e) {
            logger.debug("导出数据异常!");
            e.printStackTrace();
        }
    }

    /**
     * 使用POI生成导出Excel
     *
     * @param svo
     * @throws Exception
     */
    public Download exportExcel(SyxxcxVO svo,HttpServletResponse response) throws Exception {
        List<HashMap<String, Object>> listMap = new ArrayList<>();

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List listData = delegateMapper.selectList("com.xalt.sjjg.dao.SyxxcxMapper.exportCountAll", param);
        if (listData.size() > 50000) {
            includeJson("所要导出的数据不得大于五万条，解释权归开发者所有！");
            return null;
        }

        for (Object obj : listData) {
            Map map = (Map) obj;
            HashMap<String, Object> dataMap = new HashMap<>();
            // dataMap.put("XH", map.get("XH"));
            // dataMap.put("ZSUUID", map.get("ZSUUID"));
            dataMap.put("JFRSBH", map.get("JFRSBH"));
            dataMap.put("JFRMC", map.get("JFRMC"));
            dataMap.put("HSJG", map.get("HSJG"));
            dataMap.put("JFRKSSWJG", map.get("JFRKSSWJG"));
            dataMap.put("SBSJLY", map.get("SBSJLY"));
            dataMap.put("SBJBJG", map.get("SBJBJG"));
            dataMap.put("SBBM", map.get("SBBM"));
            dataMap.put("ZSXMDM", map.get("ZSXMDM"));
            dataMap.put("ZSXM", map.get("ZSXM"));
            dataMap.put("ZSPMDM", map.get("ZSPMDM"));
            dataMap.put("ZSPM", map.get("ZSPM"));
            dataMap.put("ZSZMDM", map.get("ZSZMDM"));
            dataMap.put("ZSZM", map.get("ZSZM"));
            dataMap.put("FKSSQZ", map.get("FKSSQZ"));
            dataMap.put("JFRS", map.get("JFRS"));
            dataMap.put("JFJS", map.get("JFJS"));
            dataMap.put("JFBL", map.get("JFBL"));
            dataMap.put("PZHM", map.get("PZHM"));
            dataMap.put("KPJBR", map.get("KPJBR"));
            dataMap.put("KPJBRQ", map.get("KPJBRQ"));
            dataMap.put("DZSPH", map.get("DZSPH"));
            dataMap.put("RKRQ", map.get("RKRQ"));
            dataMap.put("RKXHJBR", map.get("RKXHJBR"));
            dataMap.put("RKXHJBRQ", map.get("RKXHJBRQ"));
            dataMap.put("SJJE", map.get("SJJE"));
            dataMap.put("LXSM", map.get("LXSM"));
            listMap.add(dataMap);
        }

        String title = "tableName";
        String[] rowsName = new String[]{"序号", "缴费人识别号", "缴费人名称", "核算机关", "缴费人科所税务机关",
                "申报数据来源", "社保经办机构", "社保编码", "征收项目代码", "征收项目", "征收品目代码",
                "征收品目", "征收子目代码", "征收子目", "费款所属期起止", "缴费人数", "缴费基数", "缴费比例",
                "票证号码", "开票经办人", "开票经办日期", "电子税票号", "入库日期", "入库销号经办人",
                "入库销号经办日期", "实缴金额", "类型说明"};
        List<Object[]> dataList = new ArrayList<Object[]>();
        Object[] objs = null;
        for (int i = 0; i < listMap.size(); i++) {
            HashMap<String, Object> data = listMap.get(i);
            objs = new Object[rowsName.length];
            objs[0] = i;
            objs[1] = data.get("JFRSBH");
            objs[2] = data.get("JFRMC");
            objs[3] = data.get("HSJG");
            objs[4] = data.get("JFRKSSWJG");
            objs[5] = data.get("SBSJLY");
            objs[6] = data.get("SBJBJG");
            objs[7] = data.get("SBBM");
            objs[8] = data.get("ZSXMDM");
            objs[9] = data.get("ZSXM");
            objs[10] = data.get("ZSPMDM");
            objs[11] = data.get("ZSPM");
            objs[12] = data.get("ZSZMDM");
            objs[13] = data.get("ZSZM");
            objs[14] = data.get("FKSSQZ");
            objs[15] = data.get("JFRS");
            objs[16] = data.get("JFJS");
            objs[17] = data.get("JFBL");
            objs[18] = data.get("PZHM");
            objs[19] = data.get("KPJBR");
            objs[20] = data.get("KPJBRQ");
            objs[21] = data.get("DZSPH");
            objs[22] = data.get("RKRQ");
            objs[23] = data.get("RKXHJBR");
            objs[24] = data.get("RKXHJBRQ");
            objs[25] = data.get("SJJE");
            objs[26] = data.get("LXSM");

            dataList.add(objs);
        }
        ExportExcel ex = new ExportExcel(title, rowsName, dataList);
        return ex.export(response);
        //includeJson("已成功导出数据！");
    }
}
