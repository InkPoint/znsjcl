<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/2
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>demo导出状况统计</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.js"></script>
    <script src="${ctx}/assets/js/bootstrap-editable.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
    <script src="${ctx}/static/js/jquery.ts.js"></script>
    <script src="${ctx}/assets/js/util.js"></script>

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/js/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/weather-icons.min.css" />

    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/demo.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/typicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/animate.min.css" />

    <script src="${ctx}/assets/js/skins.min.js"></script>
    <!--Beyond Scripts-->
    <script src="${ctx}/assets/js/beyond.min.js"></script>
    <%--Select2--%>
    <script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
    <!--时间-->
    <link rel="stylesheet" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
    <script src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
    <script src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${ctx}/assets/js/datetime/bootstrap-datepicker.js"></script>

<%--导出插件--%>
    <script src="${ctx}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script><%--导出插件 表格导出初始化--%>
    <script src="${ctx}/assets/js/bootstrap-table-develop/tableExport.js"></script><%--导出插件 表格导出执行--%>
    <%--页面提交数据--%>
    <script src="${ctx}/static/js/jquery.ts.js"></script>
    <script src="${ctx}/assets/js/util.js"></script>

    <%--文件上传插件--%>
    <script src="${ctx}/assets/js/util.js"></script>
    <script src="${ctx}/assets/js/fileinput/fileinput.js"></script>
    <script src="${ctx}/assets/js/fileinput/zh.js"></script>

    <!--table-->
   <%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/bootstrap-table/bootstrap-table-zh-CN.js"></script>--%>

</head>
<body>
<h1>demo导出状况统计...</h1>
<!-- 装载容器开始 -->
<div class="loading-container">
    <div class="loading-progress">
        <div class="rotator">
            <div class="rotator">
                <div class="rotator colored">
                    <div class="rotator">
                        <div class="rotator colored">
                            <div class="rotator colored"></div>
                            <div class="rotator"></div>
                        </div>
                        <div class="rotator colored"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
        <div class="rotator"></div>
    </div>
</div>
<!-- Page Body -->
<div class="page-body">
    <div id="condition" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <!--小部件标题-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">交换id:</td>
                            <td ><input id="jhid" type="text" class="form-control" placeholder="交换id" style="width: 200px;"></td>
                            <td style="vertical-align:middle;width: 3cm;">交换时间起:</td>
                            <td>
                                <div class="col-sm-2" style="width: 200px;">
                                    <div id="jhsjbegin" style="width: 100%;"
                                         class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
                                        <input class="form-control" style="width: 100%;" type="text" value=""/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                    </div>
                                </div>
                            </td>
                            <td style="vertical-align:middle;width: 3cm;">交换时间止:</td>
                            <td>
                                <div class="col-sm-2" style="width: 200px;">
                                    <div id="jhsjend" style="width: 100%;"
                                         class="input-group date form_date col-md-5" data-date=""
                                         data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">
                                        <input class="form-control" style="width: 100%;" type="text" value=""/>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="6">
                                <button type="button" class="btn btn-info" onclick="selectList()" style="width: 2cm;">执行查询</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-info btn-block" onclick="gobacks()" style="width: 2cm;">返&nbsp;&nbsp;回</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Widget Body-->
            </div>
            <!--Widget-->
        </div>
    </div>
    <div id ="querys" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button type="button" class="btn btn-primary btn-primary" onclick="ckxx()">
                            <i class="glyphicon glyphicon-search"></i>
                            查看
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-primary btn-info" style=""  onclick="dcsj()">
                            <i class="glyphicon glyphicon-share-alt"></i>
                            导出
                        </button>
                        &nbsp;
                    </div>
                    <!---------------------------------------数据表容器------------------------------------------>
                    <table id="taskList_table" class="table table-striped table-bordered table-hover" data-height="570" style="white-space: nowrap"></table>
                </div>
                <div class="widget-body">
                    <table class="table   table-bordered table-hover" id="mytab"></table>
                </div>
            </div>
        </div>
    </div>
    <div id="add" class="row" style="display: none;">
        <div class="col-sm-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">添加信息</span>
                    <div class="widget-buttons">
                        <a href="#" data-toggle="maximize">
                            <i class="fa fa-expand"></i>
                        </a>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-minus"></i>
                        </a>
                        <a href="#" data-toggle="dispose" onclick="javascrip:history.go(-1)">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                    <!--小部件按钮-->
                </div>
                <!--------------->
                <div class="ibox-content" style="height: 755px;">
                    <form id="editForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">纳税人名称</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_nsrmc" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">管理代码</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_gldm" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">创建时间</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_cjsj" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">法人</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_fr" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-1 col-sm-offset-5">
                                <button type="button" class="btn btn-info btn-block" onclick="addsaves()">保存</button>
                            </div>
                            <div class="col-sm-1 ">
                                <button type="button" class="btn btn-info btn-block" onclick="showmains()">返回</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!------------------------>
            </div>
        </div>

    </div>
