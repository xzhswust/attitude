<%--
  Created by IntelliJ IDEA.
  User: zh.xu
  Date: 14-2-16
  Time: 20:36
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html lang="en">
<head>
    <sitemesh:head/>
    <title><sitemesh:title/></title>

    <link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">
    <script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>
    <script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>
    <script src="/static/portal/js/common.js" type="application/javascript"></script>

    <%--自定义弹出框--%>
    <SCRIPT src="/static/alert/m.js" type=text/javascript></SCRIPT>
    <SCRIPT src="/static/alert/jquery.ui.draggable.js" type=text/javascript></SCRIPT>
    <!-- 对话框核心JS文件和对应的CSS文件-->
    <SCRIPT src="/static/alert/jquery.alerts.js" type=text/javascript></SCRIPT>
    <LINK media=screen href="/static/alert/jquery.alerts.css" type=text/css rel=stylesheet>

    <script src="/static/portal/js/blocksit.min.js"></script>

    <link rel="shortcut icon" href="/static/portal/images/favicon.ico" />
    <link rel="Bookmark" href="/static/portal/images/favicon.ico" />
</head>
<body class="">
<div class="headerbox white nobg">
    <div class="header">
        <div class="logo">
            <img src="/static/portal/images/logo2.png" width="230" height="51" alt="壹态" title="壹态">
        </div>
        <div class="nav">
            <ul>
                <li><a href="/">首页</a></li>
                <li id="product" class="on"><a href="/Product">壹态套餐</a></li>
                <li id="comment"><a href="/Comment">顾客说</a></li>
                <li id="delivery"><a href="/Delivery">配送服务</a></li>
                <li id="qa"><a href="/QA">常见问题</a></li>
                <li id="about"><a href="/About">关于我们</a></li>
            </ul>
        </div>
        <div class="login">
            <strong>
                <a style="float: left;" href="/Product">
                    <img src="/static/portal/images/goumai.png" alt="立即购买" width="28" height="28" title="立即购买"/>

                    <div>立刻购买</div>
                </a>
                <a style="padding-top:41px;margin:0 5px;float: left">|</a>
                <div style="float: left;">
                    <%--<img src="/static/portal/images/user.png" alt="登陆/注册" title="登陆/注册" width="28" height="28"/>--%>

                    <%--<p><a href="/Login">登陆</a><a>/</a><a href="/Register">注册</a></p>--%>
                    <img id="userPic" src="/static/portal/images/user.png" alt="登陆/注册" title="登陆/注册" width="28"
                         height="28"/>

                    <p id="un_login_state"><a href="/Login">登陆</a><a>/</a><a href="/Register">注册</a></p>

                    <p id="login_state" style="display: none"><a id="userTitle"
                                                                 href="/Customer/GetUserInfo">${userTitle}</a></p>
                </div>
            </strong>
        </div>
        <div class="clear"></div>
    </div>
</div>
<sitemesh:body/>
<div class="clear"></div>
<div class="mainbottom">
    <div class="bottombox"></div>
    <div class="footer">
        <div class="wxtc">
            <div class="is_close"></div>
            <img src="/static/portal/images/yytt.png" width="336" height="295">
        </div>
        <div class="leftmenu">
            <ul>
                <li><a class="wxgx" href="#"><img src="/static/portal/images/wx.png" alt="" height="33"/></a></li>
                <li><a href="http://wpa.qq.com/msgrd?v=3&uin=344013224&site=qq&menu=yes"><img src="/static/portal/images/qq.png" alt=""  height="33"/></a></li>
                <li><a href="#" onclick="window.open('http://weibo.com/u/5275387413');"><img src="/static/portal/images/weibo.png" alt=""  height="33"/></a></li>
                <div class="clear"></div>
            </ul>
            <div class="phoneinfo">
                <img src="/static/portal/images/pico.png" alt=""/>
                4000-160-167 <span>（9:00-22:00）</span>
            </div>
        </div>
        <script>
            $('.wxgx').click(function () {
                $('.wxtc').fadeIn();
                return false;
            })
            $('.is_close').click(function () {
                $('.wxtc').fadeOut();
            })
        </script>
        <div class="rightdesc">
            <ul>
                <li>市场联络：marketing@yitaidiet.com</li>
                <li>职位问询：hr@yitaidiet.com</li>
                <li>蜀ICP备14028674号-1</li>
                <li>做最舒服的自己，Live Yourself Comfortably！</li>
            </ul>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
<script>
    $(document).ready(function () {
        if ($(".block").length<0){
            var dd=$('html').height();
            var screenheight=$(window).height();
            var topheight=$('.headerbox').height();
            var bottomheight=$('.mainbottom').height();
//  		$('.headerbox').append('文档高度'+dd+'<br>');
//  		$('.headerbox').append('屏幕高度'+screenheight+'<br>');
            if (dd<screenheight){
                var wdd=(screenheight-dd);
                var bheight=$('.bodybox').height();
                bheight=bheight+wdd;
                $('.bodybox').height(bheight);
            }
        }

        if ($('#userTitle').text() != '') {
            $('#login_state').show();
            $('#un_login_state').hide();
        }

        if ($('#userTitle').text() != '') {
            $('#login_state').show();
            $('#un_login_state').hide();
        }

        var url = window.location.href;
        $("#product").removeClass("on");
        $("#comment").removeClass("on");
        $("#delivery").removeClass("on");
        $("#qa").removeClass("on");
        $("#about").removeClass("on");
        if (url.indexOf('/Product') > 0) {
            $("#product").addClass("on");
        }else if(url.indexOf('/Comment') > 0) {
            $("#comment").addClass("on");
        }else if(url.indexOf('/Delivery') > 0) {
            $("#delivery").addClass("on");
        }else if(url.indexOf('/QA') > 0) {
            $("#qa").addClass("on");
        }else if(url.indexOf('About') > 0 || url.indexOf('JoinUs') > 0) {
            $("#about").addClass("on");
        }else if(url.indexOf('Customer') > 0 || url.indexOf('Login') > 0 || url.indexOf('Register') > 0){

        }else{
            $("#product").addClass("on");
        }
    });
</script>
</html>

