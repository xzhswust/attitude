package com.attitude.controller;

import com.attitude.common.utils.*;
import com.attitude.dal.mybatis.dao.UserMapper;
import com.attitude.dal.mybatis.entity.User;
import com.attitude.dal.mybatis.entity.UserExample;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Smomo on 14-11-20.
 */
@Controller
@RequestMapping(value = "/Customer")
public class CustomerController {
    //注册提交
    @RequestMapping(value = "/RegisterSubmit", method = RequestMethod.POST)
    public ModelAndView RegisterSubmit(Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            AsyncResponseJson responseJson = new AsyncResponseJson(true, "");

            // 检验验证码是否正确
            String verificationCode = request.getParameter("validNum");
            Object code = request.getSession().getAttribute("validNum");
            String verifyCode = null;
            if (null != code) {
                verifyCode = String.valueOf(code);
            }
            if (!StringUtils.equalsIgnoreCase(verifyCode, verificationCode)) {
                responseJson.setSuccess(false);
                responseJson.setMessage("验证码输入错误");
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);

                return null;
            }

            String mobile = request.getParameter("mobile");

            // 检查手机是否已经注册
            UserExample example = new UserExample();
            example.createCriteria().andMobilePhoneEqualTo(mobile);
            List<User> userInfoList = MapperServiceUtil.getUserMapperService().selectByExample(example);
            if (null != userInfoList && userInfoList.size() > 0) {
                responseJson.setSuccess(false);
                responseJson.setMessage("该手机号已被注册。");
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);

