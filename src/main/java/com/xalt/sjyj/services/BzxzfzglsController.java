package com.xalt.sjyj.services;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import br.com.caelum.vraptor.observer.upload.UploadSizeLimit;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import com.google.common.base.Strings;
import com.google.common.collect.Maps;
import com.google.common.io.Files;
import com.ts.acl.util.ByteInputStream;
import com.ts.core.annotation.NoLoginValidate;
import com.ts.core.service.WebServiceSupport;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.common.FilesConst;
import com.xalt.sjyj.model.BzxzfzglsVO;
import com.xalt.sjyj.model.FxbgyfVO;
import com.xalt.utils.CharCloudyUtil;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by weijunyuan on 2018/7/10.
 * 保障性住房资格连审信息
 * User:weijunyuan
 */
@Controller
public class BzxzfzglsController extends WebServiceSupport {

    @Inject
    private Logger log;
    @Inject
    private CharCloudyUtil utils;

    //文件上传路径
    private String savepath=this.getClass().getResource("/").getPath()+"myuploadfile/";

    //初始化界面
    public void initzgls() {
    }



    //上传原始文件
    @UploadSizeLimit(sizeLimit=40*1024*1024, fileSizeLimit=100*1024*1024)
    public void uploadfiles(UploadedFile fileinput1) {
        String savePath = savepath;
        log.debug("====>保障性住房资格连审信息数据文件excel上传");
        log.debug("====>basePath={}", savePath);
        if(fileinput1 != null){
            log.debug("===>file is {}",fileinput1.getFileName());
            String fileName = fileinput1.getFileName();
            String extName = "";
            //扩展名格式：
            if (fileName.lastIndexOf(".") >= 0) {
                extName = fileName.substring(fileName.lastIndexOf("."));
            }
            String fullName = savePath + fileinput1.getFileName();
            File f = new File(savePath);
            if (!f.exists()) {
                f.mkdirs();
            }
            File f1 = new File(savePath+"/updates");
            if (!f1.exists()) {
                f1.mkdirs();
            }
            try {
                log.debug("==>文件{}保存成功!", fullName);
                Files.write(ByteInputStream.input2byte(fileinput1.getFile()), new File(fullName));
                includeJson("导入成功！");
            } catch (IOException e) {
                includeJson("导入失败！");
                e.printStackTrace();
            }

        }else{
                includeJson("导入失败！");
        }
    }

