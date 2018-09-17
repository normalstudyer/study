package com.test;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/8/23.
 */
public class Test03 {
    public static final String url = "jdbc:mysql://127.0.0.1:3306/graduate";
    public static final String user = "root";
    public static final String password = "123456";
    public static void main(String[] args){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            //连接数据库
            Connection con = DriverManager.getConnection(url,user,password);
            DatabaseMetaData dbmt = con.getMetaData();
            //拿到所有的graduate数据库中的所有信息
            ResultSet rs = dbmt.getTables("graduate","graduate",null,new String[]{"TABLE","VIEW"});
            List<String> tablenames = new ArrayList<String>();
            while(rs.next()){
                String tablename = rs.getString("TABLE_NAME");
                tablenames.add(tablename);
            }
            for(String tablename:tablenames){
                System.out.println(tablename+"表：");
                String sql = "select * from "+tablename;
                Statement st = con.createStatement();
                ResultSet dataRs = st.executeQuery(sql);
                ResultSetMetaData rsmt = dataRs.getMetaData();
                //拿到列数
                int columns = rsmt.getColumnCount();
                for(int i=1;i <= columns;i++){
                    //拿到表头信息
                    String colName = rsmt.getColumnName(i);
                    System.out.println(colName+"\t");
                }
                System.out.println();
                while (dataRs.next()){
                    for (int i =1;i <= columns;i++){
                        //拿到表信息
                        System.out.println(dataRs.getString(i)+"\t");
                    }
                    System.out.println();
                }
            }
            con.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
