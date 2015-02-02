package com.attitude.common.utils;

/**
 * Created by zh.xu on 14-9-3.
 * 异步响音对象
 */
public class AsyncResponseJson {
    private boolean success;  //是否成功

    private String message;  //消息

    private String retStr = "";//返回的字符串

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public AsyncResponseJson(boolean isSuccess){
        this.success = isSuccess;
    }

    public AsyncResponseJson(boolean isSuccess, String message){
        this.success = isSuccess;
        this.message = message;
    }

    public AsyncResponseJson(boolean isSuccess, String message, String retStr){
        this.success = isSuccess;
        this.message = message;
        this.retStr = retStr;
    }

    public String getRetStr() {
        return retStr;
    }

    public void setRetStr(String retStr) {
        this.retStr = retStr;
    }
}
