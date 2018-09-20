package com.xalt.sjjh.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjjh.model.XxcjVO;
import com.xalt.utils.CharCloudyUtil;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * author:WangPengWen
 * Created by win7 on 2018/3/23.
 * 信息采集
 */
@Controller
public class XxcjController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    public void initXxcj() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"水资源信息取用采集",this.getUserPrincipal().getUserCode(),"sjjh/xxcj/initXxcj");
        }catch (Exception e){

        }
    }


    public void initXxcjAdd() {
    }


    public void initXxcjEdit() {
    }

    /**
     * 水源类型 (下拉菜单)
     */

    public void sylxcd() {
        DelegateMapper mapper = getMapper();
        //数据载入数据加载
        List vo = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.sylxcd");
        includeJson(vo);

    }

    /**
     * 取用水行业 (下拉菜单)
     */

    public void qyshycd() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.qyshycd");
        includeJson(vo);

    }

    /**
     * 地下水超采类型（下拉树形菜单）
     */

    public void dxscclxcd() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.dxscclxcd");
        includeJson(vo);
    }

    /**
     * 地下水取水地点供水管网(下拉菜单)
     */

    public void gsgwcd() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.gsgwcd");
        includeJson(vo);
    }

    /**
     * 特殊用水类别（下拉树形菜单）
     */

    public void tsyslbcd() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.tsyslbcd");
        includeJson(vo);
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

    public void taxdata(XxcjVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.xxcj.dao.XxcjMapper.taxdata", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    /**
     * 新增信息
     *
     * @param datalist
     * @param svo
     */

    public void newaddition(String datalist, XxcjVO svo) {
        List<XxcjVO> list = JsonObjectToJava.getListByArray(XxcjVO.class, datalist);
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        svo.setLrr(this.getUserPrincipal().getUserCode());
        param.put("svo", svo);
        mapper.update("com.xalt.xxcj.dao.XxcjMapper.newaddition", param);
        //查询任务ID
        List<XxcjVO> xxcjlist = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.getid");
        param.put("xxcjid", ((XxcjVO) xxcjlist.get(0)).getXxcjid());
        param.put("xxmxlist", list);
        //批量插入明细数据
        mapper.insert("com.xalt.xxcj.dao.XxcjMapper.theDetailData", param);
        includeJson("新增成功!");
    }

    /**
     * 信息采集表
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */

    public void selectAll(XxcjVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.xxcj.dao.XxcjMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    /**
     * 信息明细(表)
     *
     * @param svo
     * @param limit
     * @param offset
     * @param sort
     * @param order
     */

    public void viewthedata(XxcjVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO alldatas = mapper.selectPaginated("com.xalt.xxcj.dao.XxcjMapper.querytab", param, offset, limit);
        includeJson(alldatas);
    }

    /**
     * 删除
     *
     * @param svo
     */

    public void deletedata(XxcjVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.xxcj.dao.XxcjMapper.deletesbyid", param);
        includeJson("删除成功!");
    }

    /**
     * 获取要编辑数据
     *
     * @param svo
     */

    public void editData(XxcjVO svo) {
        //实体类型
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List editdata = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.editTable", param);
        includeJson(editdata);
    }

    /**
     * 信息明细(新增)
     *
     * @param svo
     */

    public void adddata(XxcjVO svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.adddata", param);
        includeJson("新增成功");
    }

    /**
     * 修改数据
     *
     * @param svo
     */

    public void savetheeditor(XxcjVO svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.xxcj.dao.XxcjMapper.editdata", param);
        includeJson("修改成功");
    }

    /**
     * 修改表头信息
     *
     * @param svo
     */

    public void modifytheheader(XxcjVO svo) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.xxcj.dao.XxcjMapper.modifytheheader", param);
        includeJson("修改成功");
    }

    /**
     * 删除明细
     *
     * @param svo
     */

    public void deletethedetail(XxcjVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.insert("com.xalt.xxcj.dao.XxcjMapper.deletethedetail", param);
        includeJson("删除成功!");
    }

    /**
     * 校验是否是金三数据
     *
     * @param svo
     */

    public void checkthenum(XxcjVO svo) {
        boolean result = false;
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List list = mapper.selectList("com.xalt.xxcj.dao.XxcjMapper.checkthenum", param);
        if (list != null && list.size() > 0) {
            result = true;
        }
        includeJson(result);
    }
}
