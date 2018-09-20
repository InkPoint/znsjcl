package com.xalt.demos.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import br.com.caelum.vraptor.observer.download.Download;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.demos.model.DemoVO;
import com.xalt.demos.model.NsrxxVO;
import com.xalt.demos.model.QueryVO;
import com.xalt.demos.util.JsonObjectToJava;
import com.xalt.utils.BigDataExport;
import com.xalt.utils.MyRunnable;
import com.xalt.utils.MyThreadFactory;
import com.xalt.utils.TaskFactory;
import oracle.jdbc.rowset.OracleSerialBlob;
import oracle.jdbc.rowset.OracleSerialClob;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialClob;
import java.io.Reader;
import java.io.StringReader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Blob;
import java.sql.Clob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 2017-10-24
 * 查询基本使用办法
 * user controller
 */
@Controller
public class BasicQueryController extends WebServiceSupport {
    @Inject
    private Logger log;

    @Inject
    Environment environment;

    @NoLoginValidate
    public void initinfo(){
    }

    @NoLoginValidate
    public void initinfo1(){
    }

    //编码转化初始化页面
    @NoLoginValidate
    public void initencode(){
    }

    //初始化wm_concat页面
    @NoLoginValidate
    public void initwminfo(){
    }

    //大数据量导出
    public void bigdataexport(){}

    // 基本分页查询
    @NoLoginValidate
    public void list(QueryVO svo, int limit, int offset, String sort, String order){
        log.debug("limit:"+limit);
        log.debug("offset:"+offset);
        if(svo == null){
            svo = new QueryVO();
        }

        DelegateMapper delegateMapper = getMapper();
        log.debug("===== svo {}", svo);
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        //List vo = delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.selectAll", param);
        PaginatedVO vo=delegateMapper.selectPaginated("com.xalt.demos.dao.BasicQueryMapper.selectAll", param,offset,limit);
        Map<String,Object> results=new HashMap<String,Object>();
        log.debug("vo", vo);
        includeJson(vo);

    }

    @NoLoginValidate
    public void  savedata(String  nsrxxlist,String nsrmc){
        log.debug("nsrxxlist:"+nsrxxlist);
        log.debug("nsrmc:"+nsrmc);

        List  myulist= JsonObjectToJava.getListByArray(NsrxxVO.class,nsrxxlist);

        //创建数据表
         String mysql="" +
                 "create table temp_oldwei_01( \n" +
                 "  id varchar2(100) ,\n" +
                 "  name varchar2(200) \n" +
                 ")";
        DelegateMapper delegateMapper = getMapper();
        Map mp=new HashMap<String,Object>();
        mp.put("mysql",mysql);
        delegateMapper.update("com.xalt.demos.dao.BasicQueryMapper.createtable",mp);
        includeJson("执行成功!");
    }

    //执行job 方法一
    @NoLoginValidate
    public void  calljob(){
        log.debug("执行job方法开始!");

        //创建数据表
        String mysql="" +
                        "declare job number;\n" +
                                "begin\n" +
                                "  sys.dbms_job.submit(job => job,\n" +
                                "                      what => 'test_1120;',\n" +
                                "                      next_date => to_date('25-11-2017', 'dd-mm-yyyy'),\n" +
                                "                      interval => 'null');\n" +
                                "  commit;\n" +
                                "end;\n" +
                                "";

        DelegateMapper delegateMapper = getMapper();
        Map mp=new HashMap<String,Object>();
        mp.put("mysql",mysql);
        delegateMapper.update("com.xalt.demos.dao.BasicQueryMapper.calljobs",mp);
        includeJson("执行成功!");
    }

    //执行job 方法二
    @NoLoginValidate
    public void  calljob1(){
        log.debug("执行job方法开始!");
        DelegateMapper delegateMapper = getMapper();
        String plandate="2017-12-12";
        Map<String,Object> mp=new HashMap<String,Object>();
        mp.put("plandate",plandate);
        delegateMapper.update("com.xalt.demos.dao.BasicQueryMapper.calljobs1",mp);
        includeJson("执行成功!");
    }



    //执行存储过程
    @NoLoginValidate
    public void  callprocedure(){
        log.debug("执行存储过程方法开始!");
        DelegateMapper delegateMapper = getMapper();
        DemoVO  vo=new DemoVO();
        String name="testsss";
        int sex=20;

        Map<String,Object> mp=new HashMap<String,Object>();
        mp.put("NAME",name);
        mp.put("SEX",sex);
        mp.put("RS","");
        delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.callprocedure", mp);
        includeJson("执行成功!");
    }


