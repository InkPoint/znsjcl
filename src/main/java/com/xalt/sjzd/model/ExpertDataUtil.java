package com.xalt.sjzd.model;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
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
    public static  void doPostExecute(HttpServletRequest request, HttpServletResponse response,List ls,String[] title,String[] columns,String filename1 ) throws Exception {
        try{


            response.setContentType("application/vnd.ms-excel");
            String fileName=null;
            try {
                 fileName=filename1+".xls";
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

            } catch (IOException e) {
                e.printStackTrace();
            }
        }catch(Exception ex){
            throw new Exception("导出Excel失败！");
        }

    }

    //发票导出
    private static void getExcelsfp(List ls,ServletOutputStream out,String[] title,String[] columnstr)throws Exception{
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
            Map m = (Map)(ls.get(i)==null?(new HashMap()):ls.get(i));
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
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            out.flush();
            out.close();
            book.close();

        }

    }
}
