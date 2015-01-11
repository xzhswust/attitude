package com.attitude.common.utils;

import com.attitude.dal.mybatis.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.ui.Model;

/**
 * Created by xzh on 15-1-11.
 */
public class ShiroUtil {
    public static String getCurrLoginUserName(){
        Subject subject = SecurityUtils.getSubject();
        if(null != subject.getSession()) {
            return String.valueOf(subject.getSession().getAttribute("user_mobile"));
        }else{
            return null;
        }
    }

    public static String getCurrLoginUserID(){
        Subject subject = SecurityUtils.getSubject();
        if(null != subject.getSession()) {
            return String.valueOf(subject.getSession().getAttribute("user_id"));
        }else{
            return null;
        }
    }

    public static void setModelUserTitle(Model model){
        try {
            if (ShiroUtil.getCurrLoginUserID() != null) {
                int uid = Integer.parseInt(ShiroUtil.getCurrLoginUserID());
                User user = MapperServiceUtil.getUserMapperService().selectByPrimaryKey(uid);
                if (null == user.getRealName() || user.getRealName().isEmpty()) {
                    model.addAttribute("userTitle", user.getUserName());
                } else {
                    model.addAttribute("userTitle", user.getRealName());
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
