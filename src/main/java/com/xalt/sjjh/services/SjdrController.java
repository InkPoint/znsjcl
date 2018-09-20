package com.xalt.sjjh.services;


import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.Sjwjsc;
import com.xalt.utils.ExpertData;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lihui on 2017/11/8.
 */
@Controller
public class SjdrController extends WebServiceSupport {
    @Inject
    private Logger log;


    @Inject
    Environment environment;


    public void  sjdr(){
    }

    //获取自主导入数据信息

    public void getTableData(String pcmc,String wjmc){

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("pcmc", pcmc);
        param.put("wjmc", wjmc);
        List<Sjwjsc> dataList = delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.search", param);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("childrens", dataList);
        includeJson(dataList);
    }

    /*删除页面数据*/

    public void delTableData(String drid){

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("drid", drid);

        delegateMapper.update("com.xalt.sjdr.dao.SjdrMapper.delete", param);
        getTableData("","");
    }


    /*页面数据*/

    public void saveTableData(String drid,String wjmc,String wjlx,String wjdx,String pc,String sjb){

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("drid", drid);
        param.put("wjmc", wjmc);
        param.put("wjlx", wjlx);
        param.put("wjdx", wjdx);
        param.put("pc", pc);
        param.put("sjb",sjb);
        //      delegateMapper.insert("com.xalt.sjdr.dao.SjdrMapper.savedata", param);
        //将该文件对应的数据保存到数据库
        //获取数据表对应数据项
        List sjxobj= delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.sjxlists", param);

        String filepath="D:/uploadfiles/"+wjmc+".xls";
        ExpertData ed=new ExpertData();
        try{
            List ls= ed.readExcel(filepath);
            //循环插入数据
            for(int i=0;i<ls.size();i++){
                //值信息
                Map mr=(Map)ls.get(i);
                //列信息
                if(mr!=null&&mr.size()>0&&mr.size()==sjxobj.size()){
                    int msize=mr.size();
                    String columstr="";
                    String valuestr="";
                    //循环拼数据
                    for(int r=0;r<msize;r++){
                          Map sjxmp=(Map)sjxobj.get(r);
                          String ywmc=sjxmp.get("SJXMCYW").toString();
                          String sjlx=sjxmp.get("SJXLX").toString();
                            //拼接表的列
                            if("".equals(columstr)){
                                columstr=ywmc;
                            }else{
                                columstr=columstr+","+ywmc;
                            }
                             Object  value1=mr.get("obj"+r);
                            //拼接值的字符串
                            if("".equals(valuestr)){
                                if((sjlx.toUpperCase()).contains("VARCHAR")){
                                    valuestr="'"+value1+"'";
                                }else if((sjlx.toUpperCase()).equals("DATE")){
                                    valuestr="to_date('"+value1+"','yyyy-mm-dd')";
                                }else if((sjlx.toUpperCase()).equals("NUMBER")){
                                    valuestr="to_number('"+value1+"')";
                                }
                            }else{
                                if((sjlx.toUpperCase()).contains("VARCHAR")){
                                    valuestr=valuestr+",'"+value1+"'";
                                }else if((sjlx.toUpperCase()).equals("DATE")){
                                    valuestr=valuestr+"to_date('"+value1+"','yyyy-mm-dd')";
                                }else if((sjlx.toUpperCase()).equals("NUMBER")){
                                    valuestr=valuestr+"to_number('"+value1+"')";
                                }
                            }
                    }

                    String psql="insert into "+sjb+"("+columstr+") values("+valuestr+")";
                    log.debug("执行的sql："+psql);
                    Map<String,Object> mm=new HashMap<String,Object>();
                    mm.put("psql",psql);
                    delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.insertsjb",mm) ;
                }
            }
            log.debug("ls---->"+ls);
            delegateMapper.update("com.xalt.sjdr.dao.SjdrMapper.updatedrbz",param);
            getTableData("","");
        } catch (Exception e){
            includeJson("执行失败");
            e.printStackTrace();
        }
    }

    /*获取文件名称下拉菜单的数据*/

    public void getWjmcData(){
        DelegateMapper delegateMapper = getMapper();
        List<Sjwjsc> dataList = delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.getWjmcData");
        List<Sjwjsc>  tabList = delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.getSjdxList");
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("childrens", dataList);
        results.put("tabList", tabList);
        includeJson(results);
    }

    /*获取批次下拉菜单的数据*/

    public void getPcData(){
        DelegateMapper delegateMapper = getMapper();
        List<Sjwjsc> dataList = delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.getPcData");
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("childrens", dataList);
        includeJson(dataList);
    }


}
