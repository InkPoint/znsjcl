package com.xalt.utils;

import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.FileDownload;
import com.google.common.collect.Maps;
import com.ts.model.PaginatedVO;
import com.ts.persistence.dao.DelegateMapper;
import com.xalt.common.FilesConst;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 18-8-23
 * Time: 上午10:50
 */
public class BigDataExport {

    //每次导出的默认最大的条数
    private static final int  defaultnums=10000;

    /*
    *  创建人：魏军元
    *  功能：大数据量数据导出功能
    *  参数说明:1 数据库连接对象；delegateMapper
    *           2 列头结果集    excelcolunmlist
    *           3 列字段结果集合  datacolumnlist
    *           4 excel名称      filename
    *           5 sheet页基本名称   basicsheetname
    *           6 每个sheet页面数据量条数     sheetnums
    *           7 查询语句: querysql
    *  创建时间   2018
    */
    public Download ExportData(DelegateMapper delegateMapper,String tj,String querysql,List excelcolunmlist,List datacolumnlist,String filename,String basicsheetname,HttpServletResponse response,int pagesize){
        Date   starttime=new Date();
        System.out.println("大数据量数据导出开始，开始时间是:" + DateUtils.getNowDateStr());
        FileDownload downloca =null;
        int pages=0;
        int allnum=0;
        Map<String, Object> param = Maps.newHashMap();
        //获取查询数据
        List resdata=new ArrayList();
        String basedata="";
        String celldatas="";
        Workbook wb=new  SXSSFWorkbook(100);
        if(excelcolunmlist==null||excelcolunmlist.size()<=0||datacolumnlist==null||datacolumnlist.size()<=0||excelcolunmlist.size()!=datacolumnlist.size()){
            //列头输入和excel表头不一致
            System.out.println("提供的excel表头和列头不一致！");
            return null;
        }

        if(delegateMapper!=null){
            //虎丘数据总条数以及数据总页数
            param.put("pagesize",pagesize);
            List tjlist=delegateMapper.selectList(tj, param);
            if(tjlist!=null){
                Map m=(Map)tjlist.get(0);
                allnum=Integer.parseInt(m.get("ALLNUM").toString()) ;
                pages  =Integer.parseInt(m.get("PAGES").toString()) ;
            }
            System.out.println("查询的数据总量："+allnum+",总页数："+pages);
            for(int k=1;k<=pages;k++){
                param.put("pagenum",k);
                List datas=delegateMapper.selectList(querysql, param);
                if(datas!=null){
                    resdata=datas;
                }
                //循环写入excel里面
                //循环将值写入exdel
                if(resdata!=null&&resdata.size()>0){
                    //创建sheet页面
                    Sheet sheet=wb.createSheet("sheet"+k);
                    System.out.println("大数据量数据导出中，创建第"+k+"个sheet页");
                    Row nRow=null;
                    Cell nCell=null;
                    int rowNo=0;
                    short colNo=0;
                    for(int i=0;i<resdata.size();i++){
                        Map ma=(Map)resdata.get(i);
                        //创建行对象
                        nRow=sheet.createRow(i);
                        //添加标题行
                        if(i==0){
                            //循环创建标题行
                            for(int r=0;r<excelcolunmlist.size();r++){
                                nCell=nRow.createCell(r);
                                nCell.setCellValue(excelcolunmlist.get(r).toString());
                            }
                        }else{
                            //循环创建爱你单元格对象并且给单元格赋值
                            for(int r=0;r<excelcolunmlist.size();r++){
                                nCell=nRow.createCell(r);
                                basedata=datacolumnlist.get(r)==null?"":datacolumnlist.get(r).toString();
                                if(!"".equals(basedata)){
                                    celldatas=ma.get(basedata)==null?"":ma.get(basedata).toString();
                                }
                                nCell.setCellValue(celldatas);
                            }
                        }
                    }
                    //清空list，释放内存
                    resdata.clear();
                    datas.clear();
                    System.out.println("大数据量数据导出中，第" + k + "个sheet页数据创建完毕");
                }

            }
            System.out.println("所有sheet页创建完毕");
            //将数据写入excel文件中去
            try{
                String filepaths = "D:/bigdata/" + filename;
                File file = new File(filepaths);
                FileOutputStream out = new FileOutputStream(filepaths);
                wb.write(out);
                out.close();
                String contentType = ".*"; //所有文件类型
                response.setContentType("application/octet-stream");
                String newFileName = URLEncoder.encode(filename, "UTF-8");
                response.setHeader("Content-Disposition", "attachment;filename=" + newFileName);
                downloca = new FileDownload(file, contentType, newFileName, true);
                Date   endtime=new Date();
                System.out.println("大数据量数据导出完毕,耗费时间："+DateUtils.getDateRqcs(starttime,endtime)+" 秒");
            }catch (IOException ee){
                ee.printStackTrace();
            }
        }
        System.out.println("最终结果："+downloca);
       return downloca;

    }


