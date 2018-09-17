package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Product;
import com.service.ProductService;

@Controller
@RequestMapping(value="/product")
public class ProductController {
	@Autowired
	ProductService productService;
    //在content.jsp里面显示图书的具体信息
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/booklist",method=RequestMethod.POST)
	@ResponseBody
	public void booklist(@RequestBody Map map,HttpServletRequest req,Model model){
		System.out.println("已成功进入content.jsp里面的图书信息");
		
		int pId = (int) map.get("pid");
		Product product=productService.bookdetail(pId);
		System.out.println(product);
		req.getSession().setAttribute("book", product);
		//model.addAttribute("book", list);
		
	}
}
