<%--
  Created by IntelliJ IDEA.
  User: cuihegn
  Date: 2018/8/20
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>不动产查询</title>
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
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
</head>
<body>
<div class="page-body" id="bxx">
    <div class="page-body">
        <div class="row" id="xx">
            <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                <div class="widget">
                    <div class="widget-header bg-blue">
                        <span class="widget-caption">查询条件</span>
                    </div>
                    <div class="widget-body">
                        <table class="table">
                            <tr>
                                <td style="vertical-align:middle; width: 2cm">产权人姓名:</td>
                                <td style="width: 22cm;">
                                    <input id="cqr" type="text" class="form-control" style="width: 180px;">
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="12">
                                    <button type="button" class="btn btn-info" onclick="searchlist()">执行查询</button>
                                    &nbsp;
                                    <button onclick="window.location.href='${ctx}/main/homepage/sjyjpage'" type="button"
                                            class="btn btn-info " style="width: 2cm">返回
                                    </button>
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
                    <div class="widget-header ">
                        <span class="widget-caption">查询结果</span>
                    </div>
                    <div class="widget-body">
                        <div id="toolbar">
                            <button type="button" class="btn btn-info btn-sm" onclick="wjdc()">
                                <i ></i>
                                文件导出
                            </button>
                            <span style="color: #ff0000;font-size: 18px">说明：本功能最多导出10000条数据!</span>
                        </div>
                        <table id="mytab" class="table-striped" data-height="400"></table>
                    </div>
                    <div class="widget-body">
                        <table id="taskList_table" class="table table-striped table-bordered table-hover"  style="white-space: nowrap" data-height="580"></table>
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

<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script type="text/javascript">

    //初始化
    $(function () {
        //初始化表格
        inittabs();
    });


    function inittabs(cqr) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/bdccx/selectlist",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    'svo.cqr': cqr,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [50, 100, 200, 500], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
    //        uniqueIS: "nsrmc", //每一行的唯一标识，一般为主键列
//            showToggle: "true", //切换视图
//            showColumns: 'true', //是否显示内容列下拉框
            sidePagination: 'server',
            columns: [

                {
                    field: 'XH',
                    align: 'center',
                    title: '序号'
                }, {
                    field: 'DH',
                    align: 'center',
                    title: '幢号'
                }, {
                    field: 'DY',
                    align: 'center',
                    title: '单元'
                }, {
                    field: 'C',
                    align: 'center',
                    title: '层'
                }, {
                    field: 'FH',
                    align: 'center',
                    title: '房号'
                }, {
                    field: 'CQZH',
                    align: 'center',
                    title: '产权证号'
                }, {
                    field: 'CQR',
                    align: 'center',
                    title: '产权人（最新）'
                },{
                    field: 'GYQK',
                    align: 'center',
                    title: '共有情况'
                },
                {
                    field: 'FWZL',
                    align: 'center',
                    title: '房屋坐落'
                },{
                    field: 'SPFCSDJSJ',
                    align: 'center',
                    title: '商品房初始登记时间'
                },{
                    field: 'SPFZYDJSJ',
                    align: 'center',
                    title: '商品房转移登记时间'
                },{
                    field: 'ESFZYDJSJ',
                    align: 'center',
                    title: '二手房转移登记时间（最新）'
                },{
                    field: 'SPFJYJE',
                    align: 'center',
                    title: '商品房交易金额'
                },{
                    field: 'ESFJYJE',
                    align: 'center',
                    title: '二手房交易金额（最新）'
                },{
                    field: 'FWLY',
                    align: 'center',
                    title: '房屋来源'
                },{
                    field: 'FWYT',
                    align: 'center',
                    title: '房屋用途'
                },{
                    field: 'JZJG',
                    align: 'center',
                    title: '建筑结构'
                },{
                    field: 'JZMJ',
                    align: 'center',
                    title: '建筑面积'
                },{
                    field: 'SPFWQMSR',
                    align: 'center',
                    title: '商品房网签买受人'
                },{
                    field: 'SPFWQBASJ',
                    align: 'center',
                    title: '商品房网签备案时间'
                },{
                    field: 'CQR_DJXH',
                    align: 'center',
                    title: '产权人登记序号'
                },{
                    field: 'MSR_DJXH',
                    align: 'center',
                    title: '买受人登记序号'
                }

            ]
        });
    }

     //查询
    function searchlist(){
        //获取产权人姓名
        var cqr =$("#cqr").val();
        inittabs(cqr);

    }


    //文件导出
    function wjdc(){
        var cqr =$("#cqr").val();
        window.location.href = "${pageContext.request.contextPath}/sjyj/bdccx/sjdc?svo.cqr="+cqr+"";
    }



</script>
