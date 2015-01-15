package com.attitude.common.utils;

import com.attitude.dal.mybatis.dao.AddressMapper;
import com.attitude.dal.mybatis.dao.UserMapper;

/**
 * Created by xzh on 15-1-8.
 */
public class MapperServiceUtil {
    public static UserMapper getUserMapperService(){
        try{
            return (UserMapper)BeansManagerUtil.getBean("userService");
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            return null;
        }
    }

    public static AddressMapper getAddressMapperService(){
        try{
            return (AddressMapper)BeansManagerUtil.getBean("addressService");
        }catch (Exception ex){
            System.out.println(ex.getMessage());
            return null;
        }
    }
}
