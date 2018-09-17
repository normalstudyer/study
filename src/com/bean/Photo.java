package com.bean;

/**
 * Created by Administrator on 2018/8/29.
 */
public class Photo {
    private int pId;
    private String pName;

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getpName() {
        return pName;
    }
    public void setpName(String pName) {
        this.pName = pName;
    }

    public Photo() {
    }

    @Override
    public String toString() {
        return "Photo{" +
                "pId='" + pId + '\'' +
                ", pName='" + pName + '\'' +
                '}';
    }

    public Photo(int pId,String pNmae) {
        this.pId = pId;
        this.pName = pName;
    }
}
