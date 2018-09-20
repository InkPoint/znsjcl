<%--
  Created by IntelliJ IDEA.
  User: PengWen Wang
  Date: 2018/8/13
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>养老信息查询</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Bootstrap Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Select2 styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <%--Font-awesome Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <!--Beyond Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <style>
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
    <div id="condition" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span id="headerid" class="widget-caption">养老信息查询</span>
                </div>
                <div class="widget-body">
                    <form id="tablevalidation" method="post" class="form-horizontal">
                        <table class="table">
                            <div class="form-group">
                                <div class="group">
                                    <label style="font-size: 15px" class="col-sm-1 control-label">核算机关:</label>
                                    <div class="col-sm-3">
                                        <div class="input-group col-sm-11">
                                            <select id="hsjg" onchange="vacantMechanism()">
                                                <option></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <label style="font-size: 15px" class="col-sm-2 control-label">经办机构:</label>
                                    <div class="col-sm-3">
                                        <div class="input-group col-sm-11">
                                            <select id="jbjg" onchange="vacantOffice()">
                                                <option></option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="group">
                                    <div class="col-sm-1 col-lg-offset-5">
                                        <button type="button" class="btn btn-info" onclick="search();">查&nbsp;&nbsp;&nbsp;询</button>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-1">
                                        <button type="button" class="btn btn-info"
                                                onclick="returndiv()">返&nbsp;&nbsp;&nbsp;回
                                        </button>
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
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar" class="hidden-print">
                        <button onclick="exportToExcel()" type="button" class="btn btn-default" style="width: 2cm"><i
                                class="glyphicon glyphicon-export"></i>导出
                        </button>
                    </div>
                    <table style="white-space: nowrap;" class="table table-striped table-bordered table-hover"
                           id="mytab" data-height="560"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<!--Basic Scripts-->
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--Select2 Scripts--%>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<%--Export Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-develop/tableExport.js"></script>
<script>
    function returndiv() {
        window.location.href = "${ctx}/sjjg/ylxxcx/initYl";
    }

    $(function () {
        inittabs();
        $("#hsjg").focus();
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                search();
                return false;
            }
        });
        // 核算机关
        $.post("${ctx}/sjjg/ylxxcx/organMenu", null, function (data) {
            $("#hsjg").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        // 经办机构
        $.post("${ctx}/sjjg/ylxxcx/mechanismMenu", null, function (data) {
            $("#jbjg").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
    });

    function search() {
        // 核算机关
        var hsjg = $("#hsjg").select2("data");
        var hsjgcon = "";
        if (hsjg != null && JSON.stringify(hsjg) != "{}" && typeof(hsjg) != "undefined" && hsjg.length > 0) {
            hsjgcon = hsjg[0].text;
        }
        // 经办机构
        var jbjg = $("#jbjg").select2("data");
        var jbjgcon = "";
        if (jbjg != null && JSON.stringify(jbjg) != "{}" && typeof(jbjg) != "undefined" && jbjg.length > 0) {
            jbjgcon = jbjg[0].text;
        }
        inittabs(hsjgcon, jbjgcon);
    }

    function inittabs(hsjgcon, jbjgcon) {
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            url: "${ctx}/sjjg/ylxxcx/countAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.hsjg': hsjgcon,
                    'svo.zgsbjg': jbjgcon,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
            pageList: [10, 100, 500, 'All'], //可供选择的每页行数
            // showExport: true,//是否显示导出按钮
            toolbar: '#toolbar',
            toolbarAlign: 'right',
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            columns: [{
                field: 'xh',
                title: '序号',
                align: 'center',
                width: 40,
                formatter: function (value, row, index) {
                    //获取每页的数据量
                    var pagesize = $("#mytab").bootstrapTable('getOptions').pageSize;
                    //获取当前是第几页
                    var pageNumber = $("#mytab").bootstrapTable('getOptions').pageNumber;
                    //返回序号(从0开始)
                    return pagesize * (pageNumber - 1) + index + 1;
                }
            },
                {
                    field: 'jfrsbh',
                    align: 'left',
                    halign: 'center',
                    title: '缴费人识别号'
                }, {
                    field: 'sbbh',
                    align: 'left',
                    halign: 'center',
                    title: '社保编码'
                }, {
                    field: 'jfdwmc',
                    align: 'left',
                    halign: 'center',
                    title: '缴费单位名称'
                }, {
                    field: 'hsjg',
                    align: 'left',
                    halign: 'center',
                    title: '核算机关'
                }, {
                    field: 'zgsbjg',
                    align: 'left',
                    halign: 'center',
                    title: '主管社保机构'
                }, {
                    field: 'kprq',
                    align: 'center',
                    halign: 'center',
                    title: '开票日期'
                }, {
                    field: 'zssq',
                    align: 'left',
                    halign: 'center',
                    title: '征收属期'
                }, {
                    field: 'dwjfjs',
                    align: 'center',
                    halign: 'center',
                    title: '单位缴费基数'
                }, {
                    field: 'grjfjs',
                    align: 'right',
                    halign: 'center',
                    title: '个人缴费基数'
                }, {
                    field: 'jfrs',
                    align: 'right',
                    halign: 'center',
                    title: '缴费人数'
                }, {
                    field: 'dwsjje',
                    align: 'center',
                    halign: 'center',
                    title: '单位实缴金额'
                }, {
                    field: 'grsjje',
                    align: 'center',
                    halign: 'center',
                    title: '个人实缴金额'
                }, {
                    field: 'znj',
                    align: 'center',
                    halign: 'center',
                    title: '滞纳金'
                }, {
                    field: 'qtgrjf',
                    align: 'center',
                    halign: 'center',
                    title: '其它个人缴费'
                }, {
                    field: 'fk',
                    align: 'center',
                    halign: 'center',
                    title: '罚款'
                }, {
                    field: 'lx',
                    align: 'center',
                    halign: 'center',
                    title: '利息'
                }, {
                    field: 'rke',
                    align: 'right',
                    halign: 'center',
                    title: '入库额'
                }, {
                    field: 'rkrq',
                    align: 'right',
                    halign: 'center',
                    title: '入库日期'
                }, {
                    field: 'ph',
                    align: 'right',
                    halign: 'center',
                    title: '票号'
                }
            ]
        });
    }

    // 导出数据
    function exportToExcel() {
        // 核算机关
        var hsjg = $("#hsjg").select2("data");
        var hsjgcon = "";
        if (hsjg != null && JSON.stringify(hsjg) != "{}" && typeof(hsjg) != "undefined" && hsjg.length > 0) {
            hsjgcon = hsjg[0].text;
        }
        // 经办机构
        var jbjg = $("#jbjg").select2("data");
        var jbjgcon = "";
        if (jbjg != null && JSON.stringify(jbjg) != "{}" && typeof(jbjg) != "undefined" && jbjg.length > 0) {
            jbjgcon = jbjg[0].text;
        }
        window.location.href = "${ctx}/sjjg/ylxxcx/exportExcel?svo.hsjg=" + hsjgcon + "&" +"svo.zgsbjg=" + jbjgcon;
    }

    // 置空机构
    function vacantMechanism() {
        $("#jbjg").val("").select2();
        $("#jbjg").select2({
            placeholder: '请选择',
            allowClear: true
        });
    }

    // 置空机关
    function vacantOffice() {
        $("#hsjg").val("").select2();
        $("#hsjg").select2({
            placeholder: '请选择',
            allowClear: true
        });
    }
</script>
