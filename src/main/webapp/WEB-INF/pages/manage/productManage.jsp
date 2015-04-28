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
    <title>产品管理</title>
    <style>
        .ftitle {
            font-size: 14px;
            font-weight: bold;
            padding: 5px 0;
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
        }

        #fm {
            margin: 0;
            padding: 10px 30px;
        }

        .fitem {
            margin-top: 20px;
        }
    </style>
</head>
<body style="text-align: center">

<div class="bodybox">
    <div class="adminmain">
        <div class="usernav">
            <h1>后台管理</h1>
            <ul>
                <li><a href="/Admin/UserMng">用户管理</a></li>
                <li><a href="/Admin/CommentMng">评论管理</a></li>
                <li><a href="/Admin/OrderMng">订单管理</a></li>
                <li class="on"><a href="/Admin/ProductMng">产品管理</a></li>
                <li><a href="/Admin/QAMng">问题管理</a></li>
            </ul>
        </div>
        <div class="mainbox">
            <div class="easyui-panel" title="产品列表" style="padding: 20px">
                <table id="productTable" class="easyui-datagrid"
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
                        <th data-options="field:'pName',width:150,align:'center',editor:{type: 'text', required: true}">
                            产品名称
                        </th>
                        <th data-options="field:'description',width:200,align:'center',editor:{type: 'text', required: true}">
                            产品描述
                        </th>
                        <th data-options="field:'price',width:100,align:'center',editor:{type: 'numberbox', required: true,options:{precision:2}}">
                            价格
                        </th>
                        <th data-options="field:'memberPrice',width:100,align:'center',editor:{type: 'numberbox',options:{precision:2}}">
                            会员价格
                        </th>
                        <th data-options="field:'pic',width:400,formatter:function(value,row){return '<img width=\'120px\' heeight=\'70px\' src=/Admin/ViewProductImg?id='+row.id+' />';}">
                            产品图片
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="toolbar1" style="height:auto; text-align: left;">
                    <a href="javascript:void(0)" class="easyui-linkbutton"
                       data-options="iconCls:'icon-add',plain:true" onclick="add()">新建</a>
                    &nbsp;&nbsp;
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
    </div>

    <div id="dlg" class="easyui-dialog" style="width:460px;height:520px;padding:10px 20px"
         closed="true" buttons="#dlg-buttons">
        <div class="ftitle">添加商品</div>
        <form id="fm" action="/Admin/SubmitProduct" class="easyui-form" method="post"
              enctype="multipart/form-data" data-options="novalidate:true">
            <%--<div style="display: none;">--%>
            <%--<input name="busID" class="easyui-textbox" value="${busID}">--%>
            <%--</div>--%>
            <div class="fitem">
                产品名:
                <input id="pName" name="pName" class="easyui-validatebox textbox" maxlength="50"
                       required="true">
            </div>
            <div class="fitem">
                说明:
                <textarea id="description" name="description" class="easyui-validatebox" maxlength="200"
                          style="width: 300px;height: 150px"
                          required="true">
                </textarea>
            </div>
            <div class="fitem">
                单价:
                <input id="price" name="price" class="easyui-numberbox easyui-validatebox" precision="2"
                       required="true">
            </div>
            <div class="fitem">
                会员价:
                <input id="memberPrice" name="memberPrice" class="easyui-numberbox easyui-validatebox" precision="2"
                       required="true">
            </div>
            <div class="fitem">
                产品图片:
                <input type="file" id="pic" name="pic" onchange="uploadImgChange(this,$('#Tip'),$('#btn'))">
            </div>
            <div class="fitem">
                <span id="Tip" style="color: red;"></span>
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok"
           onclick="submit()" style="width:90px">提交</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel"
           onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
    </div>
</div>


