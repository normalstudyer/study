package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.Product;
import com.service.IndexService;

@Controller
@RequestMapping(value="/index")
public class IndexController {
     @Autowired
     IndexService indexService;
     
     @SuppressWarnings("rawtypes")
     //获取部分图书信息
	 @RequestMapping(value="/centerBook",method=RequestMethod.POST)
     @ResponseBody
     public List getPart(@RequestBody Map map,HttpServletResponse res,Model model,HttpServletRequest req){
    	 System.out.println("已进入部分图书信息接口debug模式下");
    	 String data = (String) map.get("data");
    	 System.out.println(data);
    	 int start = 0;
    	 int end = 0;
    	 List<Product> list = indexService.getPart(0, 4);
    	 //model.addAttribute("product", list);
    	 req.getSession().setAttribute("product", list);
    	 for(int i=0;i<list.size();i++){
    		 System.out.println(list.get(i));
    	 }
    	 return list;
     }
     //获取热门推荐图书信息
     @SuppressWarnings("rawtypes")
	@RequestMapping(value="/floor-list",method=RequestMethod.POST)
     @ResponseBody
     public List floorlist(@RequestBody Map map,HttpServletRequest req){
    	 String data = (String) map.get("data");
    	 System.out.println(data);
    	 List list = indexService.floorlist(0, 5);
    	 return list;
    	 
     }
}
