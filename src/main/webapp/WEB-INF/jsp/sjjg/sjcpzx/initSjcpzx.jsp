<%--
  Created by IntelliJ IDEA.
  User: ChengZhang
  Date: 2018/3/28
  Time: 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据产品中心</title>
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
    <!--bootstrapt 编辑-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-editable.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <style>
        /*设置打印边框颜色，线条*/
        @media print {
            #taskList_table1 {
                border: 2px solid #000000;
            }

            .pagination-detail {
                display: none;
            }
        }

        /*修改表头换行*/
        .fixed-table-container tbody td .th-inner, .fixed-table-container thead th .th-inner {
            white-space: pre-wrap;
        }

        #page-body2 .fixed-table-body {
            height: 91%;
        }
    </style>

</head>


<body>
<%--产品列表页--%>
<div class="page-body" id="page-body1">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget panel panel-default">
                <div class="widget-header bg-blue panel-heading" role="tab" id="headingTwo">
                    <%--<span class="widget-caption">数据产品中心 > 查询条件</span>--%>
                    <h4 class="panel-title" align="left">
                        <a class="widget-caption" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" style="font-size: 14px">数据产品中心
                            > 查询条件</a>
                    </h4>
                </div>
                <div id="collapseTwo" class="widget-body panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="headingTwo">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width: 2cm">产品标题:</td>
                            <td style="width: 22cm;">
                                <input id="cpmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info" style="width: 2cm">
                                    查询
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回
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
                    <span class="widget-caption">产品列表</span>
                </div>
                <div class="widget-body">
                    <table id="taskList_table" class="table table-striped table-bordered table-hover"
                           data-height="470"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--产品明细查询页--%>
<div class="page-body" id="page-body2" style="display: none;">
    <div id="cxtj" class="row hidden-print">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget panel panel-default">
                <div class="widget-header bg-blue panel-heading" role="tab" id="headingOne">
                    <%--<span class="widget-caption">产品明细 > 查询条件</span>--%>
                    <h4 class="panel-title" align="left">
                        <a class="widget-caption" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" style="font-size: 14px">产品明细
                            > 查询条件</a>
                    </h4>
                </div>
                <div id="collapseOne" class="widget-body panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="headingOne">
                    <table class="table">
                        <tr>
                            <td id="startTime" style="vertical-align:middle; width: 4cm;text-align: right;">入库起时间:</td>
                            <td style="width: 3cm">
                                <div class="col-sm-2" style="width: 200px;">
                                    <div id="qsj" style="width: 100%;"
                                         class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
                                        <input id="qsjdate" class="form-control" style="width: 100%;" type="text"
                                               value="" readonly/>
                                        <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                    </div>
                                </div>
                            </td>

                            <td id="endTime" style="vertical-align:middle; width: 4cm";text-align: right;>入库止时间:</td>
                            <td>
                                <div class="col-sm-2" style="width: 200px;">
                                    <div id="zsj" style="width: 100%;"
                                         class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
                                        <input id="zsjdate" class="form-control" style="width: 100%;" type="text"
                                               value="" readonly/>
                                        <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchresult()" type="button" class="btn btn-info" style="width: 2cm">查询</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button onclick="returndiv1()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="printBody" class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header hidden-print">
                    <span id="cpbt" class="widget-caption"></span>
                </div>
                <div class="widget-body">
                    <div id="toolbar" hidden="hidden" class="hidden-print">
                        <button onclick="exportToExcel()" type="button" class="btn btn-default" style="width: 2cm"><i
                                class="glyphicon glyphicon-export"></i>导出
                        </button>
                        &nbsp;&nbsp;
                        <button onclick="printThisTable()" type="button" class="btn btn-default" style="width: 2cm"><i
                                class="glyphicon glyphicon-print"></i>打印
                        </button>
                    </div>
                    <div id="tabDiv" style="height:1100px;">
                        <table id="taskList_table1" class="table table-striped table-bordered table-hover">
                            <p id="tjts" align="center"
                               style="border:none;font-size: 16px;color: #ff0000;height: 30px;line-height: 30px">
                                请选择属期！</p>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--水利基金科所查询--%>
