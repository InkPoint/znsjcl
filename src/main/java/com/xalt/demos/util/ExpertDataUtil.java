package com.xalt.demos.util;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: weijunyuan
 * Date: 17-11-11
 * Time: 下午2:47
 * 导出数据实例
 */
public class ExpertDataUtil {
    /*
    *   request  请求  从系统获取
    *   response  返回请求  从系统获取
    *   ls  要导出的结果集
    *    title  导出excel列头名称
    *    columns  对应查询结果中列名称
    * */
    public    void doPostExecute(HttpServletRequest request, HttpServletResponse response,List ls,String[] title,String[] columns ) throws Exception {
        try{


            response.setContentType("application/vnd.ms-excel");
            String fileName=null;
            try {
                 fileName="新建文件.xls";
                 fileName = java.net.URLEncoder.encode(fileName,"UTF-8");
                 response.setHeader("Content-Disposition", "attachment;filename="+fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ServletOutputStream out = response.getOutputStream();
//                String[] title = {"对象id","对象英文名称","对象名称中文","类型id"};
//                String[] columns = {"DXID","DXMCYW","DXMCZW","LXID"};
                getExcelsfp(ls,out,title,columns);
                out.close();
                out.flush();


            } catch (IOException e) {
                e.printStackTrace();
            }
        }catch(Exception ex){
            throw new Exception("导出Excel失败！");
        }

    }

    //发票导出
    private   void getExcelsfp(List ls,ServletOutputStream out,String[] title,String[] columnstr)throws Exception{
//        String[] title = {"纳税人名称","管理代码","发票号码","开票日期","开票人","收款方","票面信息一","票面信息二","总金额","项目"};

        HSSFWorkbook book = new HSSFWorkbook();
        HSSFSheet sheet = book.createSheet();
        short rownum = 0;
        HSSFRow row = sheet.createRow(rownum++);
        int cellnum = 0;
        int rowNum = ls.size();
        //填充表头
        for(int i=0;i<title.length;i++){
            HSSFCell cell = row.createCell(cellnum++);
//            cell.setEncoding((short)1);
            cell.setCellValue(title[i]);
        }
        //获取内容
        for(int i=0;i<rowNum;i++){
            Map m = (Map)ls.get(i);
            String[] str=new String[columnstr.length];
            for(int k=0;k<columnstr.length;k++){
                str[k]= m.get(columnstr[k].toUpperCase())==null ? "":m.get(columnstr[k].toUpperCase()).toString();
            }

            row = sheet.createRow(rownum++);
            cellnum = 0;
            //填充内容
            for(int j=0;j<title.length;j++){
                HSSFCell cell = row.createCell(cellnum++);
//                cell.setEncoding((short)1);
                cell.setCellValue(str[j]);
            }
        }
        try {
            book.write(out);
            book.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }







    /**
     * cuihegn
     */


    public    void doPostExecute1(HttpServletRequest request, HttpServletResponse response,List ls,String[] title,String[] columns,String bt1,String bt2 ) throws Exception {
        try{


            response.setContentType("application/vnd.ms-excel");
            String fileName=null;
            try {
                fileName="新建文件.xls";
                fileName = java.net.URLEncoder.encode(fileName,"UTF-8");
                response.setHeader("Content-Disposition", "attachment;filename="+fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ServletOutputStream out = response.getOutputStream();
                getExcelsfp1(ls, out, title, columns,bt1,bt2);
                out.close();
                out.flush();


            } catch (IOException e) {
                e.printStackTrace();
            }
        }catch(Exception ex){
            throw new Exception("导出Excel失败！");
        }

    }



    private   void getExcelsfp1(List ls,ServletOutputStream out,String[] title,String[] columnstr ,String bt1,String bt2)throws Exception{

        HSSFWorkbook book = new HSSFWorkbook();
        HSSFSheet sheet = book.createSheet();
        int cellnum = 0;
        int rowNum = ls.size();

//

        HSSFRow row1 = sheet.createRow(0);
        Hashtable hss=new Hashtable();
        hss.put("col","10");
        hss.put("bt1","bt1");



        HSSFCell cell1 = row1.createCell(3);
        cell1.setCellValue(bt1);
        HSSFRow row2 = sheet.createRow(1);
        HSSFCell cell2= row2.createCell(3);
        cell2.setCellValue(bt2);
        //填充表头
        HSSFRow row = sheet.createRow(2);
        for(int i=0;i<title.length;i++){
            HSSFCell cell = row.createCell(cellnum++);
//            HSSFCell cell = row.createCell(cellnum++);
//            cell.setEncoding((short)1);
            cell.setCellValue(title[i]);
        }
        short rownum = 3;
        //获取内容
        for(int i=0;i<rowNum;i++){
            Map m = (Map)ls.get(i);
            String[] str=new String[columnstr.length];
            for(int k=0;k<columnstr.length;k++){
                str[k]= m.get(columnstr[k].toUpperCase())==null ? "":m.get(columnstr[k].toUpperCase()).toString();
            }

            row = sheet.createRow(rownum++);
            cellnum = 0;
            //填充内容
            for(int j=0;j<title.length;j++){
                HSSFCell cell = row.createCell(cellnum++);
//                cell.setEncoding((short)1);
                cell.setCellValue(str[j]);
            }
        }
        try {
            book.write(out);
            book.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    //导出一个表头
    public    void doPostExecute2(HttpServletRequest request, HttpServletResponse response,List ls,String[] title,String[] columns,String bt1) throws Exception {
        try{


            response.setContentType("application/vnd.ms-excel");
            String fileName=null;
            try {
                fileName="新建文件.xls";
                fileName = java.net.URLEncoder.encode(fileName,"UTF-8");
                response.setHeader("Content-Disposition", "attachment;filename="+fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ServletOutputStream out = response.getOutputStream();
                getExcelsfp2(ls, out, title, columns,bt1);
                out.close();
                out.flush();


            } catch (IOException e) {
                e.printStackTrace();
            }
        }catch(Exception ex){
            throw new Exception("导出Excel失败！");
        }

    }


    private   void getExcelsfp2(List ls,ServletOutputStream out,String[] title,String[] columnstr ,String bt1)throws Exception{

        HSSFWorkbook book = new HSSFWorkbook();
        HSSFSheet sheet = book.createSheet();
        int cellnum = 0;
        int rowNum = ls.size();

        HSSFRow row1 = sheet.createRow(0);
        HSSFCell cell1 = row1.createCell(1);
        cell1.setCellValue(bt1);
//        HSSFRow row2 = sheet.createRow(1);
//        HSSFCell cell2= row2.createCell(3);
//        cell2.setCellValue(bt2);
        //填充表头
        HSSFRow row = sheet.createRow(1);
        for(int i=0;i<title.length;i++){
            HSSFCell cell = row.createCell(cellnum++);
//            HSSFCell cell = row.createCell(cellnum++);
//            cell.setEncoding((short)1);
            cell.setCellValue(title[i]);
        }
        short rownum = 2;
        //获取内容
        for(int i=0;i<rowNum;i++){
            Map m = (Map)ls.get(i);
            String[] str=new String[columnstr.length];
            for(int k=0;k<columnstr.length;k++){
                str[k]= m.get(columnstr[k].toUpperCase())==null ? "":m.get(columnstr[k].toUpperCase()).toString();
            }

            row = sheet.createRow(rownum++);
            cellnum = 0;
            //填充内容
            for(int j=0;j<title.length;j++){
                HSSFCell cell = row.createCell(cellnum++);
//                cell.setEncoding((short)1);
                cell.setCellValue(str[j]);
            }
        }
        try {
            book.write(out);
            book.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }




    //养老封皮导出


    public    void doPostExecute3(HttpServletRequest request, HttpServletResponse response,List ls,String[] title,String[] columns,String bt1,String bt2 ) throws Exception {
        try{


            response.setContentType("application/vnd.ms-excel");
            String fileName=null;
            try {
                fileName="新建文件.xls";
                fileName = java.net.URLEncoder.encode(fileName,"UTF-8");
                response.setHeader("Content-Disposition", "attachment;filename="+fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                ServletOutputStream out = response.getOutputStream();
                getExcelsfp3(ls, out, title, columns,bt1,bt2);
                out.close();
                out.flush();


            } catch (IOException e) {
                e.printStackTrace();
            }
        }catch(Exception ex){
            throw new Exception("导出Excel失败！");
        }

    }



    private   void getExcelsfp3(List ls,ServletOutputStream out,String[] title,String[] columnstr ,String bt1,String bt2)throws Exception{
        HSSFWorkbook book = new HSSFWorkbook();
        HSSFSheet sheet = book.createSheet();
        int cellnum = 0;
        int rowNum = ls.size();
        HSSFRow row1 = sheet.createRow(0);
        HSSFCell cell1 = row1.createCell(1);
        cell1.setCellValue(bt1);
        HSSFRow row2 = sheet.createRow(1);
        HSSFCell cell2= row2.createCell(1);
        cell2.setCellValue(bt2);
        //填充表头
        HSSFRow row = sheet.createRow(2);
        for(int i=0;i<title.length;i++){
            HSSFCell cell = row.createCell(cellnum++);
//            HSSFCell cell = row.createCell(cellnum++);
//            cell.setEncoding((short)1);
            cell.setCellValue(title[i]);
        }
        short rownum = 2;
        //获取内容
        for(int i=0;i<rowNum;i++){
            Map m = (Map)ls.get(i);
            String[] str=new String[columnstr.length];
            for(int k=0;k<columnstr.length;k++){
                str[k]= m.get(columnstr[k].toUpperCase())==null ? "":m.get(columnstr[k].toUpperCase()).toString();
            }

            row = sheet.createRow(rownum++);
            cellnum = 0;
            //填充内容
            for(int j=0;j<title.length;j++){
                HSSFCell cell = row.createCell(cellnum++);
//                cell.setEncoding((short)1);
                cell.setCellValue(str[j]);
            }
        }
        try {
            book.write(out);
            book.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
