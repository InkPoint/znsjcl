package com.xalt.zzfwzx.services;

import br.com.caelum.vraptor.Controller;
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
import com.xalt.zzfwzx.model.WjscVo;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;

import javax.inject.Inject;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by cuiheng on 2018/3/9.
 * 文件上传
 */

@Controller
public class WjscController extends WebServiceSupport {
    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    @NoLoginValidate
    public void initwjsc() {
        DelegateMapper mapper = getMapper();
        try{
            utils.addCloudydata(mapper,"自助服务中心—文件上传",this.getUserPrincipal().getUserCode(),"zzfwzx/wjsc/initwjsc");
        }catch (Exception e){

        }

    }


    //获取自主导入数据信息
    @NoLoginValidate
    public void getTableData(WjscVo svo) {
        this.getUserPrincipal().getOrgCode();
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("svo", svo);
        param.put("cjr", this.getUserPrincipal().getUserCode());
        List<Sjwjsc> dataList = delegateMapper.selectList("com.xalt.zzfwzx.dao.WjscMapper.search", param);
        Map<String, Object> results = new HashMap<String, Object>();
        results.put("childrens", dataList);
        includeJson(dataList);
    }


    /*删除页面数据*/
    @NoLoginValidate
    public void delTableData(String drid) {

        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("drid", drid);

        delegateMapper.update("com.xalt.zzfwzx.dao.WjscMapper.delete", param);
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
    @UploadSizeLimit(sizeLimit = 100 * 1024 * 1024, fileSizeLimit = 50 * 1024 * 1024)
    //fileinput上传文件方法
    @NoLoginValidate
    public void uploadfile(UploadedFile fileinput) throws Exception {
        log.debug("fileinput:" + fileinput);
        InputStream inputStream = fileinput.getFile();
        //      获取项目的所在的根路径
        String basepath = "D://uploadfiles//";
        //创建文件临时目录
        File tmpDir = new File(basepath);
        if (!tmpDir.exists()) {
            tmpDir.mkdirs();
        }
        ExpertData ed = new ExpertData();
        List column = ed.readExcelColumns(basepath + "" + fileinput.getFileName());
        FileUtils.instreamTooutputstream(inputStream, "D:/uploadfiles/" + fileinput.getFileName());
        includeJson(column);
    }

    @NoLoginValidate
    /*保存文件信息到数据库*/
    public void savewjxx(String wjmc,String wjlx, String wjdx, String pc, String sjb, String solumns, Sjwjsc svo, String rwid, String mbbmc,String rwsm,String bz,String dxmcyw) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("wjmc", wjmc);
        param.put("rwsm",rwsm);
        param.put("dxmcyw",dxmcyw);
        param.put("bz",bz);
        param.put("wjlx", wjlx);
        param.put("wjdx", wjdx);
        param.put("bm", svo.getBm());
        param.put("zdm", svo.getZdm());
        param.put("scr", this.getUserPrincipal().getUserCode());
        String drid = DateUtils.getNowDateStr();
        param.put("drid", drid);
        //param.put("rwid", rwid);
        param.put("mbbmc", mbbmc);
//        param.put("cjr", this.getUserPrincipal().getUserCode());

        //保存任务基本信息
        delegateMapper.insert("com.xalt.zzfwzx.dao.WjscMapper.jbxx", param);

        //保存导入记录
        delegateMapper.insert("com.xalt.zzfwzx.dao.WjscMapper.insertwjxx", param);
        //导入数据
        saveTableData(delegateMapper, wjmc, wjlx, wjdx, pc, sjb, solumns, drid);
        //导入完成后修改导入完成标志
        delegateMapper.update("com.xalt.zzfwzx.dao.WjscMapper.updatedrbz", param);
        //导入完成后添加一列
        Map<String, Object> mp = new HashMap<String, Object>();
        mp.put("bm", sjb);
//        mp.put("zdm",solumns);
        log.debug("bm:", sjb);
//        log.debug("zdm:",solumns);
        delegateMapper.selectList("com.xalt.zzfwzx.dao.WjscMapper.addcolum", mp);

        //数据导入完成后向中间表添加字段（任务id与表名称英文）
        delegateMapper.insert("com.xalt.zzfwzx.dao.WjscMapper.insertbywmc", param);


        //导入完成后修改上传状态
        delegateMapper.update("com.xalt.zzfwzx.dao.WjscMapper.updatewjsczt", param);


        includeJson("success");
    }


