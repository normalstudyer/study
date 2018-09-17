package com.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.bean.User;

@Repository
public interface UserDao {
  //登录
  User login(@Param("username") String username,@Param("password") String password);
  //注册
  User register(@Param("username") String username,@Param("password") String password);
}
