<%--
  Created by IntelliJ IDEA.
  User: 崔衡
  Date: 2018/4/12
  Time: 10:42
   自助服务中心- 处理任务运行监控
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>处理任务运行监控</title>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>
    <html>
    <head>
        <title>处理任务运行监控</title>
        <meta name="description" content="simple and responsive tables"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
        <!--Bootstrap Styles-->
        <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
        <%--Bootstrap-table Styles--%>
        <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
        <%--Font-awesome Styles--%>
        <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
        <!--Beyond Styles-->
        <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    </head>
    <body>
    <div class="page-body">
        <div class="row">
            <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
                <div class="widget">
                    <div class="widget-header bg-blue">
                        <span class="widget-caption">查询条件</span>
                    </div>
                    <div class="widget-body">
                        <table class="table">
                            <tr>
                                <td colspan="12">
                                    <form method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-1 control-label"
                                                   style="text-align: left;width: 2.5cm;">任务编号:</label>

                                            <div class="col-sm-2" style="width: 190px;">
                                                <input id="rwbh" align="left" type="text" class="form-control">
                                            </div>
                                            <label class="col-sm-1 control-label" style="text-align: left;width: 2.5cm;">任务名称:</label>

                                            <div class="col-sm-2" style="width: 190px;">
                                                <input id="rwmc" align="left" type="text" class="form-control">
                                            </div>
                                        </div>
                                    </form>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="12" align="center">
                                    <button type="button" class="btn btn-info" style="width: 2cm;" onclick="querys()">
                                        执行查询
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
                        <table id="mytab" class="table table-striped table-bordered table-hover" data-height="530"
                               style="white-space: nowrap;"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--View the data--%>
    <div class="modal fade" id="myview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 1100px;">
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
                    <div id="prompt" style="color: #0000cc">
                        温馨提示: 行背景色为白色 代表已匹配数据，为红色 代表未匹配数据。
                    </div>
                    <div id="toolbar">
                        <button type="button" class="btn btn-default btn-sm" onclick="thematched()">已匹配</button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="didnotmatch()">未匹配</button>
                    </div>
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
    <%--End view the data--%>
    </body>
    <!--Basic Scripts-->
    <script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
    <%--Bootstrap Scripts--%>
    <script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
    <%--Bootstrap-table Scripts--%>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
    <%--Export Scripts--%>
    <script src="${ctx}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-develop/tableExport.js"></script>
    </html>
    <script>
        var yb = "";
        $(function () {
            $(document).keydown(function (event) {
                if (event.keyCode == 13) {
                    querys();
                }
            });
            inittabs();
        });
        //默认加载表
        function inittabs(rwbhs, rwmcs) {
            $('#mytab').bootstrapTable('destroy');
            $('#mytab').bootstrapTable({
                url: "${pageContext.request.contextPath}/zzfwzx/clrwyxjk/selectAll",//获取数据的Select地址
                sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
                queryParams: function (params) {
                    return {
                        'svo.rwid': rwbhs,
                        'svo.rwmc': rwmcs,
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
                cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                pageList: [10, 25, 50, 100, 'All'], //可供选择的每页行数
                paginationLoop: true,//设置为true启用分页条无线循环的功能
                clickToSelect: true, //是否启用点击选中行
                ueryParamsType: 'limit',
                columns: [{
                    field: 'select',
                    checkbox: true,
                    align: 'center',
                    valign: 'middle'
                },
                    {
                        field: 'rwid',
                        align: 'center',
                        title: '任务编号'
                    }, {
                        field: 'rwmc',
                        align: 'left',
                        title: '任务名称'
                    }, {
                        field: 'ytable',
                        align: 'left',
                        title: '源表'
                    }, {
                        field: 'zxsj',
                        align: 'center',
                        title: '执行时间'
                    }, {
                        field: 'clmx',
                        align: 'center',
                        title: '任务类型'
                    }, {
                        field: 'yxzt',
                        align: 'center',
                        title: '运行状态'
                    }, {
                        field: 'operation',
                        align: 'center',
                        title: '操作',
                        formatter: function (value, row, index) {
                            return '<button type="button" class="btn btn-info btn-sm" onclick="myviewdata(\'' + row.ytable + '\',\'' + row.yxzt + '\',\'' + row.clmx + '\')">查看</button>';
                        }
                    }
                ]
            });

        }
        //执行查询
        function querys() {
            //获取任务编号
            var rwbh = $("#rwbh").val().trim();
            //获取任务名称
            var rwmc = $("#rwmc").val().trim();
            inittabs(rwbh, rwmc);
        }
        //查看数据
        function myviewdata(ytable, yxzt, clmx) {
            var ytables = ytable;
            //运行状态
            var yxzt = yxzt;
            //任务类型
            var tasktype = clmx;
            if (yxzt == ("未运行")) {
                alert("该任务尚未运行，暂无数据！");
                return false;
            }
            if (yxzt == ("执行失败")) {
                alert("该任务未执行成功，暂无数据！");
                return false;
            }
            if (tasktype == "清洗模型") {
                ytable = ytable + "_qx";
                viewcleaningdata(ytable);
                //工具栏
                $("#toolbar").hide();
                //提示语
                $("#prompt").hide();
                return false;
            }
            $("#prompt").show();
            $("#toolbar").show();
            viewthedata(ytables);
        }
        function viewthedata(ytables) {
            yb = ytables;
            if (ytables == "undefined") {
                alert("该任务暂无数据！");
                return;
            }
            $('#myview').modal('show');
            $.ajax({
                url: "${ctx}/zzfwzx/clrwyxjk/getheader",
                dataType: 'json',
                data: {'svo.dxmcyw': ytables},
                success: function (header) {
                    for (var i in header)
                        $("#viewtables").bootstrapTable('destroy');
                    $("#viewtables").bootstrapTable({
                        url: "${ctx}/zzfwzx/clrwyxjk/viewthedata?svo.dxmcyw=" + yb,
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
                        pageList: [10, 25, 50, 100, 'All'], //可供选择的每页行数
                        clickToSelect: true, //是否启用点击选中行
                        cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                        undefinedText: '-',//当数据为undefined时显示的字符
                        columns: header,
                        toolbar: '#toolbar',
                        rowStyle: function (value, row, index) {
                            var strjson = JSON.stringify(header[1]);
                            if (strjson.indexOf("DJXH1") != -1) {
                                if (value.DJXH1 == undefined) {
                                    return {css: {"background-color": "#FFE4E1"}}
                                } else {
                                    return {css: {"background-color": ""}}
                                }
                                return false;
                            }
                            if (value.DJXH == undefined) {
                                return {css: {"background-color": "#FFE4E1"}}
                            } else {
                                return {css: {"background-color": ""}}
                            }
                        }
                    });
                }
            });
        }
        //查看已清洗数据
        function viewcleaningdata(ytables) {
            var yb = ytables;
            if (ytables == "undefined") {
                alert("该任务暂无数据！");
                return;
            }
            $('#myview').modal('show');
            $.ajax({
                url: "${ctx}/zzfwzx/clrwyxjk/getheader",
                dataType: 'json',
                data: {'svo.dxmcyw': ytables},
                success: function (header) {
                    for (var i in header)
                        $("#viewtables").bootstrapTable('destroy');
                    $("#viewtables").bootstrapTable({
                        url: "${ctx}/zzfwzx/clrwyxjk/viewthedata?svo.dxmcyw=" + yb,
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
                        pageList: [10, 25, 50, 100, 'All'], //可供选择的每页行数
                        clickToSelect: true, //是否启用点击选中行
                        cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                        undefinedText: '-',//当数据为undefined时显示的字符
                        columns: header
                    });
                }
            });
        }



        //查看已匹配数据
        function thematched() {
            $.ajax({
                url: "${ctx}/zzfwzx/clrwyxjk/getheader",
                dataType: 'json',
                data: {'svo.dxmcyw': yb},
                success: function (header) {
                    for (var i in header)
                        $("#viewtables").bootstrapTable('destroy');
                    $("#viewtables").bootstrapTable({
                        url: "${ctx}/zzfwzx/clrwyxjk/thematched",
                        sidePagination: "server",//表示服务端请求
                        pagination: true, //是否分页
                        showExport: true,//是否显示导出按钮
                        queryParams: function (params) {
                            return {
                                'svo.dxmcyw': yb,
                                offset: (params.offset / params.limit) + 1,
                                limit: params.limit
                            }
                        },
                        queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                        singleSelect: true,//设置为true 禁止多选
                        pageNumber: 1, //初始化加载第一页，默认第一页
                        buttonsAlign: 'right', //按钮对齐方式
                        pageSize: 10, //每页的记录行数
                        pageList: [10, 25, 50, 100, 'All'], //可供选择的每页行数
                        clickToSelect: true, //是否启用点击选中行
                        cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                        undefinedText: '-',//当数据为undefined时显示的字符
                        columns: header,
                        toolbar: '#toolbar'
                    });
                }
            });
        }
        //查看未匹配数据
        function didnotmatch() {
            $.ajax({
                url: "${ctx}/zzfwzx/clrwyxjk/getheader",
                dataType: 'json',
                data: {'svo.dxmcyw': yb},
                success: function (header) {
                    for (var i in header)
                        $("#viewtables").bootstrapTable('destroy');
                    $("#viewtables").bootstrapTable({
                        url: "${ctx}/zzfwzx/clrwyxjk/didNotMatch",
                        sidePagination: "server",//表示服务端请求
                        pagination: true, //是否分页
                        showExport: true,//是否显示导出按钮
                        queryParams: function (params) {
                            return {
                                'svo.dxmcyw': yb,
                                offset: (params.offset / params.limit) + 1,
                                limit: params.limit
                            }
                        },
                        queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                        singleSelect: true,//设置为true 禁止多选
                        pageNumber: 1, //初始化加载第一页，默认第一页
                        buttonsAlign: 'right', //按钮对齐方式
                        pageSize: 10, //每页的记录行数
                        pageList: [10, 25, 50, 100, 'All'], //可供选择的每页行数
                        clickToSelect: true, //是否启用点击选中行
                        cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                        undefinedText: '-',//当数据为undefined时显示的字符
                        columns: header,
                        toolbar: '#toolbar'
                    });
                }
            });
        }

        function gohistory(){
            window.location.href="${ctx}/zzfwzxpage.jsp";
        }
    </script>
