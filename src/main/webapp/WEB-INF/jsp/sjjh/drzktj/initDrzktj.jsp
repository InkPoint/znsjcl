<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/11/13
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>导入状况统计</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Bootstrap Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Select2 styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <!--Bootstrap-datetimepicker Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
</head>
<body>
<div class="page-body" id="bxx">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width:3cm;">表中文名称:</td>
                            <td style="width:11cm;">
                                <input id="sjlxmc" type="text" style="width: 150px;" class="form-control"></td>
                            <td colspan="12">
                                <button type="button" class="btn btn-info" style="width: 2cm;"
                                        onclick="searchlist()">执行查询
                                </button>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
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
                    <table id="table" data-height="580" class="table table-striped table-bordered table-hover"
                           style="white-space: nowrap;"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--查看数据页面--%>
<div class="page-body" id="sjxx" style="display: none">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <%--<span class="widget-caption">查看数据</span>--%>
                    <div style="margin-right: 98%;padding-top: 4px;padding-bottom: 3px" >
                        <button onclick="xsModel()" type="button" class="btn btn-info btn-block"
                                style="width: 2cm; ">返回
                        </button>
                    </div>
                </div>
                <div class="widget-body">
                    <%--数据项(表)信息展示--%>
                    <table id="viewtables" data-height="680" style="white-space: nowrap" class="table table-striped table-bordered table-hover" >
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>


</body>
<!--Basic Scripts-->
<script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--Select2 Scripts--%>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<%--Bootstrap-datetimepicker Scripts--%>
<script src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
<%--Export Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-develop/tableExport.js"></script>
</html>
<script>
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjjhpage.jsp";
    }
    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                searchlist();
            }
        });
        //数据来源(下拉菜单)
        $.post("${pageContext.request.contextPath}/sjzd/sjdxgl/datasurce", null, function (data) {
            $(".js-data-sjly").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //数据级别(下拉菜单)
        $.post("${pageContext.request.contextPath}/sjzd/sjjbgl/getSjjbTree", null, function (data) {
            $(".input-xlarge").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //导入方式(下拉菜单)
        $.post("${pageContext.request.contextPath}/sjjh/drzktj/getDrlxTree", null, function (data) {
            $(".js-data-example-ajax").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //初始化Table
        inittabs();
    });
    //导入状况Table
    function inittabs(sjlxmc) {
        //先销毁表格
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/drzktj/drzktjAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.sjlxmc': sjlxmc,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "pc_dm", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: 'sjlxmc',
                align: 'center',
                title: '表中文名称'

            }, {
                field: 'lymc',
                align: 'center',
                title: '数据来源'

            }, {
                field: 'jbmc',
                align: 'center',
                title: '数据级别'
            }, {
                field: 'sjb',
                align: 'center',
                title: '表英文名称'
            }, {
                field: 'drsjl',
                align: 'center',
                title: '导入数据量'
            }, {
                field: 'drsj',
                align: 'center',
                title: '导入时间'
            }, {
                field: 'cjr',
                align: 'center',
                title: '导入人'
            }, {
                field: 'view',
                align: 'center',
                title: '查看数据 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-info btn-sm" onclick="myviewdata(\'' + row.sjb + '\')" >查看</button>';

                }
            }]

        });
    }
    //Search
    function searchlist() {
        var sjlxmc = $("#sjlxmc").val();
        inittabs(sjlxmc);
    }
    ///Bootstrap-datetimepicker
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


    function xsModel() {
        $('#bxx').show();
        $('#sjxx').hide();
    }


    //查看详细信息
    function myviewdata(dxmcyws) {
        var sjb = dxmcyws;

        viewthedata(sjb);
    }

    //查看数据
    function viewthedata(dxmcyws) {
//        $('#myview').modal('show');

        $('#bxx').hide();
        $('#sjxx').show();


        //销毁表格
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/sjdxgl/getheader",
            dataType: 'json',
            data: {'svo.dxmcyw': dxmcyws},
            success: function (header) {
                $("#viewtables").bootstrapTable('destroy');
                $("#viewtables").bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjzd/sjdxgl/viewthedata",
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            'svo.dxmcyw': dxmcyws,
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                    singleSelect: true,//设置为true 禁止多选
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 15, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    columns: header
                });
            }
        });
    }


</script>