    /*
    *  创建人：魏军元
    *  功能：大数据量数据导出功能
    *  参数说明:1 数据库连接对象；delegateMapper
    *           2 列头结果集    excelcolunmlist[]
    *           3 列字段结果集合  datacolumnlist[]
    *           4 excel名称      filename
    *           5 sheet页基本名称   basicsheetname
    *           6 每个sheet页面数据量条数     sheetnums
    *           7 查询语句: querysql
    *  创建时间   2018
    */
    public Download ExportData1(DelegateMapper delegateMapper,String tj,String querysql,String[] excelcolunmlist,String[] datacolumnlist,String filename,String basicsheetname,HttpServletResponse response,int pagesize){
        Date   starttime=new Date();
        System.out.println("大数据量数据导出开始，开始时间是:" + DateUtils.getNowDateStr());
        FileDownload downloca =null;
        int pages=0;
        int allnum=0;
        Map<String, Object> param = Maps.newHashMap();
        //获取查询数据
        List resdata=new ArrayList();
        String basedata="";
        String celldatas="";
        Workbook wb=new  SXSSFWorkbook(100);
        if(excelcolunmlist==null||excelcolunmlist.length<=0||datacolumnlist==null||datacolumnlist.length<=0||excelcolunmlist.length!=datacolumnlist.length){
            //列头输入和excel表头不一致
            System.out.println("提供的excel表头和列头不一致！");
            return null;
        }

        if(delegateMapper!=null){
            //虎丘数据总条数以及数据总页数
            param.put("pagesize",pagesize);
            List tjlist=delegateMapper.selectList(tj, param);
            if(tjlist!=null){
                Map m=(Map)tjlist.get(0);
                allnum=Integer.parseInt(m.get("ALLNUM").toString()) ;
                pages  =Integer.parseInt(m.get("PAGES").toString()) ;
            }
            System.out.println("查询的数据总量："+allnum+",总页数："+pages);
            for(int k=1;k<=pages;k++){
                param.put("pagenum",k);
                List datas=delegateMapper.selectList(querysql, param);
                if(datas!=null){
                    resdata=datas;
                }
                //循环写入excel里面
                //循环将值写入exdel
                if(resdata!=null&&resdata.size()>0){
                    //创建sheet页面
                    Sheet sheet=wb.createSheet("sheet"+k);
                    System.out.println("大数据量数据导出中，创建第"+k+"个sheet页");
                    Row nRow=null;
                    Cell nCell=null;
                    int rowNo=0;
                    short colNo=0;
                    for(int i=0;i<resdata.size();i++){
                        Map ma=(Map)resdata.get(i);
                        //创建行对象
                        nRow=sheet.createRow(i);
                        //添加标题行
                        if(i==0){
                            //循环创建标题行
                            for(int r=0;r<excelcolunmlist.length;r++){
                                nCell=nRow.createCell(r);
                                nCell.setCellValue(excelcolunmlist[r].toString());
                            }
                        }else{
                            //循环创建爱你单元格对象并且给单元格赋值
                            for(int r=0;r<excelcolunmlist.length;r++){
                                nCell=nRow.createCell(r);
                                basedata=datacolumnlist[r]==null?"":datacolumnlist[r].toString();
                                if(!"".equals(basedata)){
                                    celldatas=ma.get(basedata)==null?"":ma.get(basedata).toString();
                                }
                                nCell.setCellValue(celldatas);
                            }
                        }
                    }
                    //清空list，释放内存
                    resdata.clear();
                    datas.clear();
                    System.out.println("大数据量数据导出中，第" + k + "个sheet页数据创建完毕");
                }

            }
            System.out.println("所有sheet页创建完毕");
            //将数据写入excel文件中去
            try{
                String filepaths = "D:/bigdata/" + filename;
                File file = new File(filepaths);
                FileOutputStream out = new FileOutputStream(filepaths);
                wb.write(out);
                out.close();
                String contentType = ".*"; //所有文件类型
                response.setContentType("application/octet-stream");
                String newFileName = URLEncoder.encode(filename, "UTF-8");
                response.setHeader("Content-Disposition", "attachment;filename=" + newFileName);
                downloca = new FileDownload(file, contentType, newFileName, true);
                Date   endtime=new Date();
                System.out.println("大数据量数据导出完毕,耗费时间："+DateUtils.getDateRqcs(starttime,endtime)+" 秒");
            }catch (IOException ee){
                ee.printStackTrace();
            }
        }
        System.out.println("最终结果："+downloca);
        return downloca;

    }


