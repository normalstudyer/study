package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bean.Product;

public interface TestDao {
  List<Product> Testlimit(@Param("start") int pstart, @Param("size") int psize);
}
