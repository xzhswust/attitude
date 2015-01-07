package com.attitude.controller;

import com.attitude.SmsClient.interfacej.SmsClientInterface;
import com.attitude.common.utils.CommonUtil;
import com.attitude.dal.mybatis.dao.UserMapper;
import com.attitude.dal.mybatis.entity.User;
import com.attitude.dal.mybatis.entity.UserExample;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by zh.xu on 14-5-26.
 */
@Controller
public class HelloController {
    @Resource
    private UserMapper mapper;

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String hello(Model model, HttpServletRequest request) {
        List<User> l = mapper.selectByExample(new UserExample());
        model.addAttribute("user", l.get(0).getUserName());
        model.addAttribute("Vcode", "壹态网欢迎您，手机验证码【" + CommonUtil.GetVerificationCode() + "】");
        //String msg  = SmsClientInterface.sendSms("http://www.duanxin10086.com/sms.aspx","9988","Z2313","123456","13709011577","Hello momo!");
        //System.out.println(msg);
        return "test";
    }

    @RequestMapping(value = "/mobileSMS", method = RequestMethod.POST)
    public String mobileSMS(Model model, HttpServletRequest request) {
        String mobile = request.getParameter("mobile");
        String content = request.getParameter("content");
        //String msg = SmsClientInterface.sendSms("http://www.duanxin10086.com/sms.aspx", "9988", "Z2313", "123456", mobile, content);
        String msg = SmsClientInterface.sendSms(mobile, content);
        System.out.println(msg);
        model.addAttribute("msg", msg);
        return "test";
    }


}
