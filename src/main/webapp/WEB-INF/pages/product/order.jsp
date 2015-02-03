<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>壹态Diet</title>
</head>
<body>
<%--<link href="/static/portal/css/common.css" rel="stylesheet" type="text/css">--%>
<%--<script src="/static/portal/js/jquery-1.8.3.min.js" type="application/javascript"></script>--%>
<%--<script src="/static/portal/js/jquery.SuperSlide.2.1.1.js" type="application/javascript"></script>--%>
<%--<script src="/static/portal/js/common.js" type="application/javascript"></script>--%>
<link rel="stylesheet" type="text/css" href="/static/portal/css/jquery.inputbox.css"/>
<script src="/static/portal/js/jquery.inputbox.js" type="text/javascript"></script>
<script src="/static/portal/js/jquery.ganged.js" type="text/javascript"></script>
<script src="/static/portal/js/diqu.js" type="text/javascript"></script>
<style type="text/css">
    .black_overlay {
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 180%;
        background-color: black;
        z-index: 1001;
        -moz-opacity: 0.8;
        opacity: .50;
        filter: alpha(opacity=60);
        _position: absolute;
        _top: expression(eval(document.documentElement.clientHeight/2+document.documentElement.scrollTop));
    }

    .white_content {
        display: none;
        position: fixed;
        _position: absolute;
        _top: expression(eval(document.documentElement.clientHeight/2+document.documentElement.scrollTop));
        top: 50%;
        left: 50%;
        width: 600px; /*下面的宽度maring为负的宽度50% 高度同理*/
        height: 400px;
        margin-left: -300px;
        margin-top: -200px;
        padding: 16px;
        /*border: 2px solid orange;*/
        border: 0;
        background-color: white;
        z-index: 1002;
        overflow: auto;
        border-radius: 4px 4px 4px 4px;
        -moz-border-radius: 4px 4px 4px 4px;
        -webkit-border-radius: 4px 4px 4px 4px;
    }
</style>

