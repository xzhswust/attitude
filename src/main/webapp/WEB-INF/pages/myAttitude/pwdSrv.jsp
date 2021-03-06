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
    <div class="bodymain">
        <div class="regbox">
            <h1 id="title">忘记/修改密码</h1>

            <div class="regleft">
                <img src="/static/portal/images/ico.png" alt=""/>
            </div>
            <div class="regright">
                <form id="pwdForm">
                    <table width="100%">
                        <tr>
                            <td width="73">用户名</td>
                            <td width="389"><input name="mobile" id="mobile" type="text" class="inputtype1" placeholder="请输入手机号"
                                                   value="${mobile}"
                                                   width="261"/><a class="greenbtn" href="javascript:void(0);"
                                                                   onclick="msgValid()"
                                                                   style="margin-left:16px">发送验证码</a></td>
                        </tr>
                        <tr>
                            <td>验证码</td>
                            <td><input name="validNum" id="validNum" type="text" class="inputtype1" placeholder="请输入您的验证码"
                                       width="261"/>
                            </td>
                        </tr>
                        <tr>
                            <td>密码</td>
                            <td valign="center"><input name="password" id="password" type="password" class="inputtype1"
                                                       onblur="pwdOnblur($(this))" placeholder="请输入密码" width="261"/><img
                                    src="/static/portal/images/yes.png" alt=""
                                    style="vertical-align:middle;margin-left:17px;display: none"/>
                            </td>
                        </tr>
                        <tr>
                            <td>确认密码</td>
                            <td><input name="passwordre" id="passwordre" type="password" class="inputtype1" placeholder="请确认密码"
                                       onblur="pwdOnblur($(this))" width="261"/><img src="/static/portal/images/yes.png" alt=""
                                                         style="vertical-align:middle;margin-left:17px;display: none"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a class="greenbtn fr" style="margin-right:130px"
                                               href="javascript:void(0);" onclick="pwdModifySubmit()">修改密码</a></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        if ($('#userTitle').text() != '') {
            $('#login_state').show();
            $('#un_login_state').hide();
            $('#title').text('修改密码');
            $(document).attr('title', '修改密码');
        } else {
            $('#title').text('找回密码');
            $(document).attr('title', '找回密码');
        }
    });

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
                if (json.success) { //申报成功
//                    alert(json.message);
                    $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                    jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">恭喜你</div><div>'+json.message+'</div>', '', function() {
                        $.alerts.dialogClass = null; // 重置到默认值
                    });
                } else {
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
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请输入正确的手机号码</div>', '', function() {
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

    function pwdModifySubmit(){
        if (!validBeforeSubmit())return;

        $.ajax({
            url: '/Customer/PwdModifySubmit',
            type: 'POST',
            data: $('#pwdForm').serialize(),
            dataType: 'json',
            success: function (json) {
                if (json.success) { //申报成功
//                    alert(json.message);
                    $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                    jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">恭喜你</div><div>'+json.message+'</div>', '', function() {
                        $.alerts.dialogClass = null; // 重置到默认值
                    });
                    window.location.href = "/Login?userName=" + $('#mobile').val();
                } else {
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

    function pwdOnblur(target){
        if (target.val().length < 8) {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>密码长度至少为8位</div>', '', function() {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            target.next().hide();
        }else{
            if(target.attr('id') == 'passwordre'){
                if(target.val() != $('#password').val()){
                    $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                    jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>两次密码输入不一致</div>', '', function() {
                        $.alerts.dialogClass = null; // 重置到默认值
                    });
                    target.next().hide();
                }else{
                    target.next().show();
                }
            }else {
                target.next().show();
            }
        }

    }

</script>
</body>
</html>
