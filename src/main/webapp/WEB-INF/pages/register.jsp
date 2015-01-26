<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎注册壹态用户</title>
    <%--<meta name="decorator" content="un-decorator-pages"/>--%>
    <%--<link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">--%>
    <%--<script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/common.js" type="application/javascript"></script>--%>
</head>
<body>
<%--<div class="headerbox white">--%>
    <%--<div class="header">--%>
        <%--<div class="logo">--%>
            <%--<img src="/static/portal/images/logo2.png" width="230" height="51" alt="壹态" title="壹态">--%>
        <%--</div>--%>
        <%--<div class="nav">--%>
            <%--<ul>--%>
                <%--<li><a href="/">首页</a></li>--%>
                <%--<li><a href="/Product">壹态套餐</a></li>--%>
                <%--<li><a href="/Comment">顾客说</a></li>--%>
                <%--<li><a href="/Delivery">配送服务</a></li>--%>
                <%--<li><a href="/QA">常见问题</a></li>--%>
                <%--<li><a href="/About">关于我们</a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
        <%--<div class="login">--%>
            <%--<strong>--%>
                <%--<a style="float: left;" href="/Product">--%>
                    <%--<img src="/static/portal/images/goumai.png" alt="立即购买" width="28" height="28" title="立即购买"/>--%>

                    <%--<div>立刻购买</div>--%>
                <%--</a>--%>
                <%--<a style="padding-top:41px;margin:0 5px;float: left">|</a>--%>

                <%--<div style="float: left;">--%>
                    <%--<img src="/static/portal/images/user.png" alt="登陆/注册" title="登陆/注册" width="28" height="28"/>--%>

                    <%--<p><a href="/Login">登陆</a><a>/</a><a href="/Register">注册</a></p>--%>
                <%--</div>--%>
            <%--</strong>--%>
        <%--</div>--%>
        <%--<div class="clear"></div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<div class="cnav"></div>--%>
