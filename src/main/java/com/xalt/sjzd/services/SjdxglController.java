package com.xalt.sjzd.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjzd.model.ExpertDataUtil;
import com.xalt.sjzd.model.SjdxglVo;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by win7 on 2017/10/24.
 * 数据对象管理
 */
@Controller
public class SjdxglController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initSjdxgl() {
        DelegateMapper mapper = getMapper();
        try{
              utils.addCloudydata(mapper,"数据对象管理",this.getUserPrincipal().getUserCode(),"sjzd/sjdxgl/initSjdxgl");
        }catch (Exception e){

        }

    }


    public void initSjdxglAdd() {
    }


    public void initSjdxglEdit() {
    }

    // 数据对象管理基本分页查询

    public void list(SjdxglVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new SjdxglVo();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjzd.dao.SjdxglMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        log.debug("vo", vo);
        includeJson(vo);

    }

    // 数据项基本分页查询

    public void sjxList(SjxVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        if (svo == null) {
            svo = new SjxVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.sjzd.dao.SjdxglMapper.sjxAll", param, offset, limit);
        includeJson(vo);

    }

    /**
     * 数据分区 (下拉菜单)
     */

    public void getSjfqTree() {
        DelegateMapper mapper = getMapper();
        //数据载入数据加载
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.fqlist");
        includeJson(vo);

    }

    /**
     * 实体类型 (下拉菜单)
     */

    public void getStlxTree() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.stlist");
        includeJson(vo);

    }

    /**
     * 数据来源（下拉树形菜单）
     */

    public void getSjlyTree() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.lylist");
        includeJson(vo);
    }

    //数据来源(下拉菜单)

    public void datasurce() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.datasurce");
        includeJson(vo);
    }

    /**
     * 业务标签管理（下拉树形菜单）
     */

    public void getYwbqTree() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.ywbqList");
        includeJson(vo);
    }

    /**
     * 数据项(保存数据)
     * datalist  数据项字符串
     * svo   数据对象
     */

    public void savedata(String datalist, SjdxglVo svo) {
        String mysql = "";
        List list = JsonObjectToJava.getListByArray(SjxVo.class, datalist);
        //SjdxglVo
        //循环拼接字段
        //表名信息拼接
        //字段信息拼接
        String sqls = "create table " + svo.getDxmcyw() + " ( \n";
        for (int i = 0; i < list.size(); i++) {
            SjxVo vo = (SjxVo) list.get(i);
            if (vo != null) {
                if (i < list.size() - 1) {
                    sqls = sqls + vo.getSjxmcyw() + " " + vo.getSjxlx() + ", \n";
                } else {
                    sqls = sqls + vo.getSjxmcyw() + " " + vo.getSjxlx() + "\n";
                }

            }
        }
        sqls = sqls + ")";
        log.debug("sqls" + sqls);
        DelegateMapper mapper = getMapper();
        Map dx = new HashMap<String, Object>();
        svo.setCjr(this.getUserPrincipal().getUserCode());
        dx.put("svo", svo);
        //插入数据对象信息到数据对象表中
        mapper.insert("com.xalt.sjzd.dao.SjdxglMapper.insertsjdx", dx);
        List checks = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.sjdxbyname", dx);
        SjdxglVo mvo = null;
        if (checks != null || !checks.isEmpty()) {
            mvo = (SjdxglVo) checks.get(0);
            svo.setDxid(mvo.getDxid());
        }

        //插入数据项信息到数据项表中
        for (Object obj : list) {
            SjxVo vos = (SjxVo) obj;
            vos.setDxid(svo.getDxid());
            vos.setSjdxmcyw(svo.getSjdxmcyw());
            log.debug("vos", vos);
            Map ms = new HashMap<String, Object>();
            ms.put("svo", vos);
            ms.put("bqid",svo.getBqid());
            mapper.insert("com.xalt.sjzd.dao.SjdxglMapper.insertsjx", ms);
        }
        Map mp = new HashMap<String, Object>();
        mp.put("mysql", sqls);
        //创建表
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.createdx", mp);
        includeJson("执行成功!");

    }

    /**
     * 数据项(修改数据)
     */

    public void updatedata(SjxVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //修改数据项数据
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.updatedata", param);
        if (!svo.getSjxmcyw().equals(svo.getOldcolumn())) {
            //修改列名
            mapper.update("com.xalt.sjzd.dao.SjdxglMapper.editcolumn", param);
        }
        //修改列类型
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.editcolumntype", param);
        includeJson("修改成功");
    }

    /**
     * 数据对象(修改表信息)
     */

    public void updatetable(SjdxglVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.updatetable", param);
        includeJson("修改成功!");
    }

    /**
     * 数据对象管理_删除
     */

    public void deleteList(SjdxglVo svo) {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        log.debug("ids:" + svo);
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.deletesjxdata", param);
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.deleteList", param);
        //删除源表
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.deletetable", param);
        includeJson("删除成功！");
    }

    /**
     * 数据项(修改)_获取所有编辑数据
     */

    public void editData(SjdxglVo svo) {
        //实体类型
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List jbxx = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.editTable", param);
        List stlx = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.stlist");
        List sjly = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.datasurce");
        List sjfq = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.fqlist");
        List sjjb = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.jblist");
        Map<String, Object> alldata = Maps.newHashMap();
        alldata.put("jbxx", jbxx);
        alldata.put("stlx", stlx);
        alldata.put("sjly", sjly);
        alldata.put("sjfq", sjfq);
        alldata.put("sjjb", sjjb);
        includeJson(alldata);

    }

    // 数据项基本分页查询

    public void viewthedata(SjdxglVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //获取表数据信息
        PaginatedVO alldatas = mapper.selectPaginated("com.xalt.sjzd.dao.SjdxglMapper.querytab", param, offset, limit);
        includeJson(alldatas);

    }

    // 数据项基本分页查询

    public void getheader(SjdxglVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        // 查询表头信息
        List collumns = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.viewdata", param);
        includeJson(collumns);
    }

    // 导出

    public void exportData(SjdxglVo svo, String filename) {
        DelegateMapper delegateMapper = getMapper();
        if (svo == null) {
            svo = new SjdxglVo();
        }
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List lists = delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.exportData", param);
        List sjxxx = delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.sjxinfo", param);
        if (sjxxx != null && sjxxx.size() > 0) {
            String[] title = new String[sjxxx.size()];
            String[] columns = new String[sjxxx.size()];
            for (int i = 0; i < sjxxx.size(); i++) {
                SjxVo vo = (SjxVo) sjxxx.get(i);
                title[i] = vo.getSjxmczw();
                columns[i] = vo.getSjxmcyw();
            }
            try {
                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), lists, title, columns, filename);
            } catch (Exception e) {
                log.debug("导出数据异常!");
                e.printStackTrace();
            }
        }
        includeJson("执行成功！");
    }

    // 生成采集模板

    public void formworkData(SjdxglVo svo, String filename) {
        DelegateMapper delegateMapper = getMapper();
        if (svo == null) {
            svo = new SjdxglVo();
        }
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List lists = delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.exportData", param);
        List sjxxx = delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.sjxinfo", param);
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
                log.debug("导出数据异常!");
                e.printStackTrace();
            }
        }
    }

    //数据项(添加)

    public void adddata(SjxVo svo) {
        if (svo == null) {
            svo = new SjxVo();
        }
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.adddata", param);
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.addcolumn", param);
        includeJson("添加成功!");
    }

    // 校验当前级别名称的唯一性

    public void namevalidation(String englishname) {
        boolean result = true;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        SjdxglVo svo = new SjdxglVo();
        svo.setDxmcyw(englishname);
        param.put("svo", svo);
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.namevalidation", param);
        if (vo != null && vo.size() > 0) {
            result = false;
        }
        Map<String, Boolean> map = new HashMap<>();
        map.put("valid", result);
        includeJson(map);
    }

    //数据项_删除

    public void deldata(SjxVo svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //在znsjcl_dm_sjx中把相关列名置为“N”
        mapper.update("com.xalt.sjzd.dao.SjdxglMapper.delsjxdata", param);
        //置为不可用
        mapper.delete("com.xalt.sjzd.dao.SjdxglMapper.removecolumn", param);
        //释放
        mapper.delete("com.xalt.sjzd.dao.SjdxglMapper.release", param);
        includeJson("删除成功!");
    }

    /**
     * 业务标签(下拉菜单)
     */

    public void businessTag() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.businessTag");
        includeJson(vo);
    }
}
