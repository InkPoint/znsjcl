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
    <title>新增市场主体名单</title>
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
<%--新增市场主体名单结果查询定制页--%>
<div class="page-body" id="page-body4">
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
                                <button onclick="returndiv()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
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
                <div class="widget-header bg-blue hidden-print">
                    <span id="newMarketParticipantsListHead" class="widget-caption">产品列表 > 新增市场主体名单</span>
                </div>
                <div class="widget-body">
                    <table class="table" width="100%">
                        <tr>
                            <td bgcolor="#e0e8f5" width="10%" rowspan="5" style="vertical-align: middle" align="center">分析结果</td>
                            <td width="30%" style="vertical-align: middle"><a href="javascript:void(0)" onclick="searchList('qyydjxh')" style="text-decoration: none">企业有登记序号</a></td>
                            <td bgcolor="#e0e8f5" width="10%" rowspan="5" style="vertical-align: middle" align="center">数据说明</td>
                            <td id="sjsm" width="60%" rowspan="5"></td>
                        </tr>
                        <tr>
                            <td width="30%" style="vertical-align: middle"><a href="javascript:void(0)" onclick="searchList('qywdjxh')" style="text-decoration: none">企业无登记序号</a></td>
                        </tr>
                        <tr>
                            <td width="30%" style="vertical-align: middle"><a href="javascript:void(0)" onclick="searchList('gtydjxh')" style="text-decoration: none">个体有登记序号</a></td>
                        </tr>
                        <tr>
                            <td width="30%" style="vertical-align: middle"><a href="javascript:void(0)" onclick="searchList('gtwdjxh')" style="text-decoration: none">个体无登记序号</a></td>
                        </tr>
                        <tr>
                            <td width="30%" style="vertical-align: middle"><a href="javascript:void(0)" onclick="searchList('gxfjhx')" style="text-decoration: none">高新分局和企业名称为“***”</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--处理情况展示页--%>
<div class="page-body" id="page-body3" style="display: none;height: 78%;" >
    <div id="treatmentSituationPage" class="row hidden-print">
    </div>
    <div class="row">
        <div id="treatmentSituationBody" class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue hidden-print">
                    <span id="treatmentSituationHead" class="widget-caption">新增市场主体名单 > 分析结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar" class="hidden-print" style="text-align: right">
                        <button onclick="exportToExcel()" type="button" class="btn btn-info" style="width: 2cm"><i class="glyphicon glyphicon-export"></i>导出</button>
                        &nbsp;&nbsp;
                        <button onclick="returndiv1()" type="button" class="btn btn-info" style="width: 2cm"><i class="glyphicon glyphicon-eject"></i>返回</button>
                    </div>
                    <table id="treatmentSituationTable" class="table table-striped table-bordered table-hover"></table>
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
    $(function () {
        csid         = ${param.csid};
        cpid         = ${param.cpid};
        cpmc       = ${param.cpmc};
        cpcxjb     = ${param.cpcxjb};
        cpbtzw    = ${param.cpbtzw};
        cpmxcxlj = ${param.cpmxcxlj};

        // console.log("页面传递的参数："+csid);

        //(分析批次)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjg/jjcXzscztmd/queryBatch",
            dataType: 'json',
            success: function (datas1) {
                $("#sjfxpc").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        inittabs();

    })


    // 初始化数据说明
    function inittabs(pc_dm) {
        // console.log('批次代码：'+pc_dm);
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjg/jjcXzscztmd/querySjsm",
            type: 'post',
            data: {
                'svo.pc_dm': pc_dm
            },
            success: function (sjsm) {
                // console.log("sjsm：" + sjsm);
                $('#sjsm').html(sjsm);
            }
        });

    }

    //返回当前处室产品列表
    function returndiv() {
        // console.log('处室ID：'+csid);
        window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/initSjcpzx?ztid='"+csid+"'";
    }

    // 根据批次查询
    function searchresult() {
        //获取批次信息
        var pc_dm = $("#sjfxpc").select2("data")[0].id;
        var pcmc = $("#sjfxpc").select2("data")[0].text;
        console.log('批次代码：'+pc_dm+'，批次名称：'+pcmc);
        inittabs(pc_dm);
    }


    //点击超链接查看处理的数据
    function searchList(searchFalg) {
        queryFalg = searchFalg;
        var pc_dm = $("#sjfxpc").val();
        // 判断批次代码是否有选择
        if (pc_dm == null || pc_dm == undefined || pc_dm == '') {
            alert('请选择要查看的批次！');
        }else {
            $('#page-body4').hide();
            console.log("点击超链接传递的查询标志：" + searchFalg +'，批次代码：'+pc_dm);
            $("#treatmentSituationTable").bootstrapTable('destroy');
            $("#treatmentSituationTable").bootstrapTable({
                url: "${pageContext.request.contextPath}/sjjg/jjcXzscztmd/viewthedata",
                sidePagination: "server",//表示服务端请求
                pagination: true, //是否分页
                queryParams: function (params) {
                    return {
                        'svo.searchFalg': queryFalg,
                        'svo.pc_dm':pc_dm,
                        offset: (params.offset / params.limit) + 1,
                        limit: params.limit
                    }
                },
                singleSelect: true,//设置为true 禁止多选
                pageSize: 10, //每页的记录行数
                pageList: [10, 20, 30, 50], //可供选择的每页行数
                onlyInfoPagination: false,
                paginationLoop: true,
                sidePagination: 'server',
                // toolbar: '#toolbar',
                // toolbarAlign: 'right',
                // buttonsAlign: 'right', //按钮对齐方式
                clickToSelect: true, //是否启用点击选中行
                cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                dataType: 'json',
                columns: [{
                    "field": "XH",
                    "title": "原表序号",
                    "align": "right",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "MC",
                    "title": "企业名称",
                    "align": "left",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "ZCDJH",
                    "title": "注册登记号",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "TYSHXYDM",
                    "title": "统一社会信用代码",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "ZCDZ",
                    "title": "注册地址",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "DJJG",
                    "title": "登记机关",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "ZCSJ",
                    "title": "注册登记（迁入）时间",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "LX",
                    "title": "主体类型",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "PCMC",
                    "title": "批次名称",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }, {
                    "field": "DJXH",
                    "title": "登记序号",
                    "align": "center",
                    "halign": "center",
                    "valign": "middle"
                }],
                onLoadSuccess: function (res) {
                    $('#page-body3').show();
                }
            });
        }
    }

    //导出数据
    function exportToExcel() {
        var pc_dm = $("#sjfxpc").select2("data")[0].id;
        var pcmc = $("#sjfxpc").select2("data")[0].text;
        // console.log('批次代码：'+pc_dm+'，批次名称：'+pcmc);
        window.location.href = "${pageContext.request.contextPath}/sjjg/jjcXzscztmd/exportToExcel?svo.searchFalg=" + queryFalg + "&svo.pc_dm=" + pc_dm + "&svo.pcmc=" + pcmc ;
    }

    //返回
    function returndiv1() {
        $('#page-body4').show();
        $('#page-body3').hide();
    }

    <%--//返回当前菜单首页--%>
    <%--function gohistory() {--%>
        <%--window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/initSjcpsy";--%>
    <%--}--%>



    

</script>
