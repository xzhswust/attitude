<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-31
  Time: 下午2:01
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 记录上次访问url
    String url = request.getHeader("Referer");
    request.setAttribute("previousUrl", url);
    request.setAttribute("111", "222");
%>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>405-Page</title>
    <!--下面一条语句标识该页面不被sitemesh进行装饰-->
    <meta name="decorator" content="un-decorator-pages"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <link rel=stylesheet href="${ctx}/static/bootstrap/css/bootstrap.css">
    <link rel=stylesheet href="${ctx}/static/bootstrap/css/bootstrap-responsive.css">
    <link rel=stylesheet href="${ctx}/static/common/css/layout.css">

    <%--适配IE--%>
    <script src="${ctx}/static/bootstrap/js/bootstrap-respond.min.js"></script>

    <script src="${ctx}/static/jquery/js/jquery.js"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap.js"></script>
</head>

<body>
<section class="section">
    <div class="container">
        <div class="error-page">
            <h2 class="color-red">Error 405</h2>
            <h2 class="color-red">方法不被允许</h2>
            <a href="${previousUrl}" class="color-blue">返回</a>
        </div>
    </div>
</section>
</body>
</html>

