package com.attitude.common.utils;

import com.attitude.dal.mybatis.dao.service.StaticService;

import java.lang.Math;
import java.util.Random;

/**
 * Created by Smomo on 14-11-19.
 */
public class CommonUtil {
    public static String GetVerificationCode() {
        String code="";
        Random r = new Random();
        for(int i=0;i<6;i++){
            int x = r.nextInt(10);
            code += String.valueOf(x);
        }
        //git
        return code;
    }

    public static StaticService GetStaticService(){
        try{
            return (StaticService)BeansManagerUtil.getBean("staticService");
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            return null;
        }
    }
}
