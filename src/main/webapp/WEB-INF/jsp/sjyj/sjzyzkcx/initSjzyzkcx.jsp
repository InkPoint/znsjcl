<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/11/28
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据资源状况统计</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
</head>
<body>
<div class="page-body" id="pagdiv">
    <div class="row" >
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget  panel panel-default">
                <div class="widget-header bg-blue panel-heading" role="tab" id="headingTwo">
                    <%--<span class="widget-caption">查询条件</span>--%>
                    <h4 class="panel-title" align="left">
                        <a class="widget-caption" role="button" data-toggle="collapse" data-parent="#accordion"
                           href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"
                           style="font-size: 14px; text-decoration: none">
                            查询条件&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
                        </a>
                    </h4>
                </div>
                <div id="collapseTwo" class="widget-body panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="headingTwo">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm; ">部门名称:</td>
                            <td style="width: 6cm;"><input id="dwmc" type="text" style="width: 150px;"
                                                           class="form-control"></td>
                            <td style="vertical-align:middle; width:3cm;">表名称:</td>
                            <td style="width: 200px"><input class="form-control" style="width: 150px;" id="zybm"></td>
                            <td style="vertical-align:middle; width:3cm;">数据级别:</td>
                            <td style="width: 200px">
                                <%--<input class="form-control" style="width: 150px;" id="sjjb">--%>
                                <select class="form-control" style="width: 150px;" id="sjjb">
                                    <option></option>
                                </select>
                            </td>
                            <td style="vertical-align:middle;width: 3cm;">数据来源:</td>
                            <td>
                                <select class="form-control" style="width: 150px;" id="sjly">
                                    <option></option>
                                </select>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <%--<button type="button" class="btn btn-info" onclick="searchlist()">执行查询</button>--%>
                                <a class="btn btn-info" role="button" data-toggle="collapse" href="#collapseTwo"
                                   aria-expanded="flase" aria-controls="collapseTwo" onclick="searchlist()">
                                    执行查询
                                </a>
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
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询结果(共有数据: <span id="zgs"></span> 类)</span>
                </div>
                <div class="widget-body">
                    <table id="resultTable" class="table table-striped table-bordered table-hover" data-height="515">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--查看数据项_模态框(Modal)--%>
<div class="modal fade" id="viewdata" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 900px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    查看数据项
                </h4>
            </div>
            <div class="modal-body">
                <%--数据项(表)信息展示--%>
                <table id="tablemodal1" class="table table-striped table-bordered table-hover"
                       style="white-space: nowrap; overflow-y: auto" data-height="420">
                </table>
            </div>
            <%--<div class="modal-footer">--%>
            <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<%--end 查看数据项模态框--%>
<%--数据查看--%>
<div class="page-body" id="ckdiv" style="display: none">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <div style="margin-right: 98%;padding-top: 4px;padding-bottom: 3px" >
                        <button onclick="xsModel()" type="button" class="btn btn-info btn-block"
                                style="width: 2cm; ">返回
                        </button>
                    </div>
                </div>
                <div class="widget-header">
                    <span class="widget-caption" id="checkTableHead"></span>
                    <%--<button class="btn btn-default" onclick="returndiv()">返回</button>--%>
                    <button type="button" class="close" onclick="returndiv()" style="width: 35px;height: 35px"><span
                            aria-hidden="true">&times;</span></button>
                </div>           <table id="myviewtables" class="table table-striped table-bordered table-hove"
                                        style="white-space: nowrap" data-height="585"></table>
                <%--<div align="center">--%>
                <%--<button class="btn btn-info" onclick="returndiv()">返回</button>--%>
                <%--
            <div class="widget-body">
                <table id="myviewtables" class="table table-striped table-bordered table-hove"
                       style="white-space: nowrap" data-height="585"></table>
