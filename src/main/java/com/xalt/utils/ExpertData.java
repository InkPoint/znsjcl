package com.xalt.utils;

import br.com.caelum.vraptor.observer.download.Download;
import br.com.caelum.vraptor.observer.download.InputStreamDownload;
import org.apache.poi.hssf.usermodel.*;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/10/18.
 */
public class ExpertData {

    @Inject
    private Logger log;

    //发票导出
    public static Download getDataToExcels(String filenames, String[] title, String[] columnss, List ls, HttpServletResponse res) {

        String contentType = "application/ms-excel"; 
        try {
        	filenames = new String(filenames.getBytes(),"iso-8859-1");
		} catch (UnsupportedEncodingException e) { 
			System.out.println("导出转码失败！");
			e.printStackTrace();
		}
        if(title.length!=columnss.length){
            return null;
        }
        String fileName=filenames+".xls";
        //写入excel部分
        HSSFWorkbook book = new HSSFWorkbook();
        HSSFSheet sheet = book.createSheet();
        short rownum = 0;
        HSSFRow row = sheet.createRow(rownum++);
        int cellnum = 0;
        int rowNum = ls.size();
        //填充表头
        for(int i=0;i<title.length;i++){
            HSSFCell cell = row.createCell(cellnum++);
            cell.setCellValue(title[i]);
        }
        //获取内容
        for(int i=0;i<rowNum;i++){
            Map m = (Map)ls.get(i);
            String[] str = new String[columnss.length];
            for(int k=0;k<columnss.length;k++){
                str[k]=m.get(columnss[k])==null?"":m.get(columnss[k]).toString();
            }
            row = sheet.createRow(rownum++);
            cellnum = 0;
            //填充内容
            for(int j=0;j<title.length;j++){
                HSSFCell cell = row.createCell(cellnum++);
                cell.setCellValue(str[j]);
            }
        }
        try {
            //将数据写入到流中
            ByteArrayOutputStream os=new ByteArrayOutputStream();
            book.write(os);
            byte[] content=os.toByteArray();
            InputStream context=new ByteArrayInputStream(content);
            return new InputStreamDownload(context,contentType,fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }



    private static final String EXCEL_XLS = "xls";
    private static final String EXCEL_XLSX = "xlsx";

    /**
     * 判断Excel的版本,获取Workbook
     * @param in
     * @param
     * @return
     * @throws IOException
     */
    public static Workbook getWorkbok(InputStream in,File file) throws IOException{
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
     * 读取Excel测试，兼容 Excel 2003/2007/2010
     * @throws Exception
     */
    public  List readExcel(String filepath) throws Exception {
        List  arr=new ArrayList();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
//        BufferedWriter bw = new BufferedWriter(new FileWriter(new File("E:/xxx/InsertSql.txt")));
        try {
            // 同时支持Excel 2003、2007
            File excelFile = new File(filepath); // 创建文件对象
            FileInputStream is = new FileInputStream(excelFile); // 文件流
            checkExcelVaild(excelFile);
            Workbook workbook = getWorkbok(is,excelFile);
            int sheetCount = workbook.getNumberOfSheets(); // Sheet的数量
            /**
             * 设置当前excel中sheet的下标：0开始
             */
            Sheet sheet = workbook.getSheetAt(0);   // 遍历第一个Sheet

            // 为跳过第一行目录设置count
            int count = 0;

            for (Row row : sheet) {
                // 跳过第一行的目录
                if(count == 0){
                    count++;
                    continue;
                }
                // 如果当前行没有数据，跳出循环
                if(row.getCell(0).toString().equals("")){
                    continue;
                }
                String rowValue = "";
                Map<String,Object> mp=new HashMap<String,Object>();
                int i=0;
                for (Cell cell : row) {
                    if(cell.toString() == null||"".equals(cell.toString())){
                        continue;
                    }
                    int cellType = cell.getCellType();
                    String cellValue = "";
                    switch (cellType) {
                        case Cell.CELL_TYPE_STRING:     // 文本
                            cellValue = cell.getRichStringCellValue().getString() + "#";
                            break;
                        case Cell.CELL_TYPE_NUMERIC:    // 数字、日期
                            if (HSSFDateUtil.isCellDateFormatted(cell)) {
                                cellValue = fmt.format(cell.getDateCellValue()) + "#";
                            } else {
                                cell.setCellType(Cell.CELL_TYPE_STRING);
                                cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";
                            }
                            break;
                        case Cell.CELL_TYPE_BOOLEAN:    // 布尔型
                            cellValue = String.valueOf(cell.getBooleanCellValue()) + "#";
                            break;
                        case Cell.CELL_TYPE_BLANK: // 空白
                            cellValue = cell.getStringCellValue() + "#";
                            break;
                        case Cell.CELL_TYPE_ERROR: // 错误
                            cellValue = "错误#";
                            break;
                        case Cell.CELL_TYPE_FORMULA:    // 公式
                            // 得到对应单元格的公式
                            //cellValue = cell.getCellFormula() + "#";
                            // 得到对应单元格的字符串
                            cell.setCellType(Cell.CELL_TYPE_STRING);
                            cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";
                            break;
                        default:
                            cellValue = "";
                    }
                    //System.out.print(cellValue);
                    rowValue += cellValue;
                    mp.put("obj"+i,cellValue.replace("#",""));
                    i++;

                }
                System.out.println("当前行数据："+rowValue);
                if(mp!=null){
                    arr.add(mp);
                }
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }


    /**
     * 读取Excel表头，兼容 Excel 2003/2007/2010
     * @throws Exception
     */
    public  List  readExcelColumns(String filepath) throws Exception {

        List mp=new ArrayList();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        try {
            // 同时支持Excel 2003、2007
            File excelFile = new File(filepath); // 创建文件对象
            FileInputStream is = new FileInputStream(excelFile); // 文件流
            checkExcelVaild(excelFile);
            Workbook workbook = getWorkbok(is,excelFile);
            int sheetCount = workbook.getNumberOfSheets(); // Sheet的数量
            /**
             * 设置当前excel中sheet的下标：0开始
             */
            Sheet sheet = workbook.getSheetAt(0);   // 遍历第一个Sheet
            //获取第一行数据
            Row row=sheet.getRow(0);
            // 如果当前行没有数据，跳出循环
            if(row.getCell(0).toString().equals("")){
                return null;
            }
            String rowValue = "";
            int i=0;
            for (Cell cell : row) {
                if(cell.toString() == null){
                    continue;
                }
                int cellType = cell.getCellType();
                String cellValue = "";
                switch (cellType) {
                    case Cell.CELL_TYPE_STRING:     // 文本
                        cellValue = cell.getRichStringCellValue().getString() + "#";
                        break;
                    case Cell.CELL_TYPE_NUMERIC:    // 数字、日期
                        if (HSSFDateUtil.isCellDateFormatted(cell)) {
                            cellValue = fmt.format(cell.getDateCellValue()) + "#";
                        } else {
                            cell.setCellType(Cell.CELL_TYPE_STRING);
                            cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";
                        }
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:    // 布尔型
                        cellValue = String.valueOf(cell.getBooleanCellValue()) + "#";
                        break;
                    case Cell.CELL_TYPE_BLANK: // 空白
                        cellValue = cell.getStringCellValue() + "#";
                        break;
                    case Cell.CELL_TYPE_ERROR: // 错误
                        cellValue = "错误#";
                        break;
                    case Cell.CELL_TYPE_FORMULA:    // 公式
                        // 得到对应单元格的公式
                        //cellValue = cell.getCellFormula() + "#";
                        // 得到对应单元格的字符串
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";
                        break;
                    default:
                        cellValue = "#";
                }
                //System.out.print(cellValue);
                rowValue += cellValue;
                mp.add(cellValue.replace("#",""));
                i++;
            }
            System.out.println("当前行数据："+rowValue);




        } catch (Exception e) {
            e.printStackTrace();
        }
        return mp;
    }

    /**
     * 获取Excel基本信息
     *
     * @param filepath
     * @return
     * @throws Exception
     */
    public  Map<String, Object>  readExcelInfo(String filepath) throws Exception {

        Map<String, Object> resultMap = new HashMap<>();

        List mp=new ArrayList();
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
        try {
            // 同时支持Excel 2003、2007
            File excelFile = new File(filepath); // 创建文件对象
            FileInputStream is = new FileInputStream(excelFile); // 文件流
            // 获取文件大小
            int size = Math.round(is.available()/1024);
            String sizeStr = size+"KB";
            checkExcelVaild(excelFile);
            Workbook workbook = getWorkbok(is,excelFile);
            int sheetCount = workbook.getNumberOfSheets(); // Sheet的数量
            /**
             * 设置当前excel中sheet的下标：0开始
             */
            Sheet sheet = workbook.getSheetAt(0);   // 遍历第一个Sheet
            //获取第一行数据
            Row row=sheet.getRow(0);
            // 如果当前行没有数据，跳出循环
            if(row.getCell(0).toString().equals("")){
                return null;
            }
            String rowValue = "";
            int i=0;
            for (Cell cell : row) {
                if(cell.toString() == null||"".equals(cell.toString())){
                    continue;
                }
                int cellType = cell.getCellType();
                String cellValue = "";
                switch (cellType) {
                    case Cell.CELL_TYPE_STRING:     // 文本
                        cellValue = cell.getRichStringCellValue().getString() + "#";
                        break;
                    case Cell.CELL_TYPE_NUMERIC:    // 数字、日期
                        if (HSSFDateUtil.isCellDateFormatted(cell)) {
                            cellValue = fmt.format(cell.getDateCellValue()) + "#";
                        } else {
                            cell.setCellType(Cell.CELL_TYPE_STRING);
                            cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";
                        }
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:    // 布尔型
                        cellValue = String.valueOf(cell.getBooleanCellValue()) + "#";
                        break;
                    case Cell.CELL_TYPE_BLANK: // 空白
                        cellValue = cell.getStringCellValue() + "#";
                        break;
                    case Cell.CELL_TYPE_ERROR: // 错误
                        cellValue = "错误#";
                        break;
                    case Cell.CELL_TYPE_FORMULA:    // 公式
                        // 得到对应单元格的公式
                        //cellValue = cell.getCellFormula() + "#";
                        // 得到对应单元格的字符串
                        cell.setCellType(Cell.CELL_TYPE_STRING);
                        cellValue = String.valueOf(cell.getRichStringCellValue().getString()) + "#";
                        break;
                    default:
                        cellValue = "#";
                }
                //System.out.print(cellValue);
                rowValue += cellValue;
                mp.add(cellValue.replace("#",""));
                i++;
            }
            System.out.println("当前行数据："+rowValue);



            resultMap.put("cloums", mp);
            resultMap.put("size", sizeStr);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap;
    }

}
