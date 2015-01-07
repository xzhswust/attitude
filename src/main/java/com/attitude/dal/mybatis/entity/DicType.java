package com.attitude.dal.mybatis.entity;

public class DicType {
    private Integer dicTypeId;

    private String dicTypeName;

    public Integer getDicTypeId() {
        return dicTypeId;
    }

    public void setDicTypeId(Integer dicTypeId) {
        this.dicTypeId = dicTypeId;
    }

    public String getDicTypeName() {
        return dicTypeName;
    }

    public void setDicTypeName(String dicTypeName) {
        this.dicTypeName = dicTypeName == null ? null : dicTypeName.trim();
    }
}