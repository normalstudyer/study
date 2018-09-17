package com.serviceimp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bean.Product;
import com.dao.TestDao;
import com.service.TestService;
@Service
public class TestServiceImp implements TestService{
	@Autowired
	TestDao testdao;
    public List<Product> Testlimit(int pstart,int psize){
    	List<Product> list=testdao.Testlimit(pstart, psize);
    	for(int i=0;i<list.size();i++){
    		System.out.println(list.get(i));
    	}
    	return list;
    }
}
