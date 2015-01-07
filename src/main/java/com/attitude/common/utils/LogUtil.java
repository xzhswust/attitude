package com.attitude.common.utils;

import org.apache.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 14-5-7.
 */
public class LogUtil {
    private static Map<Class, Logger> loggers = new HashMap<Class, Logger>();
    private static Object syncRoot = new Object();

    private LogUtil(){

    }

    public static Logger getLogger(Class clazz){
        if (loggers.containsKey(clazz)){
            return loggers.get(clazz);
        }

        synchronized (syncRoot){
            if (loggers.containsKey(clazz)){
                return loggers.get(clazz);
            }else{
                Logger logger = Logger.getLogger(clazz);
                loggers.put(clazz, logger);
                return logger;
            }
        }
    }

    public static void info(Class clazz, Object message){
        Logger logger = getLogger(clazz);
        if (logger.isInfoEnabled()){
            logger.info(message);
        }
    }

    public static void info(Class clazz, Object message, Throwable t){
        Logger logger = getLogger(clazz);
        if (logger.isInfoEnabled()){
            logger.info(message, t);
        }
    }

    public static void debug(Class clazz, Object message){
        Logger logger = getLogger(clazz);
        if (logger.isDebugEnabled()){
            logger.debug(message);
        }
    }

    public static void debug(Class clazz, Object message, Throwable t){
        Logger logger = getLogger(clazz);
        if (logger.isDebugEnabled()){
            logger.debug(message, t);
        }
    }

    public static void fault(Class clazz, Object message){
        Logger logger = getLogger(clazz);
        logger.fatal(message);
    }

    public static void fault(Class clazz, Object message, Throwable t){
        Logger logger = getLogger(clazz);
        logger.fatal(message, t);
    }

    public static void warn(Class clazz, Object message){
        Logger logger = getLogger(clazz);
        logger.warn(message);
    }

    public static void warn(Class clazz, Object message, Throwable t){
        Logger logger = getLogger(clazz);
        logger.warn(message, t);
    }
}
