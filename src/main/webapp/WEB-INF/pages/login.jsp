<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>欢迎登录壹态</title>
    <!--标识该页面不被sitemesh装饰-->
    <%--<meta name="decorator" content="un-decorator-pages"/>--%>
    <%--<link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">--%>
    <%--<script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/common.js" type="application/javascript"></script>--%>
</head>
<body>
<div class="bodybox">
    <div class="bodymain">
        <div class="leftdesc">
            <img style="margin-right:28px;float:left;" src="/static/portal/images/ico.png" alt="" width="115" height="114"/>

            <h2>营养瘦身</h2>

            <p>欢迎添加壹态DIET营养瘦身餐，由营养学家，专业健身顾问，西餐打出共同设计的健康科学每日餐单。最新鲜的石材，最健康的烹饪方式，当天制作，当天配送，轻松两周十天（不包含双休日）</p>
        </div>
        <div class="rightlogin">
            <h1>壹态会员登录</h1>

            <form id="loginForm" method="post" action="">
                <table>
                    <tr>
                        <td width="57">用户</td>
                        <td><input id="username" name="username" type="text" class="inputtype1" placeholder="请输入手机号" width="261" value="${userName}"/>
                        </td>
                    </tr>
                    <tr>
                        <td width="57">密码</td>
                        <td><input id="password" name="password" type="password" class="inputtype1" placeholder="请输入密码"
                                   onkeydown="if(event.keyCode==13){login();}" width="261" value="${userPwd}"/>
                            <a style="color:#b3d465;vertical-align: bottom;margin-left:5px;" href="/Customer/FindPwd">忘记密码</a></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input name="rememberMe" type="checkbox" value="remember"/> 记住我</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><a class="greenbtn fl" style="margin-right:15px;" href="javascript:void(0);"
                                onclick="login()">立即登录</a><a
                                class="greenbtn fl" href="/Register">注册</a></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#rememberMe').click(function(){
            if($('#rememberMe').attr('checked') == true){

            }
        });
    });

    function login(){
        if ($('#username').val() == null || $('#username').val().length == 0) {
            //alert('请输入手机号码。');
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请填写手机号码</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return;
        }
        if ($('#password').val() == null || $('#password').val().length == 0) {
            //alert('请输入用户密码。');
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请填写用户密码</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return;
        }

        $.ajax({
            url: '/Customer/UserLogin',
            type: 'POST',
            data: $('#loginForm').serialize(),
            dataType: 'json',
            success: function (json) {
                //var json = (new Function("return " + data))();
                if (json.success) { //申报成功
                    alert(json.message);
                    window.location.href = "/Customer/GetUserInfo";

                } else {
                    //$.messager.alert('提示', json.message, 'error');
                    alert(json.message);
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
