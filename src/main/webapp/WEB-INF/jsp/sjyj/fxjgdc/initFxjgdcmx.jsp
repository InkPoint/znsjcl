<%--
  Created by IntelliJ IDEA.
  User: win7
  Date: 2018/7/4
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分析结果导出明细</title>
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
<div class="page-body" id="page-body">
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span id="tabletitle" class="widget-caption"></span>
                </div>
                <div id="toolbar" hidden="hidden" class="hidden-print">
                    <button onclick="exportToExcel()" type="button" class="btn btn-default"><i class="glyphicon glyphicon-export"></i>导出</button>
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
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
</html>
<script type="text/javascript">

    //先获取到页面传递来的值
    var queryFlag = "${param.queryFlag}";
    var djxhOrNsrmc = "${param.djxhOrNsrmc}";
    var pcdm = "${param.pcdm}";
    var tableTitle = "";
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
    console.log("查询标志："+queryFlag);
    console.log("djxh或nsrmc："+djxhOrNsrmc);
    console.log("批次代码："+pcdm);
    console.log("表格标题："+tableTitle);
    $("#tabletitle").html(tableTitle);
    //初始化
    $(function () {
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
            }
        });

        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/fxjgdc/selectDetails",
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
            toolbar: '#toolbar',
            buttonsAlign: 'right', //按钮对齐方式
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "nsrmc", //每一行的唯一标识，一般为主键列
//            showToggle: "true", //切换视图
//            showColumns: 'true', //是否显示内容列下拉框
            sidePagination: 'server',
            columns: jsonArr
        });
    });

    //    导出数据
    function exportToExcel(){
        console.log("导出数据传递的数据查询路径："+cxlj);
        console.log("导出数据传递的产品ID："+dxmcyw);
        var qsj = $("#qsjdate").val();
        var zsj = $("#zsjdate").val();
        window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/exportToExcel?cpmc="+cpmcs+"&svo.cpcxjb="+cxlj+"&svo.qsj="+qsj+"&svo.zsj="+zsj+"&svo.cpid="+dxmcyw;
    }

</script>
