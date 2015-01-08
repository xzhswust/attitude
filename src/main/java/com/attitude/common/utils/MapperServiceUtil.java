package com.attitude.common.utils;

import com.attitude.dal.mybatis.dao.UserMapper;

/**
 * Created by xzh on 15-1-8.
 */
public class MapperServiceUtil {
    public static UserMapper getUserMapperService() throws Exception{
        return (UserMapper)BeansManagerUtil.getBean("userService");
    }
}