                return null;
            }

            String password = request.getParameter("password");

            String md5Pwd = Md5Util.getMd5Password(password);
            User userInfo = new User();
            userInfo.setMobilePhone(mobile);
            userInfo.setPassword(md5Pwd);
            userInfo.setCreateDate(new Date());
            userInfo.setUserName(mobile);

            int ret = MapperServiceUtil.getUserMapperService().insert(userInfo);
            if (ret == 1) {
                responseJson.setSuccess(true);
                responseJson.setMessage("恭喜您，注册成功。");
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
            }
        } catch (Exception ex) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, ex.getMessage()));
        }
        return null;
    }

    //用户登录
    @RequestMapping(value = "/UserLogin", method = RequestMethod.POST)
    public ModelAndView UserLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
        try {
            String mobile = request.getParameter("username");
            String pwd = request.getParameter("password");
            String remember = request.getParameter("rememberMe");
            UserExample example = new UserExample();
            example.createCriteria().andMobilePhoneEqualTo(mobile);
            List<User> users = MapperServiceUtil.getUserMapperService().selectByExample(example);
            AsyncResponseJson responseJson = new AsyncResponseJson(true, "登陆成功");
            if (users == null || users.size() == 0) {
                //用户不存在
                responseJson.setSuccess(false);
                responseJson.setMessage("该手机号未注册。");
            } else {
                User user = users.get(0);
                if (Md5Util.getMd5Password(pwd).equals(user.getPassword())) {
                    Subject subject = SecurityUtils.getSubject();
                    boolean rememberMe = false;

                    if (null != remember && remember.equals("remember")) {
                        rememberMe = true;
                    }
                    UsernamePasswordToken token = new UsernamePasswordToken(mobile, pwd, rememberMe);
                    try {
                        subject.login(token);
                    } catch (IncorrectCredentialsException ice) {
                        responseJson.setMessage("密码错误。");
                        return null;
                    } catch (Exception ex) {
                        responseJson.setMessage(ex.getMessage());
                        return null;
                    }
                    // 记录用户名
                    subject.getSession().setAttribute("user_mobile", mobile);
                    subject.getSession().setAttribute("user_id", user.getId());

//                HttpSession session = request.getSession();
//                session.setAttribute("user_mobile", mobile);
//                session.setAttribute("user_id", user.getId());
//                session.setMaxInactiveInterval(30 * 60);//会话时长设置30分钟
//                responseJson.setSuccess(true);
//                responseJson.setMessage("用户登录成功。");
//                if (remember != null && remember.equals("remember")) {
//                    //记住用户登录名密码
//                    Cookie[] cookies = request.getCookies();
//                    Cookie moblieCookie = null;
//                    Cookie pwdCookie = null;
//                    if (cookies != null) {
//                        for (int i = 0; i < cookies.length; i++) {
//                            Cookie cookie = cookies[i];
//                            if (cookie.getName().equals("user_mobile")) {
//                                moblieCookie = cookie;
//                                cookie.setValue(mobile);
//                                cookie.setMaxAge(7*24*60*60);//一周有效
//                                response.addCookie(cookie);
//                                continue;
//                            }
//                            if (cookie.getName().equals("user_pwd")) {
//                                pwdCookie = cookie;
//                                cookie.setValue(pwd);
//                                cookie.setMaxAge(7*24*60*60);//一周有效
//                                response.addCookie(cookie);
//                                continue;
//                            }
//                        }
//                    }
//                    if (moblieCookie == null) {
//                        Cookie cookie = new Cookie("user_mobile", mobile);
//                        cookie.setMaxAge(7*24*60*60);//一周有效
//                        response.addCookie(cookie);
//                    }
//                    if (pwdCookie == null) {
//                        Cookie cookie = new Cookie("user_pwd", pwd);
//                        cookie.setMaxAge(7*24*60*60);
//                        response.addCookie(cookie);
//                    }
//                }

                } else {
                    responseJson.setSuccess(false);
                    responseJson.setMessage("密码错误。");
                }

            }
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
        } catch (Exception ex) {
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, new AsyncResponseJson(false, ex.getMessage()));
        }
        return null;
    }

    //用户资料
    @RequestMapping(value = "/GetUserInfo", method = RequestMethod.GET)
    public String GetUserInfo(Model model, HttpServletRequest request) {
        String currUserName = ShiroUtil.getCurrLoginUserName();
        if (null == currUserName || currUserName.isEmpty()) {
            return "/login";
        }
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUserNameEqualTo(currUserName);
        List<User> users = MapperServiceUtil.getUserMapperService().selectByExample(userExample);
        if (null != users && users.size() == 1) {
            User user = users.get(0);
            if (null == user.getRealName() || user.getRealName().isEmpty()) {
                model.addAttribute("userTitle", user.getUserName());
            } else {
                model.addAttribute("userTitle", user.getRealName());
            }

            model.addAttribute("realName", user.getRealName());
            model.addAttribute("mobile", user.getUserName());
            model.addAttribute("sex", user.getSex());
            if (user.getBirthday() != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String dateStr = sdf.format(user.getBirthday());
                model.addAttribute("birthday", dateStr);
            }
        }

        return "/myAttitude/userInfo";
    }

    //编辑资料
    @RequestMapping(value = "/EditUserInfo", method = RequestMethod.GET)
    public String EditUserInfo(Model model, HttpServletRequest request) {
        if (ShiroUtil.getCurrLoginUserID() == null) {
            return "login";
        }
        int uid = Integer.parseInt(ShiroUtil.getCurrLoginUserID());
        User user = MapperServiceUtil.getUserMapperService().selectByPrimaryKey(uid);

        if (null == user.getRealName() || user.getRealName().isEmpty()) {
            model.addAttribute("userTitle", user.getUserName());
        } else {
            model.addAttribute("userTitle", user.getRealName());
        }
        model.addAttribute("realName", user.getRealName());
        model.addAttribute("mobile", user.getUserName());
        model.addAttribute("sex", user.getSex());
        if (user.getBirthday() != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String dateStr = sdf.format(user.getBirthday());
            model.addAttribute("birthday", dateStr);
        }
        return "/myAttitude/editUserInfo";
    }

    //提交用户资料编辑
    @RequestMapping(value = "/SubmitEditUserInfo", method = RequestMethod.POST)
    public ModelAndView SubmitEditUserInfo(Model model, HttpServletRequest request, HttpServletResponse response) {

        AsyncResponseJson responseJson = new AsyncResponseJson(false, "");
        if (ShiroUtil.getCurrLoginUserID() == null) {
            responseJson.setSuccess(false);
            responseJson.setMessage("用户未登录，请先登录。");
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
            return null;
        }
        int uid = Integer.parseInt(ShiroUtil.getCurrLoginUserID());
        User user = new User();
        user.setId(uid);
        user.setRealName(request.getParameter("realName"));
        user.setMobilePhone(request.getParameter("mobile"));
        user.setUserName(request.getParameter("mobile"));
        user.setSex(request.getParameter("sex"));
        user.setUpdateDate(new Date());
        String birthdayStr = request.getParameter("birthday");
        if (birthdayStr != null && !birthdayStr.isEmpty()) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            try {
                user.setBirthday(sdf.parse(birthdayStr));
            } catch (ParseException e) {
                responseJson.setSuccess(false);
                responseJson.setMessage("日期格式化有误。");
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
                return null;
            }
        }
        try {
            int ret = MapperServiceUtil.getUserMapperService().updateByPrimaryKeySelective(user);
            if (ret != 1) {
                responseJson.setSuccess(false);
                responseJson.setMessage("更新用户资料失败。");
                HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
                return null;
            }
            responseJson.setSuccess(true);
            responseJson.setMessage("更新用户资料成功。");
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
        } catch (Exception e) {
            responseJson.setSuccess(false);
            responseJson.setMessage("更新用户资料失败。");
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
            return null;
        }

        return null;
    }

    //用户登出
    @RequestMapping(value = "/Logout", method = RequestMethod.GET)
    public String Logout(Model model, HttpServletRequest request) {
//        request.getSession().removeAttribute("user_mobile");
//        request.getSession().removeAttribute("user_id");
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/";
    }

    //找回密码/修改密码界面
    @RequestMapping(value = "/FindPwd", method = RequestMethod.GET)
    public String FindPwd(Model model, HttpServletRequest request) {

        if (ShiroUtil.getCurrLoginUserID() != null) {
            int uid = Integer.parseInt(ShiroUtil.getCurrLoginUserID());
            User user = MapperServiceUtil.getUserMapperService().selectByPrimaryKey(uid);
            model.addAttribute("mobile", user.getMobilePhone());
            if (null == user.getRealName() || user.getRealName().isEmpty()) {
                model.addAttribute("userTitle", user.getUserName());
            } else {
                model.addAttribute("userTitle", user.getRealName());
            }
        }
        return "/myAttitude/pwdSrv";
    }

    @RequestMapping(value = "/PwdModifySubmit", method = RequestMethod.POST)
    public ModelAndView PwdModifySubmit(Model model, HttpServletRequest request, HttpServletResponse response) {
        AsyncResponseJson responseJson = new AsyncResponseJson(true, "");

        // 检验验证码是否正确
        String verificationCode = request.getParameter("validNum");
        Object code = request.getSession().getAttribute("validNum");
        String verifyCode = null;
        if (null != code) {
            verifyCode = String.valueOf(code);
        }
        if (!StringUtils.equalsIgnoreCase(verifyCode, verificationCode)) {
            responseJson.setSuccess(false);
            responseJson.setMessage("验证码输入错误");
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);

            return null;
        }

        String mobile = request.getParameter("mobile");

        // 检查手机是否注册
        UserExample example = new UserExample();
        example.createCriteria().andMobilePhoneEqualTo(mobile);
        List<User> userInfoList = MapperServiceUtil.getUserMapperService().selectByExample(example);
        if (null == userInfoList || userInfoList.size() == 0) {
            responseJson.setSuccess(false);
            responseJson.setMessage("该手机号还未被注册。");
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
            return null;
        }
        int uid = userInfoList.get(0).getId();

        String password = request.getParameter("password");

        String md5Pwd = Md5Util.getMd5Password(password);
        User userInfo = new User();
        //userInfo.setMobilePhone(mobile);
        userInfo.setId(uid);
        userInfo.setPassword(md5Pwd);
        userInfo.setUpdateDate(new Date());


        int ret = MapperServiceUtil.getUserMapperService().updateByPrimaryKeySelective(userInfo);
        if (ret == 1) {
            //清除session
            request.getSession().removeAttribute("user_mobile");
            request.getSession().removeAttribute("user_id");
            responseJson.setSuccess(true);
            responseJson.setMessage("恭喜您，修改密码成功，请重新登录。");
            HttpResponseUtil.writeAsyncResponseJsonToResponse(response, responseJson);
        }
        return null;
    }

    @RequestMapping(value = "/GetUserAddrList", method = RequestMethod.GET)
    public String GetUserAddrList(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/AddAddr", method = RequestMethod.GET)
    public String AddAddr(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/UpdateAddr", method = RequestMethod.GET)
    public String UpdateAddr(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/DeleteAddr", method = RequestMethod.GET)
    public String DeleteAddr(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/GetUserOrderList", method = RequestMethod.GET)
    public String GetUserOrderList(Model model, HttpServletRequest request) {
        return "indexold";
    }

    @RequestMapping(value = "/ModifyPWD", method = RequestMethod.GET)
    public String ModifyPWD(Model model, HttpServletRequest request) {
        return "indexold";
    }
}
