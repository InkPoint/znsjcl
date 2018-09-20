<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/11/10
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>任务进度监控</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <%--Bootstrap Styles--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.min.css">
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
</head>
<body>
<div class="page-body" id="bxx">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width: 3cm">申请标题:</td>
                            <td style="width: 12cm;">
                                <input id="rwmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
                                <button onclick="javascript:window.history.back(-1)" type="button" style="width: 2cm"
                                        class="btn btn-info">返回
                                </button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <table id="taskList_table" class="table table-striped table-bordered table-hover"
                           data-height="580"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--任务信息模态框--%>
<%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">--%>
    <%--<div class="modal-dialog" style="width: 60%;height: 40% ">--%>
        <%--<div class="modal-content">--%>
            <%--<div class="modal-header">--%>
                <%--<button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
                    <%--&times;--%>
                <%--</button>--%>
                <%--<h4 class="modal-title">--%>
                    <%--任务信息--%>
                <%--</h4>--%>
            <%--</div>--%>
            <%--<div class="modal-body">--%>
                <%--<table style="white-space: nowrap" class="table table-striped table-bordered table-hover" id="taskList" data-height="300"></table>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>


<%--任务信息跳转页面--%>
<div class="page-body" id="rwxx" style="display: none">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <div style="margin-right: 98%;padding-top: 4px;padding-bottom: 3px" >
                        <button onclick="xsModel1()" type="button" class="btn btn-info btn-block"
                                style="width: 2cm; ">返回
                        </button>
                    </div>
                </div>
                <div class="widget-body">
                    <%--数据项(表)信息展示--%>
                        <table style="white-space: nowrap" class="table table-striped table-bordered table-hover" id="taskList" data-height="680"></table>
                    </table>
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
                    <div style="margin-right: 98%;padding-top: 4px;padding-bottom: 3px" >
                        <button onclick="xsModel()" type="button" class="btn btn-info btn-block"
                                style="width: 2cm; ">返回
                        </button>
                    </div>
                </div>
                <div class="widget-body">
                    <%--数据项(表)信息展示--%>
                    <table id="viewtables" data-height="680" style="white-space: nowrap" class="table table-striped table-bordered table-hover"  >
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>


</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/assets/assets/js/jquery-1.11.1.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${pageContext.request.contextPath}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-zh-CN.js"></script>
</html>
<script type="text/javascript">
    $(function () {
        $(document).keydown(function (evevt) {
            if (evevt.keyCode == 13) {
                searchlist();
            }
        });
        //初始化表格
        inittabs();
    });
    function inittabs(rwmcs) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/rwjdjk/rwjdjkAll",
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 8, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            queryParams: function (params) {
                return {
                    'svo.rwmc': rwmcs,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center'
            },
                {
                    field: 'rwmc',
                    align: 'center',
                    title: '申请标题'
                }, {
                    field: 'rwsm',
                    align: 'center',
                    title: '申请描述'
                }, {
                    field: 'cjsj',
                    align: 'center',
                    title: '申请时间'
                }, {
                    field: 'jzrq',
                    align: 'center',
                    title: '截止日期'
                }, {
                    field: 'name',
                    align: 'center',
                    title: '申请人'
                }, {
                    field: 'bz',
                    align: 'center',
                    title: '备注'
                },
//                {
//                    field: 'shzt',
//                    align: 'center',
//                    title: '审核状态 ',
//                    formatter: function (value, row, index) {
//                        if (value == 0) {
//                            return '未审核'
//                        } else if (value == 1) {
//                            return '审核通过'
//                        } else {
//                            return '审核不通过'
//                        }
//
//                    }
//                },
                {
                    field: 'wcjd',
                    align: 'center',
                    title: '完成进度',
                    formatter: function (value, row, index) {
                        var res = parseInt(row.wcjd);
                        if (value == undefined) {
                            value = 0;
                        } else {
                            return ["<div class='progress progress-striped active'><div class='progress-bar progress-bar-info' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100'style='width:" + res.toFixed(2) + "% '>" + res.toFixed(0) + "%" + "</div></div>"];
                        }


                    }
                }, {
                    field: '',
                    align: 'center',
                    title: '导入信息查看',
                    formatter: function (value, row, index) {
                        return '[<a style="color:#057afd;" href="javascript:void(0);" onclick="myviewdata(\'' + row.rwid + '\')">查看信息</a>]';

                    }
                }
            ]
        });
    }
    //查询
    function searchlist() {
        //获取模型名称
        var rwmc = $("#rwmc").val();
        inittabs(rwmc);
    }


    function myviewdata(rwid) {
//        $("#myModal").modal("show");
        $('#bxx').hide();
        $('#rwxx').show();




        //表信息查询
        $('#taskList').bootstrapTable('destroy');
        $('#taskList').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/rwjdjk/selectRwxx",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 15, //每页的记录行数
//            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            ueryParamsType: 'limit',
            toolbar: '#tool',
            queryParams: function (params) {
                return {
                    'svo.rwid': rwid,
                    pageSize: params.limit,
                    pageNumber: params.pageNumber,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sqid", //每一行的唯一标识，一般为主键列
//            showToggle: "true", //切换视图
//            showColumns: 'true', //是否显示内容列下拉框
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                width: 40,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'ywmc',
                    align: 'center',
                    title: '表名称（英文）'
                },
                {
                    field: 'zwmc',
                    align: 'center',
                    title: '表名称（中文）'
                }, {
                    field: 'bz',
                    align: 'center',
                    title: '表数据量 '
                },

                {
                    field: '',
                    align: 'center',
                    title: '导入数据查看',
                    formatter: function (value, row, index) {
                        return '[<a style="color:#057afd;" href="javascript:void(0);" onclick="myviewdata1(\'' + row.ywmc + '\')">查看数据</a>]';

                    }
                }
            ]

        });


    }


    //查看上传文件数据
    function myviewdata1(ywmc) {
        var dxmcyw = ywmc;

        viewthedata(dxmcyw);
    }

    //查看数据
    function viewthedata(dxmcyws) {
        $('#bxx').hide();
        $('#rwxx').hide();
        $('#sjxx').show();
//        $("#myModal").modal("hide");



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


    function xsModel() {
        $('#bxx').hide();
        $('#sjxx').hide();
        $('#rwxx').show();
    }

    function xsModel1(){
        $('#bxx').show();
        $('#sjxx').hide();
        $('#rwxx').hide();
    }

</script>
