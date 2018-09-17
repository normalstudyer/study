package com.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.bean.BuyedBooks;
import com.dao.BuyDao;
import com.service.BuyService;

@Service
public class BuyServiceImp implements BuyService {
	@Autowired
	BuyDao buyDao;
    //把图书加入购物车
	@Override
	public int shopping(BuyedBooks buyedbooks) {
		// TODO Auto-generated method stub
		int j = buyDao.shopping(buyedbooks);
		return j;
	}
	//查出所有的
	@Override
	public List<BuyedBooks> bookscar() {
		// TODO Auto-generated method stub
		List<BuyedBooks> list = buyDao.bookscar();
		return list;
	}

}
