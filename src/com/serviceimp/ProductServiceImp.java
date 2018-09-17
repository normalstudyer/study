package com.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Product;
import com.dao.ProductDao;
import com.service.ProductService;

@Service
public class ProductServiceImp implements ProductService{
    @Autowired
    ProductDao productDao;
    //content.jsp里面的图书信 息
	@Override
	public Product bookdetail(int pId) {
		// TODO Auto-generated method stub
		Product product = productDao.bookdetail(pId);
		return product;
	}

}
