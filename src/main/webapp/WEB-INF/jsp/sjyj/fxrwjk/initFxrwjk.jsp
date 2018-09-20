<%--
  Created by IntelliJ IDEA.
  User: CuiHeng
  Date: 2017/12/5
  Time: 10:43
  The modifier: PengWen Wang
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分析任务监控</title>
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
</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width: 2cm">任务名称:</td>
                            <td style="width: 22cm;">
                                <input id="rwmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width:2cm;">返回</button>
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
                    <%--Modify time:2018/4/23--%>
                    <table id="taskList_table" class="table table-striped table-bordered table-hover" data-height="570"  style="white-space: nowrap;"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Add Time:2018/4/23--%>
<div class="modal fade" id="viewnumber" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1100px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">查看</h4>
            </div>
            <div class="modal-body">
                <table id="viewtables" class="table table-striped table-bordered table-hover" data-height="510"
                       style="white-space: nowrap;"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<%--End the add--%>
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
</html>
<script type="text/javascript">

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjyjpage.jsp";
    }

    <%--The new time 2018/4/28--%>
    $(function () {
        inittabs();
        $("#rwmc").focus();
        $(document).keydown(function (event) {
            var myfocus = document.actionElement;
            if (document.getElementById("rwmc").contains(myfocus)) return;
            if (event.keyCode == 13) {
                searchlist();
            }
        });
    });

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

    function inittabs(rwmcs) {
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/fxrwjk/selectList",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            //Modify the time 2018/5/7
            queryParams: function (params) {
                return {
                    'svo.rwmc': rwmcs,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "nsrmc", //每一行的唯一标识，一般为主键列
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
                    field: 'rwmc',
                    align: 'center',
                    title: '任务名称'
                }, {
                    field: 'rwms',
                    align: 'center',
                    title: '任务描述'
                }, {
                    field: 'mxmc',
                    align: 'center',
                    title: '模型'
                }, {
                    field: 'zxsj',
                    align: 'center',
                    title: '创建时间'
                }, {//Modify the time 2018/5/7
                    field: 'yxzt',
                    align: 'center',
                    title: '运行状态'
                }, {//Add Time:2018/4/23
                    field: 'cz',
                    align: 'center',
                    title: '操作 ',
                    sortatable: true,
                    formatter: function (value, row, index) {
                        return '<button style="font-size: 16px" type="button" class="btn btn-link" data-toggle="modal" data-target="#viewnumber" >查看</button>'
                    }
                }
            ]
        });
    }

    function searchlist(){
        //获取纳税人名称
        var rwmc = $("#rwmc").val();
        inittabs(rwmc);
    }
</script>