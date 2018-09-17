package com.dao;

import com.bean.Photo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2018/8/29.
 */
@Repository
public interface PhotoDao {
    List<Photo> list();
    void save(@Param("pId") int pId,@Param("pName") String pName);
    void save1(@Param("pName") String pName);
}
