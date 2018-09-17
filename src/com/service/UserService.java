package com.service;

import com.bean.User;

public interface UserService {
 //登录
 String login(String username,String password);
 //注册
 User register(String username,String password);
 //获取验证码
 public String check(String email);
}
