<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/12/5
  Time: 18:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>分析结果反馈</title>
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
<%--结果展示页--%>
<div class="page-body" id="page-body1">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget panel panel-default">
                <div class="widget-header bg-blue panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title" align="left">
                        <a class="widget-caption" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" style="font-size: 14px">分析结果反馈 > 查询条件</a>
                    </h4>
                </div>
                <div id="collapseTwo" class="widget-body panel-collapse collapse in" role="tabpanel" aria-labelledby="headingTwo">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">征收分局:</td>
                            <td>
                                <select id="zsfj" onchange="zsfcs()" class="js-data2-example-ajax"
                                        style="width: 250px;">
                                    <option></option>
                                </select>
                            </td>

                            <td style="vertical-align:middle;width: 4cm;">税务管理科所:</td>
                            <td>
                                <select id="ks" class="js-data2-example-ajax" style="width: 250px;">
                                    <option></option>
                                </select>
                            </td>
                            <td style="vertical-align:middle;width: 3cm;"></td>
                            <td></td>

                        </tr>

                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">下发批次:</td>
                            <td>
                                <select id="xfpc" onchange="changexfpc()" class="js-data2-example-ajax" style="width: 250px;">
                                    <option></option>
                                </select>
                            </td>

                            <td style="vertical-align:middle;width: 4cm;">分析大类:</td>
                            <td>
                                <select id="fxdl" onchange="changefxdl()" class="js-data2-example-ajax" style="width: 250px;">
                                    <option></option>
                                </select>
                            </td>
                            <td style="vertical-align:middle;width: 3cm;">分析小类:</td>
                            <td>
                                <select id="getfxxl" class="js-data2-example-ajax" style="width: 250px;">
                                    <option></option>
                                </select>
                            </td>

                        </tr>

                        <tr>
                            <td style="vertical-align:middle; width: 3cm;">纳税人名称:</td>
                            <td style="width:7cm;">
                                <input type="text" id="nsrmc" class="form-control" style="width: 250px;">
                            </td>

                            <td style="vertical-align:middle; width: 4cm;">纳税人识别号:</td>
                            <td style="width:7cm;">
                                <input type="text" id="nsrsbh" class="form-control" style="width: 250px;">
                            </td>
                            <td style="vertical-align:middle;width: 3cm;"></td>
                            <td></td>
                        </tr>

                        <tr align="center">
                            <td colspan="12">
                                <button type="button" onclick="searchlist()" class="btn btn-info">查询</button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button onclick="window.location.href='${pageContext.request.contextPath}/main/homepage/sjyjpage'" type="button" class="btn btn-info">返回</button>
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

                    <table id="taskList_table" class="table table-striped table-bordered table-hover" data-height="780"></table>

                </div>

            </div>
        </div>
    </div>
</div>
<%--查看详情页--%>
<div class="page-body" id="page-body2" style="display: none;">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span id="mxtitle" class="widget-caption">分析结果反馈 > </span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td bgcolor="#e0e8f5">纳税人名称</td>
                            <td id="td_nsrmc"></td>
                            <td bgcolor="#e0e8f5" rowspan="12" style="vertical-align: middle">疑点描述</td>
                            <td id="td_ydms" rowspan="12"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">纳税人识别号</td>
                            <td id="td_nsrsbh"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">生产经营地址</td>
                            <td id="td_scjydz"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">行业</td>
                            <td id="td_hy"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">登记注册类型</td>
                            <td id="td_djzclx"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">主管单位</td>
                            <td id="td_zgfj"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">税收管理员</td>
                            <td id="td_ssgly"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">下发批次</td>
                            <td id="td_xfpc"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">分析大类</td>
                            <td id="td_fxdl"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">分析小类</td>
                            <td id="td_fxxl"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">疑点概述</td>
                            <td id="td_ydgs"></td>
                        </tr>
                        <tr>
                            <td bgcolor="#e0e8f5">疑点金额</td>
                            <td id="td_ydje"></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <button onclick="returndiv1()" type="button" class="btn btn-info">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--详情明细页--%>