<div class="bodybox">
    <div class="bodymain2" style="height:auto;">
        <div class="usernav">
            <h1>立即购买</h1>
            <ul>
                <li><a href="/Product">选择套餐</a></li>
                <li class="on"><a>填写订单</a></li>
                <li><a>提交并支付</a></li>
            </ul>
        </div>
        <div class="mainbox">
            <div class="boxtop lv">
                <div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/dingdantu.png" alt=""
                                                                  style="vertical-align: middle;"/>请填写收货信息</a></div>
            </div>
            <div class="boxcenter xiedingdan">
                <form id="orderForm" method="post">
                    <div id="sel3">
                        <div name="province" type="selectbox" style="margin-right: 5px;">
                            <div class="opts"></div>
                        </div>
                        <div name="city" type="selectbox" style="margin-right:5px;">
                            <div class="opts"></div>
                        </div>
                        <div name="area" type="selectbox" style="margin-right:5px;">
                            <div class="opts"></div>
                        </div>
                        <%--<input class="real" name="gongsisuozaidi" type="hidden" value=""/>--%>
                        <input id="provinceID" type="hidden" class="province"/>
                        <input id="cityID" type="hidden" class="city"/>
                        <input id="areaID" type="hidden" class="area"/>
                    </div>
                    <input type="text" name="address" id="address" value="" placeholder="请填写具体收货地址" class="inputtype2"
                           style="width:230px;margin-right:5px;"/><input type="text" name="name" id="name" value=""
                                                                         placeholder="收货人姓名" class="inputtype2"
                                                                         style="width:90px;margin-right:5px"/><input
                        type="text" name="mobile" id="mobile" value="" placeholder="收货人联系电话" class="inputtype2"
                        style="width:120px;margin-right:5px"/><a href="javascript:void(0);" onclick="selectAddr()"
                                                                 style="font-size: 9px;color:#A9CE2C ">已有地址</a>
                    <%--<input type="text" name="site" value="" placeholder="邮编信息" class="inputtype2"--%>
                    <%--style="width:150px;margin-top:15px"/>--%>
                    <!--务必不要在input之间加入空格 回车-->
                    <script>
                        $('#sel3').ganged({'data': data, 'width': 110, 'height': 32});
                    </script>
                    <div class="clear"></div>
                    <div class="shtime">
                        收货时间
                    </div>
                    <div style="line-height:34px;height: 34px;font-size:12px;margin-top:17px;">
                        <div type="selectbox" name="beginDate" id="sel4" style="margin-right: 11px;">
                            <div class="opts">
                                <%--<a href="javascript:;" val="暂时只支持每周日晚开始配送">暂时只支持每周日晚开始配送</a>--%>
                            </div>
                        </div>
                        <span style="color: darkgray">(暂时只支持每周日晚开始配送)</span>
                    </div>
                    <script>
                        $('#sel4').inputbox({
                            height: 24,
                            width: 225
                        });

                        $('#sel4').find('.selected').text('请选择套餐开始配送日期').css('left', '0');
                    </script>
                    <div style="font-size:12px;margin-top:13px;text-indent:45px;color: darkgray">
                        温馨提示：不建议女性在生理期，妊娠期，和哺乳期食用。
                    </div>
                    <div class="fkway">
                        付款方式
                    </div>
                    <ul class="fkselect">
                        <li><input type="radio" name="fkway" value="货到付款" disabled/>货到付款（即将开通）</li>
                        <li><input type="radio" name="fkway" checked value="在线支付"/>在线支付（支付宝）<img
                                src="/static/portal/images/lt.png"/></li>
                        <li style="text-indent:45px;color: darkgray">请您在24小时之内完成支付，否则订单会自动取消</li>
                    </ul>
                    <div class="clear"></div>
                    <div style="margin-left:45px;font-size:12px;">确认订单信息</div>
                    <div class="formtop"></div>
                    <table class="ddform">
                        <tr>
                            <th width="200">套餐名称</th>
                            <th width="100">单价（元）</th>
                            <th width="220">数量（套）</th>
                            <th width="150">优惠信息</th>
                            <th width="100">小计</th>
                            <th></th>
                        </tr>
                        <tr>
                            <td>壹态纤体瘦身套餐（2周）</td>
                            <td><span id="jiage">1380</span></td>
                            <td style="position:relative">
                                <div class="count xdel"></div>
                        	<span>
                        	<span id="countnum">1</span>套 
                        	</span>

                                <div class="count xadd"></div>
                                <div class="clear"></div>
                            </td>
                            <td>0</td>
                            <td><span id="jieguo">1380</span></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="5">备注<input class="inputtype2" type="text" name="remark"
                                                     style="margin-left:40px;width:370px"/>
                            </td>
                            <td>
                                <a id="submit" href="javascript:void(0);" class="greenbtn"
                                   onclick="submit()">提交订单</a>
                            </td>
                        </tr>


                    </table>
                    <script>
                        $('.count').eq(1).click(function () {
                            var countnum = $('#countnum').text();
                            var jiage = $('#jiage').text();
                            countnum++;
                            $('#jieguo').text(jiage * countnum);
                            $('#countnum').text(countnum);

                            $('#count').val(countnum);
                            $('#amount').val(jiage * countnum);
                        })
                        $('.count').eq(0).click(function () {
                            var countnum = $('#countnum').text();
                            var jiage = $('#jiage').text();
                            countnum--;
                            if (countnum < 1) {
                                countnum = 1
                            }
                            $('#jieguo').text(jiage * countnum);
                            $('#countnum').text(countnum);

                            $('#count').val(countnum);
                            $('#amount').val(jiage * countnum);
                        })
                    </script>
                    <div style="display:none">
                        <input id="price" name="price" value="1380">
                        <input id="count" name="count" value="1">
                        <input id="amount" name="amount" value="1380">
                    </div>
                    <div class="formbottom"></div>
                </form>
            </div>

            <div class="boxbottom"></div>
        </div>
    </div>
</div>

<div id="light" class="white_content">
    <div style="height: 20px; background-color: aliceblue; padding: 8px;">
        <div style="float: left"><a id="deliveryTitle" href="javascript:void(0);"
                                    style="color:#A9CE2C; font-weight: bold;">已有收货地址</a></div>
        <div style="float: right;"><a href="javascript:void(0);" style="color:#A9CE2C;" onclick="closeWindow();">关闭</a>
        </div>
    </div>

    <div style="padding: 0px; font-size:13px;">
        <div class="boxcenter xiedingdan" style="font-size: 13px;">
            <div id="deliveryID" style="display: none;"></div>
            <div id="addrList">

            </div>
            <div>
                <a id="choseAddr" class="greenbtn fl" href="javascript:void(0);"
                   onclick="choseAddr()">选择地址</a>
            </div>


            <div class="clear"></div>
        </div>

        <div class="boxbottom"></div>
    </div>


</div>

<div id="fade" class="black_overlay"></div>

