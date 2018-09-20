<%--
  Created by IntelliJ IDEA.
  User: PengWen Wang
  Date: 2018/4/12
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>(开发者)查看日志</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
</head>
<body>
<div class="page-body">
    <ul class="nav nav-tabs">
        <li class="active"><a href="javascript:void(0)">看日志</a></li>
        <li><a href="javascript:void(0)" onclick="window.location.href='${ctx}/sjsplc/log/initLog'">写日志</a></li></ul>
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-body">
                    <table class="table">
                        <tr><td style="vertical-align:middle;width: 1.5cm;">主题名称:</td>
                            <td style="width: 160px"><input id="topicName" type="text" style="width: 150px;" class="form-control"></td>
                            <td style="vertical-align:middle;width: 1.5cm;">用户名称:</td>
                            <td style="width: 160px"><input id="userName" type="text" style="width: 150px;" class="form-control"></td>
                            <td style="vertical-align:middle;width: 1.5cm;">任务时间:</td>
                            <td style="width: 160px"><div style="width: 160px" class="input-group date form_date"
                                     data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
                                    <input id="operationTime" class="form-control" type="text">
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span></div></td></tr>
                            <tr><td colspan="12" align="center">
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="searchlist()">执行查询</button>&nbsp;
                                <button onclick="window.location.href='${ctx}/xtgn.jsp'" type="button"
                                        class="btn btn-info" style="width: 2cm">返&nbsp;&nbsp;&nbsp;&nbsp;回</button>
                            </td></tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-body">
                    <div id="toolbar" class="hidden-print">
                        <button onclick="exportToExcel()" type="button" class="btn btn-default" style="width: 2cm"><i
                                class="glyphicon glyphicon-export"></i>导出
                        </button>
                    </div>
                    <table id="tableid" data-height="650" data-classes="table table-no-bordered" class="table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
</html>
<script>
    var code;
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    $(function () {
        $.post("${ctx}/sjsplc/log/currentLoginUser", null, function (results) {
            code = results;
        });
        theLogTable();
        $("#topicName").focus();
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                searchlist();
                return false;
            }
        });
    });

    function searchlist() {
        var topicname = $("#topicName").val().trim();
        var username = $("#userName").val().trim();
        var operationtime = $("#operationTime").val();
        theLogTable(topicname, username, operationtime);
    }

    function theLogTable(topicname, username, operationtime) {
        $('#tableid').bootstrapTable('destroy');
        $('#tableid').bootstrapTable({
            url: "${ctx}/sjsplc/log/querysAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.theme': topicname,
                    'svo.username': username,
                    'svo.operatingtime': operationtime,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            toolbar: '#toolbar',
            toolbarAlign: 'right',
            striped: true,                          //隔行换色
            pagination: true,                       //是否分页
            singleSelect: true,                     //设置为true将禁止多选
            pageNumber: 1,                          //初始化加载第一页，默认第一页
            buttonsAlign: 'left',                   //按钮对齐方式
            pageSize: 10,                           //每页的记录行数
            onlyInfoPagination: false,             //设置为true只显示总数据数，而不是显示分页按钮
            cache: false,                          //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50],             //可供选择的每页行数
            paginationLoop: true,                   //设置为true启用分页条无线循环的功能
            clickToSelect: true,                    //是否启用点击选中行
            uniqueIS: "xxcjid",                     //每一行的唯一标识，一般为主键列
            queryParamsType: 'limit',               //设置为“limit”则会发送符合RESTFui格式的参数
            columns: [{
                title: '序号',
                align: 'center',
                width: 40,
                formatter: function (value, row, index) {
                    //获取每页的数据量
                    var pagesize = $("#tableid").bootstrapTable('getOptions').pageSize;
                    //获取当前是第几页
                    var pageNumber = $("#tableid").bootstrapTable('getOptions').pageNumber;
                    //返回序号(从0开始)
                    return pagesize * (pageNumber - 1) + index + 1;
                }
            }, {
                field: 'usercode',
                align: 'center',
                title: '用户代码',
                halign: 'center'

            }, {
                field: 'username',
                align: 'left',
                title: '用户名称',
                halign: 'center'
            }, {
                field: 'theme',
                align: 'left',
                title: '主题名称',
                halign: 'center',
                formatter: function (value, row, index) {
                    var shorthandTheme; // 简写主题名称
                    if (value ==  undefined)value="";
                    if (value != null){
                    if (value.length > 25) {
                        shorthandTheme = value.substring(0, 25) + "...";
                    } else {
                        shorthandTheme = value;
                    }
                        }
                    return [
                        '<a  data-toggle="tooltip" data_placement="bottom" title=' + value + '>' + shorthandTheme + '</a>'
                    ].join('');
                }
            }, {
                field: 'text',
                align: 'center',
                halign: 'center',
                title: '工作类型'
            }, {
                field: 'operatingtime',
                align: 'center',
                title: '任务时间'
            }, {
                field: 'cz',
                align: 'center',
                title: '操作 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    if (row.usercode.search(code) > -1) {
                        return '<div class="btn-group">' +
                            '<button type="button" class="btn btn-default btn-sm" style="color: #3bb4f2" onclick="editTheLog(\'' + row.logid + '\')"><i class="glyphicon glyphicon-edit"></i>编辑</button>' +
                            '<button type="button" class="btn btn-default btn-sm" style="color: #dd514c" onclick="deleteTheLog(\'' + row.logid + '\')"><i class="glyphicon glyphicon-remove"></i>删除</button></div>';
                    } else {
                        return '<div class="btn-group">' +
                            '<button type="button" class="btn btn-default btn-sm" onclick="seeTheLog(\'' + row.logid + '\',)"><i class="glyphicon glyphicon-search"></i>查看</button>' + '</div>';
                    }
                }
            }]
        });

    }

    function deleteTheLog(logid) {
        $.post("${ctx}/sjsplc/log/deleteTheLog", {'svo.logid': logid}, function (data) {
            $('#tableid').bootstrapTable("destroy");
            searchlist();
        });
    }

    function editTheLog(logid) {
        window.location.href = "${ctx}/sjsplc/log/initLog?logid=" + logid;
    }

    function seeTheLog(logid) {
        var identifier = "examine";
        window.location.href = "${ctx}/sjsplc/log/initLog?logid=" + logid + "&" + "identifier=" + identifier;
    }

    function exportToExcel() {
        window.location.href="${ctx}/sjsplc/log/exportExcel";
    }
</script>
