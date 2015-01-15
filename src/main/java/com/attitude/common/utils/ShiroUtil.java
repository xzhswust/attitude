package com.attitude.common.utils;

import com.attitude.dal.mybatis.entity.User;
import com.attitude.dal.mybatis.entity.UserExample;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.ui.Model;

import java.util.List;

/**
 * Created by xzh on 15-1-11.
 */
public class ShiroUtil {
    public static String getCurrLoginUserName(){
        Subject subject = SecurityUtils.getSubject();
        boolean isRemenberMe = subject.isRemembered();
        if(isRemenberMe) {
            String userName = String.valueOf(subject.getPrincipal());
            return userName;
        }
        if(null != subject.getSession()) {
            return String.valueOf(subject.getSession().getAttribute("user_mobile"));
        }else{
            return null;
        }
    }

    public static String getCurrLoginUserID(){
        Subject subject = SecurityUtils.getSubject();
        if(null != subject.getSession() && null != subject.getSession().getAttribute("user_id")) {
            return String.valueOf(subject.getSession().getAttribute("user_id"));
        }else{
            return null;
        }
    }

    public static void setModelUserTitle(Model model){
        try {
            Subject subject = SecurityUtils.getSubject();
            boolean isRemenberMe = subject.isRemembered();
            if(isRemenberMe){
                String userID = String.valueOf(subject.getPrincipal());
                UserExample userExample = new UserExample();
                userExample.createCriteria().andUserNameEqualTo(userID);
                List<User> users = MapperServiceUtil.getUserMapperService().selectByExample(userExample);
                if(users.size() == 1){
                    if (null == users.get(0).getRealName() || users.get(0).getRealName().isEmpty()) {
                        model.addAttribute("userTitle", users.get(0).getUserName());
                    } else {
                        model.addAttribute("userTitle", users.get(0).getRealName());
                    }
                }
            }else{
                if(null != ShiroUtil.getCurrLoginUserID()){
                    int uid = Integer.parseInt(ShiroUtil.getCurrLoginUserID());
                    User user = MapperServiceUtil.getUserMapperService().selectByPrimaryKey(uid);
                    if (null == user.getRealName() || user.getRealName().isEmpty()) {
                        model.addAttribute("userTitle", user.getUserName());
                    } else {
                        model.addAttribute("userTitle", user.getRealName());
                    }
                }
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }
}
