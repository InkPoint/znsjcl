package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.sjcl.model.RgppVo;
import com.xalt.sjzd.model.SjxVo;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.zzfwzx.model.RgppclVo;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by CuiHeng on 2018/4/2.
 * 人工匹配
 */
@Controller
public class RgppclController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;

    //市局匹配
    @NoLoginValidate
    public void initRgppcl() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "自助服务中心—人工匹配", this.getUserPrincipal().getUserCode(),"zzfwzx/rgppcl/initRgppcl");
        } catch (Exception e) {

        }
    }

    //基层局匹配
    @NoLoginValidate
    public void initSdhc() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "自助服务中心—实地核查", this.getUserPrincipal().getUserCode(),"zzfwzx/rgppcl/initSdhc");
        } catch (Exception e) {

        }
    }

    //核查
    @NoLoginValidate
    public void initCyhc() {
        DelegateMapper mapper = getMapper();
        try {
            utils.addCloudydata(mapper, "自助服务中心—抽样核查", this.getUserPrincipal().getUserCode(),"zzfwzx/rgppcl/initCyhc");
        } catch (Exception e) {

        }
    }

    //数据表下拉框查询
    public void selectSjb() {
        DelegateMapper mapper = getMapper();
        List sjb = mapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.selectSjb");  //数据表查询
        List shyy = mapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.selectShyy");//审核原因
        List xffj = mapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.selectZddw");//下发分局
        List ppy = mapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.selectPpyy");//匹配源查询
        List wfppyj_jc = mapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.selectPpyy_jc");//基层局无法匹配原因
        Map<String, Object> param = Maps.newHashMap();
        param.put("sjb", sjb);
        param.put("shyy", shyy);
        param.put("xffj", xffj);
        param.put("ppy", ppy);
        param.put("wfppyj_jc",wfppyj_jc);
        includeJson(param);
    }


    //市局默认表信息查询
    public void selectList(RgppclVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        svo.setPpr(this.getUserPrincipal().getUserCode());
        svo.setPpdw(this.getUserPrincipal().getOrgCode());
        svo.setXfdw(this.getUserPrincipal().getOrgCode());
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.zzfwzx.dao.RgppclMapper.selectAll", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //基层匹配默认信息查询
    public void selectJc(RgppclVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        svo.setXfdw(this.getUserPrincipal().getOrgCode());
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.zzfwzx.dao.RgppclMapper.selectJc", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //核查默认信息查询
    public void selectHc(RgppclVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.zzfwzx.dao.RgppclMapper.selectCyhc", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }



    //匹配信息查询
    public void selecrPpxx(RgppclVo svo, int limit, int offset, String sort, String order) {
        DelegateMapper mapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = mapper.selectPaginated("com.xalt.zzfwzx.dao.RgppclMapper.selectPpys", param, offset, limit);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("total", vo.getPageCount());
        results.put("rows", vo.getRows());
        includeJson(vo);
    }

    //市局确认匹配
    public void qrpp(String datalist,String yblist) {
        int j = 0;
        DelegateMapper delegateMapper = getMapper();
        List  myulist= JsonObjectToJava.getListByArray(RgppclVo.class, datalist);
        List  ybywlist= JsonObjectToJava.getListByArray(RgppclVo.class, yblist);

        for(Object vo:myulist){
            RgppclVo svo=(RgppclVo)vo;
            Map<String, Object> param = Maps.newHashMap();
            param.put("ppr", this.getUserPrincipal().getUserCode());
            param.put("ppdw", this.getUserPrincipal().getOrgCode());
            param.put("ybywlist",ybywlist);
            param.put("svo",svo);
            int msg = delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.qrpp", param);
            j++;
        }

        if (j == 0) {
            //0失败
            includeJson("0");
        } else {
            //1成功
            includeJson("1");
        }

    }

    //基层局确认匹配
    public void qrppjc(String datalist,String xfdw){
        int j = 0;
        DelegateMapper delegateMapper = getMapper();
        List  myulist= JsonObjectToJava.getListByArray(RgppclVo.class, datalist);
        for(Object vo:myulist){
            RgppclVo svo=(RgppclVo)vo;
            Map<String, Object> param = Maps.newHashMap();
            param.put("ppr", this.getUserPrincipal().getUserCode());
            param.put("ppdw", this.getUserPrincipal().getOrgCode());
            param.put("svo",svo);
            int msg = delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.qrppjc", param);
            j++;
        }
        if (j == 0) {
            //0失败
            includeJson("0");
        } else {
            //1成功
            includeJson("1");
        }

    }

    //下发基层分局或者无法匹配
    public void xfjcfj(String wid, String xfdw, String wfpp,String ppz,String ybywm,String yblist) {
        DelegateMapper delegateMapper = getMapper();
        List  ybywlist= JsonObjectToJava.getListByArray(RgppclVo.class, yblist);
        Map<String, Object> param = Maps.newHashMap();
        param.put("ybywlist",ybywlist);
        param.put("wid", wid);
        param.put("ppz",ppz);
        param.put("wfpp", wfpp);
        param.put("ybywm",ybywm);
        param.put("xffj", xfdw);//下发单位
        param.put("xfr", this.getUserPrincipal().getUserCode());//下发人
        param.put("ppr", this.getUserPrincipal().getUserCode());//匹配人
        param.put("ppdw", this.getUserPrincipal().getOrgCode());//部门
        param.put("orgcode",this.getUserPrincipal().getOrgCode());//下发人所在单位
        if ("".equals(xfdw) || null == xfdw) {
            //无法匹配
            delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.rgpp_wfpp", param);
        } else {
            //下发基层
            delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.rgpp_xffj", param);
        }
        includeJson("good");
    }



    //抽样核查(审核通过或者不通过)
    public void selectHcqr(String wid, String wfpp,String wfppyy) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("wid", wid);
        param.put("wfpp", wfpp);
        param.put("wfppyy", wfppyy);
        param.put("hcr", this.getUserPrincipal().getUserCode());
        if ("2".equals(wfpp)) {
            delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.shcg", param);
        } else {
            delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.shbcg", param);

        }
        includeJson("good");
    }

    //匹配单位下拉框查询
    public void ppdwcx(){
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.zddwcx", mp);
        includeJson(vo);
    }


    //基层局无法匹配
    public void jcjwfpp(String wid,  String wfpp,String xfr,String xfdw){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("wid", wid);
        param.put("wfpp", wfpp);
        param.put("xfr",xfr);
        param.put("xffj", xfdw);//下发单位
        //  param.put("xfr", this.getUserPrincipal().getUserCode());//下发人
        param.put("ppr", this.getUserPrincipal().getUserCode());//匹配人
        param.put("ppdw", this.getUserPrincipal().getOrgCode());//部门
        param.put("orgcode",this.getUserPrincipal().getOrgCode());//下发人所在单位

        //判断该数据是否属于当前分局
        if(wfpp.equals("3")){
            delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.jcjbugfj", param);
        }else {
            delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.rgpp_wfpp", param);
        }

        includeJson("yes");
    }


    //市局匹配任务撤销
    public void rwcx(){
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("ppr",this.getUserPrincipal().getUserCode());
        delegateMapper.update("com.xalt.zzfwzx.dao.RgppclMapper.cxcx", param);
        includeJson("ok");
    }

    //抽样核查匹配人下拉框查询
    public void cyhcPpr(){
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.selectHcr", mp);
        includeJson(vo);
    }



    //纳税人原始信息查询
    @NoLoginValidate
    public void viewthedata(RgppVo svo) {
        if(svo == null){
            svo = new RgppVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        List columnlist = delegateMapper.selectList("com.xalt.zzfwzx.dao.RgppclMapper.selectLm",param);
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



}