    /**
     * 数据来源（下拉树形菜单）
     */
    @NoLoginValidate
    public void getSjlyTree() {
        //数据载入数据加载
        DelegateMapper mapper = getMapper();
        List vo = mapper.selectList("com.xalt.zzfwzx.dao.WjscMapper.sjlylist");
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


    //    获取数据对象列表
    @NoLoginValidate
    public void initsjdx() {
        DelegateMapper delegateMapper = getMapper();
        List ll = delegateMapper.selectList("com.xalt.zzfwzx.dao.WjscMapper.initsjdx");
        includeJson(ll);
    }


    @NoLoginValidate
    /*获取数据项信息*/
    public void getsjxinfo(String mbb) {
        DelegateMapper delegateMapper = getMapper();
        Map<String, Object> param = Maps.newHashMap();
        param.put("mbb", mbb);
        List sjxlist = delegateMapper.selectList("com.xalt.zzfwzx.dao.WjscMapper.getsjxinfo", param);
        includeJson(sjxlist);
    }

    @NoLoginValidate
    /*获取批次数据*/
    public void initpc() {
        DelegateMapper delegateMapper = getMapper();
        List sjxlist = delegateMapper.selectList("com.xalt.zzfwzx.dao.WjscMapper.initpc");
        includeJson(sjxlist);
    }


    /*导入数据*/
    @NoLoginValidate
    public void saveTableData(DelegateMapper delegateMapper, String wjmc, String wjlx, String wjdx, String pc, String sjb, String colu, String drid) {
        String[] collumns = colu.split(",");
        Map<String, Object> param = Maps.newHashMap();
        param.put("drid", drid);
        param.put("wjmc", wjmc);
        param.put("wjlx", wjlx);
        param.put("wjdx", wjdx);
        param.put("pc", pc);
        param.put("sjb", sjb);
        //      delegateMapper.insert("com.xalt.sjdr.dao.SjdrMapper.savedata", param);
        //将该文件对应的数据保存到数据库
        //获取数据表对应数据项
        List sjxobj = delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.sjxlists", param);

        String filepath = "D:/uploadfiles/" + wjmc;
        ExpertData ed = new ExpertData();
        try {
            List ls = ed.readExcel(filepath);
            //循环插入数据
            for (int i = 0; i < ls.size(); i++) {
                //值信息
                Map mr = (Map) ls.get(i);
                //列信息
                if (mr != null && mr.size() > 0 && mr.size() == sjxobj.size()) {
                    int msize = mr.size();
                    String columstr = "";
                    String valuestr = "";
                    //循环拼数据
                    for (int r = 0; r < collumns.length; r++) {
//                        String ywmc="";
                        String sjlx = "";
                        for (Object obj : sjxobj) {
                            Map sjxmp = (Map) obj;
                            String ywmc1 = sjxmp.get("SJXMCYW").toString().toUpperCase();
                            String sjlx1 = sjxmp.get("SJXLX").toString();
                            String coltr = collumns[r].toUpperCase();
                            if (ywmc1.equals(coltr)) {
                                sjlx = sjlx1;
                                break;
                            }
                        }

                        Object value1 = mr.get("obj" + r);
                        //拼接值的字符串
                        if ("".equals(valuestr)) {
                            if ((sjlx.toUpperCase()).contains("VARCHAR")) {
                                valuestr = "'" + value1 + "'";
                            } else if ((sjlx.toUpperCase()).equals("DATE")) {
                                valuestr = "to_date('" + value1 + "','yyyy-mm-dd')";
                            } else if ((sjlx.toUpperCase()).equals("NUMBER")) {
                                valuestr = "to_number('" + value1 + "')";
                            }
                        } else {
                            if ((sjlx.toUpperCase()).contains("VARCHAR")) {
                                valuestr = valuestr + ",'" + value1 + "'";
                            } else if ((sjlx.toUpperCase()).equals("DATE")) {
                                valuestr = valuestr + ",to_date('" + value1 + "','yyyy-mm-dd')";
                            } else if ((sjlx.toUpperCase()).equals("NUMBER")) {
                                valuestr = valuestr + ",to_number('" + value1 + "')";
                            }
                        }
                    }

                    String psql = "insert into " + sjb + "(" + colu + ") values(" + valuestr + ")";
                    log.debug("执行的sql：" + psql);
                    Map<String, Object> mm = new HashMap<String, Object>();
                    mm.put("psql", psql);
                    delegateMapper.selectList("com.xalt.sjdr.dao.SjdrMapper.insertsjb", mm);
                }
            }
            log.debug("ls---->" + ls);
            delegateMapper.update("com.xalt.sjdr.dao.SjdrMapper.updatedrbz", param);

        } catch (Exception e) {
            includeJson("执行失败");
            e.printStackTrace();
        }
    }


    private static final String EXCEL_XLS = "xls";
    private static final String EXCEL_XLSX = "xlsx";

    /**
     * 判断Excel的版本,获取Workbook
     *
     * @param in
     * @param
     * @return
     * @throws java.io.IOException
     */
    @NoLoginValidate
    public static Workbook getWorkbok(InputStream in, File file) throws IOException {
        Workbook wb = null;

        if (file.getName().endsWith(EXCEL_XLS)) {  //Excel 2003
            wb = new HSSFWorkbook(in);

        }
        return wb;
    }

    /**
     * 判断文件是否是excel
     *
     * @throws Exception
     */
    @NoLoginValidate
    public static void checkExcelVaild(File file) throws Exception {
        if (!file.exists()) {
            throw new Exception("文件不存在");
        }
        if (!(file.isFile() && (file.getName().endsWith(EXCEL_XLS) || file.getName().endsWith(EXCEL_XLSX)))) {
            throw new Exception("文件不是Excel");
        }
    }

    /**
     * 读取Excel表头，兼容 Excel 2003/2007/2010
     *
     * @throws Exception
     */
    @NoLoginValidate
    public void readExcelColumns(String filepath) throws Exception {
        filepath = "D:\\uploadfiles\\" + filepath;
        ExpertData ed = new ExpertData();
        Map<String, Object> map = ed.readExcelInfo(filepath);
        includeJson(map);
    }


    //文件上传
    @NoLoginValidate
    public void uploadfileinput(UploadedFile fileinput) throws Exception {
        //读取流
        InputStream inputStream = fileinput.getFile();
        //创建文件临时目录
        final String allowFileSuffix = "xls";
        long currentMillis = System.currentTimeMillis();
        String fileExt = fileinput.getFileName().substring(fileinput.getFileName().lastIndexOf("."));
        String newFileName = currentMillis + fileExt;
        String fileName = fileinput.getFileName();
        String basePath = "D:/uploadfiles";
        File tmpDir = new File(basePath);
        if (!tmpDir.exists()) {
            //建立多级文件夹
            tmpDir.mkdirs();
        }
        //字节输出流
        //File.separator 用于不同系统下路径的问题
        FileOutputStream fos = FileUtils.instreamTooutputstream(inputStream, basePath + File.separator + fileName);
        fos.close();
        includeJson("上传成功!");

    }


}


