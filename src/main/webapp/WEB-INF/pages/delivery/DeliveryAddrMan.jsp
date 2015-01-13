<%--
  Created by IntelliJ IDEA.
  User: zh.xu
  Date: 2015/1/13
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>收货地址管理</title>
</head>
<body>
<div class="bodybox">
  <div class="bodymain2">
    <div class="usernav">
      <h1>我的壹态</h1>
      <ul>
        <li><a href="/Customer/GetUserInfo">我的资料</a></li>
        <li class="on"><a href="#">管理收货地址</a></li>
        <li><a href="#">查询订单</a></li>
        <li><a href="#">我的抵用金</a></li>
      </ul>
    </div>
    <div class="mainbox">
      <div class="boxtop lan">
        <div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/shouhuo.png" alt="" style="vertical-align: middle;"/>修改收货地址</a></div>
        <div class="fr">
          <a class="readall" href="#">
            <img src="/static/portal/images/readall.png" alt="" style="vertical-align: middle;"/>查看全部
          </a>
        </div>
      </div>
      <div class="boxcenter shouhuo">
        <ul>
          <li>姓名：</li>
          <li>电话：</li>
          <li>收货地址：</li>
        </ul>
        <div class="addmore"></div>
        <div class="addmorebox">
          <ul>
            <li>姓名：</li>
            <li>电话：</li>
            <li>新增收货地址：</li>
          </ul>
        </div>
      </div>
      <div class="boxbottom"></div>
    </div>
  </div>
</div>
</body>
</html>