    //执行存储过程  主要是讲存储过程中传入‘’字符串看能否传递进去，如果可以就不需要其他方法了
    @NoLoginValidate
    public void  callprocedure1(){
        log.debug("执行存储过程方法开始!");
        DelegateMapper delegateMapper = getMapper();
        Map<String,Object> mp=new HashMap<String,Object>();

        mp.put("procename","test_insertdata");
        mp.put("paramstr","'991122','郭德纲'");
        mp.put("startdate","2017-12-15 10:30:10");
        mp.put("oprcycle","0");
        mp.put("rwid","991");
        mp.put("rwmc","房产测试数据2017-12-14");
        mp.put("pc","fc001");
        delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.callprocedure1", mp);

        includeJson("执行成功!");
    }

    //select下拉树数据组织
    public List selectTreeData(List dsource){
        List alldata=new ArrayList();
        if(dsource!=null){
            for(int i =0;i<dsource.size();i++){
                   Map m=(Map)dsource.get(i);
                   String curid=m.get("ID").toString();
                   String  curtext=m.get("TEXT").toString();
                   String  curpid=m.get("PID").toString();

                   for(Object m1:dsource){
                         Map m2=(Map)m1;
                         String curids=m2.get("PID").toString();
                         if(curid.equals(curids)){

                         }
                   }
            }
        }
        return alldata;
    }


    //多线程方法一
    public void  mythreadinfo(){
        log.debug("执行多线程查询（方法一 ）开始!");
        //调用线程工程创建多线程
        DelegateMapper dm= getMapper();
        Map<String,Object> map=new HashMap<>(); 
        MyRunnable mr =new MyRunnable(dm,"com.xalt.demos.dao.BasicQueryMapper.mythreadinfo",map,"selectList");
        new Thread(mr).start();
        includeJson("执行成功!");
    }

    //多线程方法二
    public void  mythreadinfo2(){
        log.debug("执行多线程查询（方法二 ）开始!");
        //调用线程工程创建多线程
        DelegateMapper dm= getMapper();
        Map<String,Object> map=new HashMap<>();
        TaskFactory mr =new TaskFactory();
        mr.selectList(dm,"com.xalt.demos.dao.BasicQueryMapper.mythreadinfo",map);
        includeJson("执行成功!");
    }

    //测试
    @NoLoginValidate
    public void  sendSpecilstr(){
          String str1="134679";
          Map<String,Object>  m=new HashMap<String,Object>();
          m.put("mystr","\'"+str1+"\'");
          includeJson(m);
    }
    public static void main(String[] args){
        List a  =new ArrayList();
        a.add(1);
        a.add(2);
        List b =new ArrayList();
        for(Object r:a){
            b.add(r);
        }
    }


    //执行存储过程svo对象做参数
    @NoLoginValidate
    public void  callprocedure2(){
        log.debug("执行存储过程方法开始!");
        DelegateMapper delegateMapper = getMapper();
        DemoVO  vo=new DemoVO();
        vo.setSex(1);
        vo.setName("理");
        String name="testsss";
        int sex=20;
        Map<String,Object> mp=new HashMap<String,Object>();
        mp.put("svo",vo);
        delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.callprocedure2", mp);
        includeJson("执行成功!");
    }
    //字符串转码
    @NoLoginValidate
    public void  urlencode(){
        log.debug("执行转码方法开会!");
        String  mystr="执行转码方法开会";
        String  encodestr="";
        try{
              encodestr=URLEncoder.encode(mystr,"UTF-8");
              log.debug("执行转码方法开会encodestr:",encodestr);
        }catch (Exception ex){
            encodestr="抓马失败！";
        };
        includeJson(encodestr);
    }

    //字符串解码
    @NoLoginValidate
    public void  urldecode(String  mystr){
        log.debug("执行解码方法开始!");
        String  encodestr="";
        try{
            encodestr= URLDecoder.decode(mystr, "UTF-8");
            log.debug("解码后的字符串encodestr:",encodestr);
        }catch (Exception ex){
            encodestr="解码失败！";
        };
        includeJson(encodestr);
    }


