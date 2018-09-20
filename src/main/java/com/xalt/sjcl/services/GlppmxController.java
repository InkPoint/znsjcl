package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjcl.model.GlppgzglVO;
import com.xalt.sjcl.model.GlppmxVO;
import com.xalt.sjcl.model.MxgzVO;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.RandomUUID;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 关联匹配规则管理
 * user controller
 */
@Controller
public class GlppmxController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @Inject
    private CharCloudyUtil utils;


    //初始化匹配模型界面

    public void initmx() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"匹配模型管理",this.getUserPrincipal().getUserCode(),"sjcl/glppmx/initmx");
        }catch (Exception e){

        }
    }


    public void addmx() {

    }

    // 基本分页查询

    public void list(GlppmxVO svo, int limit, int offset, String sort, String order) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.GlppmxMapper.selectAll", param, offset, limit);
        includeJson(vo);
    }

    //添加模型部分

    public void add(GlppmxVO svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("curuser", this.getUserPrincipal().getUserCode());
        DelegateMapper delegateMapper = getMapper();
        if (svo.getMxid() == null || svo.getMxid().isEmpty()) {
            delegateMapper.insert("com.xalt.sjcl.dao.GlppmxMapper.insertdata", param);
        } else {
            delegateMapper.update("com.xalt.sjcl.dao.GlppmxMapper.updatedata", param);
        }
        includeJson("执行成功!");
    }


    public void deletes(GlppmxVO svo) {
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        DelegateMapper delegateMapper = getMapper();
        delegateMapper.delete("com.xalt.sjcl.dao.GlppmxMapper.deletes", param);
        delegateMapper.delete("com.xalt.sjcl.dao.GlppmxMapper.deleteschildren", param);
        includeJson("执行成功!");
    }

    //查询模型对应规则

    public void mxgzlist(GlppmxVO svo, int limit, int offset) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.GlppmxMapper.mxgzlist", param, offset, limit);
        includeJson(vo);
    }


    //添加和修改模型和规则关系列信息初始化

    public void initadd(GlppmxVO svo) {
        Map<String, Object> results = Maps.newHashMap();
        if (svo != null) {
            DelegateMapper delegateMapper = getMapper();
            Map<String, Object> param = Maps.newHashMap();
            param.put("svo", svo);
            List basicinfo = delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.basicinfo", param);
            //获取所有表
            List alltab = delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.getalltab", param);
//            //源表字段
//            List yblist=delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.ybcolumns",param);
//            //目标表字段
//            List mbblist=delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.mbbcolumns",param);
//            //规则列表
//            List gzlist=delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.gzlist",param);

//            results.put("yblist",yblist);
//            results.put("mbblist",mbblist);
//            results.put("gzlist",gzlist);
            results.put("alltab", alltab);
            results.put("basicinfo", basicinfo);
        }

        includeJson(results);
    }

    //添加和修改模型和规则关系列信息初始化

    public void initadddownlist(String yb, String mbb) {
        Map<String, Object> results = Maps.newHashMap();

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("yb", yb);
        param.put("mbb", mbb);
        param.put("curuser", this.getUserPrincipal().getUserCode());
        //源表字段
        List yblist = delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.ybcolumns", param);
        //目标表字段
        List mbblist = delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.mbbcolumns", param);
        //规则列表
        List gzlist = delegateMapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.gzlist", param);

        results.put("yblist", yblist);
        results.put("mbblist", mbblist);
        results.put("gzlist", gzlist);
        includeJson(results);
    }


    //添加模型和模型规则关联数据

    public void savedata(GlppmxVO svo) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        //获取模型id
        String mxid = svo.getMxid();
        String oprflag = svo.getOprflag();
        if (oprflag != null && "0".equals(oprflag)) {
            mxid = RandomUUID.getUUIDRandoms();
        }

        if (svo != null) {
            svo.setMxid(mxid);
            //保存模型
            String datastr = svo.getDatastr();
            List myulist = JsonObjectToJava.getListByArray(MxgzVO.class, datastr);
            String gzstrs = "";
            for (Object vo : myulist) {
                MxgzVO kr = (MxgzVO) vo;
                if ("".equals(gzstrs)) {
                    gzstrs = kr.getGzid();
                } else {
                    gzstrs = gzstrs + "," + kr.getGzid();
                }
            }
            svo.setPpgz(gzstrs);
            param.put("svo", svo);
            //保存模型
            if (oprflag != null && "0".equals(oprflag)) {
                //添加数据
                delegateMapper.insert("com.xalt.sjcl.dao.GlppmxMapper.insertdata", param);
            } else {
                //修改数据
                delegateMapper.update("com.xalt.sjcl.dao.GlppmxMapper.updatedata", param);

            }

            //保存模型关系信息
            for (Object vo : myulist) {
                MxgzVO kr = (MxgzVO) vo;
                kr.setMxid(mxid);
                Map<String, Object> param1 = Maps.newHashMap();
                param1.put("svo", kr);
                if (kr.getMxgzid() == null || kr.getMxgzid().isEmpty()) {
                    delegateMapper.insert("com.xalt.sjcl.dao.GlppmxMapper.insertmxgz", param1);
                } else {
                    delegateMapper.update("com.xalt.sjcl.dao.GlppmxMapper.updatemxgz", param1);
                }

            }
        }
        includeJson("执行成功!");
    }


    //循环查询匹配规则信息
    public List Hqppgzlist(List rs, DelegateMapper mapper) {
        List gzlist = new ArrayList();
        for (Object obj : rs) {
            if (obj != null) {
                GlppmxVO vo = (GlppmxVO) obj;
                String ppgzs = vo.getPpgz();
                String zwppgz = "";
                if (ppgzs != null && !ppgzs.isEmpty()) {
                    String[] gzs = ppgzs.split(",");
                    for (int i = 0; i < gzs.length; i++) {
                        //循环查询规则表信息获取规则名称
                        List gzcl = mapper.selectList("com.xalt.sjcl.dao.GlppgzglMapper.selectAllbygzid", gzs[i]);
                        if (gzcl != null && gzcl.size() > 0) {
                            GlppgzglVO vos = (GlppgzglVO) gzcl.get(0);
                            zwppgz = zwppgz + vos.getGzmc();
                        }
                    }
                }
                vo.setPpgzstr(zwppgz);
                gzlist.add(vo);
            }
        }
        return gzlist;
    }
    /**
     * Created with IntelliJ IDEA.
     * User: WangPengWen
     * Date: 2018-2-21
     *添加相关匹配模型
     */
    //规则(下拉菜单)

    public void therules() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.rulesofthemenu");
        includeJson(vo);
    }
    //源数据表、目标数据表(下拉菜单)

    public void tablemenu() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.tablemenu");
        includeJson(vo);
    }
    //自定义处理任务(新增)

    public void newaddition(String datalist, GlppmxVO svo) {
        List<GlppmxVO> list = JsonObjectToJava.getListByArray(GlppmxVO.class, datalist);
        log.debug("转JSON数据=",list.get(0));
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        mapper.update("com.xalt.sjcl.dao.GlppmxMapper.newaddition", param);
        //查询任务ID
        List<GlppmxVO> rwidlist = mapper.selectList("com.xalt.sjcl.dao.GlppmxMapper.viewRwid");
        param.put("mxid", ((GlppmxVO) rwidlist.get(0)).getMxid());
        param.put("ppmxlist", list);
        //批量插入数据项、指标
        mapper.insert("com.xalt.sjcl.dao.GlppmxMapper.addTempdata", param);
        includeJson("新增成功!");
    }
}
