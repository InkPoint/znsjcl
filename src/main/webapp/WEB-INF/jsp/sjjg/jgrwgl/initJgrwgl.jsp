<%--
  Created by IntelliJ IDEA.
  User: CuiHeng
  Date: 2018/1/9
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加工任务管理</title>
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
<div class="page-body" id ="bxx">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width: 2cm">任务名称:</td>
                            <td style="width: 22cm;">
                                <input id="rwmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
                                <button onclick="window.location.href='${pageContext.request.contextPath}/main/homepage/sjjgpage'" type="button" class="btn btn-info" style="width: 2cm">返回</button>
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
                    <div id="toolbar">
                        <button type="button" class="btn btn-success btn-sm" onclick="btn_add()">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        &nbsp;
                        <%--<button type="button" id="myEdit" class="btn btn-warning btn-sm">--%>
                            <%--<i class="glyphicon glyphicon-pencil "></i>--%>
                            <%--编辑--%>
                        <%--</button>--%>
                        <%--&nbsp;--%>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                    </div>
                    <table id="taskList_table" class="table table-striped table-bordered table-hover"></table>
                    <!--结束-->
                    <!-------------------------------------------------------------------------------------------->
                    <!--编辑任务模态框-->
                    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-label="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        添加
                                    </h4>
                                </div>

                                    <div class="widget-body" style="width: 100%;height: 65%;">
                                        <form id="editForm1" method="post" class="form-horizontal">

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">任务名称:</label>

                                                <div class="col-sm-4">
                                                    <input id="bjrwmc" type="text" style="width:200px;"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="hr-line-dashed"></div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">任务描述：</label>

                                                <div class="col-sm-4">
                                                    <textarea rows="6" id="bjrwms" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="hr-line-dashed"></div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">加工模型:</label>
                                                <select id="bjjgmx" class="js-data2-example-ajax" style="width: 200px;">
                                                    <option></option>
                                                </select>
                                            </div>
                                            <div class="hr-line-dashed"></div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">执行周期:</label>
                                                <select id="bjzqid" class="js-data2-example-ajax" style="width: 200px;">
                                                    <option></option>
                                                </select>
                                            </div>
                                            <div class="hr-line-dashed"></div>
                                            <div style="text-align: center">
                                                <button type="button" class="btn btn-primary" onclick="xgbc()" data-dismiss="modal">保存</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>


                        </div>

                    </div>
                    <!--结束-->
                </div>
            </div>
        </div>
    </div>
</div>

<!--添加任务模态框-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-label="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    添加
                </h4>
            </div>

            <div class="modal-body">
                <%--<div class="widget-body" style="width: 100%;height: 80%;">--%>
                <form id="editForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">任务名称:</label>

                        <div class="col-sm-4">
                            <input id="tjrwmc" name="tjrwmc" type="text" style="width:200px;"
                                   class="form-control">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">任务描述：</label>

                        <div class="col-sm-4">
                            <input id="tjrwms" name="tjrwms" type="text" style="width:200px;" class="form-control">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">执行周期:</label>

                        <div class="col-sm-5">
                            <select id="tjzqid" name="tjzqid" class="js-data2-example-ajax" style="width: 200px;">
                                <option></option>
                            </select>
                        </div>

                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">加工模型:</label>

                        <div class="col-sm-5">
                            <select id="tjjgmx" name="tjjgmx" class="js-data2-example-ajax"
                                    style="width: 200px;">
                                <option></option>
                            </select>
                        </div>

                    </div>
                    <div class="hr-line-dashed"></div>

                    <div style="text-align: center">
                        <button type="submit" class="btn btn-primary" onclick="tjbc()"
                                data-dismiss="modal">保存
                        </button>
                    </div>
                </form>
                <%--</div>--%>
            </div>
        </div>
    </div>