<%--<div style="width: 1200px;padding: 10px;margin-right: 10px">--%>
    <%--<div class="easyui-panel" title="产品列表" style="padding: 20px">--%>
        <%--<table id="productTable" class="easyui-datagrid"--%>
               <%--style="height:400px"--%>
               <%--data-options="--%>
                                    <%--singleSelect: true,--%>
                                    <%--&lt;%&ndash;rownumbers:true,&ndash;%&gt;--%>
                                    <%--url: '',--%>
                                    <%--fitColumns:true,--%>
                                    <%--toolbar: '#toolbar1',--%>
                                    <%--pagination:true,--%>
                                    <%--pageSize:50,--%>
                                    <%--pageList: [50,100],--%>
                                    <%--onClickRow: onClickRow,--%>
                                    <%--method: 'get'--%>
                                    <%--">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th data-options="field:'id',width:20,align:'center'">ID</th>--%>
                <%--<th data-options="field:'pName',width:150,align:'center',editor:{type: 'text', required: true}">产品名称--%>
                <%--</th>--%>
                <%--<th data-options="field:'description',width:200,align:'center',editor:{type: 'text', required: true}">--%>
                    <%--产品描述--%>
                <%--</th>--%>
                <%--<th data-options="field:'price',width:100,align:'center',editor:{type: 'numberbox', required: true,options:{precision:2}}">--%>
                    <%--价格--%>
                <%--</th>--%>
                <%--<th data-options="field:'memberPrice',width:100,align:'center',editor:{type: 'numberbox',options:{precision:2}}">--%>
                    <%--会员价格--%>
                <%--</th>--%>
                <%--<th data-options="field:'pic',width:400,formatter:function(value,row){return '<img width=\'120px\' heeight=\'70px\' src=/Admin/ViewProductImg?id='+row.id+' />';}">--%>
                    <%--产品图片--%>
                <%--</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>
            <%--<tbody>--%>
            <%--</tbody>--%>
        <%--</table>--%>
        <%--<div id="toolbar1" style="height:auto; text-align: left;">--%>
            <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
               <%--data-options="iconCls:'icon-remove',plain:true" onclick="del()">删除</a>--%>
            <%--&nbsp;&nbsp;--%>
            <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
               <%--data-options="iconCls:'icon-edit',plain:true" onclick="edit()">编辑</a>--%>
            <%--&nbsp;&nbsp;--%>
            <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
               <%--data-options="iconCls:'icon-reload',plain:true" onclick="refreshList()">刷新</a>--%>
            <%--&nbsp;&nbsp;--%>
            <%--<a href="javascript:void(0)" class="easyui-linkbutton"--%>
               <%--data-options="iconCls:'icon-ok',plain:true" onclick="update()">确认修改</a>--%>
            <%--&nbsp;&nbsp;--%>

        <%--</div>--%>

    <%--</div>--%>
<%--</div>--%>
<%--<div style="width: 100%;">--%>
    <%--<form action="/Admin/SubmitProduct" id="form" method="post" enctype="multipart/form-data">--%>

        <%--<table align="center">--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--添加产品--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--产品名--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<input id="pName" name="pName">--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--说明--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<textarea id="description" name="description">--%>

                    <%--</textarea>--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--单价--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<input id="price" name="price" class="easyui-numberbox" precision="2">--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--会员价--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<input id="memberPrice" name="memberPrice" class="easyui-numberbox" precision="2">--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--产品图片--%>
                <%--</td>--%>
                <%--<td>--%>
                    <%--<input type="file" id="pic" name="pic" onchange="uploadImgChange(this,$('#Tip'),$('#btn'))">--%>
                <%--</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>--%>
                    <%--<span id="Tip" style="color: red;"></span>--%>
                <%--</td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</form>--%>
    <%--<div style="text-align: center">--%>
        <%--<button style="display: none" id="btn" onclick="submit();">提交</button>--%>
    <%--</div>--%>
<%--</div>--%>

<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/css/easyui.css">
<link rel="stylesheet" type="text/css" href="${ctx}/static/easyui/css/icon.css">

<script type="text/javascript" src="${ctx}/static/easyui/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctx}/static/easyui/js/jquery.easyui.min.js"></script>