<script language="javascript">
    var list = undefined;
    $(document).ready(function () {
        initAddr();

        initBeginDate();
    });

    function openWindow() {
        document.getElementById('light').style.display = 'block';
        document.getElementById('fade').style.display = 'block';
    }

    function closeWindow() {
        document.getElementById('light').style.display = 'none';
        document.getElementById('fade').style.display = 'none';
    }

    function selectAddr() {
        openWindow();
    }

    function choseAddr() {
        var id = $('input[name=addrRdo]:checked').attr('id');
        var i = id.substr(4);
        var addr = list[i];

        $('div[name="province"] .selected').html(addr.provinceCode);
        $('input[name="province"]').val(addr.provinceCode);
        setTimeout(function () {
            $('div[name="city"] .selected').html(addr.cityCode);
            $('input[name="city"]').val(addr.cityCode);
        }, 50);
        setTimeout(function () {
            $('div[name="area"] .selected').html(addr.districtCode);
            $('input[name="area"]').val(addr.districtCode);
        }, 100);

        $('#mobile').val(addr.contractPhone);
        $('#name').val(addr.consignee);
        $('#address').val(addr.address);
        //alert(i);
        closeWindow();
    }

    function submit() {
        if (!validate()) return;
        $.alerts.dialogClass = "style_2";
        jConfirm('您确定提交订单?', '确认', function (r) {
            if (r) {
                $.ajax({
                    url: '/Order/SubmitOrder',
                    type: 'POST',
                    data: $('#orderForm').serialize(),
                    dataType: 'json',
                    success: function (data) {
                        if(data.success) {
                            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
                            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">恭喜你</div><div>订单提交成功</div>', '', function () {
                                $.alerts.dialogClass = null; // 重置到默认值
                            });
                            window.location.href = "/Order/OrderAndPay?busID=" + data.retStr;
                        }
                    },
                    error: function (data) {
                        jAlert(data);
                    }
                });
            }
        });
    }

    function validate() {
        //alert($('input[name=province]').val());
        if ($('input[name=province]').val() == '-1') {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请选择所在省</div>', '', function () {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        if ($('input[name=city]').val() == '-1') {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请选择所在市</div>', '', function () {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        if ($('input[name=area]').val() == '-1') {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请选择所在区</div>', '', function () {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        if ($('#name').val() == null || $('#name').val().length == 0) {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请输入收货人姓名</div>', '', function () {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        if ($('#mobile').val() == null || $('#mobile').val().length == 0) {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请输入收货人电话</div>', '', function () {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        if ($('#address').val() == null || $('#address').val().length == 0) {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请输入收货人地址</div>', '', function () {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        if ($('#sel4').find('.selected').eq(0).text() == '请选择套餐开始配送日期') {
            $.alerts.dialogClass = "style_1"; // 设置自定义样式的Class
            jAlert('<div style=\"font-size:15px;color:#a9cd2c;margin-bottom:10px\">温馨提示</div><div>请选择开始配送的日期</div>', '', function () {
                $.alerts.dialogClass = null; // 重置到默认值
            });
            return false;
        }
        return true;
    }

    function initAddr() {
        $.ajax({
            url: '/Customer/getDeliveryListJson',
            type: 'GET',
            data: null,
            dataType: 'json',
            success: function (json) {
                list = json;
                //alert(JSON.stringify(json));
                for (var i = 0; i < json.length; i++) {
                    var address = json[i];
                    var chk = '';
                    if (i == 0) {
                        chk = 'checked';
                    }
                    var html = "<table><tr><td rowspan='2' width='100px'><input id='addr" + i + "' " + chk + " type='radio' name='addrRdo'>选择地址</td><td width='120px' height='30px'>收货人：" + address.consignee + "</td>"
                            + "<td height='30px'>联系电话:" + address.contractPhone + "</td></tr>"
                            + "<tr><td colspan='2' height='30px'>收货地址：" + address.provinceCode + address.cityCode + address.districtCode + address.address + "</td></tr></table>"
                    $('#addrList').append(html);
                }
                $('#addrList table:even').css('background', '#ddd')
            },
            error: function (data) {
                jAlert(data);
            }
        });
    }

    function initBeginDate() {
        $.ajax({
            url: '/GetLatestSunday',
            type: 'GET',
            data: null,
            dataType: 'json',
            success: function (json) {
                //alert(JSON.stringify(json));
                for (var i = 0; i < json.length; i++) {
                    var a = "<a href=\"javascript:;\" val=" + json[i] + ">" + json[i] + "</a>"
                    $('#sel4').find('.opts').append(a);
                }
            },
            error: function (data) {
                jAlert(data);
            }
        });
    }
</script>
</body>
</html>
