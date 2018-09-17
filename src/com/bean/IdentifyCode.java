package com.bean;

import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2018/8/27.
 */
@Repository
public class IdentifyCode {
    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public IdentifyCode(String code) {
        this.code = code;
    }

    public IdentifyCode() {
        super();
    }
}