<div class="page-body" id="page-body3" style="display: none; height: 84%">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span id="cpbt1" class="widget-caption">水利基金抵顶信息明细</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar1">
                        <button onclick="exportToExcelT2()" type="button" class="btn btn-default" style="width: 2cm"><i
                                class="glyphicon glyphicon-export"></i>导出
                        </button>
                        <%--&nbsp;&nbsp;--%>
                        <%--<button onclick="printThisTable()" type="button" class="btn btn-default"><i--%>
                                <%--class="glyphicon glyphicon-print"></i>打印--%>
                        <%--</button>--%>
                        &nbsp;&nbsp;
                        <button onclick="returndiv2()" type="button" class="btn btn-info" style="width: 2cm"><i
                                class="glyphicon glyphicon-eject"></i>返回
                        </button>
                    </div>
                    <table id="taskList_table2" class="table table-striped table-bordered table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--新增市场主体名单结果查询定制页--%>
<div class="page-body" id="page-body4" style="display: none;">
    <div id="newMarketParticipantsListPage" class="row hidden-print">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget panel panel-default">
                <div class="widget-header bg-blue panel-heading" role="tab" id="headingThree">
                    <%--<span class="widget-caption">产品明细 > 查询条件</span>--%>
                    <h4 class="panel-title" align="left">
                        <a class="widget-caption" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseThree" aria-expanded="true" aria-controls="collapseThree" style="font-size: 14px">产品明细
                            > 查询条件</a>
                    </h4>
                </div>
                <div id="collapseThree" class="widget-body panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="headingThree">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width: 4cm;text-align: right;">数据分析批次:</td>
                            <td>
                                <select  id="sjfxpc" class="js-data2-example-ajax" style="width: 250px;">
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchresult()" type="button" class="btn btn-info" style="width: 2cm">查询</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button onclick="returndiv1()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div id="newMarketParticipantsListBody" class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header hidden-print">
                    <span id="newMarketParticipantsListHead" class="widget-caption"></span>
                </div>
                <div class="widget-body">
                    <%--<div id="toolbar" hidden="hidden" class="hidden-print">--%>
                        <%--<button onclick="exportToExcel()" type="button" class="btn btn-default" style="width: 2cm"><i--%>
                                <%--class="glyphicon glyphicon-export"></i>导出--%>
                        <%--</button>--%>
                        <%--&nbsp;&nbsp;--%>
                        <%--<button onclick="printThisTable()" type="button" class="btn btn-default" style="width: 2cm"><i--%>
                                <%--class="glyphicon glyphicon-print"></i>打印--%>
                        <%--</button>--%>
                    <%--</div>--%>
                    <div id="newMarketParticipantsListDiv" style="height:1100px;">
                        <table id="newMarketParticipantsListTable" class="table table-striped table-bordered table-hover">
                            <%--<p id="newMarketParticipantsListPrompt" align="center"--%>
                               <%--style="border:none;font-size: 16px;color: #ff0000;height: 30px;line-height: 30px">--%>
                                <%--请选择批次！</p>--%>
                        </table>
                    </div>
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

<!--bootstrapTable 编辑-->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable.js"></script>

<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
<%--Export Scripts--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/tableExport.js"></script>


</html>

<script>
    //初始化
    var bnc = "";
    $(function () {
        //获取当天
        var myDate = new Date();
        bnc = myDate.getFullYear().toString() + "-01-01";
        console.log("本年初日期：" + bnc);
        //时间
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

        //初始化产品列表
        inittabs();
    });

    $("#qsjdate").attr('value', bnc);
    $("#zsjdate").attr('value', getNowFormatDate());
    //获取当前日期时间
    function getNowFormatDate() {
        var date = new Date();
        var tung = "-";
        var thecolon = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        var currentTime = date.getFullYear() + tung + month + tung + strDate;
//        var currentTime = date.getFullYear() + tung + month + tung + strDate + " " + date.getHours() + thecolon + date.getMinutes() + thecolon + date.getSeconds();
        return currentTime;
    }

    var csid = ${param.ztid};
    console.log("页面传递的处室ID："+csid);
    function inittabs(cpmc) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjg/sjcpzx/selectlist",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
