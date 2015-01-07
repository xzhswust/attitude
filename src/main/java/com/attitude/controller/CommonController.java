package com.attitude.controller;

import com.attitude.SmsClient.interfacej.SmsClientInterface;
import com.attitude.common.utils.AsyncResponseJson;
import com.attitude.common.utils.CommonUtil;
import com.attitude.common.utils.HttpResponseUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by Smomo on 2014/12/28.
 */
@Controller
public class CommonController {
    @RequestMapping(value = "/SendMsgValid", method = RequestMethod.POST)
    public ModelAndView SendMsgValid(HttpServletRequest request, HttpServletResponse response) {
        String mobile = request.getParameter("mobile");
        String validNum = CommonUtil.GetVerificationCode();
        String content = "壹态网欢迎您，用户手机验证码为【" + validNum + "】";
        SmsClientInterface.sendSms(mobile,content);

        //发送成功
        HttpSession session = request.getSession();
        session.setAttribute("validNum",validNum);
        HttpResponseUtil.writeAsyncResponseJsonToResponse(response,new AsyncResponseJson(true,"手机验证码已成功发送。"));
        return null;
    }
}
