package com.service;

import com.bean.Photo;


import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
public interface PhotoService {
    List<Photo> list();
    void save(int pId,String pName);
    void save1(String pName);
}