//            toolbar: '#toolbar',
            queryParams: function (params) {
                return {
                    'svo.cpmc': cpmc,
                    'svo.ztid': csid,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            ueryParamsType: 'limit',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "cpid", //每一行的唯一标识，一般为主键列
//            showToggle: "true", //切换视图
//            showColumns: 'true', //是否显示内容列下拉框
            sidePagination: 'server',
            columns: [{
                field: 'cpmc',
                align: 'center',
                title: '产品标题'
            }, {
                field: 'cpms',
                align: 'center',
                title: '产品描述'
            }, {
                field: 'cjr',
                align: 'center',
                title: '创建人'
            }, {
                field: 'cjsj',
                align: 'center',
                title: '创建时间'
            }, {
                field: 'cksj',
                align: 'center',
                title: '查看数据',
                formatter: function (value, row, index) {
                    // 如果产品明细查询路径不为空，跳转定制页面
                    if (row.cpmxcxlj == null || row.cpmxcxlj == '' || row.cpmxcxlj == undefined) {
                        return '<button type="button" class="btn btn-info btn-sm" onclick="dateConditionSelection(\'' + row.cpid + '\',\'' + row.cpmc + '\',\'' + row.cpcxjb + '\',\'' + row.cpbtzw + '\')">查看</button>';
                    }else {
                        return '<button type="button" class="btn btn-info btn-sm" onclick="newProductDetailPage(\'' + row.cpid + '\',\'' + row.cpmc + '\',\'' + row.cpcxjb + '\',\'' + row.cpbtzw + '\',\'' + row.cpmxcxlj + '\',\'' + row.csid + '\')">查看</button>';
                    }
                }
            }
            ]
        });
    }
    //返回按钮
    function returndiv1() {
        inittabs();
        $("#cpmc").val('');
        $('#page-body1').show();
        $('#page-body2').hide();
    }

    //按产品名称查询
    var cpmcs = "";
    function searchlist() {
        //获取产品标题
        var cpmc = $("#cpmc").val();
        inittabs(cpmc);
    }

    var dxmcyw = "";
    var cxlj = "";
    //属期选择页
    function dateConditionSelection(cpid, cpmc, cpcxjb,cpbtzw) {
        cxlj = cpcxjb;
        cpmcs = cpmc;
        var sqlx = cpbtzw
        console.log('属期条件类型：'+sqlx);
        console.log("查询路径：" + cxlj);
        console.log("产品名称：" + cpmcs);

        $('#startTime').html(sqlx+'起：');
        $('#endTime').html(sqlx+'止：');
        $('#page-body1').hide();
        $("#qsjdate").val(bnc);
        $("#zsjdate").val(getNowFormatDate());
        $('#page-body2').show();
        dxmcyw = cpid;
        $('#cpbt').html("<a onclick='returndiv1()' style='cursor: hand;text-decoration: none'>产品列表</a>" + " > " + cpmc);
        $("#taskList_table1").bootstrapTable('destroy');
        $("#tjts").show();
        $("#toolbar").hide();
    }

    //新产品明细页面
    function newProductDetailPage(cpid,cpmc,cpcxjb,cpbtzw,cpmxcxlj,csid) {
        // console.log('传递的参数处室ID：'+csid);
        console.log('传递的参数产品明细查询路径：'+cpmxcxlj);
        window.location.href = "${pageContext.request.contextPath}"+cpmxcxlj+"?cpid='"+cpid+"'&cpmc='"+cpmc+"'&cpcxjb='"+cpcxjb+"'&cpbtzw='"+cpbtzw+"'&cpmxcxlj='"+cpmxcxlj+"'&csid='"+csid+"'  ";
    }

    // 打印
    function printThisTable() {
        window.print();
    }

    // 根据属期选择后查询出的结果数据
    function searchresult() {
        //隐藏提示
        $("#tjts").hide();
        //获取起止时间
        var qsj = $("#qsjdate").val();
        var zsj = $("#zsjdate").val();
        console.debug("产品ID：" + dxmcyw);
        console.debug("起时间：" + qsj);
        console.debug("止时间：" + zsj);
        //获取表头，再加载表数据
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjg/sjcpzx/getheader",
            dataType: 'json',
            data: {'svo.dxmcyw': dxmcyw},//对象名称实则为产品ID
            success: function (header) {
                $("#toolbar").show();
                console.log("header：" + header);
                var jsonObj = JSON.parse(header);
//                console.log("jsonObj："+jsonObj);
                var jsonArr = [];
                for (var i = 0; i < jsonObj.length; i++) {
                    jsonArr[i] = jsonObj[i];
                }
//                console.log("jsonArr："+jsonArr);
                $("#taskList_table1").bootstrapTable('destroy');
                $("#taskList_table1").bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjjg/sjcpzx/viewthedata",
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            'svo.qsj': qsj,
                            'svo.zsj': zsj,
//                            'svo.cpid': dxmcyw,
                            'svo.cpcxjb': cxlj,
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                    singleSelect: true,//设置为true 禁止多选
                    toolbar: '#toolbar',
                    toolbarAlign: 'right',
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 25, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    dataType: 'json',
                    columns: jsonArr,
                    onLoadSuccess: function (res) {
                        if (cxlj == 'com.xalt.sjjg.dao.SjcpzxMapper.selectSljjdxxxtj') {
                            var obj = eval(res.rows);
                            var resData = JSON.stringify(eval(res.rows));
//                        console.log("onLoadSuccess后获取的数据："+resData);
                            for (var i in obj) {
                                if (obj[i].SWJGMC != '合计') {
                                    $("#taskList_table1 tbody tr:eq(" + i + ") td:nth-child(2)").html('<a href="javascript:void(0);"  style="text-decoration: none" onclick="cxqxsj(\'' + obj[i].SWJG_DM + '\',\'' + qsj + '\',\'' + zsj + '\')">' + obj[i].SWJGMC + '</a>');
                                }
                            }
                        }
                    }
                });
            }
        });
    }

    //导出数据
    function exportToExcel() {
        console.log("导出数据传递的数据查询路径：" + cxlj);
        console.log("导出数据传递的产品ID：" + dxmcyw);
        var qsj = $("#qsjdate").val();
        var zsj = $("#zsjdate").val();
        window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/exportToExcel?cpmc=" + cpmcs + "&svo.cpcxjb=" + cxlj + "&svo.qsj=" + qsj + "&svo.zsj=" + zsj + "&svo.cpid=" + dxmcyw;
    }
    //水利基金低顶信息明细导出数据
    function exportToExcelT2() {
        var cpid = '6CDB05094C61BA56E050149C42165ED3';
        var cpcxlj = 'com.xalt.sjjg.dao.SjcpzxMapper.selectSljjdxxxtjKs';
        var cpmc= '水利基金抵顶信息明细（'+zgswj_dm+'）';
        var qsj = $("#qsjdate").val();
        var zsj = $("#zsjdate").val();
        window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/exportToExcel?cpmc=" + cpmc + "&svo.cpcxjb=" + cpcxlj + "&svo.qsj=" + qsj + "&svo.zsj=" + zsj + "&svo.cpid=" + cpid;
    }

    //返回当前菜单首页
    function gohistory() {
        window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/initSjcpsy";
    }

    //返回
    function returndiv2() {
        $('#page-body2').show();
        $('#page-body3').hide();
    }

    //科所超链接查询
    function cxqxsj(swjgdm, qsj, zsj) {
        $('#page-body2').hide();
        $('#page-body3').show();
        //按科所查询
        var cpid = '6CDB05094C61BA56E050149C42165ED3';
        var cpcxlj = 'com.xalt.sjjg.dao.SjcpzxMapper.selectSljjdxxxtjKs';
        zgswj_dm = swjgdm.substr(0, 7);
        var ssqq = qsj;
        var ssqz = zsj;
        console.log("点击税务机关名称超链接传递的数据：" + zgswj_dm + "," + ssqq + "," + ssqz);
        $("#toolbar1").show();
        $("#taskList_table2").bootstrapTable('destroy');
        $("#taskList_table2").bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjg/sjcpzx/viewthedata",
            sidePagination: "server",//表示服务端请求
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    'svo.qsj': qsj
                    , 'svo.zsj': zsj
                    , 'svo.swjg_dm': zgswj_dm
                    , 'svo.cpcxjb': cpcxlj,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,//设置为true 禁止多选
            pageSize: 15, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            paginationLoop: true,
            sidePagination: 'server',
            toolbar: '#toolbar1',
            toolbarAlign: 'right',
            buttonsAlign: 'right', //按钮对齐方式
            clickToSelect: true, //是否启用点击选中行
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            dataType: 'json',
            columns: [{
                "field": "RN",
                "title": "序号",
                "align": "right",
                "halign": "center",
                "valign": "middle"
            }, {
                "field": "SWJGMC",
                "title": "主管税务机关名称",
                "align": "left",
                "halign": "center",
                "valign": "middle"
            }, {
                "field": "NSRSBH",
                "title": "纳税人识别号",
                "align": "center",
                "halign": "center",
                "valign": "middle"
            }, {
                "field": "NSRMC",
                "title": "纳税人名称",
                "align": "center",
                "halign": "center",
                "valign": "middle"
            }, {
                "field": "SWRYXM",
                "title": "税收管理员",
                "align": "center",
                "halign": "center",
                "valign": "middle"
            }, {
                "field": "SBHS",
                "title": "申报户数",
                "align": "right",
                "halign": "center",
                "valign": "middle"
            }, {
                "field": "JCX_WY",
                "title": "减除项（元）",
                "align": "right",
                "halign": "center",
                "valign": "middle"
            }, {"field": "JME_WY",
                "title": "减免额（元）",
                "align": "right",
                "halign": "center",
                "valign": "middle"
            }],
            onLoadSuccess: function (res) {
                // 加载成功发放
            }
        });
    }

</script>
