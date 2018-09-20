<%--
  Created by IntelliJ IDEA.
  User: PengWen Wang
  Date: 2018/8/23
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>养老信息</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">养老保险信息</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar" class="hidden-print">
                        <button onclick="returndiv()" type="button" class="btn btn-blue">返&nbsp;&nbsp;回</button>
                    </div>
                    <table style="white-space: nowrap;" class="table table-striped table-bordered table-hover"
                           id="viewtable" data-height="560"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<script>
    $(function () {
        $('#viewtable').bootstrapTable('destroy');
        $('#viewtable').bootstrapTable({
            pagination: true,
            singleSelect: true,
            pageNumber: 1,
            pageSize: 10,
            onlyInfoPagination: false,
            pageList: [10, 25, 50, 100],
            toolbar: '#toolbar',
            toolbarAlign: 'left',
            paginationLoop: true,
            clickToSelect: true,
            columns: [{
                field: 'xh',
                title: '序号',
                align: 'center',
                width: 40
            },
                {
                    field: 'cpbt',
                    align: 'center',
                    halign: 'center',
                    title: '产品标题'
                }, {
                    field: 'cpms',
                    align: 'left',
                    halign: 'center',
                    title: '产品描述'
                }, {
                    field: 'cjr',
                    align: 'center',
                    halign: 'center',
                    title: '创建人'
                }, {
                    field: 'cjsj',
                    align: 'center',
                    halign: 'center',
                    title: '创建时间'
                }, {
                    field: 'cksj',
                    align: 'center',
                    halign: 'center',
                    title: '查看数据'
                }
            ], data: [{
                xh: '1',
                cpbt: '社保数据传递',
                cpms: '养老保险信息汇总，可按照核算机关、经办单位统计',
                cjr: '刘东兴',
                cjsj: '2018/08/23 15:57:31',
                cksj: '<button type="button" onclick="summary()" class="btn btn-blue btn-sm"><i class="glyphicon glyphicon-search"></i>查看</button>'
            }, {
                xh: '2',
                cpbt: '社保数据传递',
                cpms: '养老保险信息封皮',
                cjr: '刘东兴',
                cjsj: '2018/08/23 16:30:24',
                cksj: '<button onclick="aFrontConver()" type="button" class="btn btn-blue btn-sm"><i class="glyphicon glyphicon-search"></i>查看</button>'
            }]
        });
    });
    function returndiv() {
        var tempValue="sjcp09";
        window.location.href = "${ctx}/sjjg/syhz/initSbcsym?csid='"+tempValue+"'";
    }
    function summary(){
        window.location.href="${ctx}/sjjg/ylxxcx/initYlxxcx";
    }
    function aFrontConver(){
        window.location.href="${ctx}/sjjg/ylfp/initYlfp";
    }
</script>
