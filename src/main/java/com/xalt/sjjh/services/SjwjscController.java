package com.xalt.sjjh.services;


import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.environment.Environment;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.collect.Maps;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.sjjh.model.Sjwjsc;
import com.xalt.utils.CharCloudyUtil;
import com.xalt.utils.DateUtils;
import com.xalt.utils.ExpertData;
import com.xalt.utils.FileUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lihui on 2017/11/8.
 * 数据文件上传
 */
@Controller
public class SjwjscController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;


    @Inject
    Environment environment;


    public void initsjwjsc() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"上传文件数据导入",this.getUserPrincipal().getUserCode(),"sjjh/sjwjsc/initsjwjsc");
        }catch (Exception e){

        }
    }


    public void initwjsc() {
    }


    public void test() {
    }

    //获取自主导入数据信息

    public void getTableData(Sjwjsc svo) {

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("cjr", this.getUserPrincipal().getUserCode());
        List<Sjwjsc> dataList = delegateMapper.selectList("com.xalt.sjdr.dao.SjwjscMapper.search", param);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("childrens", dataList);
        includeJson(dataList);
    }


    /*删除页面数据*/

    public void delTableData(String drid) {

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("drid", drid);

        delegateMapper.update("com.xalt.sjdr.dao.SjwjscMapper.delete", param);
    }


    /* *//*上传文件*//*
    @UploadSizeLimit(sizeLimit = 40 * 1024 * 1024, fileSizeLimit = 10 * 1024 * 1024)
    @NoLoginValidate
    public void uploadfile(UploadedFile uploadedFile, String sjly) {

        String savePath = "D:/user/allfiles/";
        File f = new File(savePath);
        if (!f.exists()) {
            f.mkdirs();
        }
            log.debug("sss-->"+sjly);

        log.debug("====>basePath={}", savePath);
        if (uploadedFile != null) {
            log.debug("===>file is {}", uploadedFile.getFileName());
            String fileName = uploadedFile.getFileName();
            String extName = "";
            //扩展名格式：
            if (fileName.lastIndexOf(".") >= 0) {
                extName = fileName.substring(fileName.lastIndexOf("."));
            }
            String fullName = savePath + uploadedFile.getFileName();
            try {
                log.debug("==>文件{}保存成功!", fullName);
                Files.write(ByteInputStream.input2byte(uploadedFile.getFile()), new File(fullName));
            } catch (IOException e) {
                e.printStackTrace();
            }

            //插入数据文件信息到数据库
            String wjmc = fileName.substring(0, fileName.indexOf("."));
            String wjlx = extName.replace(".", "");
            String wjdx = "";
            if (uploadedFile.getSize() > 0) {
                wjdx = getWjdx(uploadedFile.getSize());
            }
            log.debug("wjmc-->" + wjmc);
            log.debug("wjlx-->" + wjlx);
            log.debug("wjdx-->" + wjdx);

            *//*通过页面传递的数据来源反向寻找dxid未完成*//*
            String sjlyid = sjly;
            String dxid = sjlyid;
            *//*保存文件信息到数据库*//*
//            savewjxx(wjmc,wjlx,wjdx);
            savewjxx(wjmc,wjlx,wjdx);

        }
        include("").redirectTo("/sjjh/sjwjsc/sjwjsc");

    }*/
    @UploadSizeLimit(sizeLimit=100*1024*1024, fileSizeLimit=50*1024*1024)
    //fileinput上传文件方法

    public void uploadfile(UploadedFile fileinput) throws Exception{
        InputStream inputStream=fileinput.getFile();
        //      获取项目的所在的根路径
        String basepath="D://uploadfiles//";
        //创建文件临时目录
        File tmpDir=new File(basepath);
        if(!tmpDir.exists()){
            tmpDir.mkdirs();
        }
        ExpertData ed=new ExpertData();
        List column=ed.readExcelColumns(basepath+""+fileinput.getFileName());
        FileUtils.instreamTooutputstream(inputStream,"D:/uploadfiles/"+fileinput.getFileName());
        includeJson(column);
    }

    /*保存文件信息到数据库*/
    public void savewjxx(String wjmc, String wjlx, String wjdx,String pc,String sjb,String solumns,Sjwjsc svo,String rwid,String mbbmc) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("wjmc", wjmc);
        param.put("wjlx", wjlx);
        param.put("wjdx", wjdx);
        param.put("bm", svo.getBm());
        param.put("zdm", svo.getZdm());
        param.put("scr",this.getUserPrincipal().getUserCode());
        String drid= DateUtils.getNowDateStr();
        param.put("drid",drid);
        param.put("rwid",rwid);
        param.put("mbbmc",mbbmc);
        param.put("pc",pc);

        //保存导入记录
        delegateMapper.insert("com.xalt.sjdr.dao.SjwjscMapper.insertwjxx", param);
        //导入数据
        saveTableData(delegateMapper,wjmc,wjlx,wjdx,pc,sjb,solumns,drid);
        //导入完成后修改导入完成标志
        delegateMapper.update("com.xalt.sjdr.dao.SjwjscMapper.updatedrbz",param);
        //导入完成后添加一列
        Map<String,Object> mp=new HashMap<String,Object>();
        mp.put("bm",sjb);
        delegateMapper.selectList("com.xalt.sjdr.dao.SjwjscMapper.addcolum",mp);
        //数据导入完成后向中间表添加字段（任务id与表名称英文）
        delegateMapper.insert("com.xalt.sjdr.dao.SjwjscMapper.insertbywmc", param);

        //判断目标表中有没有批次字段
       int flag = (Integer)delegateMapper.selectOne("com.xalt.sjdr.dao.SjwjscMapper.pcpd", param);
        if(flag>0){
            //增加批次代码
            delegateMapper.update("com.xalt.sjdr.dao.SjwjscMapper.updatePcdm", param);
        }else {
            //增加批次代码列
            delegateMapper.update("com.xalt.sjdr.dao.SjwjscMapper.addPc_dm", param);
            delegateMapper.update("com.xalt.sjdr.dao.SjwjscMapper.updatePcdm", param);
        }

        //导入完成后修改上传状态
        delegateMapper.update("com.xalt.sjdr.dao.SjwjscMapper.updatewjsczt",param);
        includeJson("success");
    }


    /**
     * 数据来源（下拉树形菜单）
     */

    public void getSjlyTree() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.sjdr.dao.SjwjscMapper.sjlylist");
        includeJson(vo);
    }

    /*换算文件大小*/
    public String getWjdx(long size) {
        DecimalFormat df = new DecimalFormat("#.00");
        String wjdx = "";
        if (size < 1024) {
            wjdx = "1KB";
        } else if (size < 1048576) {
            wjdx = df.format((double) size / 1024) + "KB";
        } else if (size < 1073741824) {
            wjdx = df.format((double) size / 1048576) + "MB";
        } else {
            wjdx = df.format((double) size / 1073741824) + "GB";
        }
        return wjdx;

    }

    // 获取数据对象列表

    public void initsjdx() {
        DelegateMapper delegateMapper = getMapper();
        List ll=delegateMapper.selectList("com.xalt.sjdr.dao.SjwjscMapper.initsjdx");
        includeJson(ll);
    }



    /*获取数据项信息*/
    public void getsjxinfo(String mbb) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("mbb", mbb);
        List sjxlist=delegateMapper.selectList("com.xalt.sjdr.dao.SjwjscMapper.getsjxinfo", param);
        includeJson(sjxlist);
    }


    /*获取批次数据*/
    public void initpc() {
        DelegateMapper delegateMapper = getMapper();
        List sjxlist=delegateMapper.selectList("com.xalt.sjdr.dao.SjwjscMapper.initpc");
        includeJson(sjxlist);
    }



    /*导入数据*/

    public void saveTableData(DelegateMapper delegateMapper,String wjmc,String wjlx,String wjdx,String pc,String sjb,String colu,String drid){
        String[] collumns=colu.split(",");
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

        String filepath="D:/uploadfiles/"+wjmc;
        ExpertData ed=new ExpertData();
        try{
            List ls= ed.readExcel(filepath);
            //循环插入数据
            for(int i=0;i<ls.size();i++){
                //值信息
                Map mr=(Map)ls.get(i);
                //列信息
                if(mr!=null&&mr.size()>0){
//                    if(mr!=null&&mr.size()>0&&mr.size()==sjxobj.size()){
                    int msize=mr.size();
                    String columstr="";
                    String valuestr="";
                    //循环拼数据
                    for(int r=0;r<collumns.length;r++){
//                        String ywmc="";
                        String sjlx="";
                        for(Object obj:sjxobj){
                            Map sjxmp=(Map)obj;
                            String ywmc1=sjxmp.get("SJXMCYW").toString().toUpperCase();
                            String sjlx1=sjxmp.get("SJXLX").toString();
                            String  coltr= collumns[r].toUpperCase();
                            if(ywmc1.equals(coltr)){
                                sjlx=sjlx1;
                                break;
                            }
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
                                valuestr=valuestr+",to_date('"+value1+"','yyyy-mm-dd')";
                            }else if((sjlx.toUpperCase()).equals("NUMBER")){
                                valuestr=valuestr+",to_number('"+value1+"')";
                            }
                        }
                    }

                    String psql="insert into "+sjb+"("+colu+") values("+valuestr+")";
                    log.debug("执行的sql："+psql);
                    Map<String,Object> mm=new HashMap<String,Object>();
                    mm.put("psql",psql);
                    delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.insertsjb",mm) ;
                }
            }
            log.debug("ls---->"+ls);
            delegateMapper.update("com.xalt.sjdr.dao.SjdrMapper.updatedrbz",param);

        } catch (Exception e){
            includeJson("执行失败");
            e.printStackTrace();
        }
    }




    private static final String EXCEL_XLS = "xls";
    private static final String EXCEL_XLSX = "xlsx";

    /**
     * 判断Excel的版本,获取Workbook
     * @param in
     * @param
     * @return
     * @throws java.io.IOException
     */

    public static Workbook getWorkbok(InputStream in,File file) throws IOException {
        Workbook wb = null;

        if(file.getName().endsWith(EXCEL_XLS)){  //Excel 2003
            wb = new HSSFWorkbook(in);

        }
        return wb;
    }

    /**
     * 判断文件是否是excel
     * @throws Exception
     */

    public static void checkExcelVaild(File file) throws Exception{
        if(!file.exists()){
            throw new Exception("文件不存在");
        }
        if(!(file.isFile() && (file.getName().endsWith(EXCEL_XLS) || file.getName().endsWith(EXCEL_XLSX)))){
            throw new Exception("文件不是Excel");
        }
    }

    /**
     * 读取Excel表头，兼容 Excel 2003/2007/2010
     * @throws Exception
     */

    public  void  readExcelColumns(String filepath) throws Exception {
        filepath= "D:\\uploadfiles\\"+filepath;
        ExpertData ed=new ExpertData();
        Map<String, Object> map = ed.readExcelInfo(filepath);
        includeJson(map);
    }

}
