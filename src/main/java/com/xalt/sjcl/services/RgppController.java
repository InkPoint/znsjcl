package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.RgppVo;
import com.xalt.sjzd.model.SjxVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win7 on 2017/11/20.
 * 人工匹配
 * User:CuiHeng
 */
@Controller
public class RgppController extends WebServiceSupport {
    @Inject
    private Logger log;


    public void initRgpp() {
    }

    //指定单位下拉框查询

    public void selectZddw() {
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjcl.dao.RgppMapper.selectZddw");
        includeJson(vo);
    }

    //人工匹配默认信息查询

    public void list(RgppVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.RgppMapper.selecttAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //匹配源信息查询

    public void selectPpy(RgppVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.RgppMapper.selectPpy", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //纳税人原始信息查询

    public void viewthedata(RgppVo svo) {
        if(svo == null){
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        List columnlist = delegateMapper.selectList("com.xalt.sjcl.dao.RgppMapper.selectLm",param);
        String columns = "";//获取查询列
        if (columnlist != null && !columnlist.isEmpty()){
            for(int i = 0; i<columnlist.size(); i++){
                Object obj = columnlist.get(i);
                if (obj != null) {
                    SjxVo vos = (SjxVo) obj;
                    if (i == 0){
                        columns = vos.getSjxmcyw();
                    }else{
                        columns = columns + "," + vos.getSjxmcyw();
                    }
                }
            }
        }
        //原表英文名
        String ybywm = svo.getYbywm();
        //原表字段
        String ybzd = svo.getYbzd();
        //匹配值
        String ppz = svo.getPpz();
      //  if(ybywm != "" && ybywm != null ){
            //拼接查询sql
            String ysbsql = "select " + columns + " from " + ybywm + " where " + ybzd + "=" + "'" + ppz + "'";
            Map<String, Object> parmas = new HashMap<String, Object>();
            parmas.put("ysbsql", ysbsql);
            //查询原始表数据
            List ysbdata = delegateMapper.selectList("com.xalt.sjcl.dao.RgppMapper.selectysb", parmas);
            //获取查询的第一条数据
            Map<String, Object> mymp = new HashMap<>();
            if (ysbdata != null && !ysbdata.isEmpty()) {
                mymp = (Map) ysbdata.get(0);
            }
            //结合列和数据
            List<Map> lastrs = new ArrayList<>();
            for (Object obj : columnlist) {
                SjxVo vo1 = (SjxVo) obj;
                if(!vo1.getSjxmcyw().toUpperCase().equals("DJXH")){
                Map<String, Object> mmp = new HashMap<>();
                mmp.put("columnsyw", vo1.getSjxmcyw());
                mmp.put("columnszw", vo1.getSjxmczw());
                Object coldatas = mymp.get((vo1.getSjxmcyw().toUpperCase()).trim());
                if (coldatas != null) {
                    mmp.put("columndata", coldatas.toString());
                }
                lastrs.add(mmp);
                }
            }
            includeJson(lastrs);
       // }
    }

    //添加指定单位

    public void updateZddw(RgppVo svo) {
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        delegateMapper.update("com.xalt.sjcl.dao.RgppMapper.updateZddw", param);
        includeJson("good");
    }

    //确认匹配

    public void qrpp(RgppVo svo) {
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        int msg = delegateMapper.update("com.xalt.sjcl.dao.RgppMapper.qrpp", param);
        if (msg == 0) {
            //0失败
            includeJson("0");
        } else {
            //1成功
            includeJson("1");
        }

    }
    //得到表头

    public void ckbt(RgppVo svo){
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("djxh","djxh");
        //将原表的表头遍历出来
        List columnlist = delegateMapper.selectList("com.xalt.sjcl.dao.RgppMapper.selectLm",param);
        List<Map> results =new ArrayList<Map>();
        Map<String,Object> bt = Maps.newHashMap();
        bt.put("field","");
        bt.put("checkbox","true");
        bt.put("align","center");
        bt.put("clickToSelect","true");
        results.add(bt);
        String sjxmcyw = "";
        String sjxmczw = "";
        if(columnlist != null && !columnlist.isEmpty()){
            for(int i =0; i<columnlist.size();i++){
                Object obj = columnlist.get(i);
                if(obj!= null){
                    SjxVo vo = (SjxVo) obj;
                    if(!vo.getSjxmcyw().toUpperCase().equals("DJXH")){
                    sjxmcyw = vo.getSjxmcyw().toUpperCase();
                    sjxmczw = vo.getSjxmczw().toUpperCase();
                    //不显示匹配的东西
                    Map<String,Object> rows = Maps.newHashMap();
                    rows.put("field",sjxmcyw);
                    rows.put("align","center");
                    rows.put("title",sjxmczw);
                    results.add(rows);
                   }
                }
            }

            includeJson(results);
        }
        else {
            includeJson("原表中的不存在多的字段");
        }
    }
    //模态框中的查询

    public void modalview(RgppVo svo, int limit, int offset, String sort, String order){
        if(svo == null){
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> parma = Maps.newHashMap();
        parma.put("svo",svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.RgppMapper.modalview", parma, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }
    //手动添加登记序号

    public void sdupdatedjxh(String ybywm,String srdjxh,String ybid){
            int flag = 0;
            DelegateMapper delegateMapper = getMapper();
            Map<String,Object> param = Maps.newHashMap();
            param.put("ybywm",ybywm);
            param.put("srdjxh",srdjxh);
            param.put("ybid",ybid);
//            //判断是否有djxh这个字段在原表里面
//            int bz = (Integer)delegateMapper.selectOne("com.xalt.sjcl.dao.RgppMapper.hasdjxh", param);
//            if(bz == 0){
//                delegateMapper.update("com.xalt.sjcl.dao.RgppMapper.adddjxh",param);
//            }else{
                flag = delegateMapper.update("com.xalt.sjcl.dao.RgppMapper.htdjxh",param);
//            }
            if(flag!=0){
                includeJson("手动匹配成功！");
            }else {
                includeJson("手动匹配失败");
            }


    }
    //判断原表中匹配值相同的记录有多少条 如果没有 给数据项表加一行数据登记序号 给原表加djxh字段

    public void pdsjgs(RgppVo svo){
        if (svo == null) {
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
//        param.put("djxh","djxh");
        //判断是否有djxh这个字段在原表里面
//        int bz = (Integer)delegateMapper.selectOne("com.xalt.sjcl.dao.RgppMapper.hasdjxh", param);
//        if(bz == 0){
//            //给数据项加djxh字段
//            delegateMapper.insert("com.xalt.sjcl.dao.RgppMapper.insertsjx",param);
//            delegateMapper.update("com.xalt.sjcl.dao.RgppMapper.adddjxh",param);
//        }
        List list = delegateMapper.selectList("com.xalt.sjcl.dao.RgppMapper.modalview", param);
        int flag = list.size();
        Map<String,Object> result = Maps.newHashMap();
        if(flag <= 1){
            result.put("flag",0);
        }else{
            result.put("flag",1);
        }
        includeJson(result);
    }

}