    //解析xls文件内容
    public void parseXlsfile(String filename,String starttime,String endtime){
        String timsplit=starttime.split("-")[0]+"年"+starttime.split("-")[1]+"月 至 "  +endtime.split("-")[0]+"年"+endtime.split("-")[1]+"月";
        DelegateMapper delegateMapper = getMapper();
        String defaultvalue="N/A";
        List<BzxzfzglsVO> tablist=new ArrayList<>();
         if(!Strings.isNullOrEmpty(filename)){
             //读取文件
             String filepath =savepath+filename;
             //操作excel文件过程
             File excelFile = new File(filepath); // 创建文件对象
             try{
                 FileInputStream is = new FileInputStream(excelFile); // 文件流
                 Workbook workbook = getWorkbok(is,excelFile);
                 int sheetCount = workbook.getNumberOfSheets(); // Sheet的数量
                 Sheet sheet = workbook.getSheetAt(0);   // 遍历第一个Sheet
                 log.debug("sheet(0).size"+sheet.getPhysicalNumberOfRows());
                 List alllist=new ArrayList();
                 List sfzhmlist=new ArrayList();
                 //循环读取excel数据并且将excel数据中身份证号码保存到数据库中
                 for (Row row : sheet) {
                     String rowValue = "";
                     Map<String,Object> mp=new HashMap<String,Object>();
                     Cell cell6=row.getCell(6);
                     String cell6str= cell6==null?"":cellValus(cell6,cell6.getCellType());
                     if(!"".equals(cell6str)&&!"身份证号".equals(cell6str)){
                         //将身份证号码添加到集合中去
                         sfzhmlist.add(cell6str);
                     }
                 }

                 //根据身份证号查询所有数据
                 Map<String,Object> param1=new HashMap<String,Object>();
                 param1.put("sfzhmlist",sfzhmlist);
                 delegateMapper.delete("com.xalt.sjyj.dao.BzxzfzglsMapper.deletedata");
                 delegateMapper.insert("com.xalt.sjyj.dao.BzxzfzglsMapper.inserlist",param1);
                 //获取结果数据
                 param1.put("starttime",starttime);
                 param1.put("endtime",endtime);
                 List<Map<String,Object>> lists=delegateMapper.selectList("com.xalt.sjyj.dao.BzxzfzglsMapper.selectalls",param1);


                 //将查询出来的结果循环赋值到excel中去
                 for (Row row : sheet) {
                     String rowValue = "";
                     Map<String,Object> mp=new HashMap<String,Object>();
                     if(row==null){
                         continue;
                     }
                     Cell cell6=row.getCell(6);
                     String cell6str= cell6==null?"":cellValus(cell6,cell6.getCellType());
                     if(!"".equals(cell6str)&&!"身份证号".equals(cell6str)){

                         //将身份证号不为空的数据 并且能查询到数据的  循环获取第八列和第九列集赋值
                         for(Map map:lists){
                             String value6=map.get("SFZJHM")==null?"":map.get("SFZJHM").toString();
                             String value8=map.get("YJSRE")==null?"":map.get("YJSRE").toString();
                             String value9=map.get("ZSRE")==null?"":map.get("ZSRE").toString();
                             if(cell6str.equals(value6)){
                                 //将row对应的值修改掉
                                 if(row.getCell(8)==null){
                                     row.createCell(8).setCellValue(value8==null||"".equals(value8)?"N/A":value8);
                                 }else{
                                     row.getCell(8).setCellValue(value8==null||"".equals(value8)?"N/A":value8);
                                 }
                                 if(row.getCell(9)==null){
                                     row.createCell(9).setCellValue(value9==null||"".equals(value9)?"N/A":value9);
                                 }else{
                                     row.getCell(9).setCellValue(value9==null||"".equals(value9)?"N/A":value9);
                                 }
                                 break;

                             }
                         }
                         //将第八列和第九列中数据为空的全部制成N/A
                         Cell cell8str1=  row.getCell(8);
                         Cell cell9str1=  row.getCell(9);
                         if(cell8str1==null){
                             row.createCell(8).setCellValue("N/A");
                         }else{
//                             log.debug("第八列值："+cellValus(cell8str1,cell8str1.getCellType()));
                             cell8str1.setCellValue(Strings.isNullOrEmpty(cellValus(cell8str1,cell8str1.getCellType()))?defaultvalue:cellValus(cell8str1,cell8str1.getCellType()));
                         }
                         if(cell9str1==null){
                             row.createCell(9).setCellValue("N/A");
                         }else{
//                             log.debug("第八列值："+cellValus(cell9str1,cell9str1.getCellType()));
                             cell9str1.setCellValue(Strings.isNullOrEmpty(cellValus(cell9str1,cell9str1.getCellType()))?defaultvalue:cellValus(cell9str1,cell9str1.getCellType()));
                         }

                     }
                     if(cell6str!=null&&"身份证号".equals(cell6str)){
                                 //将row对应的值修改掉
                                 if(row.getCell(8)==null){
                                     row.createCell(8).setCellValue(timsplit+"平均月收入");
                                 }else{
                                     row.getCell(8).setCellValue(timsplit+"平均月收入");
                                 }
                                 if(row.getCell(9)==null){
                                     row.createCell(9).setCellValue(timsplit+"缴纳个人所得税总额");
                                 }else{
                                     row.getCell(9).setCellValue(timsplit+"缴纳个人所得税总额");
                                 }

                     }


                     Cell cell0=row.getCell(0);
                     Cell cell1=row.getCell(1);
                     Cell cell2=row.getCell(2);
                     Cell cell3=row.getCell(3);
                     Cell cell4=row.getCell(4);
                     Cell cell5=row.getCell(5);
                     Cell cell7=row.getCell(7);
                     Cell cell8=row.getCell(8);
                     Cell cell9=row.getCell(9);

                     String cell0str=  cell0==null?defaultvalue:cellValus(cell0,cell0.getCellType());
                     String cell1str=  cell1==null?defaultvalue:cellValus(cell1,cell1.getCellType());
                     String cell2str=  cell2==null?defaultvalue:cellValus(cell2,cell2.getCellType());
                     String cell3str=  cell3==null?defaultvalue:cellValus(cell3,cell3.getCellType());
                     String cell4str=  cell4==null?defaultvalue:cellValus(cell4,cell4.getCellType());
                     String cell5str=  cell5==null?defaultvalue:cellValus(cell5,cell5.getCellType());
                     String cell6strs= cell6==null?defaultvalue:cellValus(cell6,cell6.getCellType());
                     String cell7str=  cell7==null?defaultvalue:cellValus(cell7,cell7.getCellType());
                     String cell8str=  cell8==null?defaultvalue:cellValus(cell8,cell8.getCellType());
                     String cell9str=  cell9==null?defaultvalue:cellValus(cell9,cell9.getCellType());

                     //将不是数据行的去掉  只添加数据行
                     if(!"".equals(cell6strs)&&!"身份证号".equals(cell6strs)){
                         BzxzfzglsVO vo=new BzxzfzglsVO();
                         vo.setSqbh(cell1str);
                         vo.setSqr(cell2str);
                         vo.setXm(cell3str);
                         vo.setXb(cell4str);
                         vo.setGx(cell5str);
                         vo.setSfzhm(cell6strs);
                         vo.setYkzpsr(cell7str);
                         vo.setJsr(cell8str);
                         vo.setZe(cell9str);
                         tablist.add(vo);
                     }
                 }

                 //将流数据写入新的文件中
                 FileOutputStream excelfileoutputstream=new FileOutputStream(savepath+"/updates/"+filename);
                 workbook.write(excelfileoutputstream);
                 excelfileoutputstream.flush();
                 excelfileoutputstream.close();
                 is.close();
             }catch(Exception e){
                 e.printStackTrace();
             }

         }


         includeJson(tablist);
    }

