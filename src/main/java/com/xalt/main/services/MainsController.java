package com.xalt.main.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import com.alibaba.fastjson.JSON;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.main.model.BaseChartVo;
import com.xalt.utils.EchartsUtils;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 首页消息提示查询
 * user controller
 */
@Controller
public class MainsController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;




    //首页提示消息框中的任务新
    @NoLoginValidate
    public void infolist(){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> mm=new HashMap<>();
        mm.put("zxr",this.getUserPrincipal().getUserCode());
//      查询交换数据
        List list=delegateMapper.selectList("com.xalt.main.dao.MainsMapper.infolist",mm);
        Map<String,Object> alldata=new HashMap<String,Object>();
        if(list==null||list.size()==0){
            alldata.put("infolist","0");
        }else{
            alldata.put("infolist",list);
        }


        includeJson(alldata);

    }

    //
    @NoLoginValidate
    public void bztxinfo(){
        DelegateMapper delegateMapper = getMapper();
    //      查询交换数据
        List list=delegateMapper.selectList("com.xalt.main.dao.MainsMapper.bztxinfo");
        Map<String,Object> alldata=new HashMap<String,Object>();
        if(list==null||list.size()==0){
            alldata.put("infolist","0");
        }else{
            alldata.put("infolist","1");
        }

        includeJson(alldata);

    }

    // 首页菜单权限数据显示控制数据
    @NoLoginValidate
    public void menuinfo(){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> mm=new HashMap<>();
        Map<String,Object> results=new HashMap<>();
        mm.put("usercode",this.getUserPrincipal().getUserCode());
        //查询交换数据
        List list=delegateMapper.selectList("com.xalt.main.dao.MainsMapper.menuinfo",mm);
        List list1=new ArrayList();
        List list2=new ArrayList();
        List list3=new ArrayList();
        List list4=new ArrayList();
        List list5=new ArrayList();
        List list6=new ArrayList();
        List list7=new ArrayList();

        if(list!=null&&list.size()>0){
            for(Object ob:list){
                   Map ma=(Map)ob;
                   String munuid=ma.get("MENUID").toString();
                   if(!munuid.isEmpty()){
                       String[] arr=munuid.split("_");
                       if("1".equals(arr[1])){
                           list1.add(arr[0]);
                       }else if("2".equals(arr[1])){
                           list2.add(arr[0]);
                       }else if("3".equals(arr[1])){
                           list3.add(arr[0]);
                       }else if("4".equals(arr[1])){
                           list4.add(arr[0]);
                       }else if("5".equals(arr[1])){
                           list5.add(arr[0]);
                       }else if("6".equals(arr[1])){
                           list6.add(arr[0]);
                       }
                   }
            }
        }
        results.put("list1",list1);
        results.put("list2",list2);
        results.put("list3",list3);
        results.put("list4",list4);
        results.put("list5",list5);
        results.put("list6",list6);
        includeJson(results);

    }
//    添加数据到任务执行队列
    public void addRemindInfo(String rwid,String yxzt){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> mm=new HashMap<>();
        Map<String,Object> results=new HashMap<>();
        mm.put("rwid",rwid);
        //查询交换数据
        if("2".equals(yxzt)){
            delegateMapper.insert("com.xalt.main.dao.MainsMapper.addremind",mm);
        }else if("5".equals(yxzt)){
            delegateMapper.insert("com.xalt.main.dao.MainsMapper.updaterwzt",mm);
        }

        includeJson("1");

    }

    //    获取权限控制数据
    public void permissionInfo(String mkstr){
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> mm=new HashMap<>();
        Map<String,Object> results=new HashMap<>();
        mm.put("mkstr",mkstr);
        mm.put("usercode",this.getUserPrincipal().getUserCode());
        //查询权限数据
        List permissions=delegateMapper.selectList("com.xalt.main.dao.MainsMapper.permissions",mm);
        includeJson(permissions);

    }


    // 获取常用功能查询
    public void selectCygn(){
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("usercode", this.getUserPrincipal().getUserCode());
        List vo = mapper.selectList("com.xalt.main.dao.MainsMapper.selectCygbcx",mp);
        includeJson(vo);
    }

    // 主菜单查询
    public void querymodels(){
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("usercode", this.getUserPrincipal().getUserCode());
        List vo = mapper.selectList("com.xalt.main.dao.MainsMapper.querymodels",mp);
        includeJson(vo);
    }

    // 详细菜单查询
    public void querymenus(String modelid){
        DelegateMapper mapper = getMapper();
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("usercode", this.getUserPrincipal().getUserCode());
        mp.put("modelid", modelid);
        List vo = mapper.selectList("com.xalt.main.dao.MainsMapper.querymenus",mp);
        includeJson(vo);
    }
}
