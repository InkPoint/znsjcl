<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2018/4/20
  Time: 14:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>一户式查询</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <form method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-1 col-lg-offset-2 control-label"
                                       style="text-align: left;width: 3cm;font-size: 15px;margin-top: 6px">纳税人搜索</label>
                                <div class="col-sm-5 ">
                                    <input id="nsrmc" align="left" type="text" class="form-control"
                                           placeholder="多个查询条件请以空格隔开">
                                </div>
                            </div>
                            <div class="form-group" style="margin-top: -8px;">
                                <label class="control-label">查询模式</label>
                                <input id="or" type="radio" name="ms" value="1"/><label>或</label>
                                <input id="and" type="radio" name="ms" value="2" checked/><label>且</label>
                            </div>
                        </form>
                        <br/>
                        <tr>
                            <td colspan="12" align="center">
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="querys()">执行查询
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <table id="mytab" class="table table-striped table-bordered table-hover" data-height="550"
                           style="white-space: nowrap;"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-develop/tableExport.js"></script>
</html>
<script>
    var conditions = "";

    $(function () {
        $("#nsrmc").focus();
        $(document).keydown(function (event) {
            var myfocus = document.activeElement;
            if (!document.getElementById("nsrmc").contains(myfocus)) return;
            if (event.keyCode == 13) {
                querys();
                return false;
            }
        });
        initTables();
    });

    function initTables(nsrmc, conditions) {
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            url: "${ctx}/sjyj/yhscx/taxdata",
            sidePagination: "server",
            queryParams: function (params) {
                return {
                    'svo.nsrmc': nsrmc,
                    'svo.conditions': conditions,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true,
            singleSelect: true,
            pageNumber: 1,
            buttonsAlign: 'right',
            pageSize: 10,
            onlyInfoPagination: false,
            cache: false,
            pageList: [10, 25, 50, 100],
            paginationLoop: true,
            clickToSelect: true,
            ueryParamsType: 'limit',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'djxh',
                    align: 'left',
                    halign: 'center',
                    title: '登记序号'
                }, {
                    field: 'nsrmc',
                    align: 'left',
                    halign: 'center',
                    title: '纳税人名称'
                }, {
                    field: 'nsrsbh',
                    align: 'left',
                    halign: 'center',
                    title: '纳税人识别号'
                }, {
                    field: 'fddbrxm',
                    align: 'left',
                    halign: 'center',
                    title: '法人'
                }, {
                    field: 'nsrztmc',
                    align: 'left',
                    halign: 'center',
                    title: '纳税人状态'
                }, {
                    field: 'zcdz',
                    align: 'left',
                    halign: 'center',
                    title: '注册地址'
                }, {
                    field: 'scjydz',
                    align: 'left',
                    halign: 'center',
                    title: '生产经营地址'
                }, {
                    field: 'djzclxmc',
                    align: 'left',
                    halign: 'center',
                    title: '登记注册类型'
                }, {
                    field: 'hymc',
                    align: 'left',
                    halign: 'center',
                    title: '行业'
                }, {
                    field: 'fj',
                    align: 'left',
                    halign: 'center',
                    title: '分局'
                }, {
                    field: 'ks',
                    align: 'left',
                    halign: 'center',
                    title: '科所'
                }, {
                    field: 'swryxm',
                    align: 'left',
                    halign: 'center',
                    title: '税收管理员'
                }, {
                    field: 'operation',
                    align: 'center',
                    halign: 'center',
                    title: '操作',
                    formatter: function (value, row, index) {
                        return '<button type="button" class="btn btn-info btn-sm" onclick="checkTheDetails(\'' + row.djxh + '\')">查看</button>';
                    }
                }
            ]
        });

    }

    function querys() {
        var nsrmcs = $("#nsrmc").val().trim();
        if ($("#and").get(0).checked) {
            conditions = "and";
        } else {
            conditions = "or";
        }
        initTables(nsrmcs, conditions);
    }

    function checkTheDetails(djxh) {
        window.location.href = "${ctx}/sjyj/yhscx/initViewDetail?djxh=" + djxh;
    }
</script>
