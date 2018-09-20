<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/11/15
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导入任务定制</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--基本样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/weather-icons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>

    <!--风格样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css"/>

    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <%--Select2插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>

    <!--皮肤脚本：在head中，这个脚本用于加载皮肤和支持的脚本-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>

    <!--Beyond Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>

    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <!--table-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/bootstrap-table/bootstrap-table-zh-CN.js"></script>

    <%--页面提交数据--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--表单验证插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</head>
<body>
<!-- Page Body -->
<div class="page-body" id="bxx">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <!--Widget Header-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">任务名称:</td>
                            <td style="width: 6cm;"><input id="rwmcs" type="text" style="width: 150px;"
                                                           class="form-control"></td>
                            <td align="left" style="vertical-align:middle;width: 3cm; ">目标源表:</td>
                            <td>
                                <div class="control-label">
                                    <select id="mbbs" class="js-data-example-ajax" style="width: 150px;">
                                        <option></option>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12" align="center">
                                <button type="button" onclick=" searchlist()" class="btn btn-info" style="width: 2cm;">
                                    执行查询
                                </button>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="height: 45%">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <!--表数据-->
                    <table  id="taskList_table" class="table table-striped table-bordered table-hover" style="white-space: nowrap"
                           data-height="560"></table>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="page-body" id="sjxx" style="display: none">
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
                <div class="widget-body">
                    <%--数据项(表)信息展示--%>
                    <table id="viewtables" class="table table-striped table-bordered table-hover" style="white-space: nowrap"
                           data-height="680"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<!--查看日志模态框-->
<div class="modal fade" id="ckrzModal" tabindex="-1" role="dialog" aria-label="myModalLabel">
    <div class="modal-dialog" style="height: 300px;width: 700px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                   日志详情
                </h4>
            </div>

            <div class="modal-body">
                <form id="editForm" method="post" class="form-horizontal">
                    <table id="rzxx_table"  class="table table-striped table-bordered table-hover" style="white-space: nowrap"></table>
                </form>
            </div>
        </div>
    </div>
</div>

</body>

</html>
<script>
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjjhpage.jsp";
    }

    //保存当前行数据
    var dqhsj = new Array();
    //(数据源表)下拉菜单
    $(function () {
        inittabs();
        insert_rwxj_tb();
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjh/drrwdz/selectYb",
            dataType: 'json',
            success: function (datas) {
                $("#mbbs").select2({
                    data: datas,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

    });

    //初始化表格
    function inittabs(rwmc, mbyb, getdata) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/drrwdz/list",
            pagination: true, //是否分页
            singleSelect: true,
            queryParams: function (params) {
                return {
                    'svo.rwmc': rwmc,
                    'svo.mbb': mbyb,
                    pageSize: params.limit,
                    pageNumber: params.pageNumber,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },

            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [20, 50, 100, 300], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            uniqueId: 'sqid',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sqid", //每一行的唯一标识，一般为主键列
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center'
            }, {
                field: 'rwmc',
                align: 'center',
                title: '任务名称    '
            }, {
                field: 'ybzwm',
                align: 'center',
                title: '数据源表    '
            }, {
                field: 'mbbzwm',
                align: 'center',
                title: '目标源表   '
            }, {
                field: 'zqmc',
                align: 'center',
                title: '执行周期   '
            }, {
                field: 'cjsj',
                align: 'center',
                title: '创建时间  '
            }, {
                field: 'ztmc',
                align: 'center',
                title: '运行状态  '
            }, {
                field: 'name',
                align: 'center',
                title: '执行人  '
            }, {
                field: '',
                align: 'center',
                title: '导入数据查看',
                formatter: function (value, row, index) {
                    return '[<a style="color:#057afd;" href="javascript:void(0);" onclick="myviewdata(\'' + row.dxmcyw + '\')">查看数据</a>]';

                }
            }, {
                field: '',
                align: 'center',
                title: '查看日志',
                formatter: function (value, row, index) {
                    return '[<a style="color:#057afd;" href="javascript:void(0);" onclick="ckxq(\'' + row.jobid + '\')">日志详情</a>]';
                }
            }
            ],
            data: getdata
        });

    }

    //查找(将搜索栏条件全部发送到后台)
    function searchlist() {
        //获取任务名称
        var rwmc = $("#rwmcs").val();
        //获取目标源表
        var mbb = $("#mbbs").val();
        //获取申请时间
        inittabs(rwmc, mbb);
    }


    //查看上传文件数据
    function myviewdata(dxmcyws) {
        var dxmcyw = dxmcyws;
        viewthedata(dxmcyw);
    }
    //查看数据
    function viewthedata(dxmcyws) {
        $('#sjxx').show();
        $('#bxx').hide();

        //销毁表格
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/sjdxgl/getheader",
            dataType: 'json',
            data: {'svo.dxmcyw': dxmcyws},
            success: function (header) {
                $("#viewtables").bootstrapTable('destroy');
                $("#viewtables").bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjzd/sjdxgl/viewthedata",
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            'svo.dxmcyw': dxmcyws,
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                    singleSelect: true,//设置为true 禁止多选
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 15, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    columns: header
                });
            }
        });
    }

    //日志详情
    function ckxq(ckxq) {
        insert_rwxj_tb(ckxq);
        $('#ckrzModal').modal('show');

    }

    function xsModel(){
        $('#bxx').show();
        $('#sjxx').hide();
    }



</script>



<script>

    function insert_rwxj_tb(jobids) {
        //先销毁表格
        $('#rzxx_table').bootstrapTable('destroy');
        $('#rzxx_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/drrwjk/selectRz",
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            toolbar: '#toolbars',
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            queryParams: function (params) {
                return {
                    'svo.jobid': jobids,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            onlyInfoPagination: false,
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                width: 40,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'rwmc',
                    align: 'center',
                    title: '任务名称'
                }, {
                    field: 'sctime',
                    align: 'center',
                    title: '上次开始执行时间'
                }, {
                    field: 'scjstime',
                    align: 'center',
                    title: '上次执行结束时间'
                }


            ]
        });
    }


</script>
