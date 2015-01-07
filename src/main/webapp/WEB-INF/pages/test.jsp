<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-11-19
  Time: 上午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--标识该页面不被sitemesh装饰-->
<meta name="decorator" content="un-decorator-pages"/>
<html>
<head>
    <title>test page</title>
</head>
<body>
<h3>Hello ${user}!</h3>

<form id="mobileCheckForm" action="/mobileSMS" method="post">
    手机：<input id="mobile" name="mobile" type="number" value="13709011577">
    短信：<input id="content" style="width: 300px" name="content" type="text" value=${Vcode}>
    <button type="submit">发送</button>
</form>
<div>${msg}</div>
<button onclick="overage()">余额查询</button>
<div id="overage"></div>
</body>
<script>

</script>
</html>
