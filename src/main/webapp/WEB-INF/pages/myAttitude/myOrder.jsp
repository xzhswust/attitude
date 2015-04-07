<%--
  Created by IntelliJ IDEA.
  User: Smomo
  Date: 2015/2/4
  Time: 21:25
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
	<div class="bodymain2">
		<div class="usernav">
			<h1>我的壹态</h1>
			<ul>
				<li><a href="/Customer/GetUserInfo">我的资料</a></li>
				<li><a href="/Customer/DeliveryAddrMan">管理收货地址</a></li>
				<li class="on"><a href="/Customer/MyOrder">查询订单</a></li>
				<li><a href="#">我的抵用金</a></li>
			</ul>
		</div>
		<div class="mainbox">
			<div class="boxtop">
				<div class="fl"><a href="#" class="usermenu"><img src="/static/portal/images/usermenu.png" alt="" style="vertical-align: middle;"/>查看全部</a></div>
				<div class="fr">
					<a class="readall" href="#">
						<img src="/static/portal/images/readall.png" alt="" style="vertical-align: middle;"/>查看全部
					</a>
				</div>
			</div>
			<div id="orderList" class="boxcenter xiadan" style="overflow-y:scroll; height: 300px;">

			</div>
			<div class="boxbottom"></div>
		</div>
	</div>
</div>

<script>
	$(document).ready(function () {
		$.ajax({
			url: '/Customer/GetMyOrder',
			type: 'GET',
			data: null,
			dataType: 'json',
			success: function (json) {
				if (json.success) {
					$("#orderList").html(json.retStr);
				} else {
					jAlert(json.message);
				}
			},
			error: function (data) {
				jAlert(data);
			}
		});
	});
</script>
</body>
</html>
