<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/10/24
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>数据对象管理</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Select2 Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <style>
        /*Modal滚动条*/
        @media (min-width: 992px) {
            .modal-chat {
                width: 58.333%;
                height: 78.333%;
                overflow: scroll;
                overflow: auto;
                overflow: auto;
            }
        }

        /*Modal分割线*/
        .hr-line-dashed {
            border-top: 1px dashed #e7eaec;
            color: #fff;
            background-color: #fff;
            height: 1px;
            margin: 15px 0
        }

        .file-manager .hr-line-dashed {
            margin: 15px 0
        }
    </style>
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
                            <td style="vertical-align:middle;width: 3cm">数据分区:</td>
                            <td><select class="js-data-example-ajax" style="width: 150px;" id="sjfq">
                                <option></option>
                            </select></td>
                            <td style="vertical-align:middle;width: 3cm;">中文表名:</td>
                            <td><input id="bmzw" type="text" style="width: 150px;" class="form-control"></td>
                            <td style="vertical-align:middle;width: 3cm;">英文表名:</td>
                            <td><input id="bmyw" type="text" style="width: 150px;" class="form-control"></td>
                        </tr>
                        <tr>
                            <td colspan="12" align="center">
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="searchlist()">执行查询</button>
                                &nbsp;
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="gohistory()">返回</button>

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
                    <div id="toolbar">
                        <a href="${ctx}/sjzd/sjdxgl/initSjdxglAdd">
                            <button type="button" class="btn btn-success btn-sm"><i class="glyphicon glyphicon-plus"></i>添加</button>
                        </a>
                        <button type="button" class="btn btn-warning btn-sm" onclick="btn_edit()"><i class="glyphicon glyphicon-pencil" onclick="btn_edit()"></i>编辑</button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()"><i class="glyphicon glyphicon-remove"></i>删除</button>
                    </div>
                    <table id="taskList_table" data-height="604" class="table table-striped table-bordered table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="modal fade" id="viewdata" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">查看数据项</h4>
            </div>
            <div class="modal-body">
                <table id="table" class="table table-striped table-bordered table-hover" style="white-space: nowrap;" data-height="365"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">查看数据</h4>
            </div>
            <div class="modal-body">
                <table id="viewtables" data-height="396" class="table table-striped table-bordered table-hover" style="white-space: nowrap;"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
