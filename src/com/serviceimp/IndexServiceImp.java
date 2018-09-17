package com.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Product;
import com.dao.IndexDao;
import com.service.IndexService;

@Service
public class IndexServiceImp implements IndexService{
	@Autowired
	IndexDao indexDao;
    //获取部分图书信息
	@Override
	public List<Product> getPart(int start, int end) {
		// TODO Auto-generated method stub
		
		List<Product> list = indexDao.getPart(start, end);
		return list;
	}
	//获取热门图书信息
	@Override
	public List<Product> floorlist(int start, int end) {
		// TODO Auto-generated method stub
		List<Product> list = indexDao.getPart(start, end);
		return list;
	}
  
}
