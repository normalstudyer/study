package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Product;
@Repository
public interface IndexDao {
	//获取部分图书信息
   public List<Product> getPart(@Param(value = "start") int start,@Param(value = "end") int end);
   //获取热门图书信息
   public List<Product> floorlist(@Param(value = "start") int start,@Param(value = "end") int end);
}

