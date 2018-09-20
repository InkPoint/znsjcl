<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/8/14
  Time: 15:13
  养老封皮
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>养老封皮</title>
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
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
</head>
<body>
<div class="page-body" id="bxx">

    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">


                        <button type="button" class="btn btn-info btn-sm" onclick="fh()">
                            <i></i>
                            返回
                        </button>

                        <button type="button" class="btn btn-info btn-sm" onclick="wjdc()">
                            <i></i>
                            文件导出
                        </button>
                    </div>
                    <%--<table id="mytab" class="table-striped" data-height="400"></table>--%>
                </div>
                <div class="widget-body">
                    <table id="taskList_table" class="table table-striped table-bordered table-hover"
                           style="white-space: nowrap" data-height="700"></table>
                </div>
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
<%--时间--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>

<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script type="text/javascript">

    //初始化
    $(function () {
        <%--csid         = ${param.csid};--%>
        //初始化表格
        inittabs();
    });


    function inittabs() {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjg/ylfp/selectAll",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 30, //每页的记录行数
            pageList: [50, 100, 200, 500], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "nsrmc", //每一行的唯一标识，一般为主键列
            sidePagination: 'server',
            columns: [
                [
                    {
                        "title": "西安市税务局养老保险费税务入库明细表集中传递",
                        "halign": "center",
                        "align": "center",
                        "colspan": 11,
                        "font-size":30
                    },
                ], [
                    {
                        field: 'ZGSBJG',
                        align: 'center',
                        title: ''
                    }, {
                        field: 'DWJFJS',
                        align: 'center',
                        title: '单位缴费基数'
                    }, {
                        field: 'GRJFJS',
                        align: 'center',
                        title: '个人缴费基数'
                    }, {
                        field: 'JFRS',
                        align: 'center',
                        title: '缴费人数'
                    }, {
                        field: 'DWSJJE',
                        align: 'center',
                        title: '单位实缴金额'
                    }, {
                        field: 'GRSJJE',
                        align: 'center',
                        title: '个人实缴金额'
                    }, {
                        field: 'ZNJ',
                        align: 'center',
                        title: '滞纳金'
                    }, {
                        field: 'QT',
                        align: 'center',
                        title: '其它（个人缴费）'
                    }, {
                        field: 'FK',
                        align: 'center',
                        title: '罚款'
                    }, {
                        field: 'LX',
                        align: 'center',
                        title: '利息'
                    }, {
                        field: 'RKE',
                        align: 'center',
                        title: '入库额'
                    }
                ]


            ]
        });
    }



    //文件导出
    function wjdc(){
        window.location.href = "${pageContext.request.contextPath}/sjjg/ylfp/sjdc"
    }

    //返回
    function fh() {
        window.location.href = "${pageContext.request.contextPath}/sjjg/ylxxcx/initYl"
    }

  </script>