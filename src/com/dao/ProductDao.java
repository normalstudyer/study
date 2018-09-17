package com.dao;



import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.Product;

@Repository
public interface ProductDao {

	//content.jsp里面的图书信息
	public Product bookdetail(@Param("pId") int pId);
}