    /*
    * 版本号：3
   *  创建人：魏军元
   *  功能：大数据量数据导出功能
   *  参数说明:1 数据库连接对象；delegateMapper
   *           2 列头结果集    excelcolunmlist[]
   *           3 列字段结果集合  datacolumnlist[]
   *           4 excel名称      filename
   *           5 sheet页基本名称   basicsheetname
   *           6 每个sheet页面数据量条数     sheetnums
   *           7 查询语句: querysql
   *  创建时间   2018
   */
    public Download ExportData21(DelegateMapper delegateMapper,String querysql,String[] excelcolunmlist,String[] datacolumnlist,String filename,String basicsheetname,HttpServletResponse response,int pagesize){
        Date   starttime=new Date();
        System.out.println("大数据量数据导出开始，开始时间是:" + DateUtils.getNowDateStr());
        FileDownload downloca =null;
        int pages=0;
        int allnum=0;
        Map<String, Object> param = Maps.newHashMap();
        //获取查询数据
        List resdata=new ArrayList();
        String basedata="";
        String celldatas="";
        Workbook wb=new  SXSSFWorkbook(100);
        if(excelcolunmlist==null||excelcolunmlist.length<=0||datacolumnlist==null||datacolumnlist.length<=0||excelcolunmlist.length!=datacolumnlist.length){
            //列头输入和excel表头不一致
            System.out.println("提供的excel表头和列头不一致！");
            return null;
        }

        if(delegateMapper!=null){
            //虎丘数据总条数以及数据总页数
            param.put("pagesize",pagesize);
            PaginatedVO tjlist=delegateMapper.selectPaginated(querysql, param,1,pagesize);
            if(tjlist!=null){
                allnum=tjlist.getTotal() ;
                pages  =tjlist.getPageCount() ;
            }
            System.out.println("查询的数据总量："+allnum+",总页数："+pages);
            for(int k=1;k<=pages;k++){
                param.put("pagenum",k);
                PaginatedVO datas=delegateMapper.selectPaginated(querysql, param,k,pagesize);
                if(datas!=null){
                    resdata=datas.getRows();
                }
                //循环写入excel里面
                //循环将值写入exdel
                if(resdata!=null&&resdata.size()>0){
                    //创建sheet页面
                    Sheet sheet=wb.createSheet("sheet"+k);
                    System.out.println("大数据量数据导出中，创建第"+k+"个sheet页");
                    Row nRow=null;
                    Cell nCell=null;
                    int rowNo=0;
                    short colNo=0;
                    for(int i=0;i<resdata.size();i++){
                        Map ma=(Map)resdata.get(i);
                        //创建行对象
                        nRow=sheet.createRow(i);
                        //添加标题行
                        if(i==0){
                            //循环创建标题行
                            for(int r=0;r<excelcolunmlist.length;r++){
                                nCell=nRow.createCell(r);
                                nCell.setCellValue(excelcolunmlist[r].toString());
                            }
                        }else{
                            //循环创建爱你单元格对象并且给单元格赋值
                            for(int r=0;r<excelcolunmlist.length;r++){
                                nCell=nRow.createCell(r);
                                basedata=datacolumnlist[r]==null?"":datacolumnlist[r].toString().toUpperCase();
                                if(!"".equals(basedata)){
                                    celldatas=ma.get(basedata)==null?"":ma.get(basedata).toString();
                                }
                                nCell.setCellValue(celldatas);
                            }
                        }
                    }
                    //清空list，释放内存
                    resdata.clear();
                    datas=null;
                    System.out.println("大数据量数据导出中，第" + k + "个sheet页数据创建完毕");
                }

            }
            System.out.println("所有sheet页创建完毕");
            //将数据写入excel文件中去
            try{
                String filepaths = "D:/bigdata/" + filename;
                File file = new File(filepaths);
                FileOutputStream out = new FileOutputStream(filepaths);
                wb.write(out);
                out.close();
                String contentType = ".*"; //所有文件类型
                response.setContentType("application/octet-stream");
                String newFileName = URLEncoder.encode(filename, "UTF-8");
                response.setHeader("Content-Disposition", "attachment;filename=" + newFileName);
                downloca = new FileDownload(file, contentType, newFileName, true);
                Date   endtime=new Date();
                System.out.println("大数据量数据导出完毕,耗费时间："+DateUtils.getDateRqcs(starttime,endtime)+" 秒");
            }catch (IOException ee){
                ee.printStackTrace();
            }
        }
        System.out.println("最终结果："+downloca);
        return downloca;

    }
}