</html>
<script>
    //返回按钮
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjzdpage.jsp";
    }

    //(数据分区)下拉菜单
    var datas = [];
    var $table = $("#taskList_table");
    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                searchlist();
            }
        });
    });

    //查看数据项
    function viewdataitems(dxida) {
        var dxid = dxida;
        viewdata(dxid);
    }

    //查看数据
    function myviewdata(dxmcyws) {
        var dxmcyw = dxmcyws;
        viewthedata(dxmcyw);
    }

    $(function () {
        //初始化数据分区（下拉菜单）
        $.ajax({
            url: "${ctx}/sjzd/sjdxgl/getSjfqTree",
            dataType: 'json',
            success: function (datas) {
                $(".js-data-example-ajax").select2({
                    data: datas,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //初始化(数据对象管理)表格数据
        inittabs();
    });

    //Modal编辑
    function btn_edit() {
        //获取被选中的记录
        var rows = $('#taskList_table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要编辑的记录！");
            return;
        } else {
            window.location.href = "${ctx}/sjzd/sjdxgl/initSjdxglEdit?dxid=" + rows[0].dxid + "&" + "dxmcyw=" + rows[0].dxmcyw;
        }
    }

    //删除
    function btn_delete() {
        //获取被选中的记录
        var rows = $('#taskList_table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var ids = '';
        ids = rows[0].dxmcyw;
        deleteUser(ids);
    }

    function deleteUser(ids) {
        var msg = "你确定要删除吗？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            $.ajax({
                url: "${ctx}/sjzd/sjdxgl/deleteList",
                type: "post",
                data: {
                    'svo.dxmcyw': ids
                },
                success: function (data) {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        }
    }

    //(数据对象管理)初始化表
    function inittabs(sjfqcons, sjlys, dxmczws, dxmcyws, sjxmczws, sjxmcyws) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $table.bootstrapTable({
            url: "${ctx}/sjzd/sjdxgl/list",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.fqid': sjfqcons,
                    'svo.lyid': sjlys,
                    'svo.dxmczw': dxmczws,
                    'svo.dxmcyw': dxmcyws,
                    'svo.sjxmczw': sjxmczws,
                    'svo.sjxmcyw': sjxmcyws,
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
            uniqueIS: "dxid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'

            }, {
                field: 'dxmczw',
                align: 'left',
                title: '中文表名 ',
                halign: 'center'

            }, {
                field: 'dxmcyw',
                align: 'left',
                title: '英文表名',
                halign: 'center'
            }, {
                field: 'cjsj',
                align: 'center',
                title: '建表时间'
            }, {
                field: 'dxms',
                align: 'center',
                title: '表说明'
            }, {
                field: 'cz',
                align: 'center',
                title: '操作 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-link" data-toggle="modal" data-target="#viewdata" onclick="viewdataitems(\'' + row.dxid + '\')">查看字段</button>' +
                            '<button type="button" class="btn btn-link" onclick="formwork(\'' + row.dxmcyw + '\',\'' + row.dxmczw + '\')">生成模板</button>' +
                            '<button type="button" class="btn btn-link" onclick="myviewdata(\'' + row.dxmcyw + '\')">查看数据</button>';
                }
            }
            ]
        });

    }

    //导出数据
    function exportdata(dxmcyws) {
        var dxmcyw = dxmcyws;
        window.location.href = "${ctx}/sjzd/sjdxgl/exportData?svo.dxmcyw=" + dxmcyw;

    }

    //生成采集模板
    function formwork(dxmcyws, dxmczw) {
        var dxmcyw = dxmcyws;
        window.location.href = "${ctx}/sjzd/sjdxgl/formworkData?svo.dxmcyw=" + dxmcyw + "&filename=" + dxmczw;
    }

    //查找
    function searchlist() {
        //获取数据分区
        var sjfq = $("#sjfq").select2("data");
        var sjfqcon = "";
        if (sjfq != null && JSON.stringify(sjfq) != "{}" && typeof(sjfq) != "undefined" && sjfq.length > 0) {
            sjfqcon = sjfq[0].id;
        }
        //获取数据来源
        var sjly = "";
        //获取表名(中文)
        var dxmczw = $("#bmzw").val().trim();
        //获取表名(英文)
        var dxmcyw = $("#bmyw").val().trim();
        //获取数据项(中文)
        var sjxmczw = $("#sjxzw").val();
        //获取数据项(英文)
        var sjxmcyw = $("#sjxyw").val();

        inittabs(sjfqcon, sjly, dxmczw, dxmcyw, sjxmczw, sjxmcyw);
    }

    //查看数据项
    function viewdata(dxids) {
        $('#table').bootstrapTable('destroy');
        //初始化表格，动态从服务器加载数据
        $('#table').bootstrapTable({
            url: "${ctx}/sjzd/sjdxgl/sjxList",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(服务器端处理分页)
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    'svo.dxid': dxids,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sjxid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
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

    //查看数据
    function viewthedata(dxmcyws) {
        $('#myview').modal('show');
        //销毁表格
        $.ajax({
            url: "${ctx}/sjzd/sjdxgl/getheader",
            dataType: 'json',
            data: {'svo.dxmcyw': dxmcyws},
            success: function (header) {
                $("#viewtables").bootstrapTable('destroy');
                $("#viewtables").bootstrapTable({
                    url: "${ctx}/sjzd/sjdxgl/viewthedata",
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
                    pageSize: 10, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    columns: header
                });
            }
        });
    }
</script>
