package com.service;

import java.util.List;

import com.bean.Product;

public interface IndexService {
    //获取部分图书信息
	public List<Product> getPart(int start,int end);
	//获取热门图书信息
	public List<Product> floorlist(int start,int end);
}
