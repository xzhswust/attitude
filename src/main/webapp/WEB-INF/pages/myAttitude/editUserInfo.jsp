<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改资料</title>
    <meta name="decorator" content="un-decorator-pages"/>
    <link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">
    <script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>
    <script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>
    <script src="/static/portal/js/common.js" type="application/javascript"></script>
    <script src="/static/laydate/laydate.js" type="application/javascript"></script>
</head>
<body>
<div class="headerbox white">
    <div class="header">
        <div class="logo">
            <img src="/static/portal/images/logo2.png" width="230" height="51" alt="壹态" title="壹态">
        </div>
        <div class="nav">
            <ul>
                <li><a href="/">首页</a></li>
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
        <div class="clear"></div>
    </div>
</div>
<div class="cnav"></div>
<div class="bodybox">
    <div class="bodymain2">
        <div class="usernav">
            <h1>我的壹态</h1>
            <ul>
                <li class="on"><a href="/Customer/GetUserInfo">我的资料</a></li>
                <li><a href="#">管理收货地址</a></li>
                <li><a href="#">查询订单</a></li>
                <li><a href="#">我的抵用金</a></li>
            </ul>
        </div>
        <div class="mainbox">
            <div class="boxtop lv">
                <div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/userhd.png" alt=""
                                                                  style="vertical-align: middle;"/>资料修改</a></div>
                <div class="fr" style="display: none;">
                    <a class="readall" href="#">
                        <img src="/static/portal/images/readall.png" alt="" style="vertical-align: middle;"/>编辑资料
                    </a>
                </div>
            </div>
            <div class="boxcenter ziliao">
                <div class="userheader">
                    <div class="userhdshade"></div>
                    <!--头像遮罩-->
                    <img src="/static/portal/images/userdemo.png" width="157" height="210"/><!--头像位置&&头像demo图像-->
                    <a href="#">上传头像</a>
                    <a href="#">修改头像</a>
                </div>
                <div class="userinfo infosmall">
                    <form id="userForm">
                        <ul>
                            <li>姓名：<input type="text" id="realName" name="realName" class="inputtype2" value="${realName}"/></li>
                            <li>电话：<input type="text" id="mobile" name="mobile" class="inputtype2" value="${mobile}"/></li>
                            <div style="display: none">
                                <span id="sexHidden">${sex}</span>
                            </div>
                            <li>性别：<input type="radio" id="male" name="sex" value="男"/> 男 <input type="radio" id="female" name="sex"
                                                                                       value="女"/> 女
                            </li>
                            <li>生日：<input id="birthday" name="birthday" class="laydate-icon inputtype2"
                                          value="${birthday}"/></li>
                            <script>
                                laydate({
                                    elem: '#birthday', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
                                    event: 'focus', //响应事件。如果没有传入event，则按照默认的click
                                    format: 'YYYY-MM-DD',
                                    istime: false,
                                    min: '1900-01-01',
                                    start: '1990-01-01'
                                });
                                laydate.skin('huanglv');
                            </script>
                            <li><img src="/static/portal/images/liststyle1.png" align=""
                                     style="vertical-align: middle;margin-right:13px;"/>完善您的个人资料，加入我们，和壹态社区其他客户进行更好的互动
                            </li>
                        </ul>
                    </form>
                    <div class="save">
                        <a type="submit" class="greenbtn" style="font-size:11px;color:black;"
                                href="javascript:void(0);" onclick="submitEdit()">保存资料</a>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="boxbottom"></div>
        </div>
    </div>
</div>
<div class="mainbottom">
    <div class="bottombox"></div>
    <div class="footer">
        <div class="leftmenu">
            <ul>
                <li><a href="#"><img src="/static/portal/images/wx.png" alt=""/></a></li>
                <li><a href="#"><img src="/static/portal/images/qq.png" alt=""/></a></li>
                <li><a href="#"><img src="/static/portal/images/weibo.png" alt=""/></a></li>
            </ul>
        </div>
        <div class="rightdesc">
            <ul>
                <li>市场联络：SLKFDJLSKFJS</li>
                <li>京ICP备149594940</li>
                <li>YITAIDIET@163.COM</li>
            </ul>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        if($('#userTitle').text() != ''){
            $('#login_state').show();
            $('#un_login_state').hide();
        }
        if($('#sexHidden').text() == '男'){
            $('#male').attr('checked',true);
        }
        if($('#sexHidden').text() == '女'){
            $('#female').attr('checked',true);
        }
    });

    //验证手机号
    function validMobileNum() {
        var length = $("#mobile").val().length;
        var mobile = /^(((1[0-9]{2})|(15[0-9]{1}))+\d{8})$/;
        if (length != 11 || !mobile.test($("#mobile").val())) {
            alert('请输入正确的手机号码!');
            return false;
        }
        return true;
    }

    //提交前验证
    function validBeforeSubmit() {
        if (!validMobileNum()) {
            return false;
        }

        return true;

    }

    function submitEdit(){
        if (!validMobileNum())return;

        $.ajax({
            url: '/Customer/SubmitEditUserInfo',
            type: 'POST',
            data: $('#userForm').serialize(),
            dataType: 'json',
            success: function (json) {
                //var json = (new Function("return " + data))();
                if (json.success) { //申报成功
                    alert(json.message);
                    window.location.href = "/Customer/GetUserInfo";
                    //$.messager.defaults = { ok: "是", cancel: "否" };
//                    var msg = "注册成功，您可以登录系统了，您的登录账号为：" + json.message;
//                    $.messager.confirm('提示', msg, function (r) {
//                        if (r) {
//                            window.location.href = "/?userName=" + json.message;
//                        }
//                    });

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
