<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-31
  Time: 上午9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%response.setStatus(200);%>

<%
    Throwable ex = null;
    if (exception != null)
        ex = exception;
    if (request.getAttribute("javax.servlet.error.exception") != null)
        ex = (Throwable) request.getAttribute("javax.servlet.error.exception");

    //记录日志
    Logger logger = LoggerFactory.getLogger("500.jsp");
    logger.error(ex.getMessage(), ex);
    System.out.println(ex.getMessage());
    request.setAttribute("exception", ex.getMessage());

    String url = request.getHeader("Referer");
    request.setAttribute("previousUrl", url);
    System.out.println(url);
%>
<html>
<head>
    <meta charset="utf-8"/>
    <title>500 - 系统内部错误</title>
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
            <h2 class="color-red">Error 500</h2>
            <h2 class="color-red">系统发生内部错误</h2>
            <p class="color-orange"></p>
            <p class="color-green">错误详情:<c:out value="${exception}"></c:out></p>
            <a href="${previousUrl}" class="color-blue">返回</a>
        </div>
    </div>
</section>
</body>

</html>
