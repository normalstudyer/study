package com.serviceimp;

import com.bean.Photo;
import com.dao.PhotoDao;
import com.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
@Service
public class PhotoServiceImp implements PhotoService{


    @Autowired
    PhotoDao photoDao;
    @Override
    public List<Photo> list() {
        return null;
    }
    @Override
    public void save(int pId,String pName) {
        photoDao.save(pId,pName);
    }
    @Override
    public void save1(String pName) {
        photoDao.save1(pName);
    }
}
