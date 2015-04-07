<%--
  Created by IntelliJ IDEA.
  User: Smomo
  Date: 2015/2/2
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>壹态Diet</title>
    <style type="text/css">
        .linkbox {
            text-align: center;
            height: 89px;
            font-size: 18px;
            line-height: 32px;
        }

        .linkbox a{
            font-size: 12px;
            color: silver;
            margin-left: 10px;
        }

        .linkcontent {
            margin: 15px 0px;
            font-size: 12px;
            color: #818c91;
            line-height: 27px;
        }

        .orderinfo {
            font-size: 12px;
            color: #818c91;
        }

        .orderinfo td {
            padding: 8px 5px;
        }

        .money {
            float: right;
            margin: 15px 0px;
            font-size: 14px;
            color: #818c91;
        }

        .money span {
            color: #95c754;
            font-size: 30px;
        }

        .ct {
            border: 1px solid #b3d465;
            border-radius: 5px;
            margin: 10px 0px;
        }
    </style>
</head>
<body>

<div class="bodybox">
    <div class="bodymain2" style="height:auto;">
        <div class="usernav">
            <h1>确认订单/支付</h1>
            <ul>
                <li><a href="/Product">选择套餐</a></li>
                <li><a>填写订单</a></li>
                <li class="on"><a>提交并支付</a></li>
            </ul>
        </div>
        <div class="mainbox">
            <div class="boxtop lv">
                <div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/dingdantu.png" alt=""
                                                                  style="vertical-align: middle;"/>确认订单</a></div>
            </div>
            <div class="boxcenter xiedingdan">
                <div class="linkbox">
                    <p>复制你的专属连接推荐好友订购成功<span style="color:red;">立减10元</span>，您也将<span
                            style="color:red;">获得抵用金10元/单</span>，多荐多得无上限！
                        <input type="text" id="shareLink" readonly="readonly" value="http://www.yitaiedit.com/invite?7YH5N"
                               style="background:#f5f5f5;border:1px solid #ebecec;width:435px;height:32px;color:#95c754;text-align: center;"/>
                        <a href="javascript:void(0);" onclick="codeCopy()">复制链接</a>
                    </p>
                </div>
                <div class="linkcontent">
                    订单已经提交，请在12小时内完成支付，订单将为您保留到 ${remain}<br/>
                    订单支付后，我们将在您选择的时间为您配送，请保持联系电话通畅<br/>
                    有任何问题，请通过官方微信、QQ或者直接拨打4000-160-167（9：00-22：00）联系客服<br/>
                </div>
                <div class="orderinfo">
                    <div class="ct">
                        <table width="100%">
                            <tr>
                                <td width="411">订单编号：<span id="busID">${busID}</span></td>
                                <td width="258">下单时间:${createDate}</td>
                                <td>订单状态：${status}</td>
                            </tr>
                            <tr>
                                <td>商品信息：<span id="subject">${productName}</span></td>
                                <td>数量:${count}</td>
                                <td>订单金额：¥ <span id="amount">${amount}</span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="ct">
                        <table width="100%">
                            <tr>
                                <td width="175">首次配送开始日期：${beginDate}</td>
                                <td width="122">收货人：${consignee}</td>
                                <td width="219">联系电话：${mobile}</td>
                                <td>收货地址：${address}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="ct">
                        <table>
                            <tr>
                                <td>备注：</td>
                                <td>${remark}</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="money">
                    订单金额：<span>¥ ${amount}</span>
                </div>
                <div class="clear"></div>
                <a id="submit" href="javascript:void(0);" class="greenbtn" style="float:right"
                   onclick="pay()">现在支付</a>
            </div>

            <div class="boxbottom"></div>
        </div>
    </div>
</div>

<script>
    var codeCopy = function() {
        var code = $('#shareLink').val();
        try {
            if (window.clipboardData.setData("Text", code)) {
                alert("已复制到剪贴板");
            }
            else {
                var t = window.prompt("请按Ctrl+C快捷键进行复制!", code);
            }
        }
        catch (ex) {
            var t = window.prompt("请按Ctrl+C快捷键进行复制!", code);
        }
    };

    function pay(){
        $.alerts.dialogClass = "style_2";
        jConfirm('您确定支付该订单?', '确认', function (r) {
            if (r) {
//                $.ajax({
//                    url: '/Order/PayOrder',
//                    type: 'POST',
//                    data: {"busID":$('#busID').text(),"subject":$('#subject').text(),"amount":$('#amount').text()},
//                    dataType: 'json',
//                    success: function (data) {
//
//                    },
//                    error: function (data) {
//                        jAlert(data);
//                    }
//                });
                window.open('/Order/PayOrder?busID=' + $('#busID').text());
            }
        });
    }

</script>

</body>
</html>