    //保存静态的文本html到数据库 包含了html元素
    public void saveHtml(String jj){
            log.debug("jj:",jj);
        try{
//            Clob clobs=new SerialClob(jj.toCharArray());
//            Blob blobs=new SerialBlob(jj.getBytes());
//            Reader clobreader= new StringReader(jj);

            DelegateMapper delegateMapper = getMapper();
            Map<String,Object> mp=new HashMap<String,Object>();
            mp.put("data1", "153456");
            mp.put("data2",jj);
            mp.put("data3",jj.getBytes());
            delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.saveinfo", mp);
            List ss= delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.getclobs");
            includeJson(ss);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    //保存静态的文本html到数据库 包含了html元素
    public void hqHtml(){
        try{
            DelegateMapper delegateMapper = getMapper();
            List ss= delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.getclobs");
            includeJson(ss);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    //查询含有wm_concat函数的大字段数据
    public void qwmconcat(){
        try{
            DelegateMapper delegateMapper = getMapper();
            List ss= delegateMapper.selectList("com.xalt.demos.dao.BasicQueryMapper.qwmconcat");
            List ss1=new ArrayList();
            Map<String,Object> m1=new HashMap<String,Object>();
            if(ss!=null&&ss.size()>0){
                for(Object m:ss){
                       Map mm=(Map)m;
                       Map<String,Object> mk=new HashMap<String,Object>();
                       mk.put("bm",mm.get("BM")==null?"":mm.get("BM").toString());
                       mk.put("tabname",mm.get("TABNAME")==null?"":URLEncoder.encode(mm.get("TABNAME").toString(), "UTF-8"));
                       ss1.add(mk);
                }
            }
            includeJson(ss1);
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    //大数据量数据导出(本次导出92万条数据，耗时108秒)
    public Download exportBigData(HttpServletResponse response){
        //整理参数
        DelegateMapper delegateMapper = getMapper();
        List excelcolunmlist=new ArrayList();
        excelcolunmlist.add("登记序号");
        excelcolunmlist.add("税收档案编号");
        excelcolunmlist.add("纳税人名称");
        excelcolunmlist.add("法定代表人名称");
        List datacolumnlist=new ArrayList();
        datacolumnlist.add("DJXH");
        datacolumnlist.add("SSDABH");
        datacolumnlist.add("NSRMC");
        datacolumnlist.add("FDDBRXM");
        String filename="纳税人信息.xlsx";
        String basicsheetname="纳税人信息";
        int sheetnums=30000;
        BigDataExport be=new   BigDataExport();
        return be.ExportData(delegateMapper
                ,"com.xalt.demos.dao.BasicQueryMapper.tjsql"
                ,"com.xalt.demos.dao.BasicQueryMapper.bigdataexport"
                ,excelcolunmlist,datacolumnlist,filename,basicsheetname, response,sheetnums);

    }

    //大数据量数据导出(本次导出92万条数据，耗时125秒)
    public Download exportBigData2(HttpServletResponse response){
        //整理参数
        DelegateMapper delegateMapper = getMapper();
        String[] excelcolunmlist={"登记序号","税收档案编号","纳税人名称","法定代表人名称"};
        String[] datacolumnlist={"DJXH","SSDABH","NSRMC","FDDBRXM"};
        String filename="纳税人信息(版本2).xlsx";
        String basicsheetname="纳税人信息版本2";
        int sheetnums=60000;
        BigDataExport be=new   BigDataExport();
        return be.ExportData21(delegateMapper
                ,"com.xalt.demos.dao.BasicQueryMapper.bigdataexport1"
                ,excelcolunmlist,datacolumnlist,filename,basicsheetname, response,sheetnums);

    }

    //大数据量数据导出(本次导出   万条数据，耗时  秒)
    public Download exportBigData3(HttpServletResponse response){
        //整理参数
        DelegateMapper delegateMapper = getMapper();
        String[] excelcolunmlist={"swjg_dm","swjgmc","zsxm_dm","zsxmmc","zspm_dm","sjje","zybl","ssbl","dsbl","qxbl","rkrq","kjrq","bz"};
        String[] datacolumnlist={"swjg_dm","swjgmc","zsxm_dm","zsxmmc","zspm_dm","sjje","zybl","ssbl","dsbl","qxbl","rkrq","kjrq","bz"};
        String filename="明细信息表.xlsx";
        String basicsheetname="明细信息表";
        int sheetnums=60000;
        BigDataExport be=new   BigDataExport();
        return be.ExportData21(delegateMapper
                ,"com.xalt.demos.dao.BasicQueryMapper.bigdataexport2"
                ,excelcolunmlist,datacolumnlist,filename,basicsheetname, response,sheetnums);

    }
}