</div>

</body>
</html>
<script>

    $(function(){
        <!--初始化-->
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
        initTable();
    });

    <!-- 分页 初始化 查询table数据-->
    function initTable(jhid,jhsjq,jhsjz){
             $('#mytab').bootstrapTable('destroy');
             $('#mytab').bootstrapTable({
                 url:'${pageContext.request.contextPath}/demos/demoDczktj/list',

                 queryParams: function (params) {
                     return {
                         'svo.jhid': jhid,
                         'svo.jhsjq': jhsjq,
                         'svo.jhsjz': jhsjz,
                          offset: (params.offset / params.limit) + 1,
                          limit: params.limit
                     }
                 },
                 sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
                 pagination:true, //是否分页
                 singleSelect: true,
                 pageNumber: 1, //初始化加载第一页，默认第一页
                 buttonsAlign: 'right', //按钮对齐方式
                 pageSize: 5, //每页的记录行数
                 pageList: [10, 20, 30, 50], //可供选择的每页行数
                 onlyInfoPagination: false,
                 toolbar: '#toolbar',
                 paginationLoop: true,
                 uniqueId: 'RN',
                 clickToSelect: true, //是否启用点击选中行
                 uniqueIS: "ppmxmc", //每一行的唯一标识，一般为主键列
                 showToggle: false, //切换视图
                 showColumns: false, //是否显示内容列下拉框
                 /*//导出
                 showExport: true,//是否显示导出按钮
                 exportTypes:['excel'], //导出文件类型
                 exportDataType:'all', //导出表格方式   默认: 只导出当前页面表格数据   all 导出所有数据   selected 导出选中的数据
                 Icons:'glyphicon-export', //导出按钮图标的设置glyphicon-export*/
                 columns: [

                    {
                        field: 'jhid',
                        align: 'center',
                        title: '交换id',
                        width:'20%'
                    }, {
                        field: 'sjl',
                        align: 'center',
                        title: '数据量' ,
                        width:'20%'
                    }, {
                        field: 'jhsj',
                        align: 'center',
                        title: '导出时间'       ,
                        width:'20%'  ,
                        formatter:function(value,row,index){
                            return  row.jhsj.toString();                                                                                                                                                                     /*"<a href=\"#\" name=\"jhsj\" data-type=\"text\" data-pk=\""+row.id+" data-title=\"导出时间\">"++"</a>";*/
                        }
                    }]

            });
        }
    <!--查询个数-->
    function selectNum(){
        //获取 文本框的value
        var jhid = $("#jhid").val().trim();
        var jhsjq = $("#jhsjbegin").find("input").val();
        var jhsjz = $("#jhsjend").find("input").val();
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: {
                'svo.jhid': jhid,
                'svo.jhsjq': jhsjq,
                'svo.jhsjz': jhsjz
            },
            url: '${pageContext.request.contextPath}/demos/demoDczktj/selectNum',
            success: function (num) {
                $("#zgs").html(num);
            }
        });

    }

    <!--模糊查询-->
    function selectList(){
        //获取 文本框的value
        var jhid = $("#jhid").val().trim();
        var jhsjq = $("#jhsjbegin").find("input").val();
        var jhsjz = $("#jhsjend").find("input").val();

        //传参数查询并更新table
        initTable(jhid,jhsjq,jhsjz);;
    }


</script>