</div>--%>
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
<!--TreeSelect 树形选择框-->
<script src="${pageContext.request.contextPath}/public/css/TreeSelect/scripts/boot.js" type="text/javascript"></script>
</html>
<script>

    //查看数据返回事件
    function xsModel(){
        $('#pagdiv').show();
        $('#ckdiv').hide();
    }



    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjyjpage.jsp";
    }
    $(function () {
        //数据级别下拉框
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '${pageContext.request.contextPath}/sjyj/sjzyzkcx/sjjbsel',
            success: function (sjjbdata) {
                $("#sjjb").select2({
                    data: sjjbdata,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //数据来源下拉框
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '${pageContext.request.contextPath}/sjyj/sjzyzkcx/sjlysel',
            success: function (sjlydata) {
                $("#sjly").select2({
                    data: sjlydata,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        inittabs();
        selectTableNums();
    });
    //    查询有多少类数据
    function selectTableNums() {
        var r_dwmc = $("#dwmc").val().trim();
        var r_zybm = $("#zybm").val().trim();
        var r_sjjb = $("#sjjb").find("option:selected").text();
        var r_sjly = $("#sjly").find("option:selected").text();
        console.log("1.部门名称：" + r_dwmc + "2.中文表名：" + r_zybm + "3.数据级别：" + r_sjjb + "4.数据来源：" + r_sjly);
        //查询总个数
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: {
                'svo.dwmc': r_dwmc,
                'svo.zybm': r_zybm,
                'svo.sjjb': r_sjjb,
                'svo.sjly': r_sjly
            },
            url: '${pageContext.request.contextPath}/sjyj/sjzyzkcx/sjzl',
            success: function (sjzl) {
                $("#zgs").html(sjzl);
            }
        });
    }
    function returndiv() {
        $('#ckdiv').hide();
        $('#pagdiv').show();
    }
    function inittabs(dwmcs, zwbms, jbids, sjlys) {
        //先销毁表格
        $('#resultTable').bootstrapTable('destroy');
        $('#resultTable').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/sjzyzkcx/selectAll",//获取数据的Select地址
//            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: {
                'svo.dwmc': dwmcs,
                'svo.zwbm': zwbms,
                'svo.sjjb': jbids,
                'svo.sjly': sjlys
            },
            search: false, //是否启用搜素
            showRefresh: false, //刷新按钮
            showPaginationSwitch: false,
            pagination: false, //是否分页
            singleSelect: true,
//            pageNumber: 1, //初始化加载第一页，默认第一 页
            buttonsAlign: 'center', //按钮对齐方式
//            pageSize: 10, //每页的记录行数
//            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            paginationLoop: true,
//            uniqueIS: "swjg_dm", //每一行的唯一标识，一般为主键列
            clickToSelect: false, //是否启用点击选中行
            showToggle: false, //切换视图
            showColumns: false, //是否显示内容列下拉框
//            queryParamsType:'limit',
            columns: [{
                field: 'dwmc',
                align: 'center',
                title: '部门名称',
                halign: 'center'
            }, {
                field: 'zywbm',
                align: 'left',
                title: '中英文表名',
                halign: 'center'
            }, {
                field: 'sjl',
                align: 'right',
                title: '数据量',
                halign: 'center'
            }, {
                field: 'ppsl',
                align: 'right',
                title: '匹配数量',
                halign: 'center'
            }, {
                field: 'ppl',
                align: 'right',
                title: '匹配率',
                halign: 'center'
            }, {
                field: 'ppsjx',
                align: 'left',
                title: '匹配数据项',
                halign: 'center'
            }, {
                field: 'tjsj',
                align: 'right',
                title: '最新获取时间',
                halign: 'center'
            }, {
                field: 'sjly',
                align: 'left',
                title: '数据来源',
                halign: 'center'
            }, {
                field: 'cz',
                align: 'center',
                width: 250,
                title: '操作 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-link" data-toggle="modal" data-target="#viewdata" onclick="viewdataitems(\'' + row.ywbm + '\')">查看字段</button>' +
                            '<button type="button" class="btn btn-link" onclick="formwork(\'' + row.ywbm + '\',\'' + row.zwbm + '\')">生成模板</button>' +
                            '<button type="button" class="btn btn-link" onclick="myviewybdata(\'' + row.ywbm + '\',\'' + row.ppsjx + '\',\'' + row.zywbm + '\')">查看数据</button>';
                }
            }]
        });
    }
    //模糊查询
    function searchlist() {
        //获取单位名称
        var dwmc = $("#dwmc").val().trim();
        //中文表名
        var zwbm = $("#zybm").val().trim();
        //数据级别
        var sjjb = $("#sjjb").find("option:selected").text();
        //获取数据来源选择项
        var sjly = $("#sjly").find("option:selected").text();

        inittabs(dwmc, zwbm, sjjb, sjly);
        selectTableNums();
    }
    //查看数据项   查看字段
    function viewdataitems(ywbms) {
        viewdata(ywbms);
    }
    //查看数据     查看数据
    function myviewybdata(ywbms, ppsjx, zywbm) {
        console.log("英文表名称：" + ywbms);
        console.log("匹配数据项：" + ppsjx);
        console.log("中英文表名：" + zywbm);
        $('#checkTableHead').html('查看数据>' + zywbm);
        $('#ckdiv').show();
        $('#pagdiv').hide();
        //销毁表格
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/sjzyzkcx/getybheader",
            dataType: 'json',
            data: {'svo.ywbm': ywbms},
            success: function (header) {
                $("#myviewtables").bootstrapTable('destroy');
                $("#myviewtables").bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjyj/sjzyzkcx/viewtabledata",
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            'svo.ywbm': ywbms,
                            'svo.ppsjx': ppsjx,
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                    singleSelect: true,//设置为true 禁止多选
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 12, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    columns: header
                });
            }
        });


        <%--$.ajax({--%>
        <%--type:'post',--%>
        <%--dataType:'json',--%>
        <%--data:{--%>
        <%--'svo.ywbm':ywbms--%>
        <%--},--%>
        <%--url:'${pageContext.request.contextPath}/sjyj/sjzyzkcx/hasywbm',--%>
        <%--success:function(mess){--%>
        <%--console.log("mess"+mess);--%>
        <%--if(mess=='0'){--%>
        <%--alert('原表尚未导入');--%>
        <%--}else{--%>
        <%----%>
        <%--}--%>
        <%--}--%>
        <%--});--%>
    }
    //生成采集模板  生成模板
    function formwork(ywbms, zwbms) {
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: {
                'svo.ywbm': ywbms
            },
            url: '${pageContext.request.contextPath}/sjyj/sjzyzkcx/hasywbm',
            success: function (msg) {
                console.log(msg);
                if (msg == '0') {
                    alert('原表尚未导入');
                } else {
                    window.location.href = "${pageContext.request.contextPath}/sjyj/sjzyzkcx/formworkData?svo.ywbm=" + ywbms + "&filename=" + zwbms;
                }
            }
        });

    }
    //查询数据项表出结果
    function viewdata(ywbms) {
        //先销毁表格
        $('#tablemodal1').bootstrapTable('destroy');
        //初始化表格，动态从服务器加载数据
        $('#tablemodal1').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/sjzyzkcx/sjxList",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(服务器端处理分页)
//            pagination: true, //是否分页
            queryParams: {'svo.sjdxmcyw': ywbms},
//            queryParams: function (params) {
//                return {
//                    'svo.sjdxmcyw': ywbms,
//                    offset: (params.offset / params.limit) + 1,
//                    limit: params.limit
//                }
//            },
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
//            pageSize: 10, //每页的记录行数
//            pageList: [10, 20, 30, 50], //可供选择的每页行数
//            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
//            uniqueIS: "sjxid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
            columns: [{
                field: 'sjxmczw',
                align: 'center',
                title: '数据项中文名'
            }, {
                field: 'sjxmcyw',
                align: 'center',
                title: '数据项英文名 '
            }]

//            columns: [{
//                field: 'id',
//                checkbox: true,
//                align: 'center'
//            }, {
//                field: 'sjxmczw',
//                align: 'center',
//                title: '数据项中文名'
//            }, {
//                field: 'sjxmcyw',
//                align: 'center',
//                title: '数据项英文名'
//            }, {
//                field: 'sjxlx',
//                align: 'center',
//                title: '字段类型 '
//            }, {
//                field: 'isnulls',
//                align: 'center',
//                title: '是否为空'
//            }, {
//                field: 'iskey',
//                align: 'center',
//                title: '是否主键 '
//            }]
        });
    }
</script>
