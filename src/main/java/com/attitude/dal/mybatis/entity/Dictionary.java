package com.attitude.dal.mybatis.entity;

public class Dictionary {
    private String dicCode;

    private String upCode;

    private String dicName;

    private Integer dicLevel;

    private Integer dicTypeId;

    public String getDicCode() {
        return dicCode;
    }

    public void setDicCode(String dicCode) {
        this.dicCode = dicCode == null ? null : dicCode.trim();
    }

    public String getUpCode() {
        return upCode;
    }

    public void setUpCode(String upCode) {
        this.upCode = upCode == null ? null : upCode.trim();
    }

    public String getDicName() {
        return dicName;
    }

    public void setDicName(String dicName) {
        this.dicName = dicName == null ? null : dicName.trim();
    }

    public Integer getDicLevel() {
        return dicLevel;
    }

    public void setDicLevel(Integer dicLevel) {
        this.dicLevel = dicLevel;
    }

    public Integer getDicTypeId() {
        return dicTypeId;
    }

    public void setDicTypeId(Integer dicTypeId) {
        this.dicTypeId = dicTypeId;
    }
}