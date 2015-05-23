<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>壹态Diet</title>
    <%--<meta name="decorator" content="un-decorator-pages"/>--%>
    <%--<link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">--%>
    <%--<script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>--%>
    <%--<script src="/static/portal/js/common.js" type="application/javascript"></script>--%>
</head>
<body>

<div class="bodybox">
    <div class="bodymain2">
        <div class="usernav">
            <h1>我的壹态</h1>
            <ul>
                <li class="on"><a href="/Customer/GetUserInfo">我的资料</a></li>
                <li><a href="/Customer/DeliveryAddrMan">管理收货地址</a></li>
                <li><a href="/Customer/MyOrder">查询订单</a></li>
                <li><a href="#">我的抵用金</a></li>
            </ul>
        </div>
        <div class="mainbox">
            <div class="boxtop lv">
                <div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/userhd.png" alt=""
                                                                  style="vertical-align: middle;"/>我的资料</a></div>
                <div class="fr">
                    <a class="readall" href="/Customer/EditUserInfo">
                        <img src="/static/portal/images/readall.png" alt="" style="vertical-align: middle;"/>编辑资料
                    </a>
                    <a style="margin-right: 20px;margin-left: -20px;color: darkcyan"
                       href="javascript:void(0);" onclick="logout()"><b>退出</b></a>
                </div>
            </div>
            <div class="boxcenter ziliao">
                <div class="userheader">
                    <div class="userhdshade"></div>
                    <!--头像遮罩-->
                    <img src="/static/portal/images/userdemo.png" width="157" height="210"/><!--头像位置&&头像demo图像-->
                </div>
                <div style="display: none;">
                    <input id="account" value="${mobile}">
                </div>
                <div class="userinfo">
                    <ul>
                        <li>姓名：${realName}</li>
                        <li>电话：${mobile}</li>
                        <li>性别：${sex}</li>
                        <li>生日：${birthday}</li>
                    </ul>
                    <div class="save">
                        <a type="submit" class="greenbtn" style="font-size:11px;color:black;"
                           href="/Customer/FindPwd">修改密码</a>
                        <a id="adminBtn" type="button" class="greenbtn" style="font-size:11px;color:black;display: none"
                           href="/Admin">系统管理</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="boxbottom"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function () {
        if($('#account').val()=='admin'){
            $('#adminBtn').show();
        }
    });

    function logout(){
        window.location.href = '/Customer/Logout';
    }
</script>
</body>
</html>
