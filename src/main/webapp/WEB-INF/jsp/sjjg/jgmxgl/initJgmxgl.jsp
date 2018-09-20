<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/1/9
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加工模型管理</title>
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
                            <td style="vertical-align:middle; width: 2cm">模型名称:</td>
                            <td style="width: 22cm;">
                                <input id="mxmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
                                <button onclick="gohistory()" type="button" class="btn btn-info">返回</button>
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

                        <button type="button" id="myEdit" class="btn btn-warning btn-sm">
                            <i class="glyphicon glyphicon-pencil "></i>
                            编辑
                        </button>
                        &nbsp;

                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>

                    </div>
                    <table id="taskList_table" class="table table-striped table-bordered table-hover"></table>
                    <!--添加任务模态框-->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-label="myModalLabel">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        添加加工模型
                                    </h4>
                                </div>

                                <div class="modal-body">
                                    <%--<div class="widget-body" style="width: 100%;height: 80%;">--%>
                                    <form id="editForm" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">模型名称:</label>

                                            <div class="col-sm-4">
                                                <input id="tjmxmc" name="tjmxmc" type="text" style="width:200px;"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">产物名称：</label>

                                            <div class="col-sm-4">
                                                <input id="tjcwmc" name="tjcwmc" type="text" style="width:200px;"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-sm-4 control-label">存储过程:</label>--%>
                                        <%--<div class="col-sm-5">--%>
                                        <%--<select id="tjccgc" name="tjmxlb" class="js-data2-example-ajax"--%>
                                        <%--style="width: 200px;">--%>
                                        <%--<option></option>--%>
                                        <%--</select>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="hr-line-dashed"></div>--%>

                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-sm-4 control-label">存储过程名称：</label>--%>

                                        <%--<div class="col-sm-4">--%>
                                        <%--<input id="tjccgcmc" name="tjrwmc" type="text" style="width:200px;"--%>
                                        <%--class="form-control">--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="hr-line-dashed"></div>--%>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">数据元件:</label>

                                            <div class="col-sm-5">
                                                <select id="tjsjyj" name="tjsjyj" class="js-data2-example-ajax"
                                                        style="width: 200px;">
                                                    <option></option>
                                                </select>
                                            </div>

                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">备注：</label>

                                            <div class="col-sm-4">
                                                <textarea rows="6" id="tjbz" name="tjbz"
                                                          class="form-control"></textarea>
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
                                        编辑
                                    </h4>
                                </div>
                                <%--<div class="modal-body">--%>
                                    <div class="widget-body" style="width: 100%;height: 60%;">
                                        <form id="editForm1" method="post" class="form-horizontal">

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">模型名称:</label>

                                                <div class="col-sm-4">
                                                    <input id="bjmxmc" type="text" style="width:200px;"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="hr-line-dashed"></div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">产物名称:</label>

                                                <div class="col-sm-4">
                                                    <input id="bjcwmc" type="text" style="width:200px;"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="hr-line-dashed"></div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">数据元件:</label>

                                                <div class="col-sm-5">
                                                    <select id="bjsjyj" class="js-data2-example-ajax"
                                                            style="width: 200px;">
                                                        <option></option>
                                                    </select>
                                                </div>

                                            </div>
                                            <div class="hr-line-dashed"></div>

                                            <div class="form-group">
                                                <label class="col-sm-4 control-label">备注：</label>

                                                <div class="col-sm-4">
                                                    <textarea rows="6" id="bjbz" class="form-control"></textarea>
                                                </div>
                                            </div>
                                            <div class="hr-line-dashed"></div>
                                            <div style="text-align: center">
                                                <button type="button" class="btn btn-primary" onclick="xgbc()" data-dismiss="modal">保存</button>
                                            </div>
                                        </form>
                                    </div>
                                <%--</div>--%>
                            </div>

                        </div>

                    </div>
                    <!--结束-->
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

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjjgpage.jsp";
    }

    //保存当前行数据
    var dqhsj = new Array();

    //初始化
    $(function () {
        //初始化表格
        inittabs();

        //(数据元件)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjg/jgmxgl/selectSjyj",
            dataType: 'json',
            success: function (datas1) {
                $("#tjsjyj,#bjsjyj").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        //修改模态框
        $("#myEdit").click(function () {
            var allselecteddata = $("#taskList_table").bootstrapTable("getSelections");
            dqhsj = allselecteddata;
            if (allselecteddata.length != 1) {
                alert("请选择一条要编辑的记录!");
            } else {
                $('#myModal1').modal('show');
                //模型名称
                $("#bjmxmc").val(allselecteddata[0].mxmc);
                //产物名称
                $("#bjcwmc").val(allselecteddata[0].cwmc);
                //数据元件
                $("#bjsjyj").val(allselecteddata[0].sjyj).select2();
                //备注
                $("#bjbz").val(allselecteddata[0].bz);
            }

        });
    });


    function inittabs(mxmcs) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjg/jgmxgl/selectList",
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            queryParams: {
                'svo.mxmc': mxmcs
            },
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "mxmcs", //每一行的唯一标识，一般为主键列
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
                    field: 'mxmc',
                    align: 'center',
                    title: '模型名称'
                }, {
                    field: 'cwmc',
                    align: 'center',
                    title: '产物名称'
                },