<div class="bodybox">
    <div class="bodymain">
        <div class="regbox">
            <h1>感谢您的注册</h1>

            <div class="regleft">
                <img src="/static/portal/images/ico.png" alt=""/>
            </div>
            <div class="regright">
                <form id="registerForm">
                    <table width="100%">
                        <tr>
                            <td width="73">用户名</td>
                            <td width="389"><input id="mobile" name="mobile" type="text" class="inputtype1"
                                                   placeholder="请输入手机号"
                                                   width="261"/><a class="greenbtn" href="javascript:void(0);"
                                                                   onclick="msgValid()"
                                                                   style="margin-left:16px">发送验证码</a></td>
                        </tr>
                        <tr>
                            <td>验证码</td>
                            <td><input id="validNum" name="validNum" type="text" class="inputtype1"
                                       placeholder="请输入您的验证码"
                                       width="261"/>
                            </td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td valign="center"><input id="password" name="password" type="password" class="inputtype1"
                                                       placeholder="请输入密码" width="261"/><img
                                    src="/static/portal/images/yes.png" alt=""
                                    style="vertical-align:middle;margin-left:17px;"/>
                            </td>
                        </tr>
                        <tr>
                            <td>确认密码</td>
                            <td><input id="passwordre" name="passwordre" type="password" class="inputtype1"
                                       placeholder="请确认密码"
                                       width="261"/><img src="/static/portal/images/yes.png" alt=""
                                                         style="vertical-align:middle;margin-left:17px;"/></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a type="submit" class="greenbtn fl" style="margin-right:15px;"
                                   href="javascript:void(0);" onclick="registerSubmit()">立即注册</a>
                                <a class="greenbtn fl" href="/Login">我要登录</a>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<%--<div class="mainbottom">--%>
    <%--<div class="bottombox"></div>--%>
    <%--<div class="footer">--%>
        <%--<div class="leftmenu">--%>
            <%--<ul>--%>
                <%--<li><a href="#"><img src="/static/portal/images/wx.png" alt=""/></a></li>--%>
                <%--<li><a href="#"><img src="/static/portal/images/qq.png" alt=""/></a></li>--%>
                <%--<li><a href="#"><img src="/static/portal/images/weibo.png" alt=""/></a></li>--%>
            <%--</ul>--%>
        <%--</div>--%>
        <%--<div class="rightdesc">--%>
            <%--<ul>--%>
                <%--<li>市场联络：SLKFDJLSKFJS</li>--%>
                <%--<li>京ICP备149594940</li>--%>
                <%--<li>YITAIDIET@163.COM</li>--%>
            <%--</ul>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<script>
    //发送短信验证码
    function msgValid() {
        if ($('#mobile').val() == null || $('#mobile').val().length == 0) {
//            alert('请输入手机号码。');
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请输入手机号码</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return;
        }
        if (!validMobileNum()) {
            return;
        }
        $.ajax({
            url: '/SendMsgValid?mobile=' + $('#mobile').val(),
            type: 'POST',
            dataType: 'json',
            success: function (json) {
                //var json = (new Function("return " + data))();
                if (json.success) { //申报成功
//                    alert(json.message);
                    $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                    jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">恭喜你</div><div>'+json.message+'</div>', '', function() {
                        $.alerts.dialogClass = null; // 重置到默认值
                    });
                    //$.messager.defaults = { ok: "是", cancel: "否" };
//                    var msg = "注册成功，您可以登录系统了，您的登录账号为：" + json.message;
//                    $.messager.confirm('提示', msg, function (r) {
//                        if (r) {
//                            window.location.href = "/?userName=" + json.message;
//                        }
//                    });

                } else {
                    //$.messager.alert('提示', json.message, 'error');
//                    alert(json.message);
                    $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                    jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">抱歉</div><div>'+json.message+'</div>', '', function() {
                        $.alerts.dialogClass = null; // 重置到默认值
                    });
                }
            },
            error: function (data) {
                alert(data);
            }
        });
    }

    //验证手机号
    function validMobileNum() {
        var length = $("#mobile").val().length;
        var mobile = /^(((1[0-9]{2})|(15[0-9]{1}))+\d{8})$/;
        if (length != 11 || !mobile.test($("#mobile").val())) {
//            alert('请输入正确的手机号码!');
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请输入格式正确的手机号码</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        return true;
    }

    //提交前验证
    function validBeforeSubmit() {
        if (!validMobileNum()) {
            return false;
        }

        var v = /\d{6}/;
        if (!v.test($('#validNum').val())) {
//            alert('请输入六位数的手机短信验证码。');
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请输入六位数的手机短信验证码</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }

        if ($('#password').val().length < 8 || $('#passwordre').val().length < 8) {
//            alert('密码长度至少为8位。');
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>密码长度至少为8位</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }

        if ($('#password').val() != $('#passwordre').val()) {
//            alert('两次密码输入不一致。');
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>两次密码输入不一致</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        return true;

    }

    //提交注册
    function registerSubmit() {
        if (!validBeforeSubmit())return;

        $.ajax({
            url: '/Customer/RegisterSubmit',
            type: 'POST',
            data: $('#registerForm').serialize(),
            dataType: 'json',
            success: function (json) {
                //var json = (new Function("return " + data))();
                if (json.success) { //申报成功
//                    alert(json.message);
                    $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                    jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">恭喜你</div><div>'+json.message+'</div>', '', function() {
                        $.alerts.dialogClass = null; // 重置到默认值
                    });
                    window.location.href = "/Login?userName=" + $('#mobile').val();
                    //$.messager.defaults = { ok: "是", cancel: "否" };
//                    var msg = "注册成功，您可以登录系统了，您的登录账号为：" + json.message;
//                    $.messager.confirm('提示', msg, function (r) {
//                        if (r) {
//                            window.location.href = "/?userName=" + json.message;
//                        }
//                    });

                } else {
                    //$.messager.alert('提示', json.message, 'error');
//                    alert(json.message);
                    $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                    jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">抱歉</div><div>'+json.message+'</div>', '', function() {
                        $.alerts.dialogClass = null; // 重置到默认值
                    });
                }
            },
            error: function (data) {
                alert(data);
            }
        });
    }
</script>
</body>
</html>
