package com.attitude.common.utils;

/**
 * Created by zh.xu on 14-9-3.
 * 异步响音对象
 */
public class AsyncResponseJson {
    private boolean success;  //是否成功

    private String message;  //消息

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
}
