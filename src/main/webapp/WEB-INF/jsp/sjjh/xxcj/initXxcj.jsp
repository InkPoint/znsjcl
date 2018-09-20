<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2018/3/24
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>信息采集</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--Select2 Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <!--bootstrap-datetimepicker Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
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
                            <td style="vertical-align:middle;width: 3.5cm;">纳税人识别号:</td>
                            <td style="width: 200px"><input id="nsrsbh" type="text" style="width: 150px;" class="form-control"></td>

                            <td style="vertical-align:middle;width: 3cm;">纳税人名称:</td>
                            <td><input id="nsrmc" type="text" style="width: 150px;" class="form-control"></td>
                        </tr>
                        <tr>
                            <td colspan="12" align="center">
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="searchlist()">执行查询</button>
                                &nbsp;
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
                    <div id="toolbar">
                        <a href="${ctx}/sjjh/xxcj/initXxcjAdd">
                            <button type="button" class="btn btn-success btn-sm"><i class="glyphicon glyphicon-plus"></i>添加</button>
                        </a>
                        <button type="button" class="btn btn-warning btn-sm" onclick="btn_edit()"><i
                                class="glyphicon glyphicon-pencil" onclick="btn_edit()"></i>编辑
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()"><i
                                class="glyphicon glyphicon-remove"></i>删除
                        </button>
                    </div>
                    <table id="taskList_table" data-height="604"
                           class="table table-striped table-bordered table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="modal fade" id="myview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1200px;height: 450px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">查看</h4>
            </div>
            <div class="modal-body">
                <div id="condition" class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-body">
                                <form id="tablevalidation" method="post" class="form-horizontal">
                                    <table class="table">
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">水行政主管部门:</label>
                                                    <input type="text" id="shzzgb" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">取水所属期起:</label>
                                                    <div id="qsssqq" style="width:92%;"
                                                         class="input-group date form_date"
                                                         data-date-format="yyyy/mm/dd"
                                                         data-link-format="yyyy/mm/dd">
                                                        <input id="qsssqqid" class="form-control" type="text" disabled>
                                                        <span class="input-group-addon" >
                                                <span class="glyphicon glyphicon-calendar" ></span>
                                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">取水所属期止:</label>
                                                    <div id="qsssqz" style="width: 92%;"
                                                         class="input-group date form_date"
                                                         data-date-format="yyyy/mm/dd"
                                                         data-link-format="yyyy/mm/dd">
                                                        <input id="qsssqzid" class="form-control" type="text" disabled>
                                                        <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">抄表日期:</label>
                                                    <div id="cbrq" style="width: 92%;"
                                                         class="input-group date form_date col-md-2"
                                                         data-date-format="yyyy/mm/dd"
                                                         data-link-format="yyyy/mm/dd">
                                                        <input id="cbrqid" class="form-control" type="text" disabled>
                                                        <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">纳税人识别号:</label>
                                                    <input type="text" id="nsrsbhs" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">纳税人名称:</label>
                                                    <input type="text" id="nsrmcs" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">联系人:</label>
                                                    <input type="text" id="lxr" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">联系方式:</label>
                                                    <input type="text" id="lxfs" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">取水计划:</label>
                                                    <input type="text" id="qsjh" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">水源类型:</label>
                                                    <select class="input-sylx" style="width: 160px;" id="sylx" disabled></select>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">取用水行业:</label>
                                                    <select class="input-qyshy" style="width: 160px;" id="qyshy" disabled></select>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">超采区类型:</label>
                                                    <select class="input-ccqlx" style="width: 160px;" id="ccqlx" disabled></select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">地下水取水地点供水管网:</label>
                                                    <select class="input-dxgsgw" style="width: 160px;" id="dxgsgw" disabled></select>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">特殊用水类:</label>
                                                    <select class="input-tsyslb" style="width: 160px;" id="tsyslb" disabled></select>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">纳税人签章:</label>
                                                    <input type="text" id="nsrqz" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">水量核定人签章:</label>
                                                    <input type="text" id="slhdrqz" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">税务机关受理人:</label>
                                                    <input type="text" id="swjgslr" style="width: 160px;" class="form-control" disabled>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-sm-2">
                                                    <label class="control-label">受理日期:</label>
                                                    <div id="slrq" style="width: 92%;"
                                                         class="input-group date form_date"
                                                         data-date-format="yyyy/mm/dd"
                                                         data-link-format="yyyy/mm/dd">
                                                        <input id="slrqid" class="form-control" type="text" disabled>
                                                        <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="querys" class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">表明细</span>
                                <div class="col-sm-11">
                                    <label class="control-label" style="margin-top: 10px">单位:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(m³)</label>
                                </div>
                            </div>
                            <div class="widget-body">
                                <table id="mytab" data-height="83"></table>
                            </div>
                        </div>
                    </div>
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
<%--Bootstrap-datetimepicker Script--%>
<script src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
</html>
<script>
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjjhpage.jsp";
    }

    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                searchlist();
            }
        });
        //初始化(信息采集)表格数据
        inittabs();
    });

    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                thequerys();
                theDetailTable();
            }
        });
        //水源类型（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/sylxcd", null, function (data) {
            $(".input-sylx").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //取用水行业（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/qyshycd", null, function (data) {
            $(".input-qyshy").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //地下水超采类型（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/dxscclxcd", null, function (data) {
            $(".input-ccqlx").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //地下水取水地点供水管网（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/gsgwcd", null, function (data) {
            $(".input-dxgsgw").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //特殊用水类别（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/tsyslbcd", null, function (data) {
            $(".input-tsyslb").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //隐藏序号列
        $('#mytab').bootstrapTable("hideColumn", "xh");
    });

    //查看数据
    function myviewdata(xxcjid) {
        theDetailTable(xxcjid);
        $.ajax({
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            url: '${ctx}/sjjh/xxcj/editData',
            type: 'post',
            data: {
                'svo.xxcjid': xxcjid
            },
            success: function (json) {
                //水源类型
                var sylxid = json[0].sylx;
                //取用水行业
                var qyshyid = json[0].qyshy;
                //超采区类型
                var ccqlxid = json[0].dxsccqlx;
                //地下水管网
                var dxsgwid = json[0].dxsqsddgsgw;
                //特殊用水类型
                var tsyslxid = json[0].tsyslb;

                //行政主管部
                $("#shzzgb").val(json[0].sxzzgbm);
                //取水属期起
                $("#qsssqqid").val(json[0].qslssqq);
                //取水属期止
                $("#qsssqzid").val(json[0].qslssqz);
                //抄表日期
                $("#cbrqid").val(json[0].cbrq);
                //纳税人识别号
                $("#nsrsbhs").val(json[0].nsrsbh);
                //纳税人名称
                $("#nsrmcs").val(json[0].nsrmc);
                //联系人
                $("#lxr").val(json[0].lxr);
                //联系方式
                $("#lxfs").val(json[0].lxfs);
                //取水计划
                $("#qsjh").val(json[0].qsjh);
                //水源类型选中项赋值
                $("#sylx").val(sylxid).select2();
                //取用水行业选中项赋值
                $("#qyshy").val(qyshyid).select2();
                //超采区选中项赋值
                $("#ccqlx").val(ccqlxid).select2();
                //地下水管网选中项赋值
                $("#dxgsgw").val(dxsgwid).select2();
                //特殊用水类别选中项赋值
                $("#tsyslb").val(tsyslxid).select2();
                //纳税人签章
                $("#nsrqz").val(json[0].nsrqz);
                //水量核定人签章
                $("#slhdrqz").val(json[0].slhdrqz);
                //税务机关受理人
                $("#swjgslr").val(json[0].swjgslr);
                //受理日期
                $("#slrqid").val(json[0].slrq);
            }
        });
    }

    //检索
    function searchlist() {
        //纳税人识别号
        var nsrsbh = $("#nsrsbh").val().trim();
        //纳税人名称
        var nsrmc = $("#nsrmc").val().trim();
        inittabs(nsrsbh, nsrmc);
    }

    //(信息采集)初始化表
    function inittabs(nsrsbh, nsrmc) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${ctx}/sjjh/xxcj/selectAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.nsrsbh': nsrsbh,
                    'svo.nsrmc': nsrmc,
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
            uniqueIS: "xxcjid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'

            }, {
                field: 'nsrsbh',
                align: 'left',
                title: '纳税人识别号',
                halign: 'center'

            }, {
                field: 'nsrmc',
                align: 'left',
                title: '纳税人名称',
                halign: 'center'
            }, {
                field: 'lxr',
                align: 'left',
                halign: 'center',
                title: '联系人'
            }, {
                field: 'lrsj',
                align: 'center',
                title: '录入时间'
            }, {
                field: 'cz',
                align: 'center',
                title: '操作 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-link" data-toggle="modal" data-target="#myview" onclick="myviewdata(\'' + row.xxcjid + '\')">查看明细</button>'
                }
            }]
        });

    }

    //删除
    function btn_delete() {
        var msg = "你确定要删除此数据吗？";
        var seldata = $('#taskList_table').bootstrapTable("getSelections");
        if (seldata.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        if (confirm(msg) == true) {
            $.ajax({
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${ctx}/sjjh/xxcj/deletedata",
                data: {'svo.xxcjid': seldata[0].xxcjid},
                type: 'post',
                dataType: 'json',
                success: function (msg) {
                    //刷新查询列表
                    $('#taskList_table').bootstrapTable("destroy");
                    inittabs();
                }
            });
        }
    }

    //编辑
    function btn_edit() {
        //获取被选中的记录
        var rows = $('#taskList_table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要编辑的记录！");
            return;
        } else {
            window.location.href = "${ctx}/sjjh/xxcj/initXxcjEdit?xxcjid=" + rows[0].xxcjid;
        }
    }

    //明细表
    function theDetailTable(xxcjid) {
        //先销毁表格
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            url: "${ctx}/sjjh/xxcj/viewthedata",
            sidePagination: "server",//表示服务端请求
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    'svo.xxcjid': xxcjid,
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
            columns: [
                {
                    field: 'qskdd',
                    align: 'left',
                    halign: 'center',
                    title: '取水口地点'
                }, {
                    field: 'bh',
                    align: 'center',
                    halign: 'center',
                    title: '编号'
                }, {
                    field: 'sqbds',
                    align: 'right',
                    halign: 'center',
                    title: '上期表底数'
                }, {
                    field: 'bqbds',
                    align: 'right',
                    halign: 'center',
                    title: '本期表底数'
                }, {
                    field: 'bqqsl',
                    align: 'right',
                    halign: 'center',
                    title: '本期取水量'
                }, {
                    field: 'ljqsl',
                    align: 'right',
                    halign: 'center',
                    title: '累计取水量'
                }, {
                    field: 'jhqsl',
                    align: 'right',
                    halign: 'center',
                    title: '计划取水量'
                }, {
                    field: 'hddjhnqsl',
                    align: 'right',
                    halign: 'center',
                    title: '核定的计划内取水量'
                }, {
                    field: 'hddcjhqsl',
                    align: 'right',
                    halign: 'center',
                    title: '核定的超计划取水量'
                }
            ]
        });
    }
</script>