    //下载excel文件
    public Download downloadExcel(HttpServletResponse response, String filenames) throws Exception{
        log.debug("===>下载excel文件"+filenames);
        if(filenames==null||"".equals(filenames)){
            return null;
        }
        response.setContentType("application/octet-stream");
        String newFileName = URLEncoder.encode(filenames, "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename="+newFileName);
        //原始文件目录
        String fullName = savepath+"updates/"+filenames;
        log.debug("===>file is {}",fullName);
        File file = new File(fullName);
        String contentType = ".*"; //所有文件类型
        //String filename = profile.getName() + ".jpg";
        //参数说明：file  原始文件目录  contentType 文件类型   最后一个参数：下载后文件名称
        return new FileDownload(file, contentType,newFileName,true);
    }


    public static Workbook getWorkbok(InputStream in,File file) throws IOException{
        Workbook wb = null;
        if(file.getName().endsWith("xls")){  //Excel 2003
            wb = new HSSFWorkbook(in);
        }
        return wb;
    }

    //判断类型
    public String cellValus(Cell cells,int cellType){
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        String cellValue = "N/A";
        switch (cellType) {
            case Cell.CELL_TYPE_STRING:     // 文本
                cellValue = cells.getRichStringCellValue().getString() ;
                break;
            case Cell.CELL_TYPE_NUMERIC:    // 数字、日期
                if (HSSFDateUtil.isCellDateFormatted(cells)) {
                    cellValue = fmt.format(cells.getDateCellValue());
                } else {
                    cells.setCellType(Cell.CELL_TYPE_STRING);
                    cellValue = String.valueOf(cells.getRichStringCellValue().getString());
                }
                break;
            case Cell.CELL_TYPE_BOOLEAN:    // 布尔型
                cellValue = String.valueOf(cells.getBooleanCellValue()) ;
                break;
            case Cell.CELL_TYPE_BLANK: // 空白
                cellValue = cells.getStringCellValue() ;
                break;
            case Cell.CELL_TYPE_ERROR: // 错误
                cellValue = "错误";
                break;
            case Cell.CELL_TYPE_FORMULA:    // 公式
                // 得到对应单元格的字符串
                cells.setCellType(Cell.CELL_TYPE_STRING);
                cellValue = String.valueOf(cells.getRichStringCellValue().getString()) ;
                break;
            default:
                cellValue = "N/A";
        }

        return cellValue;
    }
}
