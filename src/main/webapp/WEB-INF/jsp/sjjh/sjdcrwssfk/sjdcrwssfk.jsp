<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2017/10/27
  Time: 16:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>任务实施反馈</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--基本样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
          rel="stylesheet"/>
    <link id="bootstrap-rtl-link" href="" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/weather-icons.min.css"/>

    <!--风格样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css"/>
    <link id="skin-link" href="" rel="stylesheet" type="text/css"/>

    <style>
        .page-main .item-active {
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            transform: translate3d(0, -2px, 0);
        }
    </style>
</head>
<body>


<!-- Page Body -->
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <!--Widget Header-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td colspan="12">
                                <form id="editForm" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-1 control-label" style="text-align: left;width: 2.5cm;">申请标题:</label>

                                        <div class="col-sm-2" style="width: 150px;">
                                            <input id="searchbt" align="left" type="text" class="form-control"
                                                   placeholder="请输入标题">
                                        </div>
                                    </div>
                                </form>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="12" align="center">
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="search();">
                                    执行查询
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
                    <table id="table"class="table table-striped table-bordered table-hover" ></table>
                </div>
            </div>
        </div>
    </div>
</div>

        <!-------------------------任务实施细节模态框（开始）---------------------------->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    任务实施细节
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="EditData" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">分区名称:</label>

                            <div class="col-sm-5">
                                <input type="text"  name="jyname" class="form-control" id="tjfqmc"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">分区描述:</label>

                            <div class="col-sm-5">
                                <input type="text" name="yzfq" class="form-control" id="tjfqms"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="tjbz"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" onclick="tjbc()">保存</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>
        <!-------------------------任务实施细节模态框(结束)---------------------------->
</body>

<!--Basic Scripts-->
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${ctx}/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>

<!--时间-->
<link rel="stylesheet" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
<script type="text/javascript" src="${ctx}/assets/js/bootstrap-datetimepicker.fr.js"></script>
<script type="text/javascript" src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctx}/assets/js/datetime/bootstrap-datepicker.js"></script>

<!--皮肤脚本：在head中，这个脚本用于加载皮肤和支持的脚本-->
<script type="text/javascript" src="${ctx}/assets/js/skins.min.js"></script>

<!--Beyond Scripts-->
<script src="${ctx}/assets/js/beyond.min.js"></script>

<!--table-->
<link rel="stylesheet" href="${ctx}/assets/css/bootstrap-table.css"/>
<script type="text/javascript" src="${ctx}/assets/js/bootstrap-table.js"></script>
<script src="${ctx}/assets/js/bootstrap-editable/bootstrap-table-editable.js"></script>
<script type="text/javascript" src="${ctx}/assets/js/bootstrap-table/bootstrap-table-zh-CN.js"></script>

</html>
<script type="text/javascript">
    //加载任务实施细节模态框






    /*新增任务实施细节*/
    function xz() {
        var rwssxjsqid = $("#scsqid").val();
        var insertbz = $("#insertbz").val();
        if (insertRow != null && "" != insertRow) {
            var parms = {sqid: rwssxjsqid, bz: insertbz};
            //提交url
            var myurl1 = "${pageContext.request.contextPath}/sjjh/sjdcrwssfk/insertRwssjx";
            //成功方法
            var myfunctions1 = function (msg) {
                console.log("success-->" + JSON.stringify(msg))
                $('#table1').bootstrapTable("destroy");
                initrwssxjbootstrap(msg);
            }
            //提交数据
            $.myajax.common("post",
                    parms,
                    myurl1,
                    myfunctions1
            );
        }
    }

    /*点击任务实施细节提交按钮 关闭按钮后隐藏模态框*/
    function savedata() {
        $("#add").modal('hide');
    }

    /*关闭模态框后刷新页面*/
    $("#add").on('hidden.bs.modal', function () {
        search();
    });

    /*保存任务进度*/
    function savewcjd() {

        var sqid = $.trim($("#editsqid").val());
        var wcjd = $.trim($("#editwcjd").val());
        var parms = {editsqid: sqid, editwcjd: wcjd};
        //提交url
        var myurl1 = "${pageContext.request.contextPath}/sjjh/sjdcrwssfk/saveWcjdData";
        //成功方法
        var myfunctions1 = function (msg) {
            $('#table').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parms,
                myurl1,
                myfunctions1
        );
        $('#myModal').modal('hide');
    }


    /*获取页面数据*/
    function getTableData(ssqbt, ssqsjbegin, ssqsjend) {
        var parmssss = {sqbt: ssqbt, sqsjbegin: ssqsjbegin, sqsjend: ssqsjend};
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjh/sjdcrwssfk/getTableData";
        //成功方法
        var myfunctions = function (msg) {
            $('#table').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parmssss,
                myurl,
                myfunctions
        );

    }

    /*初始化页面bootstrap*/
    function initbootstrap(getdata) {
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
//           search: true, //是否启用搜素
//           showRefresh: true, //刷新按钮
//           showPaginationSwitch: true,
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            //sidePagination: "client",//表示客户端请求
            toolbar: '#toolbar',
            paginationLoop: true,
            uniqueId: 'sqid',
            uniqueIS: "sqid", //每一行的唯一标识，一般为主键列
//           showToggle: "true", //切换视图
//           showColumns: 'true', //是否显示内容列下拉框
            clickToSelect: true, //是否启用点击选中行
            columns: [{
                field: 'id',
                checkbox: true,
                align: 'center'

            }, {
                field: 'rwmc',
                align: 'center',
                title: '申请标题 '


            }, {
                field: 'rwsm',
                align: 'center',
                title: '申请内容'

            }, {
                field: 'cjsj',
                align: 'center',
                title: '申请时间'

            }, {
                field: 'jzrq',
                align: 'center',
                title: '处理截止日期'

            }, {
                field: 'shyj',
                align: 'center',
                title: '审核意见',
                formatter: function (value, row, index) {
                    if (row.xyhjid == 999999) {
                        return '审核通过';
                    } else if (row.xyhjid == 101100 || row.xyhjid == 102100 || row.xyhjid == 103100 || row.xyhjid == 104100) {
                        return '审核不通过';
                    } else {
                        return '未审核';
                    }
                }
            }, {
                field: 'bz',
                align: 'center',
                title: '任务实施细节 ',
                sortatable: true,
//                formatter: function (value, row, index) {
//                    return '<a href="#" data-toggle="modal"  data-target="#add"   onclick="rwssxj(' + row.sqid + ')">' + value + '</a>';
//                }
                formatter: function (value, row, index) {
                    return '<a style="color:#057afd;" onclick="rwssxj(' + row.rwid + ')">查看</a>';
                }
            }, {
                field: 'wcjd',
                align: 'center',
                title: '完成进度(%)',
                // sortatable: true,
                formatter: function (value, row, index) {
                    return '<a href="#" data-toggle="modal"  data-target="#myModal"   onclick="editwcjd(' + row.sqid + ',' + row.wcjd + ')">' + value + '</a>';

                }

            }], data: getdata
        });

        initdate();
    }

    //初始化时间插件
    function initdate() {
        $("#sqsjbegin").datetimepicker({
            minView: "month",
            format: "yyyy-mm-dd",
            todayBtn: true,
            autoclose: true
        });
        $("#sqsjend").datetimepicker({
            minView: "month",
            format: "yyyy-mm-dd",
            todayBtn: true,
            autoclose: true
        });
    }




</script>