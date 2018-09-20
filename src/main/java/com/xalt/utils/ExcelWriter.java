package com.xalt.utils;

import org.apache.commons.lang.time.FastDateFormat;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by win7 on 2018/8/1.
 * User:PengWen Wang
 * 使用POI生成导出Excel
 */
public class ExcelWriter {

    /**
     * 导出xlsx格式的Excel XSSF
     * author：InkPoint
     * time：2018/8/29
     *
     * @param title
     * @param headers
     * @param columns
     * @param dataset
     * @param out
     * @param pattern
     */
    public void exportXSExcelByColumn(String title, String[] headers, String[] columns, Collection<Map<String, Object>> dataset, OutputStream out, String pattern) {
        // 在内存中放置100行，超过的数据放到硬盘
        Workbook workbook = new SXSSFWorkbook(100);
        // 生成一个表格
        Sheet sheet = workbook.createSheet(title);
        // 设置自适应表格列宽
        for (int i = 0; i < columns.length; i++) {
            sheet.setDefaultColumnWidth(columns[i].getBytes().length * 2 * 256);
        }
        // 设置行高
        sheet.setDefaultRowHeightInPoints(20);
        // 生成一个 表格标题行样式
        CellStyle style = workbook.createCellStyle();
        // 设置单元格背景色
        style.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
        style.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        // 设置边框
        style.setBorderBottom(BorderStyle.THIN);// 下边框
        style.setBorderLeft(BorderStyle.THIN);// 左边框
        style.setBorderRight(BorderStyle.THIN);// 右边框
        style.setBorderTop(BorderStyle.THIN);// 上边框
        // 设置居中
        style.setAlignment(HorizontalAlignment.CENTER);
        // 设置字体
        Font font = workbook.createFont();
        // 字体颜色
        font.setColor(IndexedColors.WHITE.getIndex());
        // 字体大小
        font.setFontHeightInPoints((short) 12);
        // 字体加粗
        font.setBold(true);
        // 把设置的字体应用到当前的样式
        style.setFont(font);

        // 生成并设置内容区域的背景样式
        CellStyle cellStyle = workbook.createCellStyle();
        // 设置内容区域背景颜色
        cellStyle.setFillForegroundColor(IndexedColors.WHITE.getIndex());
        cellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        cellStyle.setBorderBottom(BorderStyle.THIN); // 下边框
        cellStyle.setBorderLeft(BorderStyle.THIN);// 左边框
        cellStyle.setBorderRight(BorderStyle.THIN);// 右边框
        cellStyle.setBorderTop(BorderStyle.THIN);// 上边框
        // 设置居中
        cellStyle.setAlignment(HorizontalAlignment.CENTER);
        cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        // 设置内容字体
        Font contentFont = workbook.createFont();
        font.setBold(true);
        // 把字体应用到当前的样式
        cellStyle.setFont(contentFont);

        // 声明一个画图的顶级管理器
        Drawing<?> patriarch = sheet.createDrawingPatriarch();
        // 定义注释的大小和位置
        Comment comment = patriarch.createCellComment(new HSSFClientAnchor(0, 0, 0, 0, (short) 4, 2, (short) 6, 5));
        // 设置注释的内容
        comment.setString(new HSSFRichTextString("Created By InkPoint"));
        // 设置注释作者，当鼠标移动到单元格上时可以在状态栏中看到该内容
        comment.setAuthor("InkPoint");

        // 产生表格标题行
        Row row = sheet.createRow(0);
        for (int i = 0; i < headers.length; i++) {
            Cell cell = row.createCell(i);
            cell.setCellStyle(style);
            RichTextString text = new HSSFRichTextString(headers[i]);
            cell.setCellValue(text);
        }

        if (StringUtils.isEmpty(pattern)) {
            pattern = "yyyy/MM/dd";
        }
        // 格式化时间且线程是安全的
        FastDateFormat instance = FastDateFormat.getInstance(pattern);
        // 遍历集合数据，产生数据行
        Iterator<Map<String, Object>> it = dataset.iterator();// 多个Map集合
        int index = 0;
        int count = 0;
        while (it.hasNext()) {
            index++;
            row = sheet.createRow(index);
            Map<String, Object> map = it.next();
            count = headers.length < columns.length ? headers.length : columns.length;
            for (int i = 0; i < count; i++) {
                Cell cell = row.createCell(i);
                cell.setCellStyle(cellStyle);

                try {
                    Object value = map.get(columns[i]);
                    // 判断值得类型后进行强制类型转换
                    String textValue = null;
                    // 判断左边对象是否为instanceof右边类的实例
                    if (value instanceof Date) {
                        Date date = (Date) value;
                        textValue = instance.format(date);
                    } else if (value instanceof byte[]) {
                        // 有图片时 设置行高为60px
                        row.setHeightInPoints(60);
                        // 设置图片所在列宽度为80px
                        sheet.setColumnWidth(i, (short) (35.7 * 80));
                        byte[] bsValue = (byte[]) value;
                        ClientAnchor anchor = new XSSFClientAnchor(0, 0, 1023, 255, (short) 6, index, (short) 6, index);
                        anchor.setAnchorType(ClientAnchor.AnchorType.MOVE_DONT_RESIZE);
                        patriarch.createPicture(anchor, workbook.addPicture(bsValue, Workbook.PICTURE_TYPE_JPEG));
                    } else if (value != null) {
                        textValue = value.toString();
                    } else {
                        textValue = "";
                    }
                    // 如果不是图片数据，就利用正则表达式判断textValue是否全部由数字组成
                    if (textValue != null) {
                        Pattern p = Pattern.compile("^//d+(//.//d+)?$");
                        Matcher matcher = p.matcher(textValue);
                        if (matcher.matches()) {
                            // 是数字当做double处理
                            cell.setCellValue(Double.parseDouble(textValue));
                        } else {
                            RichTextString richTextString = new XSSFRichTextString(textValue);
                            Font font3 = workbook.createFont();
                            font3.setColor(IndexedColors.BLACK.index);// 内容
                            richTextString.applyFont(font3);
                            cell.setCellValue(richTextString);
                        }
                    }
                } catch (SecurityException e) {
                    e.printStackTrace();
                }
            }
        }

        try {
            workbook.write(out);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(workbook);
            IOUtils.closeQuietly(out);
        }
    }
}