<script>
    var isIE = /msie/i.test(navigator.userAgent) && !window.opera;
    var selectIndex = undefined;
    function submit() {
        if($('#fm').form('enableValidation').form('validate')) {
            $('#fm').submit();
        }
    }

    $(document).ready(function () {
        $.messager.defaults = {ok: "确定", cancel: "取消"};
        refreshList();
    });

    //刷新评论
    function refreshList() {
        $.ajax({
            url: '/Admin/GetProductList',
            type: "get",
            dataType: "json",
            success: function (data) {
                //alert(JSON.stringify(data));
                if (data.noData) {
                    $('#productTable').datagrid('loadData', {total: 0, rows: []});
                } else {
                    $('#productTable').datagrid('loadData', data);
                }
            }
        });
    }

    //添加
    function add(){
        $('#dlg').dialog('open').dialog('setTitle', '添加商品');
        $('#fm').form('clear');
    }

    //删除
    function del() {
        if ($('#productTable').datagrid('getSelected') == null) {
            $.messager.alert('提示', '请选择一条票据信息。');
            return;
        }
        var row = $('#productTable').datagrid('getSelected');
        $.messager.confirm(
                '确认',
                '您确定要删除选中票据信息？',
                function (r) {
                    if (r) {
                        $.ajax({
                            url: '/Admin/DeleteProduct?id=' + row.id,
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
        $('#productTable').datagrid('selectRow', selectIndex)
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
                        $('#productTable').datagrid('acceptChanges');
                        var data = $('#productTable').datagrid('getSelected');
                        //alert(JSON.stringify(data));
                        $.ajax({
                            url: '/Admin/UpdateProduct',
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
                $('#productTable').datagrid('rejectChanges');
                selectIndex = index;
                $('#productTable').datagrid('selectRow', selectIndex);
            } else {
                $('#productTable').datagrid('rejectChanges');
                $('#productTable').datagrid('selectRow', selectIndex);
            }
        }
    }
    function endEdit() {
        if (selectIndex == undefined) {
            return true
        }
        if ($('#productTable').datagrid('validateRow', selectIndex)) {
            $('#productTable').datagrid('endEdit', selectIndex);
            selectIndex = undefined;
            return true;
        }
        else {
            return false;
        }
    }

    function uploadImgChange(target, tip, btn) {
        tip.html('');
        var fileSize = 0;
        var filetypes = [".jpg", ".png"];
        var filepath = target.value;

        var filemaxsize = 1024 * 1;//1M
        if (filepath) {
            var isNext = false;
            var fileEnd = filepath.substring(filepath.lastIndexOf("."));
            fileEnd = fileEnd.toLowerCase();
            if (filetypes && filetypes.length > 0) {
                for (var i = 0; i < filetypes.length; i++) {
                    if (filetypes[i] == fileEnd) {
                        isNext = true;
                        break;
                    }
                }
            }
            if (!isNext) {
                tip.html('*不接受此文件类型');
                target.value = "";
                btn.css('display', 'none');
                return false;
            }
        } else {
            return false;
        }
        if (isIE && !target.files) {
            //var filePath = target.value;
            var fileSystem = new ActiveXObject("Scripting.FileSystemObject");
            alert(filepath);
            if (!fileSystem.FileExists(filePath)) {
                //alert(filePath);
                tip.html("*附件不存在，请重新输入！");
                btn.css('display', 'none');
                return false;
            }
            //alert('2');
            var file = fileSystem.GetFile(filePath);
            //alert('3');
            fileSize = file.Size;
            //alert('ok');
        } else {
            fileSize = target.files[0].size;
        }
        var size = fileSize / 1024;
        if (size > filemaxsize) {
            tip.html("*附件大小不能大于" + filemaxsize / 1024 + "M！");
            target.value = "";
            btn.css('display', 'none');
            return false;
        }
        if (size <= 0) {
            tip.html("*附件大小不能为0M！")
            target.value = "";
            btn.css('display', 'none');
            return false;
        }
        btn.css('display', '');

    }
</script>
</body>
</html>
