package com.xalt.sjcl.services;

import br.com.caelum.vraptor.Controller;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjcl.model.ClmxcxVo;
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
 * Created by win7 on 2017/11/27.
 * 处理明细查询
 */

@Controller
public class ClmxcxController extends WebServiceSupport {

    @Inject
    private Logger log;

    @Inject
    private CharCloudyUtil utils;


    public void initClmxcx() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"处理明细查询",this.getUserPrincipal().getUserCode(),"sjcl/clmxcx/initClmxcx");
        }catch (Exception e){

        }
    }

    //基本分页查询(处理明细)

    public void list(ClmxcxVo svo, int limit, int offset, String sort, String order) {
        if (svo == null) {
            svo = new ClmxcxVo();
        }
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        PaginatedVO vo = delegateMapper.selectPaginated("com.xalt.sjcl.dao.ClmxcxMapper.selectClmx", param, offset, limit);
        if(vo!=null){
            for(int i=0;i<vo.getRows().size();i++){
                ClmxcxVo vos = (ClmxcxVo)vo.getRows().get(i);
                if(vos.getCllx().equals("0")){
                    vos.setCllx("数据清洗");
                }else if(vos.getCllx().equals("1")){
                    vos.setCllx("数据匹配");
                }
            }
        }
//        Map<String, Object> results = new HashMap<String, Object>();
//        results.put("total", vo.getPageCount());
//        results.put("rows", vo.getRows());
        includeJson(vo);

    }
    // 导出

    public void exportData(SjdxglVo svo,String filename){
        DelegateMapper delegateMapper = getMapper();
        if (svo == null) {
            svo = new SjdxglVo();
        }
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        List lists=delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.exportData",param);
        List sjxxx=delegateMapper.selectList("com.xalt.sjzd.dao.SjdxglMapper.sjxinfo",param);
        if(sjxxx!=null&&sjxxx.size()>0){
            String[] title=new String[sjxxx.size()];
            String[] columns=new String[sjxxx.size()];
            for(int i=0;i<sjxxx.size();i++){
                SjxVo vo=(SjxVo)sjxxx.get(i);
                title[i]=vo.getSjxmczw();
                columns[i]=vo.getSjxmcyw();
            }
            try{
                ExpertDataUtil.doPostExecute(this.getRequest(), this.getResponse(), lists, title, columns,filename);
            }catch(Exception e){
                log.debug("导出数据异常!");
                e.printStackTrace();
            }
        }
//        includeJson("执行成功！");
    }
    //调用存储过程实时更新数据

    public void callprocedure(){
        DelegateMapper delegateMapper = getMapper();
        //没有执行存储过程之前的数据总量
//        Object slbegin = delegateMapper.selectOne("com.xalt.sjcl.dao.ClmxcxMapper.sjzl");
//        int slq=Integer.parseInt(slbegin.toString());
        delegateMapper.selectList("com.xalt.sjcl.dao.ClmxcxMapper.callprocedure");
        //执行之后的数据总量
//        Object slend = delegateMapper.selectOne("com.xalt.sjcl.dao.ClmxcxMapper.sjzl");
//        int slz=Integer.parseInt(slend.toString());
//        String message = "此次共更新数据:"+(slz-slq)+"条";
        includeJson("执行成功");
    }
    //判断英文表名是否存在

    public void hasywbm(ClmxcxVo svo){
        Map<String,Object> param = Maps.newHashMap();
        param.put("svo",svo);
        DelegateMapper delegateMapper = getMapper();
        //判断原表是否存在
        Object obj = delegateMapper.selectOne("com.xalt.sjcl.dao.ClmxcxMapper.hasywbm",param);
        int bz = Integer.parseInt(obj.toString());
        if(bz==0){
            includeJson("0");//0就是原表不存在
        }else{
            //查看原表的字段有哪些
            List ybzdz = delegateMapper.selectList("com.xalt.sjcl.dao.ClmxcxMapper.ybzdz",param);
            String ynzdtext= " ";
            if(ybzdz.size()!=0){
                for(int i = 0;i<ybzdz.size();i++){
                    Object zdz = ybzdz.get(i);
                    if(zdz != null){
                        ClmxcxVo vos = (ClmxcxVo) zdz;
                        if(i==0){
                            ynzdtext = "'"+vos.getColumnname().toUpperCase().trim()+"'";
                        }else{
                            ynzdtext = ynzdtext+","+"'"+vos.getColumnname().toUpperCase().trim()+"'";
                        }
                    }
                }
            }
            param.put("columns",ynzdtext);
            //查看字段是否在数据项表里面存在
            Object sjxzd = delegateMapper.selectOne("com.xalt.sjcl.dao.ClmxcxMapper.sjxhas", param);
            int sjxbz = Integer.parseInt(sjxzd.toString());
            if(sjxbz==0){
                includeJson("1");//1原表中的字段在数据项表里面不存在
            }
            else{
                includeJson("2");
            }



        }
    }

}