//                {
//                    field: 'ccgc',
//                    align: 'center',
//                    title: '存储过程'
//                },
                {
                    field: 'yjmc',
                    align: 'center',
                    title: '数据元件'
                }, {
                    field: 'cjsj',
                    align: 'center',
                    title: '创建时间'
                }, {
                    field: 'bz',
                    align: 'center',
                    title: '备注'
                }
            ]
        });
    }

        //按照模型名称查询
        function searchlist() {
            //获取模型名称
            var mxmc = $("#mxmc").val();
            inittabs(mxmc);
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
        var mxmc = $("#tjmxmc").val();
        //获取任务描述
        var cwmc = $("#tjcwmc").val();
        //获取模型列表
        var sjyj = $("#tjsjyj").val();
        //获取执行周期
        var bz = $("#tjbz").val();

        //提交参数
        var sub = {
            'svo.mxmc': mxmc,
            'svo.cwmc': cwmc,
            'svo.sjyj': sjyj,
            'svo.bz': bz
        };

        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjg/jgmxgl/insertRw";
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

    }
    ;

    //编辑任务事件
    function xgbc() {
        $('#myModal1').modal('show');
        //获取模型id
        var mxid = $("#rwid").val();
        //获取任务名称
        var mxmc = $("#bjmxmc").val();
        //获取产物名称
        var cwmc = $("#bjcwmc").val();
        //获取数据元件
        var sjyj = $("#bjsjyj").select2("data")[0].id;
        //获取备注
        var bz = $("#bjbz").val();
        console.log("bz:", bz);
        $.ajax({
            url: '${pageContext.request.contextPath}/sjjg/jgmxgl/updateJgmx',
            type: 'post',
            data: {
                'svo.mxid': dqhsj[0].mxid,
                'svo.mxmc': mxmc,
                'svo.cwmc': cwmc,
                'svo.sjyj': sjyj,
                'svo.bz': bz
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
        var mxids = rows[0].mxid;
        var msg = "您真的确定要删除么？";
        if (confirm(msg) == true) {
            $.ajax({
                url: "${pageContext.request.contextPath}/sjjg/jgmxgl/deleteJgmx",
                type: "post",
                data: {
                    'svo.mxid': mxids

                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        }
        ;
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
                tjmxmc: {
                    message: '模型名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '模型名称不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjjg/jgmxgl/nameValidation",
                            message: '该任务名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                tjcwmc: {
                    validators: {
                        notEmpty: {
                            message: '产物名称不能为空'
                        }
                    }
                },
                tjsjyj: {
                    validators: {
                        notEmpty: {
                            message: '数据元件不能为空'
                        }
                    }
                }
            }
        });
    }
</script>
