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

        <a id="submit" href="javascript:void(0);" class="greenbtn"
           onclick="pay()">现在支付</a>
      </div>

      <div class="boxbottom"></div>
    </div>
  </div>
</div>

</body>
</html>
