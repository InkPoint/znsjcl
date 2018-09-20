<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/11/13
  Time: 16:34
  数据对象监控
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据对象监控</title>
</head>
<meta name="description" content="simple and responsive tables"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
<!--Basic Styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
<link rel="stylesheet"
      href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
<!--Beyond styles-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
<%--Select2--%>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
<script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
<!--跳转页操作区域背景-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
<script>
    function gobacks() {
        $(window.parent.goMenuPage());
    }
</script>
</head>
<body>


<div class="page-body" id="bsl" style="height:500px ">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-body">

                    <div style="color: #0000cc">
                        未知表数量：直接在数据库中创建的表，未经过数据对象创建<br>
                        异常表数量：数据库中的表与数据对象中的表，表名称一致，数据项不一致<br>
                        未经管理表数量：未知表数量+异常表数量
                    </div>
                    <tr >
                        <td colspan="12" align="center">

                            <button onclick="gohistory()" type="button" style="width: 2cm"
                                    class="btn btn-info btn-sm">返回
                            </button>
                        </td>
                    </tr>
                    <table id="table" data-toggle="table" data-toolbar="#toolbar"
                           class="table table-striped table-bordered table-hover"></table>

                </div>
            </div>
        </div>
    </div>
</div>

<div class="page-body" id="tableinfo" style="display:none;height: 600px">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div style="margin-right: 98%;padding-bottom: 3px">
                    <button onclick="xsModel()" type="button" class="btn btn-info btn-block"
                            style="width: 2cm; margin-left: 48%; ">返回
                    </button>
                </div>
                <div class="col-lg-6 col-sm-6 col-xs-6 col-md-6">
                    <div class="widget-header ">
                        <span class="widget-caption" style="font-size: 20px">数据对象信息</span>
                    </div>
                    <div class="widget-body" style="height: 560px">
                        <table class="table table-striped table-bordered table-hover" id="taskList"
                               data-height="550"
                               style="cursor: hand"></table>
                    </div>
                </div>

                <div class="col-lg-6 col-sm-6 col-xs-6 col-md-6">
                    <div class="widget-header ">
                        <span class="widget-caption" style="font-size: 20px">数据项明细</span>
                    </div>
                    <div class="widget-body" style="height: 560px">
                        <table class="table table-striped table-bordered table-hover" id="newtaskList"
                               data-height="550" style="cursor: hand"></table>
                    </div>
                </div>
                &nbsp;
            </div>
        </div>
    </div>
</div>


</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<%--Select2--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
</html>
<script>

    //返回
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjzdpage.jsp";
    }

    //关闭模态框显示主页面
    function xsModel() {
        $('#bsl').show();
        $('#tableinfo').hide();
    }

    //保存当前行数据
    var dqhsj = new Array();
    //(数据分区)下拉菜单
    var datas = [];
    $(function () {
        inittabs();


    });
    function inittabs() {
        //先销毁表格
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjzd/sjdxjk/selectlist",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            pagination: true, //是否分页
            singleSelect: true,//设置为true禁止多选
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            queryParams: function (params) {
                return {
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,//设置为true只显示总数据数，而不显示分页按钮
            toolbar: '#toolbar',
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "jbid", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'
            }, {
                field: 'fqmc',
                align: 'center',
                title: '分区名称'
            }, {
                field: 'wjgl',
                align: 'center',
                title: '未经管理表数量',
                formatter: function (value, row, index) {
                    return '<a style="color:red; cursor:hand;"  onclick="ysxx(\' 1 \',\'' + row.fqid + '\')">' + value + '</a>';
                }
            }, {
                field: 'wzbsl',
                align: 'center',
                title: '未知表数量',
                formatter: function (value, row, index) {
                    if (value != 0) {
                        return '<a style="color:red; cursor:hand;" onclick="ysxx(\' 2 \',\'' + row.fqid + '\')">' + value + '</a>';
                    } else {
                        return 0;
                    }
                }
            }, {
                field: 'ycbsl',
                align: 'center',
                title: '异常表数量',
                formatter: function (value, row, index) {
                    if (value != 0) {
                        return '<a style="color:red; cursor:hand;" onclick="ysxx(\' 3 \',\'' + row.fqid + '\')">' + value + '</a>';
                    } else {
                        return 0;
                    }
                }
            }]
        });
    }
    function ysxx(type, fqid) {

        $('#bsl').hide();
        $('#tableinfo').show();


        if (fqid == "未知分区") {
            fqid = "";
        }
        //表信息查询
        $('#taskList').bootstrapTable('destroy');
        $('#taskList').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjzd/sjdxjk/selectBxx",
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 1000, //每页的记录行数
            onlyInfoPagination: false,
            queryParams: function (params) {
                return {
                    'svo.bs': type,
                    'svo.fqid': fqid,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            ueryParamsType: 'limit',
            toolbar: '#tool',
            useCurrentPage: true,
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sqid", //每一行的唯一标识，一般为主键列
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                width: 40,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'tablename',
                    align: 'center',
                    title: '表名称（英文）'
                },
                {
                    field: 'comments',
                    align: 'center',
                    title: '表名称（中文）'
                }, {
                    field: 'tabletype',
                    align: 'center',
                    title: '表类型 '
                }
            ],
            onCheck: function (rows) {
                //数据项信息查询
                $('#newtaskList').bootstrapTable('destroy');
                $('#newtaskList').bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjzd/sjdxjk/selectSjx",
                    pagination: true, //是否分页
                    singleSelect: true,
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 100, //每页的记录行数
                    onlyInfoPagination: false,
                    toolbar: '#tool',
                    queryParams: function (params) {
                        return {
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },

                    ueryParamsType: 'limit',
                    paginationLoop: true,
                    clickToSelect: true, //是否启用点击选中行
                    uniqueIS: "sqid", //每一行的唯一标识，一般为主键列
                    sidePagination: 'server',
                    columns: [{
                        field: 'select',
                        checkbox: true,
                        width: 40,
                        align: 'center',
                        valign: 'middle'
                    },
                        {
                            field: 'columnname',
                            align: 'center',
                            title: '数据项名称（英文）'
                        }, {
                            field: 'djxh',
                            align: 'center',
                            title: '数据项名称（中文）'
                        }, {
                            field: 'datatype',
                            align: 'center',
                            title: '数据项类型 '
                        }
                    ],
                    queryParams: {
                        'svo.tablename': rows.tablename
                    }

                });
            }
        });
    }

</script>

