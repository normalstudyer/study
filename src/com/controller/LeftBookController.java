package com.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/leftbook")
public class LeftBookController {
     @RequestMapping("/newbook")
     @ResponseBody
     public List xianshi(@RequestBody Map map,HttpServletRequest req){
    	 
    	 return null;
     }
}
