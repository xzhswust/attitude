package com.attitude.controller;

import com.attitude.common.utils.MapperServiceUtil;
import com.attitude.common.utils.ShiroUtil;
import com.attitude.dal.mybatis.dao.UserMapper;
import com.attitude.dal.mybatis.entity.User;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Smomo on 14-11-20.
 */
@Controller
public class PortalController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String Portal(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "index";
    }

    @RequestMapping(value = "/Product", method = RequestMethod.GET)
    public String Product(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "/product/product";
    }

    @RequestMapping(value = "/Delivery", method = RequestMethod.GET)
    public String Delivery(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "/delivery/delivery";
    }

    @RequestMapping(value = "/Comment", method = RequestMethod.GET)
    public String Comment(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "/comment/guestSay";
    }

    @RequestMapping(value = "/QA", method = RequestMethod.GET)
    public String QA(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "/qa/qa";
    }

    @RequestMapping(value = "/ComDesc", method = RequestMethod.GET)
    public String ComDesc(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "/about/companyDesc";
    }

    @RequestMapping(value = "/About", method = RequestMethod.GET)
    public String About(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "/about/brandStory";
    }

    @RequestMapping(value = "/Login", method = RequestMethod.GET)
    public String Login(Model model, HttpServletRequest request) {
        model.addAttribute("userName", request.getParameter("userName"));
        //记住用户登录名密码
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals("user_mobile")) {
                    model.addAttribute("userName", cookie.getValue());
                    continue;
                }
                if (cookie.getName().equals("user_pwd")) {
                    model.addAttribute("userPwd", cookie.getValue());
                    continue;
                }
            }
        }
        return "login";
    }

    @RequestMapping(value = "/Register", method = RequestMethod.GET)
    public String Register(Model model, HttpServletRequest request) {
        return "register";
    }

    @RequestMapping(value = "/Order", method = RequestMethod.GET)
    public String Order(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "/product/order";
    }

    @RequestMapping(value = "/Query", method = RequestMethod.GET)
    public String Query(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "indexold";
    }

    @RequestMapping(value = "/Customer", method = RequestMethod.GET)
    public String Customer(Model model, HttpServletRequest request) {
        ShiroUtil.setModelUserTitle(model);
        return "indexold";
    }

}
