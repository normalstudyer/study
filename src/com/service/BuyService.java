package com.service;

import java.util.List;

import com.bean.BuyedBooks;

public interface BuyService {
	//把图书加入购物车
    public int shopping(BuyedBooks buyedbooks);
    //查出所有购物车中的图书
    public List<BuyedBooks> bookscar();
}
