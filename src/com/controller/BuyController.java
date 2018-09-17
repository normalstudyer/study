package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.BuyedBooks;
import com.service.BuyService;

@Controller
@RequestMapping("/buy")
public class BuyController {
	public static int i = 1;
	@Autowired
	BuyService buyService;
	//加入购物车中
    @RequestMapping(value="/shopping",method=RequestMethod.POST)
    @ResponseBody
    public void shopping(@RequestBody Map map,HttpServletRequest request){
    	System.out.println("已进入购买系统");
    	String bName = (String) map.get("bName");
    	String bCount1 = (String) map.get("bCount");
    	int bCount = Integer.parseInt(bCount1);
    	String bPrice1 = (String) map.get("bPrice");
    	double bPrice = Double.parseDouble(bPrice1);
    	String bId = "00000"+i;
    	BuyedBooks buyedbooks = new BuyedBooks(bId, bName, bCount, bPrice);
    	int j = buyService.shopping(buyedbooks);
    	
    	i++;
    	System.out.println(i+"已退出购买系统");
    }
    
    
    //显示所有加入购物车的图书
    @RequestMapping(value="/bookscar",method=RequestMethod.POST)
    @ResponseBody
    public List<BuyedBooks> bookscar(@RequestBody Map map,HttpServletRequest request){
    	String flag = (String) map.get("flag");
    	System.out.println("查出所有的购物车中图书的信息"+flag);
    	List<BuyedBooks> list = buyService.bookscar();
    	return list;
    }
}
