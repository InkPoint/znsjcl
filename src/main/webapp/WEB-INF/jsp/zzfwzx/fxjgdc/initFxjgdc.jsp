<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/5/9
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分析结果导出</title>
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
                            <td style="vertical-align:middle;width: 2cm;">征收分局:</td>
                            <td style="width: 7cm">
                                <select id="zsfj" onchange="zsfcs()" class="js-data2-example-ajax"
                                        style="width: 200px;">
                                    <option></option>
                                </select>
                            </td>

                            <td style="vertical-align:middle;width: 4cm;">税务管理科所:</td>
                            <td>
                                <select id="ks" class="js-data2-example-ajax" style="width: 200px;">
                                    <option></option>
                                </select>
                            </td>

                        </tr>

                        <tr>
                            <td style="vertical-align:middle;width: 2cm;">下发批次:</td>
                            <td>
                                <select id="xfpc" class="js-data2-example-ajax" style="width: 200px;">
                                    <option></option>
                                </select>
                            </td>

                            <td style="vertical-align:middle;width: 2cm;">分析大类:</td>
                            <td>
                                <select id="fxdl" class="js-data2-example-ajax" style="width: 200px;">
                                    <option></option>
                                </select>
                            </td>

                            <td style="vertical-align:middle;width: 2cm;">分析小类:</td>
                            <td>
                                <select id="getfxxl" class="js-data2-example-ajax" style="width: 200px;">
                                    <option></option>
                                </select>
                            </td>

                        </tr>

                        <tr>
                            <td style="vertical-align:middle; width: 3cm;">纳税人名称:</td>
                            <td style="width:7cm;"><input type="text" id="nsrmc" class="form-control"
                                                          style="width: 150px;"></td>
                            <td style="vertical-align:middle; width: 0cm;">纳税人识别号:</td>
                            <td style="width:7cm;"><input type="text" id="nsrsbh" class="form-control"
                                                          style="width: 150px;"></td>
                        </tr>

                        <tr align="center">
                            <td colspan="12">
                                <button type="button" onclick="searchlist()" class="btn btn-info">执行查询</button>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
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

                    <table id="taskList_table" class="table table-striped table-bordered table-hover"></table>

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
<%--导出插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/tableExport.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
</html>
<script type="text/javascript">
    var zsfj="";
    //初始化
    $(function () {
        //初始化表格
        inittabs();
        $("#ks").select2({
            data: [{id:'0',text:'请选择征收分局'}],
            placeholder: '请选择',
            allowClear: true
        });

        //时间
        $('#tjzxsj,#bjzxsj').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });

        //(征收分局)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/zzfwzx/fxjgdc/selectzsfj",
            dataType: 'json',
            success: function (datas1) {
                $("#zsfj").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });


        //(下发批次)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/zzfwzx/fxjgdc/selectXfpc",
            dataType: 'json',
            success: function (datas1) {
                $("#xfpc").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        //(分析大类)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/zzfwzx/fxjgdc/selectFxdl",
            dataType: 'json',
            success: function (datas1) {
                $("#fxdl").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        //(分析小类)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/zzfwzx/fxjgdc/selectFxxl",
            dataType: 'json',
            success: function (datas1) {
                $("#getfxxl").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });


    });

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/zzfwzxpage.jsp";
    }

    //具体科所查询（获取分局id）
    function zsfcs() {
        //征收分局id
        zsfj = $("#zsfj").select2("data")[0].id.substring(0, 7);
        $("#ks").empty();
        $.ajax({
            url: '${pageContext.request.contextPath}/zzfwzx/fxjgdc/selectKs',
            type: 'post',
            data: {
                'svo.fjid': zsfj
            },
            success: function (json) {
                $("#ks").select2({
                    data: json,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
    }

    function inittabs(xfpc, fxdl, fxxl, nsrmc, nsrsbh,zsfjs) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/zzfwzx/fxjgdc/selectList",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            showExport: true,//是否显示导出按钮
            queryParams: {
                'svo.pccode': xfpc,
                'svo.typecode': fxdl,
                'svo.classcode': fxxl,
                'svo.taxpayername': nsrmc,
                'svo.nsrsbh': nsrsbh,
                'svo.swjgmc': zsfjs
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
                    field: 'taxpayername',
                    align: 'center',
                    title: '纳税人名称'
                }, {
                    field: 'nsrsbh',
                    align: 'center',
                    title: '纳税人识别号'
                }, {
                    field: 'addr',
                    align: 'center',
                    title: '生产经营地址'
                }, {
                    field: 'hy',
                    align: 'center',
                    title: '行业'
                }, {
                    field: 'zclx',
                    align: 'center',
                    title: '登记注册类型'
                }, {
                    field: 'swjgmc',
                    align: 'center',
                    title: '主管单位'
                }, {
                    field: 'swgly',
                    align: 'center',
                    title: '税收管理员'
                }, {
                    field: 'pccode',
                    align: 'center',
                    title: '批次'
                }, {
                    field: 'typecode',
                    align: 'center',
                    title: '大类'
                }, {
                    field: 'classcode',
                    align: 'center',
                    title: '小类'
                }, {
                    field: 'summary',
                    align: 'center',
                    title: '疑点描述',
                    formatter: function (value, row, index) {
                        var nameString = "";
                        if (value.length > 10) {
                            nameString = value.substring(0, 10) + '...';
                        } else {
                            nameString = value;
                        }
                        return [
                            '<a data-toggle="tooltip" data_placement="bottom" title=' + value + '>' + nameString + '</a>'
                        ].join('');
                    }

                }, {
                    field: 'taskamount',
                    align: 'center',
                    title: '疑点金额'
                }, {
                    field: 'isadd',
                    align: 'center',
                    title: '数据管税平台是否添加'
                }, {
                    field: 'isss',
                    align: 'center',
                    title: '是否属实'
                }
            ]
        });
    }

    //按照纳税人名称查询
    function searchlist() {
        //获取下发批次
        var xfpc;
        var fxdl;
        var fxxl;
        var zsfjs;
        var swjgmc;
        var nsrmc = $("#nsrmc").val();
        var nsrsbh = $("#nsrsbh").val();
        var fxdl = $("#fxdl").select2("data")[0].text;
        var xfpc = $("#xfpc").select2("data")[0].text;
        var fxxl = $("#getfxxl").select2("data")[0].text;
        var ks = $("#ks").select2("data")[0].text;
        if(zsfj!=null){
            zsfjs=zsfj;
        }

        inittabs(xfpc, fxdl, fxxl, nsrmc, nsrsbh,zsfjs);
    }

    //导出
    <%--function dcsj() {--%>
        <%--//获取被选中的记录--%>
        <%--var rows = $('#taskList_table').bootstrapTable('getSelections');--%>
        <%--if (rows.length == 0) {--%>
            <%--alert("请选择要导出的记录！");--%>
            <%--return;--%>
        <%--}--%>
        <%--var bm = rows[0].bm;--%>
        <%--window.location.href = "${pageContext.request.contextPath}/sjcl/clmxcx/exportData?svo.dxmcyw=" + bm;--%>
    <%--}--%>


</script>
