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
    <div class="adminmain">
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
            <div class="easyui-panel" title="用户列表" style="padding: 5px">
                <table id="userTable" class="easyui-datagrid"
                       style="height:200px"
                       data-options="
                                    singleSelect: true,
                                    <%--rownumbers:true,--%>
                                    url: '',
                                    fitColumns:true,
                                    toolbar: '#toolbar1',
                                    pagination:true,
                                    pageSize:50,
                                    pageList: [50,100],
                                    onClickRow: onUserClick,
                                    method: 'get'
                                    ">
                    <thead>
                    <tr>
                        <th data-options="field:'id',width:20,align:'center'">ID</th>
                        <th data-options="field:'userName',width:60,align:'center'">账号
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
                    <input id="filter" class="textbox" style="width: 170px" placeholder="用户姓名、手机号码(模糊查询)"/>
                        <a href="javascript:void(0)" class="easyui-linkbutton"
                           data-options="iconCls:'icon-easyui-search',plain:true" onclick="findUser()">查找</a>
                    <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
                    <%--data-options="iconCls:'icon-ok',plain:true" onclick="updateComment()">确认修改</a>--%>
                    <%--&nbsp;&nbsp;--%>

                </div>
            </div>
            <div style="height: 10px"></div>
            <div class="easyui-panel" title="用户订单" style="padding: 5px">
                <table id="orderTable" class="easyui-datagrid"
                       style="height:270px"
                       data-options="
                                    singleSelect: true,
                                    rownumbers:true,
                                    url: '',
                                    fitColumns:true,
                                    toolbar: '#toolbar2',
                                    pagination:true,
                                    pageSize:50,
                                    pageList: [50,100],
                                    <%--onClickRow: onClickRow,--%>
                                    method: 'get'
                                    ">
                    <thead>
                    <tr>
                        <th data-options="field:'id',width:20,align:'center',hidden:true">ID</th>

                        <th data-options="field:'userAccount',width:120,align:'center'">账号
                        </th>
                        <th data-options="field:'mobile',width:120,align:'center'">手机号
                        </th>
                        <th data-options="field:'consignee',width:80,align:'center'">收货人
                        </th>
                        <th data-options="field:'province',width:70,align:'center'">省
                        </th>
                        <th data-options="field:'city',width:70,align:'center'">市
                        </th>
                        <th data-options="field:'district',width:70,align:'center'">区
                        </th>
                        <th data-options="field:'address',width:200,align:'center'">地址
                        </th>
                        <th data-options="field:'productName',width:200,align:'center'">产品
                        </th>
                        <th data-options="field:'count',width:40,align:'center'">数量
                        </th>
                        <th data-options="field:'amount',width:100,align:'center'">金额
                        </th>
                        <th data-options="field:'begindateStr',width:120,align:'center'">开始食用日期
                        </th>
                        <th data-options="field:'payment',width:150,align:'center'">支付方式
                        </th>
                        <th data-options="field:'createDateStr',width:160,align:'center'">下单时间
                        </th>
                        <th data-options="field:'stateStr',width:100,align:'center'">状态
                        </th>
                        <%--<th data-options="field:'pic',width:400,formatter:function(value,row){return '<img src=/Admin/ViewCommentImg?id='+row.id+' />';}">--%>
                        <%--图片--%>
                        <%--</th>--%>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="toolbar2" style="height:auto; text-align: left;">
                    <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
                    <%--data-options="iconCls:'icon-remove',plain:true" onclick="del()">删除</a>--%>
                    <%--&nbsp;&nbsp;--%>
                    <a href="javascript:void(0)" class="easyui-linkbutton" title=""
                       data-options="iconCls:'icon-edit',plain:true" onclick="deliver()">发货</a>
                    &nbsp;&nbsp;
                    <a href="javascript:void(0)" class="easyui-linkbutton" title=""
                       data-options="iconCls:'icon-ok',plain:true" onclick="finishOrder()">完成订单</a>
                    &nbsp;&nbsp;
                    <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
                       <%--data-options="iconCls:'icon-reload',plain:true" onclick="refreshList()">刷新</a>--%>
                    <%--&nbsp;&nbsp;--%>
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

    function onUserClick(index, row){
        getUserOrder(row.id);

    }

    //重置密码
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

    //查找用户 按手机号模糊查询
    function findUser(){
        $.ajax({
            url: '/Admin/GetUserList',
            type: "get",
            dataType: "json",
            data: {filter: $('#filter').val()},
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

    //查询用户订单
    function getUserOrder(uid) {
        $.ajax({
            url: '/Admin/GetOrderList',
            type: "get",
            dataType: "json",
            data: { uid : uid },
            success: function (data) {
                //alert(JSON.stringify(data));
                if (data.noData) {
                    $('#orderTable').datagrid('loadData', {total: 0, rows: []});
                } else {
                    $('#orderTable').datagrid('loadData', data);
                }
            }
        });
    }

    //发货
    function deliver() {
        if ($('#orderTable').datagrid('getSelected') == null) {
            $.messager.alert('提示', '请选择一条订单信息。');
            return;
        }
        var row = $('#orderTable').datagrid('getSelected');
        $.messager.confirm(
                '确认',
                '您确定为该订单发货？',
                function (r) {
                    if (r) {
                        $.ajax({
                            url: '/Admin/Deliver?oid=' + row.id,
                            type: "get",
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                                if(data.success) {
                                    refreshList();
                                }
                            }
                        });
                    }
                });

    }

    //完成
    function finishOrder() {
        if ($('#orderTable').datagrid('getSelected') == null) {
            $.messager.alert('提示', '请选择一条订单信息。');
            return;
        }
        var row = $('#orderTable').datagrid('getSelected');
        $.messager.confirm(
                '确认',
                '您确定将该订单完成？',
                function (r) {
                    if (r) {
                        $.ajax({
                            url: '/Admin/Finish?oid=' + row.id,
                            type: "get",
                            dataType: "json",
                            success: function (data) {
                                alert(data.message);
                                if(data.success) {
                                    refreshList();
                                }
                            }
                        });
                    }
                });

    }
</script>
</body>
</html>
