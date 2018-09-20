<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/11/14
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导入明细查询</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--Ztree--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>

                    <div class="widget-buttons">
                        <a href="#" data-toggle="maximize">
                            <i class="fa fa-expand"></i>
                        </a>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-minus"></i>
                        </a>
                        <a href="#" data-toggle="dispose">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="widget-body">

                    <table class="table">
                        <tr>
                            <td colspan="12">
                                <form id="editForm" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label"
                                               style="text-align: left;width: 2.5cm;">批次:</label>

                                        <div class="col-sm-2" style="width: 190px;">
                                            <input id="pc" align="left" type="text" class="form-control">
                                        </div>
                                        <label class="col-sm-2 control-label"
                                               style="text-align: left;width: 3cm;">导入时间:</label>

                                        <div class="col-sm-2" style="width: 190px;">
                                            <div id="drsj" style="width: 100%;"
                                                 class="input-group date form_date col-md-5" data-date=""
                                                 data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
                                                <input class="form-control" style="width: 100%;" type="text" value="">
                                                <span class="input-group-addon"><span
                                                        class="glyphicon glyphicon-calendar"></span></span>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="12" align="center">

                                <button type="button" class="btn btn-info" style="width: 2cm;"
                                        onclick="searchlist()">执行查询
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

                    <div class="widget-buttons">
                        <a href="#" data-toggle="maximize">
                            <i class="fa fa-expand"></i>
                        </a>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-minus"></i>
                        </a>
                        <a href="#" data-toggle="dispose">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                </div>
                <div class="widget-body">
                    <table id="table" data-height="549" data-pagination="true" data-show-refresh="true"
                           data-show-toggle="true" data-showColumns="true">

                    </table>

                </div>
            </div>
        </div>
    </div>

</div>

</div>
<%--(查看数据)模态框(Modal)--%>
<div class="modal fade" id="myview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    查看数据
                </h4>
            </div>
            <div class="modal-body">
                <%--查看数据(表)信息展示--%>
                <table id="viewtables" data-height="349">
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
<%--Select2--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--时间--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
<%--导出插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/tableExport.js"></script>
</html>
<script>
    $(function () {
        //初始化(数据对象管理)表格数据
        inittabs();
    });
    //(数据对象管理)初始化表格
    function inittabs(pcs, drsjs) {
        //先销毁表格
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
//            method: "post",//使用get请求到服务器获取数据
            url: "${pageContext.request.contextPath}/sjjh/drmxcx/drmxcxAll",//获取数据的Select地址
            //使用client分页方式，可以加载数据，可以导出【选中】
            //使用server分页方式，数据可以正常加载，但数据只能导出当前页所有的数据，不能导出选中
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            showRefresh: true, //刷新按钮
            showExport: true,//是否显示导出按钮
            search: true, //是否启用搜素
            showPaginationSwitch: true,
            queryParams: {
                'svo.pcdm': pcs,
                'svo.drsj': drsjs
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
            // uniqueIS: "pc_dm", //每一行的唯一标识，一般为主键列
            showToggle: "true", //切换视图
            showColumns: 'true', //是否显示内容列下拉框
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'
            }, {
                field: 'pcdm',
                align: 'center',
                title: '批次代码'
            }, {
                field: 'sjb',
                align: 'center',
                title: '表名'
            }, {
                field: 'drsj',
                align: 'center',
                title: '导入时间'
            }, {
                field: 'drsjl',
                align: 'center',
                title: '导入数据量'
            }, {
                field: 'drrmc',
                align: 'center',
                title: '导入人'
            }, {
                field: 'bmmc',
                align: 'center',
                title: '导入机关'
            }, {
                field: 'jbmc',
                align: 'center',
                title: '数据级别'
            }, {
                field: 'view',
                align: 'center',
                title: '操作',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<a style="color:#057afd; " onclick="myviewdata(\'' + row.sjb + '\')" >点击查看</a>';

                }
            }]

        });
    }
    //查找
    function searchlist() {
        //获取批次
        var pc = $("#pc").val();
        //获取导入时间起
        var drsj = $("#drsj").find("input").val();
        console.log("pc:", pc);
        console.log("drsj:", drsj);
        inittabs(pc, drsj);
    }
    //时间
    $('.form_date').datetimepicker({
        language: 'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });
    //查看数据
    function myviewdata(sjbs) {
        var sjb = sjbs;
        viewthedata(sjb);
    }
    //查看数据模态框(表)
    function viewthedata(sjbs) {
        $('#myview').modal('show');
        //先销毁表格
        $('#viewtables').bootstrapTable('destroy');
        //初始化表格，动态从服务器加载数据
        $('#viewtables').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/drmxcx/viewthedata",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求
            pagination: true, //是否分页
            queryParams: {
                'svo.sjb': sjbs
            },
            showExport: true,//是否显示导出按钮
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 5, //每页的记录行数
            pageList: [5, 10, 15, 20], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            columns: [{
                field: 'dwmc',
                align: 'center',
                title: '单位名称'

            }, {
                field: 'dwxz',
                align: 'center',
                title: '单位性质'

            }, {
                field: 'jfxs',
                align: 'center',
                title: '经费形式'
            }, {
                field: 'bzs',
                align: 'center',
                title: '编制数'
            }, {
                field: 'frdb',
                align: 'center',
                title: '法人代表'
            }, {
                field: 'address',
                align: 'center',
                title: '单位详细地址'
            }, {
                field: 'ssjc',
                align: 'center',
                title: '所属级次'
            }]
        });
    }

</script>
