<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<head>
    <link rel=stylesheet href="${ctx}/static/bootstrap/css/bootstrap.css">

    <script src="${ctx}/static/jquery/js/jquery.js"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap-transition.js"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap-collapse.js"></script>

    <style type="text/css">
        .aistyle {
            MARGIN-TOP: 2px;
            FLOAT: right;
            MARGIN-RIGHT: -6px;
            opacity: .25
        }
    </style>
    <script>
        // 融资查询按钮点击事件
        function financingQueryClick() {

        }
    </script>
</head>

<body>
<div class="container-fluid" style="padding-left: 2px; padding-right: 0px">
    <div class="row-fluid">
        <div class="accordion" id="accordion2">
            <div class="accordion-group">
                <div class="accordion-heading" style="BORDER-TOP: #e5e5e5 1px; background-color: lavender">
                    <ul class="nav nav-list">
                        <li><a href="#myFinancing" class="accordion-toggle"
                               data-toggle="collapse">我的融资<i class="icon-chevron-down aistyle"></i></a>
                        </li>
                    </ul>
                </div>
                <div id="myFinancing" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <ul class="nav nav-list">
                            <li class="active" style="border: 1px"><a href="#" onclick="financingQueryClick();">融资查询</a></li>
                            <li><a href="/importApply/application">申请融资</a></li>
                            <li><a href="/improveBasicInfo">企业信息完善</a> </li>
                        </ul>
                    </div>
                </div>
                <div class="accordion-heading" style="BORDER-TOP: lightgray 1px solid; background-color: lavender">
                    <ul class="nav nav-list">
                        <li><a href="#financingMan" class="accordion-toggle in" data-toggle="collapse">融资管理<i
                                class="icon-chevron-down aistyle"></i></a></li>
                    </ul>
                </div>
                <div id="financingMan" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <ul class="nav nav-list">
                            <li class="active"><a href="#">融资查询</a></li>
                            <li><a href="/approve">融资审核</a></li>
                            <li><a href="/statistical">统计分析</a></li>
                            <li><a href="/importApply">融资数据导入</a></li>
                            <li><a href="#">企业资料库管理</a></li>
                        </ul>
                    </div>
                </div>
                <div class="accordion-heading"
                     style="BORDER-BOTTOM: #e5e5e5 1px; BORDER-TOP: lightgray 1px solid; background-color: lavender">
                    <ul class="nav nav-list">
                        <li><a href="#infoMaintain" class="accordion-toggle in" data-toggle="collapse">信息维护<i
                                class="icon-chevron-down aistyle"></i></a></li>
                    </ul>
                </div>
                <div id="infoMaintain" class="accordion-body collapse in">
                    <div class="accordion-inner">
                        <ul class="nav nav-list">
                            <li class="active"><a href="#">企业信息维护</a></li>
                            <li><a href="#">个人信息维护</a></li>
                            <li><a href="#">字典维护</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
