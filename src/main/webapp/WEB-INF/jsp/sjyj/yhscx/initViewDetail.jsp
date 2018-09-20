<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2018/4/23
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>一户式查询(查询明细)</title>
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
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <a href="${ctx}/sjyj/yhscx/initYhscx">
                            <button type="button" class="btn btn-default"></i>返回</button>
                        </a>
                    </div>
                    <table id="mytab" data-classes="table table-no-bordered"
                           class="table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1100px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    查看
                </h4>
            </div>
            <div class="modal-body">
                <table id="viewtables" data-height="418" style="white-space: nowrap;"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
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
    var djxh = "${param.djxh}";

    $(function () {
        initTables();
    });

    function initTables() {
        $.ajax({
            url: "${ctx}/sjyj/yhscx/checkTheDetails",
            data: {'svo.djxh': djxh},
            dataType: 'json', success: function (tableData) {
                $('#mytab').bootstrapTable('destroy');
                $('#mytab').bootstrapTable({
                    data: tableData,
                    sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
                    singleSelect: true,
                    pageSize: 10,//每页的记录行数
                    buttonsAlign: 'right', //按钮对齐方式
                    onlyInfoPagination: false,
                    toolbar: '#toolbar',
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    paginationLoop: true,//设置为true启用分页条无线循环的功能
                    columns: [{
                        title: '',
                        align: 'center',
                        width: '5%',
                        formatter: function (value, row, index) {
                            return 0 + index + 1;
                        }
                    }, {
                        field: 'bm',
                        align: 'left',
                        halign: 'left',
                        width: '15%',
                        title: '部门名称'
                    }, {
                        field: 'tabname',
                        align: 'left',
                        halign: 'left',
                        title: '表名',
                        formatter: function (value, row, index) {
                            var aa = decodeURIComponent(value);
                            var myarr = aa.split(".");
                            $.each(myarr, function (indexs, values) {
                                var everydata = values.split("@");
                                var bmtitle1 = everydata[1].split("(")[0];
                                var bmtitle2 = everydata[1].split("(")[1].split(")")[0];
                                var bmtitle3 = everydata[1].split("(")[1].split(")")[1];
                                var strhtml = bmtitle1 + "(<font color='red'>" + bmtitle2 + "</font>)" + bmtitle3;
                                if (indexs == 0) {
                                    if (everydata[1].indexOf("(0)") > 0) {
                                        myarr = '<a href="javascript:void(0)" onclick="getTableName(\'' + everydata[0] + '\')">' + strhtml + '</a>'
                                    } else {
                                        myarr = "";
                                    }
                                } else {
                                    if (everydata[1].indexOf("(0)") > 0) {
                                        if (myarr == "") {
                                            myarr = ' <a href="javascript:void(0)" onclick="getTableName(\'' + everydata[0] + '\')">' + strhtml + '</a>';
                                        } else {
                                            myarr = myarr + ', <a href="javascript:void(0)" onclick="getTableName(\'' + everydata[0] + '\')">' + strhtml + '</a>';
                                        }
                                    }
                                }
                            });
                            return myarr;
                        }
                    }
                    ]
                });
            }
        });
    }

    function getTableName(obj) {
        $('#myview').modal('show');
        $.ajax({
            url: "${ctx}/sjyj/yhscx/getHeader",
            dataType: 'json',
            data: {'svo.tabname': obj},
            success: function (header) {
                for (var i in header)
                    $("#viewtables").bootstrapTable('destroy');
                $("#viewtables").bootstrapTable({
                    url: "${ctx}/sjyj/yhscx/presentData?svo.tabname=" + "sjqy." + obj + "@sjqy_cx",
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                    singleSelect: true,//设置为true 禁止多选
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 10, //每页的记录行数
                    pageList: [10, 25, 50, 100], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    undefinedText: '-',//当数据为undefined时显示的字符
                    columns: header
                });
            }
        });
    }
</script>