<div class="page-body" id="page-body3" style="display: none;">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span id="tabletitle" class="widget-caption"></span>
                </div>
                <div class="widget-body">
                    <%--<div id="toolbar" >--%>
                        <%--<button onclick="exportToExcel()" type="button" class="btn btn-info" style="width: 2cm"><i class="glyphicon glyphicon-export"></i>导出</button>--%>
                        <%--&nbsp;&nbsp;&nbsp;--%>
                        <%--<button onclick="returndiv2()" type="button" class="btn btn-info" style="width: 2cm">返回</button>--%>
                    <%--</div>--%>
                    <table id="taskList_table1" class="table table-striped table-bordered table-hover" data-height="780"></table>
                    <div align="center">
                        <button onclick="exportToExcel()" type="button" class="btn btn-info" style="width: 2cm"><i class="glyphicon glyphicon-export"></i>导出</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <button onclick="returndiv2()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
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
</html>
<script type="text/javascript">


    //初始化
    $(function () {
        //初始化表格
        inittabs();
        $("#ks").select2({
            data: [{id:'0',text:'请选择征收分局'}],
            placeholder: '请选择',
            allowClear: true
        });


        //给分析大类置默认值“请选择”
        $("#fxdl").select2({
            data: [{id:'0',text:'请选择下发批次'}],
            placeholder: '请选择',
            allowClear: true
        });

        //给分析小类置默认值“请选择”
        $("#getfxxl").select2({
            data: [{id:'0',text:'请选择分析大类'}],
            placeholder: '请选择',
            allowClear: true
        });

        //(征收分局)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/fxjgdc/selectzsfj",
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
            url: "${pageContext.request.contextPath}/sjyj/fxjgdc/selectXfpc",
            dataType: 'json',
            success: function (datas1) {
                $("#xfpc").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

    });

    //主管分局级联查询（获取科所）
    function zsfcs() {
        //征收分局id
        zsfj = $("#zsfj").select2("data")[0].id.substring(0, 7);
        $("#ks").empty();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjyj/fxjgdc/selectKs',
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
                $("#ks").val("请选择").trigger('change');
            }
        });
        console.log("征收分局："+zsfj+",征收科所："+$("#ks").val());
    }

    //下发批次级联查询（获取分析大类）
    function changexfpc() {
        //获取选中的下发批次代码
        var xfpc = $("#xfpc").val();
        console.log("下发批次："+xfpc);
        $("#fxdl").empty();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjyj/fxjgdc/selectFxdl',
            type: 'post',
            data: {
                'svo.pccode': xfpc
            },
            success: function (json) {
                $("#fxdl").select2({
                    data: json,
                    placeholder: '请选择',
                    allowClear: true
                });
                $("#fxdl").val("请选择").trigger('change');
            }
        });
    }

    //分析大类级联查询（获取分析小类）
    function changefxdl() {
        //获取选中的分析大类代码
        var fxdl = $("#fxdl").val();
        console.log("分析大类："+fxdl);
        if(fxdl!=null&&fxdl!=0){
            $("#getfxxl").empty();
            $.ajax({
                url: '${pageContext.request.contextPath}/sjyj/fxjgdc/selectFxxl',
                type: 'post',
                data: {
                    'svo.typecode': fxdl
                },
                success: function (json) {
                    $("#getfxxl").select2({
                        data: json,
                        placeholder: '请选择',
                        allowClear: true
                    });
                    $("#getfxxl").val("请选择").trigger('change');
                }
            });
        }else{
            $("#getfxxl").val("请选择").trigger('change');
        }

    }

    function inittabs(xfpc, fxdl, fxxl, nsrmc, nsrsbh,zsfjs) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/fxjgdc/selectList",
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    'svo.pccode': xfpc,
                    'svo.typecode': fxdl,
                    'svo.classcode': fxxl,
                    'svo.taxpayername': nsrmc,
                    'svo.nsrsbh': nsrsbh,
                    'svo.orgcode': zsfjs,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "nsrmc", //每一行的唯一标识，一般为主键列
            sidePagination: 'server',
            columns: [{
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
                field: 'pcmc',
                align: 'center',
                title: '批次'
            }, {
                field: 'dlmc',
                align: 'center',
                title: '大类'
            }, {
                field: 'xlmc',
                align: 'center',
                title: '小类'
            }, {
                field: 'summary',
                align: 'center',
                title: '疑点概述',
                formatter: function (value, row, index) {
                    var nameString = "";
                    if (value.length > 10) {
                        nameString = value.substring(0, 10) + '...';
                    } else {
                        nameString = value;
                    }
                    return [
                        '<a  data-toggle="tooltip" data_placement="bottom" title=' + value + '>' + nameString + '</a>'
                    ].join('');
                }
            }, {
                field: 'taskamount',
                align: 'center',
                title: '疑点金额'
            }, {
                field: 'view',
                align: 'center',
                title: '查看数据',
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-info btn-sm" onclick="checkdetail(\'' + row.djxh + '\',\'' + row.classcode + '\')" >查看</button>';
                }
            }
            ]
        });
    }

    var xlmc ="";
    //查看明细信息
    function checkdetail(djxh1,xldm1) {
        var djxh = djxh1;
        var xl_dm = xldm1;
        console.log("登记序号："+djxh+"小类代码："+xl_dm);
        $("#page-body1").hide();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjyj/fxjgdc/selectList',
            type: 'post',
            data: {
                'svo.djxh': djxh,
                'svo.classcode': xl_dm
            },
            success: function (data) {
                var obj = eval(data.rows);
//                var rows_str = JSON.stringify(eval(data.rows));
//                console.log("获取的数据："+rows_str);
                for (var i in obj){
                    $("#td_nsrmc").html(obj[i].taxpayername);
                    $("#td_ydms").html(obj[i].summarycontent);
                    $("#td_nsrsbh").html(obj[i].nsrsbh);
                    $("#td_scjydz").html(obj[i].addr);
                    $("#td_hy").html(obj[i].hy);
                    $("#td_djzclx").html(obj[i].zclx);
                    $("#td_zgfj").html(obj[i].swjgmc);
                    $("#td_ssgly").html(obj[i].swgly);
                    $("#td_xfpc").html(obj[i].pcmc);
                    $("#td_fxdl").html(obj[i].dlmc);
                    $("#td_fxxl").html(obj[i].xlmc);
                    $("#td_ydgs").html(obj[i].summary);
                    $("#td_ydje").html(obj[i].taskamount);
                    xlmc = obj[i].xlmc;
                    $("#mxtitle").append(xlmc);
                }
            }
        });
        $("#page-body2").show();
    }


    //    明细超链接查看
    var queryFlag= "";
    var djxhOrNsrmc = "";
    var pcdm = "";
    var tableTitle = "";
    function queryDetail(flag,djxx,pc_dm){
        queryFlag = flag;
        djxhOrNsrmc = djxx;
        pcdm = pc_dm;

        //准备标题

        if(queryFlag=='fdc_01_mx2_htba'){
            tableTitle = "房管局买卖合同备案信息";
        }else if(queryFlag=='fdc_01_mx2_gsyzyj'){
            tableTitle = "国、地税缴纳“销售不动产”相关品目增值税（营业税）信息";
        }else if(queryFlag=='fdc_01_mx2_zkfp'){
            tableTitle = "国税开具“销售不动产”相关发票";
        }else if(queryFlag=='cztdsys_201801_ysxx'){
            tableTitle = "城镇土地使用税土地交易原始信息";
        }else if(queryFlag=='qs_td_201801_ysxx'){
            tableTitle = "契税土地交易原始信息";
        }else if(queryFlag=='gqbg_zz_ysxx'){
            tableTitle = "工商局股权变更原始数据";
        }else if(queryFlag=='gqbg_zz_cfxx'){
            tableTitle = "工商局股权变更拆分信息";
        }else if(queryFlag=='gqbg_zr_ysxx'){
            tableTitle = "工商局股权变更原始数据";
        }else if(queryFlag=='gqbg_zr_cfxx'){
            tableTitle = "工商局股权变更拆分信息";
        }
        $("#tabletitle").html(xlmc+" > "+tableTitle);
        console.log("查询标志："+queryFlag);
        console.log("djxh或nsrmc："+djxhOrNsrmc);
        console.log("批次代码："+pcdm);
        console.log("表格标题："+tableTitle);


        //查询页面数据
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjg/sjcpzx/getheader",
            dataType: 'json',
            data: {'svo.dxmcyw': queryFlag},//对象名称实则为查询标志
            success: function (header) {
                console.log("header："+header);
                var jsonObj = JSON.parse(header);
//                console.log("jsonObj："+jsonObj);
                var jsonStr1 = JSON.stringify(jsonObj);
//                console.log("jsonStr1："+jsonStr1);
                var jsonArr = [];
                for (var i = 0;i<jsonObj.length;i++){
                    jsonArr[i] = jsonObj[i];
                }
//                console.log("jsonArr："+jsonArr);

                //先销毁表格
                $('#taskList_table1').bootstrapTable('destroy');
                $('#taskList_table1').bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjyj/fxjgfk/selectDetails",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            'svo.queryFlag': queryFlag,
                            'svo.djxhOrNsrmc': djxhOrNsrmc,
                            'svo.pcdm': pcdm,
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    singleSelect: true,
                    pageSize: 10, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    onlyInfoPagination: false,
//                    buttonsAlign: 'right', //按钮对齐方式
                    toolbar: '#toolbar',
                    toolbarAlign: 'right',
                    paginationLoop: true,
                    clickToSelect: true, //是否启用点击选中行
                    sidePagination: 'server',
                    columns: jsonArr
                });
                $('#page-body2').hide();
                $('#page-body3').show();
            }
        });
    }
    //返回按钮
    function returndiv1() {
        $('#page-body1').show();
        $('#page-body2').hide();
    }
    //返回按钮
    function returndiv2() {
        $('#page-body2').show();
        $('#page-body3').hide();
    }

    //按照纳税人名称查询
    function searchlist() {
        //获取下发批次
        var zsfjs=$("#zsfj").val().substring(0, 7);
        var nsrmc = $("#nsrmc").val();
        var nsrsbh = $("#nsrsbh").val();
        var fxdl = $("#fxdl").val();
        var xfpc = $("#xfpc").val();
        var fxxl = $("#getfxxl").val();
        var ks = $("#ks").val();
        if(ks!=null&&ks!=0){
            zsfjs=ks;
        }
        console.log("税务机关代码："+zsfjs+",下发批次："+xfpc+",分析大类："+fxdl+",分析小类："+fxxl+",纳税人名称："+nsrmc+",纳税人识别号："+nsrsbh);
        inittabs(xfpc, fxdl, fxxl, nsrmc, nsrsbh,zsfjs);
    }

    //    导出数据
    function exportToExcel(){
//        var filename = $("#tabletitle").val();
        console.log("filename："+tableTitle);
        <%--window.location.href = "${pageContext.request.contextPath}/sjyj/fxjgdc/exportToExcel?filename="+filename+"&svo.queryFlag="+queryFlag+"&svo.djxhOrNsrmc="+djxhOrNsrmc+"&svo.pcdm="+pcdm;--%>
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/fxjgdc/exportToExcel",
            dataType: 'json',
            data: {
                'svo.queryFlag': queryFlag,
                'svo.djxhOrNsrmc': djxhOrNsrmc,
                'svo.pcdm': pcdm,
                'svo.fileName': tableTitle
            },
            success: function (msg) {
                alert(msg);
            }
        });
    }

</script>
