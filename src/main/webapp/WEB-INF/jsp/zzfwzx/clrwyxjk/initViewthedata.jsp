<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/4/12
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看数据</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
</head>
<body>
<!-- Page Body -->
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button type="button" class="btn btn-default" onclick="javascript:history.go(-1)">
                            返回
                        </button>
                        &nbsp;
                    </div>
                    <table id="mytab" data-height="542"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--(查看数据)模态框(Modal)--%>
<div class="modal fade" id="myview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
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
                <%--数据项(表)信息展示--%>
                <table id="viewtables" data-height="296">
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>

        </div>
    </div>

</div>
<%--end (查看数据)模态框--%>
</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
</html>
<script>
    <!--表数据-->
    $('#mytab').bootstrapTable({
        pagination: true, //是否分页
        singleSelect: true,
        pageNumber: 1, //初始化加载第一页，默认第一页
        buttonsAlign: 'right', //按钮的位置
        pageSize: 10, //每页的记录行数
        pageList: [10, 20, 30, 50], //可供选择的每页行数
        onlyInfoPagination: false,
        toolbar: '#toolbar',
        paginationLoop: true,
        clickToSelect: true, //是否启用点击选中行
        columns: [{
            field: 'select',
            checkbox: true,
            width: 40,
            align: 'center',
            valign: 'middle'
        },
            {
                field: 'gqb',
                align: 'center',
                title: '股权表',
                formatter: function (value, row, index) {
                    return '<a style="color:#057afd;" href="javascript:void(0);" onclick="equity()">' + value + '</a>'
                }
            }, {
                field: 'fcb',
                align: 'center',
                title: '房产表',
                formatter: function (value, row, index) {
                    return '<a style="color:#057afd;" href="javascript:void(0);" onclick="reatestate()">' + value + '</a>'
                }
            }
        ],
        data: [{
            gqb: 'tb_gqbg_source',
            fcb: 'tb_gqbg_init '
        }]
    });
    //股权表
    function equity() {
        $('#myview').modal('show');
        //先销毁表格
        $('#viewtables').bootstrapTable('destroy');
        //初始化表格，动态从服务器加载数据
        $('#viewtables').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjzd/sjdxgl/sjxList",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 5, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            uniqueId: 'sjxid',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sjxid", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'id',
                checkbox: true,
                align: 'center'
            }, {
                field: 'sjxmczw',
                align: 'center',
                title: '数据项中文名'
            }, {
                field: 'sjxmcyw',
                align: 'center',
                title: '数据项英文名'
            }, {
                field: 'sjxlx',
                align: 'center',
                title: '字段类型 '
            }, {
                field: 'isnulls',
                align: 'center',
                title: '是否为空'
            }, {
                field: 'iskey',
                align: 'center',
                title: '是否主键 '
            }]
        });
    }
    //房产表
    function reatestate() {
        $('#myview').modal('show');
        //先销毁表格
        $('#viewtables').bootstrapTable('destroy');
        //初始化表格，动态从服务器加载数据
        $('#viewtables').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjzd/sjdxgl/sjxList",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 5, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            uniqueId: 'sjxid',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sjxid", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'id',
                checkbox: true,
                align: 'center'
            }, {
                field: 'sjxmczw',
                align: 'center',
                title: '数据项中文名'
            }, {
                field: 'sjxmcyw',
                align: 'center',
                title: '数据项英文名'
            }, {
                field: 'sjxlx',
                align: 'center',
                title: '字段类型 '
            }, {
                field: 'isnulls',
                align: 'center',
                title: '是否为空'
            }, {
                field: 'iskey',
                align: 'center',
                title: '是否主键 '
            }]
        });
    }
</script>