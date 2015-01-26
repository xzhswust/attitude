<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>壹态Diet</title>
    <!--标识该页面不被sitemesh装饰-->
    <meta name="decorator" content="un-decorator-pages"/>
    <link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">
    <script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>
    <script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>
    <script src="/static/portal/js/common.js" type="application/javascript"></script>
</head>
<body>
<div class="mainbanner">
    <div class="picbox">
        <ul>
            <li><a href="/"
                   style="display:block;width:100%;height:100%;background:url(/static/portal/images/banner.png) no-repeat center top"></a>
            </li>
            <%--<li><a href="/"--%>
                   <%--style="display:block;width:100%;height:100%;background:url(/static/portal/images/banner.png) no-repeat center top"></a>--%>
            <%--</li>--%>
            <%--<li><a href="/"--%>
                   <%--style="display:block;width:100%;height:100%;background:url(/static/portal/images/banner.png) no-repeat center top"></a>--%>
            <%--</li>--%>
        </ul>
    </div>
</div>
<div class="headerbox">
    <div class="header">
        <div class="logo">
            <img src="/static/portal/images/logo.png" width="230" height="51" alt="壹态" title="壹态">
        </div>
        <div class="nav">
            <ul>
                <li class="on"><a href="/">首页</a></li>
                <li><a href="/Product">壹态套餐</a></li>
                <li><a href="/Comment">顾客说</a></li>
                <li><a href="/Delivery">配送服务</a></li>
                <li><a href="/QA">常见问题</a></li>
                <li><a href="/About">关于我们</a></li>
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
                    <img id="userPic" src="/static/portal/images/user.png" alt="登陆/注册" title="登陆/注册" width="28"
                         height="28"/>

                    <p id="un_login_state"><a href="/Login">登陆</a><a>/</a><a href="/Register">注册</a></p>

                    <p id="login_state" style="display: none"><a id="userTitle"
                                                                 href="/Customer/GetUserInfo">${userTitle}</a></p>
                </div>
            </strong>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        if ($('#userTitle').text() != '') {
            $('#login_state').show();
            $('#un_login_state').hide();
        }
    });
</script>

</body>
</html>
