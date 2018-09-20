<%--
  Created by IntelliJ IDEA.
  User: PengWen Wang
  Date: 2018/6/19
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>查看日志</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <!--Beyond Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
</head>
<body>
<div class="page-body">
    <ul class="nav nav-tabs">
        <li class="active"><a href="javascript:void(0)">看日志</a></li>
        <li><a href="javascript:void(0)" onclick="window.location.href='${ctx}/zzfwzx/yhrz/initYhrz'">写日志</a></li>
    </ul>
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-body">
                    <div id="toolbar">
                        <div class="col-sm-2">
                            <form class="bs-example bs-example-form">
                                <div class="input-group">
                                    <input id="queryid" type="text" class="form-control" placeholder="主题名称...">
                                    <span class="input-group-addon" onclick="searchlist()">搜索</span>
                                </div>
                            </form>
                        </div>
                        &nbsp;
                        <button onclick="window.location.href='${ctx}/main/homepage/sqsppage'" type="button" class="btn btn-info"  style="margin-top: -5px;width: 2cm ">返回</button>
                    </div>
                    <table id="tableid" data-height="650" data-classes="table table-no-bordered"
                           class="table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!--Basic Scripts-->
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
</html>
<script>
    $(function () {
        theLogTable();
        $(document).keydown(function (event) {
            //返回获得的焦点元素
            var myfocus = document.activeElement;
            if (!document.getElementById("queryid").contains(myfocus)) return;
            if (event.keyCode == 13) {
                searchlist();
                $("#queryid").focus();
                return false;
            }
        });
    });

    //检索
    function searchlist() {
        var queryConditions = $("#queryid").val().trim();
        theLogTable(queryConditions);
    }

    //工作日志(表数据)
    function theLogTable(queryConditions) {
        //先销毁表格
        $('#tableid').bootstrapTable('destroy');
        $('#tableid').bootstrapTable({
            url: "${ctx}/zzfwzx/yhrz/querysAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.theme': queryConditions,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            toolbar: '#toolbar',
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
                title: 'ID',
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
                field: 'theme',
                align: 'left',
                title: '主题',
                halign: 'center'

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
                field: 'filename',
                align: 'left',
                halign: 'center',
                title: '已上传文件'
            }, {
                field: 'entrytime',
                align: 'center',
                title: '录入时间'
            }, {
                field: 'cz',
                align: 'center',
                title: '操作 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<div class="btn-group">' +
                        '<button type="button" class="btn btn-default btn-sm" style="color: #3bb4f2" onclick="editTheLog(\'' + row.logid + '\',\''+row.theme+'\')"><i class="glyphicon glyphicon-edit"></i>编辑</button>' +
                        // '<button type="button" class="btn btn-default btn-sm" onclick="fileDownload(\'' + row.logid + '\',\'' + row.filename + '\')"><i class="glyphicon glyphicon-cloud-download"></i>下载</button>' +
                        '<button type="button" class="btn btn-default btn-sm" style="color: #dd514c" onclick="deleteTheLog(\'' + row.logid + '\')"><i class="glyphicon glyphicon-remove"></i>删除</button>' + '</div>';
                }
            }]
        });

    }

    //删除日志
    function deleteTheLog(logid) {
        $.post("${ctx}/zzfwzx/yhrz/deleteTheLog", {'svo.logid': logid}, function (data) {
            $('#tableid').bootstrapTable("destroy");
            searchlist();
        });
    }

    //编辑日志
    function editTheLog(logid,theme) {
        window.location.href = "${ctx}/zzfwzx/yhrz/initYhrz?logid=" + logid+ "&" + "theme=" + theme;
    }

    //文件下载
    function fileDownload(logid, filenames) {
        $.post("${ctx}/zzfwzx/yhrz/queryFilePath", {
            'svo.logid': logid
        }, function (data) {
            if (data[0] != null) {
                var filepath = encodeURI(data[0].filepath);
                var filename = encodeURI(filenames);
                window.location.href = "${ctx}/zzfwzx/yhrz/downloadFiles?filepath=" + filepath + "&" + "filename=" + filename;
            } else {
                alert("温馨提示：该文件不存在");
            }
        });
    }
</script>
