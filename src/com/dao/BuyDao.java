package com.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.BuyedBooks;

@Repository
public interface BuyDao {
    //把图书加入购物车
	public int shopping(BuyedBooks buyedbooks);
	//进行购买
	public List<BuyedBooks> bookscar();
}
