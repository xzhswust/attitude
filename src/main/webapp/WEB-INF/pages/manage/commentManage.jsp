<%--
  Created by IntelliJ IDEA.
  User: Smomo
  Date: 2015/3/11
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>评论管理</title>
</head>
<body style="text-align: center">
<div style="width: 1000px;padding: 10px;margin-right: 10px">
    <div class="easyui-panel" title="评论列表" style="padding: 20px">
        <table id="commentTable" class="easyui-datagrid"
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
                <th data-options="field:'username',width:60,align:'center',editor:{type: 'text', required: true}">用户名
                </th>
                <th data-options="field:'comment',width:200,align:'center',editor:{type: 'text', required: true}">评论
                </th>
                <th data-options="field:'pic',width:400,formatter:function(value,row){return '<img src=/Admin/ViewCommentImg?id='+row.id+' />';}">
                    图片
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
               data-options="iconCls:'icon-reload',plain:true" onclick="refreshComment()">刷新</a>
            &nbsp;&nbsp;
            <a href="javascript:void(0)" class="easyui-linkbutton"
               data-options="iconCls:'icon-ok',plain:true" onclick="updateComment()">确认修改</a>
            &nbsp;&nbsp;

        </div>

    </div>
</div>
<div style="width: 100%;">
    <form action="/Admin/SubmitComment" id="form" method="post" enctype="multipart/form-data">

        <table align="center">
            <tr>
                <td>
                    添加评论
                </td>
            </tr>
            <tr>
                <td>
                    用户名
                </td>
                <td>
                    <input id="userName" name="userName">
                </td>
            </tr>
            <tr>
                <td>
                    评论
                </td>
                <td>
                    <textarea id="comment" name="comment">

                    </textarea>
                </td>
            </tr>
            <tr>
                <td>
                    图片
                </td>
                <td>
                    <input type="file" id="pic" name="pic" onchange="uploadImgChange(this,$('#Tip'),$('#btn'))">
                </td>
            </tr>
            <tr>
                <td>
                    <span id="Tip" style="color: red;"></span>
                </td>
            </tr>
        </table>
    </form>
    <div style="text-align: center">
        <button style="display: none" id="btn" onclick="submit();">提交</button>
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
        refreshComment();
    });

    //刷新评论
    function refreshComment() {
        $.ajax({
            url: '/Admin/GetCommentList',
            type: "get",
            dataType: "json",
            success: function (data) {
                //alert(JSON.stringify(data));
                if (data.noData) {
                    $('#commentTable').datagrid('loadData', {total: 0, rows: []});
                } else {
                    $('#commentTable').datagrid('loadData', data);
                }
            }
        });
    }

    //删除评论
    function del() {
        if ($('#commentTable').datagrid('getSelected') == null) {
            $.messager.alert('提示', '请选择一条票据信息。');
            return;
        }
        var row = $('#commentTable').datagrid('getSelected');
        $.messager.confirm(
                '确认',
                '您确定要删除选中票据信息？',
                function (r) {
                    if (r) {
                        $.ajax({
                            url: '/Admin/DeleteComment?id=' + row.id,
                            type: "post",
                            dataType: "json",
                            success: function (data) {
                                if (data.success) {
                                    $.messager.alert('提示', data.message);
                                    refreshComment();
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
        $('#commentTable').datagrid('selectRow', selectIndex)
                .datagrid('beginEdit', selectIndex);

    }

    //提交编辑
    function updateComment() {
        if (selectIndex == undefined)   return;
        if (!endEdit())return;
        $.messager.confirm(
                '确认',
                '您确定要修改该票据信息？',
                function (r) {
                    if (r) {
                        $('#commentTable').datagrid('acceptChanges');
                        var data = $('#commentTable').datagrid('getSelected');
                        //alert(JSON.stringify(data));
                        $.ajax({
                            url: '/Admin/UpdateComment',
                            type: "post",
                            dataType: "json",
                            data: data,
                            success: function (data) {
                                if (data.success) {
                                    //alert(data.message);
                                    $.messager.alert('提示', data.message);
                                    refreshComment();
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
                $('#commentTable').datagrid('rejectChanges');
                selectIndex = index;
                $('#commentTable').datagrid('selectRow', selectIndex);
            } else {
                $('#commentTable').datagrid('rejectChanges');
                $('#commentTable').datagrid('selectRow', selectIndex);
            }
        }
    }
    function endEdit() {
        if (selectIndex == undefined) {
            return true
        }
        if ($('#commentTable').datagrid('validateRow', selectIndex)) {
            $('#commentTable').datagrid('endEdit', selectIndex);
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
