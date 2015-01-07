<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 14-3-28
  Time: 下午2:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <meta charset="utf-8"/>
    <title>nonauthor</title>
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
            对不起，您没有没有权限访问该页面！
        </div>
    </div>
</section>
</body>
</html>
