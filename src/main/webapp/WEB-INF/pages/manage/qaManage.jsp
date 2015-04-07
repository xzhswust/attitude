<%--
  Created by IntelliJ IDEA.
  User: Smomo
  Date: 2015/3/25
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>问题管理</title>
</head>
<body style="text-align: center">
<div style="width: 100%">
    <table>
        <tr>
            <td>
                问题类型:
            </td>
            <td>
                <input id="qaType" class="easyui-combobox" data-options="
                    url:'/Admin/GetQATypeList',
                    method:'get',
                    valueField:'id',
                    textField:'text',
                    multiple:true,
                    panelHeight:'auto',
                    editable:false
                    ">
                <button id="deleteBtn" onclick="deleteType()">删除类型</button>
            </td>
        </tr>
        <tr>
            <td>添加类型：</td>
            <td>
                类型ID<input id="typeID">
                问题类型<input id="typeName">
                <button id="addBtn" onclick="addType()">添加类型</button>
            </td>
        </tr>
    </table>
</div>
<div style="width: 1200px;padding: 10px;margin-right: 10px">
    <div class="easyui-panel" title="问题列表" style="padding: 20px">
        <table id="qaTable" class="easyui-datagrid"
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
                                    onClickRow: onClickRow,
                                    method: 'get'
                                    ">
            <thead>
            <tr>
                <th data-options="field:'id',width:20,align:'center'">ID</th>
                <th data-options="field:'question',width:150,align:'center',editor:{type: 'text', required: true}">问题
                </th>
                <th data-options="field:'answer',width:200,align:'center',editor:{type: 'text', required: true}">回答
                </th>
                <th data-options="field:'typeStr',width:150,align:'center'">问题类型
                </th>
            </tr>
            </thead>
            <tbody>
            </tbody>
        </table>
        <div id="toolbar1" style="height:auto; text-align: left;">
            <a href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-remove',plain:true" onclick="del()">删除</a>
            &nbsp;&nbsp;
            <a href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-edit',plain:true" onclick="edit()">编辑</a>
            &nbsp;&nbsp;
            <a href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-reload',plain:true" onclick="refreshList()">刷新</a>
            &nbsp;&nbsp;
            <a href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-ok',plain:true" onclick="update()">确认修改</a>
            &nbsp;&nbsp;

        </div>

    </div>
</div>
<div style="width: 100%;">
    <form action="/Admin/SubmitQA" id="form" method="post" enctype="multipart/form-data">

        <table align="center">
            <tr>
                <td>
                    添加问题
                </td>
            </tr>
            <tr>
                <td>
                    问题分类
                </td>
                <td>
                    <input id="qaTypeInput" name="qaType" class="easyui-combobox" data-options="
                    url:'/Admin/GetQATypeList',
                    method:'get',
                    valueField:'id',
                    textField:'text',
                    panelHeight:'auto',
                    editable:false
                    ">
                </td>
            </tr>
            <tr>
                <td>
                    问题
                </td>
                <td>
                    <input class="textbox" id="question" name="question">

                </td>
            </tr>
            <tr>
                <td>
                    回答
                </td>
                <td>
                    <textarea id="answer" name="answer">

                    </textarea>
                </td>
            </tr>
        </table>
    </form>
    <div style="text-align: center">
        <button id="btn" onclick="submit();">提交</button>
    </div>
</div>

<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/css/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/css/icon.css">

<script type="text/javascript" src="${ctx}/static/easyui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui/js/jquery.easyui.min.js"></script>

