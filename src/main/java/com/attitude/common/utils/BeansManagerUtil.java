package com.attitude.common.utils;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 14-9-2.
 */
public class BeansManagerUtil {
    private static ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
    private static Map<String, Object> beans = new HashMap<String, Object>();

    /**
     * 获取JavaBean
     *
     * @param name javaBean名称
     * @return
     * @throws Exception
     */
    public synchronized static Object getBean(String name) throws Exception{
        return innerGetBean(name);
    }

    /**
     * 获取JavaBean实例(泛型方法)
     *
     * @param name javaBean名称
     * @param <T>
     * @return
     */
    public synchronized static <T> T getGenericBean(String name) throws Exception{
        Object bean = innerGetBean(name);
        return (T)bean;
    }

    private static Object innerGetBean(String name) throws Exception{
        if(null == name || name.isEmpty()){
            throw new Exception("JavaBean名称不能为null");
        }

        if(beans.containsKey(name)){
            return beans.get(name);
        }else{
            Object bean = cxt.getBean(name);
            if(null != bean){
                beans.put(name, bean);
                return bean;
            }else{
                throw new Exception("未找到名称为" + name + "的JavaBean");
            }
        }
    }
}
