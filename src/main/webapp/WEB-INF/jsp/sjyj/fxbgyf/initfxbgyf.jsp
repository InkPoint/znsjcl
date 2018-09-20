<%--
  Created by IntelliJ IDEA.
  User: PengWen Wang
  Date: 2018/6/6
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>分析报告研发</title>
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
    <%--Select2 Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <%--BootstrapValidator Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <!--bootstrap-datetimepicker Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
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
                            <td style="width: 8cm">
                                <div style="float:left;width:2.5cm;"> 所属年份：</div>
                                <div style="width: 180px;float:left;"
                                     class="input-group date form_date col-md-6"
                                     data-date-format="yyyy" data-link-format="yyyy">
                                    <input id="ssnf" class="form-control" style="width: 100%;height:28px;" type="text"
                                           readonly>
                                    <span class="input-group-addon">
                                           <span class="glyphicon glyphicon-calendar"></span>
                                       </span>
                                </div>
                            </td>
                            <td style="vertical-align:middle;width: 2.5cm;">查询方式:</td>
                            <td style="width: 6cm">
                                <select id="cxfs" onchange="cxfsfun()" class="js-data2-example-ajax"
                                        style="width: 180px;height:28px;">
                                </select>
                            </td>
                            <td id="kjfs">
                                <select id="kjlist" class="js-data2-example-ajax" style="width: 180px;height:28px;">
                                </select>
                            </td>
                            <td id="zdysj" style="display: none;">
                                <div style="float:left;width:2cm;"> 属期起：</div>
                                <div id="bgsqq" style="width: 180px;float:left;"
                                     class="input-group date form_date col-md-6"
                                     data-date-format="yyyy-mm" data-link-format="yyyy-mm">
                                    <input id="sqq" class="form-control" style="width: 100%;height:28px;" type="text"
                                           readonly>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                                <div style="float:left;width:2cm;"> &nbsp;&nbsp;属期止：</div>
                                <div id="bgsqz" style="width: 180px;float:left;"
                                     class="input-group date form_date col-md-5" data-date=""
                                     data-date-format="yyyy-mm" data-link-format="yyyy-mm">
                                    <input id="sqz" class="form-control" style="width: 100%;height:28px;" type="text"
                                           readonly>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button type="button" onclick="theReport()" class="btn btn-info">生成报告</button>
                                <button onclick="window.location.href='${ctx}/main/homepage/sjyjpage'" type="button"
                                        class="btn btn-info " style="width: 2cm">返&nbsp;&nbsp;&nbsp;&nbsp;回
                                </button>
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
                    <table id="taskList_table" data-height="570"
                           class="table table-striped table-bordered table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<!--Basic Scripts-->
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
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
<%--Bootstrap-datetimepicker Script--%>
<script src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
</html>
<script type="text/javascript">
    $(function () {
        //初始化报告(表)
        inittabs();
        //默认选取当前时间
        $("#sqq,#sqz").attr('value', getAfterTheTime());
        $("#ssnf").attr('value', getAfterTheTime().substring(0, 4));
        //时间起止
        $("#cxfs").select2({
            data: [{id: 'kjcx', text: '快捷查询'}, {id: 'zdycx', text: '自定义查询'}]
        });
        //(征收分局)下拉菜单
        $.ajax({
            url: "${ctx}/sjyj/fxbgyf/querybglxlist",
            dataType: 'json',
            success: function (datas1) {
                $("#kjlist").select2({
                    data: datas1
                });
            }
        });
    });

    //查询方式切换
    function cxfsfun() {
        var cxdata = $("#cxfs").select2("data");
        if (cxdata[0].id == "kjcx") {
            //快捷查询
            $("#kjfs").show();
            $("#zdysj").hide();
        } else {
            $("#kjfs").hide();
            $("#zdysj").show();
        }
    }

    //Bootstrap-datetimepicker
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    //获取当前日期的(后一天)时间
    function getAfterTheTime() {
        var date = new Date();
        var tung = "-";
        var month = date.getMonth() + 1;
        var strDate = date.getDate() + 1;
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 1 && strDate <= 9) {
            strDate = "0" + strDate
        }
        var currentTime = date.getFullYear() + tung + month;
        return currentTime;
    }

    //生成报告
    function theReport() {
        //所属年份
        var ssnf = $("#ssnf").val().trim();
        //快捷查询_（快捷属期）
        var kjsq = $("#kjlist").select2("data")[0].id;
        //属期起
        var sqq = ssnf + $("#sqq").val().trim().substr(4, 7);
        //属期止
        var sqz = ssnf + $("#sqz").val().trim().substr(4, 7);
        //快捷查询(下拉框)
        var selectid = $("#cxfs").select2("data")[0].id;

        var cxdata = $("#cxfs").select2("data");
        if (cxdata[0].id == "kjcx") {
            //保存报告（快捷查询）
            $.post("${ctx}/sjyj/fxbgyf/svaeTheReport", {
                'svo.ssnf': ssnf,
                'svo.kjsq': kjsq
            }, function (results) {
                window.location.href = "${ctx}/sjyj/fxbgyf/initScbg?ssnf=" + ssnf + "&" + "kjsq=" + kjsq + "&" + "selectid=" + selectid;
            });
        } else {
            //自定义保存报告(属期查询)
            $.post("${ctx}/sjyj/fxbgyf/customSaveReport", {
                'svo.sqq': sqq,
                'svo.sqz': sqz
            }, function (results) {
                window.location.href = "${ctx}/sjyj/fxbgyf/initScbg?ssnf=" + ssnf + "&" + "sqq=" + sqq + "&" + "sqz=" + sqz + "&" + "selectid=" + selectid;
            });
        }
    }

    //(已生成报告)初始化表
    function inittabs() {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${ctx}/sjyj/fxbgyf/selectAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
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
                field: 'bgmc',
                align: 'center',
                title: '报告名称',
                halign: 'center'

            }, {
                field: 'scsj',
                align: 'center',
                title: '生成报告时间',
                halign: 'center'
            }, {
                field: 'bgsqq',
                align: 'center',
                halign: 'center',
                title: '报告属期时间起'
            }, {
                field: 'bgsqz',
                align: 'center',
                title: '报告属期时间止'
            }, {
                field: 'cz',
                align: 'center',
                title: '操作 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-link" onclick="checkTheReport(\'' + row.bgsqq + '\',\'' + row.bgsqz + '\',\'' + row.scsj + '\')">查看报告</button>'
                }
            }]
        });

    }

    //查看已生成报告
    function checkTheReport(bgsqq, bgsqz, scsj) {
        var ssnf = bgsqq.substr(0, 4);//所属年份
        var bgscsj = scsj.substr(0, 10);//报告生成时间
        window.location.href = "${ctx}/sjyj/fxbgyf/initScbg?ssnf=" + ssnf + "&" + "sqq=" + bgsqq + "&" + "sqz=" + bgsqz + "&" + "selectid=" + "zdycx" + "&" + "scsj=" + bgscsj;
    }
</script>
