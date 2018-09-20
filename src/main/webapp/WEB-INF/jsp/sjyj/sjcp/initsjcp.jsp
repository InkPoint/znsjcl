<%--
  Created by IntelliJ IDEA.
  User: win7
  Date: 2018/1/5
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据产品表</title>
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

    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--时间--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <%--Select2--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
    <%--页面提交数据--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <%--表单验证插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
    <!--时间-->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datetime/bootstrap-datepicker.js"></script>
</head>
<body>
<!-- Page Body -->
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <%--widget开始--%>
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm">产品名称:</td>
                            <td>
                                <div class="col-sm-3">
                                    <input id="cpmc" type="text" class="form-control" style="width: 150px">
                                </div>
                            </td>
                            <td style="vertical-align:middle;width: 3cm">产品描述:</td>
                            <td>
                                <div class="col-sm-3">
                                    <input id="cpms" type="text" class="form-control" style="width: 150px">
                                </div>
                            </td>
                            <td style="vertical-align:middle;width: 3cm">创建时间起:</td>
                            <td>
                                <div class="control-label col-sm-3" style="width: 200px">
                                    <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-format="yyyy-mm-dd hh:ii:ss">
                                        <input  id="cjsjbegin" name="cjsjbegin"  style="width: 100%;" value="" placeholder=""/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </td>
                            <td style="vertical-align:middle;width: 3cm">创建时间止:</td>
                            <td>
                                <div class="control-label col-sm-3" style="width: 200px">
                                    <div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd hh:ii:ss" data-link-format="yyyy-mm-dd hh:ii:ss">
                                        <input  id="cjsjend" name="cjsjend"  style="width: 100%;" value="" placeholder=""/>
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button type="button" class="btn btn-info" style="width: 2.5cm" onclick="searchlist()">执行查询</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                    <table id="mytable" class="table-striped" data-height="549"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--View the data modal--%>
<div class="modal fade" id="myview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">查看数据</h4>
            </div>
            <div class="modal-body">
                <table id="viewtable" class="table-striped" data-height="258"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    $(function(){
    //时间插件
        $(".form_date").datetimepicker({
        minuteStep:10,
        minView:0,
        format:"yyyy-mm-dd hh:ii:ss",
        todayBtn:true,
        autoclose:true
        });
        //初始化表格
        inittabs();
    });
    //查询
    function searchlist(){
        //产品名称
        var cpmc = $("#cpmc").val().trim();

        //产品描述
        var cpms = $("#cpms").val().trim();
        //创建的起始时间
        var cjsjbegin = $("#cjsjbegin").val().trim();
        //创建的终止时间
        var cjsjend = $("#cjsjend").val().trim();
        inittabs(cpmc,cpms,cjsjbegin,cjsjend);
    }
    //初始化表格
    function inittabs(cpmcs,cpmss,cjsjbegins,cjsjends){
        //先销毁表格
        $('#mytable').bootstrapTable('destroy');
        $('#mytable').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/sjcp/list",//获取数据的Select地址
            //使用client分页方式，可以加载数据，可以导出【选中】
            //使用server分页方式，数据可以正常加载，但数据只能导出当前页所有的数据，不能导出选中
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.cpmc': cpmcs,
                    'svo.cpms': cpmss,
                    'svo.cjsjbegin': cjsjbegins,
                    'svo.cjsjend': cjsjends,
                   // offset: (params.offset / params.limit) + 1,
                    //limit: params.limit
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
            uniqueIS: "cpid", //每一行的唯一标识，一般为主键列
          //  ueryParamsType: 'limit',
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'

            }, {
                field: 'cpmc',
                align: 'center',
                title: '产品名称'

            }, {
                field: 'cpms',
                align: 'center',
                title: '产品描述'

            }, {
                field: 'cpbt',
                align: 'center',
                title: '产品表头'
            }, {
                field: 'cjrdm',
                align: 'center',
                title: '创建人'
            }, {
                field: 'cjsj',
                align: 'center',
                title: '创建时间'
            },  {
                field: 'view',
                align: 'center',
                title: '查看',
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-info btn-sm" onclick="myviewdata(\'' + row.cpcxjb + '\',\'' + row.cpbt + '\',\'' + row.cpbtzw + '\')" >查看数据</button>';
                }
            }]
        });
    }
    function myviewdata(cpcxjbs,cpbts,cpbtzws){
        //执行脚本
        var cpcxjb=cpcxjbs;
        //表头英文
        var cpbt = cpbts;
        //表头中文
        var cpbtzw = cpbtzws;
        viewtabs(cpcxjb,cpbt,cpbtzw);

    }
    //初始化模型的表格
    function viewtabs(cpcxjbs,cpbts,cpbtzws) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/sjyj/sjcp/colmujson",
            data:{"svo.cpbt":cpbts,"svo.cpbtzw":cpbtzws},
            dataType:'json',
            success:function(data1){
                $('#myview').modal('show');
                //销毁表格
                $('#viewtable').bootstrapTable('destroy');
                //初始化表格，动态从服务器加载数据
                $('#viewtable').bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjyj/sjcp/viewList",//获取数据的Select地址
                    columns: data1,
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: {
                        'svo.cpcxjb': cpcxjbs,
                        'svo.cpbt':cpbts,
                        'svo.cpbtzw':cpbtzws
                    },
                    showExport: true,//是否显示导出按钮
                    singleSelect: true,
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 5, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    paginationLoop: true,//设置为true启用分页条无线循环的功能
                    clickToSelect: true, //是否启用点击选中行
                    onClickRow: function (row, $element) {
                        curRow = row;
                    }

                });
            }
        });


    }
</script>
