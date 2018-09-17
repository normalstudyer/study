package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.IdentifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bean.User;
import com.service.UserService;

@Controller
@RequestMapping(value="user")
public class UserController {
       @Autowired
       UserService userservice;
       @Autowired
	   IdentifyCode code;
       //登录
       @RequestMapping(value="/login",method=RequestMethod.POST)
       @ResponseBody
       public Map login(@RequestBody Map map,Model model,HttpServletRequest req,HttpServletResponse res){
    	   System.out.println("已经进入登录后台");
    	   String username = (String) map.get("username");
    	   String password = (String) map.get("password");
    	   Map map1 = new HashMap();
    	   System.out.println("username+password"+username+password);
    	   String s = userservice.login(username, password);
		   HttpSession session = req.getSession();
    	   /*if(u!=null){
    		   req.getSession().setAttribute("userName", username);
    		   System.out.println(username);
    		   //flag = "redirect:Shop/index.jsp";
    		   flag = "true";//登录成功
    	   }*/
    	   if(s.equals("true")){
    		   session.setAttribute("userName", username);
    		   session.setMaxInactiveInterval(4*60*60);//设置session最大时间为1分钟，即1分钟后该session消失
    		  /* Cookie cookie = new Cookie("userName",username);
    		   cookie.setMaxAge(5*60);
    		   res.addCookie(cookie);*/
    		  map1.put("data","success");
    		  //return "redirect:/index.jsp";
    	   }else{
			   map1.put("data","error");
    	   	//return "login.jsp";
		   }
           return map1;
    	  // System.out.println(req.getSession().getAttribute("path"));
		   //return "redirect:res.getSession().getAttribute('path')/index";//为什么不跳转
    	   //return s;
       }
       //注册
       @RequestMapping(value="/register",method=RequestMethod.POST)
       @ResponseBody
       public Map register(@RequestBody Map map,Model model,HttpServletRequest req){
    	   String username = (String) map.get("username");
    	   String password = (String) map.get("password");
    	   String mail = (String)map.get("mail");
    	   Map<String,Object> map1 = new HashMap<String,Object>();
		   if(mail.equals(code.getCode())){
			   User u = userservice.register(username, password);
			   if(u!=null){
				   map1.put("success","1");//表示已经注册过
			   }else{
			   	map1.put("success","0");
			   }
		   }else{
		   	map1.put("success","2");
		   }
    	   return map1;
       }
       //获取验证码
	   @RequestMapping(value="/mail")
	   @ResponseBody
	   public Map check(@RequestBody Map map, HttpServletRequest request){
		   System.out.println("发送邮件");
		   String yx = (String)map.get("email");
		   String number = userservice.check(yx);
		   code = new IdentifyCode(number);
		   //return "jsp/register";
		   Map<String,Object> map1 = new HashMap<>();
		   map1.put("message",number);
		   return map1;
	   }
       //退出登录
       @RequestMapping(value="/outlogin",method=RequestMethod.POST)
       @ResponseBody
       public Map outlogin(@RequestBody Map map,Model model,HttpServletRequest req){
    	   System.out.println("进入退出登录功能");
    	   String flag = (String) map.get("flag");
    	   String s = null;
    	   Map map1 = new HashMap();
    	   if(flag.equals("false")){
    		   s = "outLogin";
    		   req.getSession().setAttribute("userName", "");
    	   }
    	   map1.put("success",s);
    	   return map1;
       }
}
