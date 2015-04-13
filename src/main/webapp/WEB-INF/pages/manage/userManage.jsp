<%--
  Created by IntelliJ IDEA.
  User: Smomo
  Date: 2015/3/15
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户管理</title>
</head>
<body style="text-align: center">
<div class="bodybox">
    <div class="bodymain2">
        <div class="usernav">
            <h1>后台管理</h1>
            <ul>
                <li class="on"><a href="/Admin/UserMng">用户管理</a></li>
                <li><a href="/Admin/CommentMng">评论管理</a></li>
                <li><a href="/Admin/OrderMng">订单管理</a></li>
                <li><a href="/Admin/ProductMng">产品管理</a></li>
                <li><a href="/Admin/QAMng">问题管理</a></li>
            </ul>
        </div>
        <div class="mainbox">
            <div class="easyui-panel" title="用户列表" style="padding: 20px">
                <table id="userTable" class="easyui-datagrid"
                       style="height:400px"
                       data-options="
                                    singleSelect: true,
                                    <%--rownumbers:true,--%>
                                    url: '',
                                    fitColumns:true,
                                    toolbar: '#toolbar1',
                                    pagination:true,
                                    pageSize:50,
                                    pageList: [50,100],
                                    <%--onClickRow: onClickRow,--%>
                                    method: 'get'
                                    ">
                    <thead>
                    <tr>
                        <th data-options="field:'id',width:20,align:'center'">ID</th>
                        <th data-options="field:'userName',width:60,align:'center'">用户名
                        </th>
                        <th data-options="field:'mobilePhone',width:60,align:'center'">手机号
                        </th>
                        <th data-options="field:'realName',width:60,align:'center'">姓名
                        </th>
                        <th data-options="field:'sex',width:60,align:'center'">性别
                        </th>
                        <th data-options="field:'birthdayStr',width:200,align:'center'">生日
                        </th>
                        <th data-options="field:'createDateStr',width:200,align:'center'">注册日期
                        </th>
                        <%--<th data-options="field:'pic',width:400,formatter:function(value,row){return '<img src=/Admin/ViewCommentImg?id='+row.id+' />';}">--%>
                        <%--图片--%>
                        <%--</th>--%>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="toolbar1" style="height:auto; text-align: left;">
                    <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
                    <%--data-options="iconCls:'icon-remove',plain:true" onclick="del()">删除</a>--%>
                    <%--&nbsp;&nbsp;--%>
                    <a href="javascript:void(0)" class="easyui-linkbutton" title="密码重置为12345678"
                       data-options="iconCls:'icon-edit',plain:true" onclick="resetPwd()">重置密码</a>
                    &nbsp;&nbsp;
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-reload',plain:true" onclick="refreshList()">刷新</a>
                    &nbsp;&nbsp;
                    <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
                    <%--data-options="iconCls:'icon-ok',plain:true" onclick="updateComment()">确认修改</a>--%>
                    <%--&nbsp;&nbsp;--%>

                </div>

            </div>
        </div>
    </div>
</div>

<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/css/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/css/icon.css">

<script type="text/javascript" src="${ctx}/static/easyui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui/js/jquery.easyui.min.js"></script>

<script>
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
    var selectIndex = undefined;

    $(document).ready(function () {
        $.messager.defaults = {ok: "确定", cancel: "取消"};
        refreshList();
    });

    //刷新列表
    function refreshList() {
        $.ajax({
            url: '/Admin/GetUserList',
            type: "get",
            dataType: "json",
            success: function (data) {
                //alert(JSON.stringify(data));
                if (data.noData) {
                    $('#userTable').datagrid('loadData', {total: 0, rows: []});
                } else {
                    $('#userTable').datagrid('loadData', data);
                }
            }
        });
    }

    function resetPwd() {
        if ($('#userTable').datagrid('getSelected') == null) {
            $.messager.alert('提示', '请选择一条用户信息。');
            return;
        }
        var row = $('#userTable').datagrid('getSelected');
        $.messager.confirm(
                '确认',
                '您确定要重置该用户密码为默认密码？',
                function (r) {
                    if (r) {
                        $.ajax({
                            url: '/Admin/ResetPwd?uid=' + row.id,
                            type: "get",
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                            }
                        });
                    }
                });

    }
</script>
</body>
</html>
