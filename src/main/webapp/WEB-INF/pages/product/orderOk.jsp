<%--
  Created by IntelliJ IDEA.
  User: Smomo
  Date: 2015/2/25
  Time: 22:27
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

    .linkbox a {
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
  <div class="bodymain2">
    <div class="usernav">
      <h1>支付成功</h1>
      <ul>
        <li><a href="/Product">选择套餐</a></li>
        <li class="on"><a>填写订单</a></li>
        <li><a>提交并支付</a></li>
      </ul>
    </div>
    <div class="mainbox">
      <div class="boxtop lv">
        <div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/dingdantu.png" alt=""
                                                          style="vertical-align: middle;"/>支付结果</a></div>
      </div>
      <div class="boxcenter dingdan">
        <h1>您的订单支付成功</h1>

        <p>如有疑问请与在线客服联系或直接致电我们（联系电话：4000-160-167）</p>

        <a href="/Customer/MyOrder" class="greenbtn" style="float:right">查看订单</a>
      </div>
      <div class="boxbottom"></div>
    </div>
  </div>
</div>
</body>
</html>

