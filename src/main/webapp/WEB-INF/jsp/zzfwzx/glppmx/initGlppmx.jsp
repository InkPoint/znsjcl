<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>关联匹配模型管理</title>
    <%@ include file="/common/global.jsp" %>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Font-awesome Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--Select2 styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <%--BootstrapValidator Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
</head>
<body>
<div class="page-body">
    <div id="condition" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">模型名称:</td>
                            <td><input id="mxmc" type="text" class="form-control" style="width: 180px;"></td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button type="button" class="btn btn-info" onclick="querys();">执行查询</button>
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
                    <div id="toolbar">
                        <a href="#">
                            <button id="add_mota" type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                    data-target="#adds">
                                <i class="glyphicon glyphicon-plus"></i>添加
                            </button>
                            &nbsp;
                        </a>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                    </div>
                    <table data-height="542" class="table table-striped" id="mytab" style="white-space: nowrap;"></table>
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
<%--BootstrapValidator--%>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
<%--Submit data Script--%>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
</html>
<script>
    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                querys();
            }
        });
        //初始化表格
        query("", "");
        //注册添加按钮单击事假
        $("#add_mota").click(function () {
            window.location.href = "${ctx}/zzfwzx/glppmx/addmx";
        });
    });

    function gohistory(){
        window.location.href="${ctx}/zzfwzxpage.jsp";
    }

    //查询
    function query(gzmc) {
        //先销毁表格
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            url: '${ctx}/zzfwzx/glppmx/list',
            queryParams: function (params) {
                return {
                    'svo.con_mxmc': gzmc,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            uniqueId: 'mxid',
            uniqueIS: "gzid", //每一行的唯一标识，一般为主键列
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
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
            ueryParamsType: 'limit',
            columns: [
                {
                    field: '',
                    align: 'center',
                    checkbox: true

                },
                {
                    field: 'mxmc',
                    align: 'left',
                    title: '模型名称',
                    halign:'center'
                }, {
                    field: 'ppx',
                    align: 'left',
                    title: '匹配项',
                    halign:'center'
                }, {
                    field: 'ppgzstr',
                    align: 'left',
                    title: '匹配规则',
                    halign:'center'
                }, {
                    field: 'ppsm',
                    align: 'left',
                    title: '匹配说明',
                    halign:'center'
                }, {
                    field: 'cjsj',
                    align: 'left',
                    title: '创建时间',
                    halign:'center'
                }
            ]
        });
    }
    //执行查询
    function querys() {
        var mxmc = $.trim($("#mxmc").val());
        $('#mytab').bootstrapTable("destroy");
        query(mxmc);
    }
    //删除数据
    function btn_delete() {
        var seldata = $('#mytab').bootstrapTable("getSelections");
        if (JSON.stringify(seldata) == "{}" || seldata == null || typeof(seldata) == "undefined" || seldata.length == 0) {
            alert("请选择一行！");
        } else {
            $.ajax({
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${ctx}/zzfwzx/glppmx/deletes",
                data: {'svo.mxid': seldata[0].mxid},
                type: 'post',
                dataType: 'json',
                success: function (msg) {
                    //刷新查询列表;
                    $('#mytab').bootstrapTable('remove', {field: 'mxid', values: [seldata[0].mxid]});
                }
            });
        }

    }
</script>
