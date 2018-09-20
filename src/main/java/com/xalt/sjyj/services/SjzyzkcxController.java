package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjyj.model.SjzyzkcxVo;
import com.xalt.sjzd.model.ExpertDataUtil;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/11/28.
 * 数据资源状况查询
 */
@Controller
public class SjzyzkcxController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initSjzyzkcx() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"数据资源状况查询",this.getUserPrincipal().getUserCode(),"sjyj/sjzyzkcx/initSjzyzkcx");
        }catch (Exception e){

        }
    }

    //数据级别 (下拉菜单)

    public void getSjjbTree() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjyj.dao.SjzyzkcxMapper.sjjblist");
        includeJson(vo);
    }

    //数据资源状况查询(表数据)

    public void selectAll(SjzyzkcxVo svo) {
        DelegateMapper mapper = getMapper();
        if (svo == null) {
            svo = new SjzyzkcxVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjyj.dao.SjzyzkcxMapper.selectAll", param);
        includeJson(vo);

    }

    //数据项的查询 通过英文表名查询

    public void sjxList(SjxVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        if (svo == null) {
            svo = new SjxVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //查询所有数据项
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjyj.dao.SjzyzkcxMapper.sjxAll", param, offset, limit);
        includeJson(vo);


    }

    //数据级别的下拉框

    public void sjjbsel() {
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjzyzkcxMapper.sjjbsel");
        includeJson(vo);
    }

    //数据来源的下拉框

    public void sjlysel() {
        DelegateMapper delegateMapper = getMapper();
        List vo = delegateMapper.selectList("com.xalt.sjyj.dao.SjzyzkcxMapper.sjlysel");
        includeJson(vo);
    }

    //判断英文表名是否存在

    public void hasywbm(SjzyzkcxVo svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        Object obj = delegateMapper.selectOne("com.xalt.sjyj.dao.SjzyzkcxMapper.hasyb", param);
        int bz = Integer.parseInt(obj.toString());
        includeJson(bz);
    }

    //生成采集模板

    public void formworkData(SjzyzkcxVo svo, String filename) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        //select * from 原表英文
        List lists = delegateMapper.selectList("com.xalt.sjyj.dao.SjzyzkcxMapper.exportData", param);
        List sjxxx = delegateMapper.selectList("com.xalt.sjyj.dao.SjzyzkcxMapper.sjxinfo", param);
        if (sjxxx != null && sjxxx.size() > 0) {
            String[] title = new String[sjxxx.size()];
            String[] columns = new String[sjxxx.size()];
            for (int i = 0; i < sjxxx.size(); i++) {
                SjxVo vo = (SjxVo) sjxxx.get(i);
                title[i] = vo.getSjxmczw();
                //columns[i]=vo.getSjxmcyw();
                columns[i] = "";
            }
            try {
                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), lists, title, columns, filename);
            } catch (Exception e) {
//                    includeJson("数据异常");
                log.debug("导出数据异常!");
                e.printStackTrace();
            }
        }
    }

    //得到原表的表头

    public void getybheader(SjzyzkcxVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        // 查询表头信息
        List collumns = delegateMapper.selectList("com.xalt.sjyj.dao.SjzyzkcxMapper.getybheader", param);
        includeJson(collumns);
    }

    //查询原表的信息

    public void viewtabledata(SjzyzkcxVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        log.debug("英文表名：" + svo.getYwbm());
        //用原始表名称和匹配数据项去资源目录表中查找匹配中间表
        Map resTbaleMsg = (Map) mapper.selectOne("com.xalt.sjyj.dao.SjzyzkcxMapper.getTableMsg", param);
        param.put("SJYB", resTbaleMsg.get("SJYB"));
        param.put("PPZJB", resTbaleMsg.get("PPZJB"));
        param.put("PPSJX", resTbaleMsg.get("PPSJX"));
        log.debug("1.resTbaleMsg:" + resTbaleMsg);
        log.debug("2.param:" + param);
        log.debug("1.原表名：" + resTbaleMsg.get("SJYB") +
                " 2.匹配中间表：" + resTbaleMsg.get("PPZJB") +
                " 3.匹配数据项：" + resTbaleMsg.get("PPSJX"));
        //获取表数据信息
        PaginatedVO alldatas = mapper.selectPaginated("com.xalt.sjyj.dao.SjzyzkcxMapper.viewtabledata", param, offset, limit);
        includeJson(alldatas);
    }

    //查询总个数

    public void sjzl(SjzyzkcxVo svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        Object ob = delegateMapper.selectOne("com.xalt.sjyj.dao.SjzyzkcxMapper.sjzl", param);
        int zl = Integer.parseInt(ob.toString());
        includeJson(zl);
    }
}