<script>
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
    var selectIndex = undefined;
    function submit() {
        $('#form').submit();
    }

    $(document).ready(function () {
        $.messager.defaults = {ok: "确定", cancel: "取消"};
        refreshList();
    });

    //刷新评论
    function refreshList() {
        $.ajax({
            url: '/Admin/GetQAList',
            type: "get",
            dataType: "json",
            success: function (data) {
                //alert(JSON.stringify(data));
                if (data.noData) {
                    $('#qaTable').datagrid('loadData', {total: 0, rows: []});
                } else {
                    $('#qaTable').datagrid('loadData', data);
                }
            }
        });
    }

    //删除评论
    function del() {
        if ($('#qaTable').datagrid('getSelected') == null) {
            $.messager.alert('提示', '请选择一条票据信息。');
            return;
        }
        var row = $('#qaTable').datagrid('getSelected');
        $.messager.confirm(
                '确认',
                '您确定要删除选中票据信息？',
                function (r) {
                    if (r) {
                        $.ajax({
                            url: '/Admin/DeleteQA?id=' + row.id,
                            type: "post",
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    $.messager.alert('提示', data.message);
                                    refreshList();
                                }
                                else {
                                    $.messager.alert('提示', data.message, 'error');
                                }
                            }
                        });
                    }
                });
    }

    //编辑
    function edit() {

        if (selectIndex == undefined) {
            return;
        }
        $('#qaTable').datagrid('selectRow', selectIndex)
                .datagrid('beginEdit', selectIndex);

    }

    //提交编辑
    function update() {
        if (selectIndex == undefined)   return;
        if (!endEdit())return;
        $.messager.confirm(
                '确认',
                '您确定要修改该产品信息？',
                function (r) {
                    if (r) {
                        $('#qaTable').datagrid('acceptChanges');
                        var data = $('#qaTable').datagrid('getSelected');
                        //alert(JSON.stringify(data));
                        $.ajax({
                            url: '/Admin/UpdateQA',
                            type: "post",
                            dataType: "json",
                            data: data,
                            success: function (data) {
                                if (data.success) {
                                    //alert(data.message);
                                    $.messager.alert('提示', data.message);
                                    refreshList();
                                }
                                else {
                                    $.messager.alert('提示', data.message, 'error');
                                }
                            }
                        });
                    }
                });
    }


    function onClickRow(index) {
        if (selectIndex != index) {
            if (endEdit()) {
                $('#qaTable').datagrid('rejectChanges');
                selectIndex = index;
                $('#qaTable').datagrid('selectRow', selectIndex);
            } else {
                $('#qaTable').datagrid('rejectChanges');
                $('#qaTable').datagrid('selectRow', selectIndex);
            }
        }
    }
    function endEdit() {
        if (selectIndex == undefined) {
            return true
        }
        if ($('#qaTable').datagrid('validateRow', selectIndex)) {
            $('#qaTable').datagrid('endEdit', selectIndex);
            selectIndex = undefined;
            return true;
        }
        else {
            return false;
        }
    }

    function addType(){
        $.messager.confirm(
                '确认',
                '您确定要添加问题类型？',
                function (r) {
                    if (r) {
                        $.ajax({
                            url: '/Admin/AddQAType',
                            type: "post",
                            data: {typeID:$('#typeID').val(),typeName:$('#typeName').val()},
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    $.messager.alert('提示', data.message);
                                    //refreshList();
                                    $('#qaType').combobox('reload');
                                    $('#qaTypeInput').combobox('reload');
                                    $('#qaType').combobox('setValue','');
                                    $('#qaTypeInput').combobox('setValue','');
                                }
                                else {
                                    $.messager.alert('提示', data.message, 'error');
                                }
                            }
                        });
                    }
                });
    }

    function deleteType(){
        $.messager.confirm(
                '确认',
                '您确定删除该问题类型？所有该类型问题将被删除。',
                function (r) {
                    if (r) {
                        //alert($('#qaType').combobox('getValues'));
                        $.ajax({
                            url: '/Admin/DeleteQAType?qaType='+$('#qaType').combobox('getValues'),
                            type: "post",
                            //data: {qaType:$('#qaType').combobox('getValues')},
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    $.messager.alert('提示', data.message);
                                    $('#qaType').combobox('reload');
                                    $('#qaTypeInput').combobox('reload');
                                    $('#qaType').combobox('setValue','');
                                    $('#qaTypeInput').combobox('setValue','');
                                    refreshList();
                                }
                                else {
                                    $.messager.alert('提示', data.message, 'error');
                                }
                            }
                        });
                    }
                });
    }
</script>
</body>
</html>
