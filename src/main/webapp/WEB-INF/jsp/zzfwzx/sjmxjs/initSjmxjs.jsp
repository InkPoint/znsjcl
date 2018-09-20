<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/4/20
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据模型检索</title>
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
    <script>
        function gobacks() {
            $(window.parent.goMenuPage());
        }
    </script>
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
                            <td style="vertical-align:middle;width: 2cm; ">模型名称:</td>
                            <td style="width: 22cm;"><input id="mxmc" type="text" style="width: 150px;"
                                                            class="form-control"></td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button type="button" class="btn btn-info" onclick="searchlist()">执行查询</button>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <table id="table" data-toggle="table" data-toolbar="#toolbar" class="table table-striped table-bordered table-hover">
                    </table>
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
<!--TreeSelect 树形选择框-->
<script src="${pageContext.request.contextPath}/public/css/TreeSelect/scripts/boot.js" type="text/javascript"></script>
</html>
<script>
    var datas = [];
    $(function () {
        inittabs();
    });
    function inittabs(mxmc) {
        //先销毁表格
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
            url: "${pageContext.request.contextPath}/zzfwzx/sjmxjs/list",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: {
                'svo.mxmc': mxmc
            },
            pagination: true, //是否分页
            singleSelect: true,//设置为true禁止多选
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,//设置为true只显示总数据数，而不显示分页按钮
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "swjg_dm", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'

            }, {
                field: 'mxmc',
                align: 'center',
                title: '模型名称 '
            }, {
                field: 'mxms',
                align: 'center',
                title: '模型描述 '
            }, {
                field: 'sjyj',
                align: 'center',
                title: '数据元件'

            }, {
                field: 'zdygs',
                align: 'center',
                title: '自定义分析公式 '
            }, {
                field: 'fxjg',
                align: 'center',
                title: '分析结果'
            }, {
                field: 'cjsj',
                align: 'center',
                title: '创建时间'

            }]
        });
    }
    //查找事件
    function searchlist() {
        //获取模型名称
        var mxmc = $("#mxmc").val();
        inittabs(mxmc);
    }
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/zzfwzxpage.jsp";
    }
</script>
