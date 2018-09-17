package com.test;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.FileOutputStream;

/**
 * 生成一个简单的Excel里面的sheet
 * Created by Administrator on 2018/8/23.
 */
public class FromDbToExcelTest01 {
    public static void main(String[] args){
        //建立一个excel表
        Workbook book = new HSSFWorkbook();
        //在对应的Excel中建立一个分表
        Sheet sheet1 = book.createSheet("分表1");
        //设置相应的行(初始从0开始)
        Row row = sheet1.createRow(0);
        //在所在的行设置所在的单元格(相当于列，初始从0开始，对应的就是A列)
        Cell cell =row.createCell(0);
        //写入相关数据到设置的行列中去。
        cell.setCellValue("相关数据");
        //保存到计算机相应路径
        try {
            book.write( new FileOutputStream("D://a.xls"));
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
