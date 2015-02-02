package com.attitude.controller;

import com.attitude.SmsClient.interfacej.SmsClientInterface;
import com.attitude.common.utils.AsyncResponseJson;
import com.attitude.common.utils.CommonUtil;
import com.attitude.common.utils.HttpResponseUtil;
import com.attitude.common.utils.JsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Smomo on 2014/12/28.
 */
@Controller
public class CommonController {
    //发送短信
    @RequestMapping(value = "/SendMsgValid", method = RequestMethod.POST)
    public ModelAndView SendMsgValid(HttpServletRequest request, HttpServletResponse response) {
        String mobile = request.getParameter("mobile");
        String validNum = CommonUtil.GetVerificationCode();
        String content = "壹态网欢迎您，用户手机验证码为:" + validNum;
        SmsClientInterface.sendSms(mobile,content);

        //发送成功
        HttpSession session = request.getSession();
        session.setAttribute("validNum",validNum);
        session.setAttribute("mobile",mobile);
        HttpResponseUtil.writeAsyncResponseJsonToResponse(response,new AsyncResponseJson(true,"手机验证码已成功发送。"));
        return null;
    }

    //获取未来两月内的所有周日
    @RequestMapping(value = "/GetLatestSunday", method = RequestMethod.GET)
    public ModelAndView GetLatestSunday(HttpServletRequest request, HttpServletResponse response) {
        Calendar calendar = Calendar.getInstance();
        calendar.setFirstDayOfWeek(Calendar.MONDAY);
        calendar.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);//本周的周日

        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH) + 2;
        int day = calendar.get(Calendar.DATE);
        Calendar cend = Calendar.getInstance();
        cend.set(year, month, day);//2个月后
        Calendar d = (Calendar) calendar.clone();
        Calendar begin = (Calendar) calendar.clone();//开始日期 周日的前一天
        begin.add(Calendar.DAY_OF_YEAR, -1);
        List<String> list = new ArrayList<String>();
        for (; d.before(cend) && d.after(begin); d.add(Calendar.DAY_OF_YEAR, 7)) {
            String date = d.get(Calendar.YEAR) + "-" ;
            if(1 + calendar.get(Calendar.MONTH) < 10){
                date += "0" + (1 + d.get(Calendar.MONTH));
            }else{
                date += (1 + d.get(Calendar.MONTH));
            }
            if(d.get(Calendar.DATE) < 10){
                date += "-0" + d.get(Calendar.DATE);
            }else{
                date += "-" + d.get(Calendar.DATE);
            }
            list.add(date);
        }
        HttpResponseUtil.writeTextToResponse(response, JsonUtil.toJson(list));
        return null;
    }
}