</div>
<%--查看数据页面--%>
<div class="page-body" id="sjxx" style="display: none;">
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
                    <table id="viewtables" class="table table-striped table-bordered table-hover" data-height="740" style="white-space: nowrap" ></table>
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




    //保存当前行数据
    var dqhsj = new Array();

    //初始化
    $(function () {
        //初始化表格
        inittabs();

        //(加工模型)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjg/jgrwgl/selectMx",
            dataType: 'json',
            success: function (datas1) {
                $("#tjjgmx,#bjjgmx").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        //(执行周期)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjg/jgrwgl/selectZxzq",
            dataType: 'json',
            success: function (datas1) {
                $("#tjzqid,#bjzqid").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //修改模态框
        $("#myEdit").click(function () {
            var allselecteddata = $("#taskList_table").bootstrapTable("getSelections");
                console.log("allselecteddata:",allselecteddata);
            dqhsj = allselecteddata;
            if (allselecteddata.length != 1) {
                alert("请选择一条要编辑的记录!");
            } else {
                $('#myModal1').modal('show');
                //任务名称
                $("#bjrwmc").val(allselecteddata[0].rwmc);
                //任务描述
                $("#bjrwms").val(allselecteddata[0].rwms);
                //加工模型
                $("#bjjgmx").val(allselecteddata[0].jgmx).select2();
                //周期名称
                $("#bjzqid").val(allselecteddata[0].zqid).select2();
                console.log("allselecteddata[0].zqid:",allselecteddata[0].zqid);
            }
        });
    });


    function inittabs(rwmcs) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjg/jgrwgl/selectList",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            queryParams: {
                'svo.rwmc': rwmcs
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
                    field: 'rwmc',
                    align: 'center',
                    title: '任务名称'
                }, {
                    field: 'rwms',
                    align: 'center',
                    title: '任务描述'
                },{
                    field: 'mxmc',
                    align: 'center',
                    title: '加工模型'
                }, {
                    field: 'zqmc',
                    align: 'center',
                    title: '执行周期'
                }, {
                    field: 'kssj',
                    align: 'center',
                    title: '任务开始时间'
                }, {
                    field: 'ztmc',
                    align: 'center',
                    title: '运行状态'
                },{
                    field: 'ywbm',
                    align: 'center',
                    title: '数据查看',
                    formatter: function (value, row, index) {
                        if(value==null){
                            return '-';
                        }else{
                            return '[<a style="color:#057afd;" href="javascript:void(0);" onclick="myviewdata(\'' + row.ywbm + '\')">查看数据</a>]';
                        }
                    }
                }
            ]
        });
    }

    //查看数据
    function myviewdata(dxmcyws) {
        var dxmcyw = dxmcyws;
        viewthedata(dxmcyw);
    }

    //查看数据
    function viewthedata(dxmcyws) {
        $('#bxx').hide();
        $('#sjxx').show();

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

    //关闭弹出页面显示主页面
    function xsModel(){
        $('#bxx').show();
        $('#sjxx').hide();
    }


    //按照纳税人名称查询
    function searchlist() {
        //获取纳税人名称0
        var rwmc = $("#rwmc").val();
        inittabs(rwmc);
    }

    //Modal验证销毁重构
    $("#myModal").on('hidden.bs.modal', function () {
        $("#editForm").data('bootstrapValidator').destroy();
        $("#editForm").data('bootstrapValidator', null);
        formValidator();
    });

    //添加验证
    $(document).ready(function () {
        formValidator();
    });
    //添加任务事件
    function btn_add() {
        $('#myModal').modal('show');
    }
    //添加
    function tjbc() {
        //开启验证
        $("#editForm").data('bootstrapValidator').validate();
        if (!$("#editForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取任务名称
        var rwmc = $("#tjrwmc").val();
        //获取任务描述
        var rwms = $("#tjrwms").val();
        //获取周期id
        var zqid = $("#tjzqid").val();
        //获取加工模型
        var jgmx = $("#tjjgmx").val();
        //提交参数
        var sub = {
            'svo.rwmc': rwmc,
            'svo.rwms': rwms,
            'svo.zqid': zqid,
            'svo.jgmx': jgmx
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjg/jgrwgl/insertRw";
//        //成功方法
        var myfunctions = function () {
            //刷新当前页面
            window.location.reload();
        };
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );

    };

    //编辑任务事件
    function xgbc() {
        $('#myModal1').modal('show');
        //获取任务id
        var rwid = $("#rwid").val();
        //获取任务名称
        var rwmc = $("#bjrwmc").val();
        //获取任务描述
        var rwms = $("#bjrwms").val();
        //获取模型名称
        var jgmx = $("#bjjgmx").select2("data")[0].id;
        //获取执行周期
        var zqid = $("#bjzqid").select2("data")[0].id;

        $.ajax({
            url: '${pageContext.request.contextPath}/sjjg/jgrwgl/updateJgmx',
            type: 'post',
            data: {
                'svo.rwid': dqhsj[0].rwid,
                'svo.rwmc': rwmc,
                'svo.rwms': rwms,
                'svo.jgmx': jgmx,
                'svo.zqid': zqid
            },
            success: function (json) {
                inittabs();
            }
        });
    }

    //删除事件
    function btn_delete() {
        //获取被选中的记录
        var rows = $('#taskList_table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var rwids = rows[0].rwid;
        var msg = "您真的确定要删除么？";
        if (confirm(msg) == true) {
            $.ajax({
                url: "${pageContext.request.contextPath}/sjjg/jgrwgl/deleteJgmx",
                type: "post",
                data: {
                    'svo.rwid': rwids

                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        };
    }


</script>


<script type="text/javascript">
    //模态框表单验证
    function formValidator() {
        $('#editForm').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                tjrwmc: {
                    message: '任务名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '任务名称不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjjg/jgrwgl/nameValidation",
                            message: '该任务名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                tjrwms: {
                    validators: {
                        notEmpty: {
                            message: '任务描述不能为空'
                        }
                    }
                },
                tjzqid: {
                    validators: {
                        notEmpty: {
                            message: '周期名称不能为空'
                        }
                    }
                },
                tjjgmx: {
                    validators: {
                        notEmpty: {
                            message: '加工模型不能为空'
                        }
                    }
                }
            }
        });
    }
</script>

