<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/10/23
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>数据级别管理</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--BootstrapValidator styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <style>
        /*Modal分割线*/
        .hr-line-dashed {
            border-top: 1px dashed #e7eaec;
            color: #fff;
            background-color: #fff;
            height: 1px;
            margin: 15px 0
        }

        .file-manager .hr-line-dashed {
            margin: 15px 0
        }
    </style>
</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget-header ">
                <span class="widget-caption">查询结果</span>
            </div>
            <div class="widget-body">
                <div id="toolbar">
                    <button id="add_mota" type="button" class="btn btn-success btn-sm" data-toggle="modal"
                            data-target="#myModal">
                        <i class="glyphicon glyphicon-plus"></i>
                        添加
                    </button>
                    &nbsp;
                    <button type="button" class="btn btn-warning btn-sm" data-toggle="modal"
                            data-target="#editModal" id="myEdit">
                        <i class="glyphicon glyphicon-pencil"></i>编辑
                    </button>
                    &nbsp;
                    <button type="button" class="btn btn-danger btn-sm" onclick="del()">
                        <i class="glyphicon glyphicon-remove"></i>
                        删除
                    </button>
                    &nbsp;
                    <button onclick="gohistory()" type="button" class="btn btn-info  btn-sm" style="width: 2cm">返回</button>
                </div>
                <table id="table" data-height="544" class="table table-striped table-bordered table-hover"></table>
            </div>
        </div>
    </div>
</div>
<%--Add the data modal--%>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">级别名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="jbmc" name="levelnames"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">级别描述:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="jbms" name="levelofdescription"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="bz" name="remark"></textarea>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" name="submit" class="btn btn-primary" data-dismiss="modal"
                                    onclick="saves()">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End add the modal-%>
<%--Edit the modal--%>
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    编辑
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationEditForm" method="post" class="form-horizontal">
                        <%--级别ID--%>
                        <input type="hidden" class="form-control" id="jbid"/>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">级别名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="editjbmc" name="levelnames" readonly/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">级别描述:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="editjbms" name="describeEdit"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="editbz"></textarea>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="saveedit()">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--End the modal--%>
</body>
<!--Basic Scripts-->
<script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--Submit data Script--%>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
<%--BootstrapValidator Script--%>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
</html>
<script>

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjzdpage.jsp";
    }
    $(function () {
        //初始化(数据对象管理)表格数据
        inittabs();
    });
    function inittabs() {
        //先销毁表格
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
            url: "${ctx}/sjzd/sjjbgl/sjjblist",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true, //是否分页
            singleSelect: true,//设置为true禁止多选
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,//设置为true只显示总数据数，而不显示分页按钮
            toolbar: '#toolbar',
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "jbid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'

            }, {
                field: 'jbid',
                align: 'center',
                title: '级别代码'

            }, {
                field: 'jbmc',
                align: 'center',
                title: '级别名称'
            }, {
                field: 'cjsj',
                align: 'center',
                title: '创建时间'
            }, {
                field: 'jbms',
                align: 'center',
                title: '级别描述'
            }, {
                field: 'bz',
                align: 'center',
                title: '备注'
            }]
        });
    }
    //保存(新增)
    function saves() {
        //开启验证
        $("#validationForm").data('bootstrapValidator').validate();
        if (!$("#validationForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //数据级别名称
        var jbmc = $("#jbmc").val();
        //获取级别描述
        var jbms = $("#jbms").val();
        //获取备注信息
        var bz = $("#bz").val();
        //提交参数
        var sub = {
            'svo.jbmc': jbmc,
            'svo.jbms': jbms,
            'svo.bz': bz
        };
        //提交url
        var myurl = "${ctx}/sjzd/sjjbgl/adddata";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新当前页面
            window.location.reload();
        }
        //提交数据
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        //隐藏模态框
        $("#myModal").modal('hide');
    }
    //初始化表单验证
    $(document).ready(function () {
        formValidator();
        formEditValidator();
    });
    //Modal验证销毁重构(添加)
    $("#myModal").on('hidden.bs.modal', function () {
        $("#validationForm").data('bootstrapValidator').destroy();
        $("#validationForm").data('bootstrapValidator', null);
        formValidator();
    });
    //Modal验证销毁重构(修改)
    $("#editModal").on('hidden.bs.modal', function () {
        $("#validationEditForm").data('bootstrapValidator').destroy();
        $("#validationEditForm").data('bootstrapValidator', null);
        formEditValidator();
    });
    //修改
    $("#myEdit").click(function () {
        var allselecteddata = $("#table").bootstrapTable("getSelections");
        if (allselecteddata.length != 1) {
            alert("请选择一条要编辑的记录!");
            return false;
        }
        btn_edit();
    });
    //获取要修改的数据
    function btn_edit() {
        //获取选择的数据
        var allselecteddata = $("#table").bootstrapTable("getSelections");
        //级别ID
        $("#jbid").val(allselecteddata[0].jbid);
        //级别名称
        $("#editjbmc").val(allselecteddata[0].jbmc);
        //级别描述
        $("#editjbms").val(allselecteddata[0].jbms);
        //备注
        $("#editbz").val(allselecteddata[0].bz);
    }
    //保存(修改)
    function saveedit() {
        //开启验证
        $("#validationEditForm").data('bootstrapValidator').validate();
        if (!$("#validationEditForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //级别ID
        var jbid = $("#jbid").val();
        //数据级别名称
        var jbmc = $("#editjbmc").val();
        //获取级别描述
        var jbms = $("#editjbms").val();
        //获取备注信息
        var bz = $("#editbz").val();
        //提交参数
        var sub = {
            'svo.jbid': jbid,
            'svo.jbmc': jbmc,
            'svo.jbms': jbms,
            'svo.bz': bz
        };
        //提交url
        var myurl = "${ctx}/sjzd/sjjbgl/modifydata";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新当前页面
            window.location.reload();
        }
        //提交数据
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        $("#editModal").modal('hide');
    }
    // 删除
    function del() {
        //获取被选中的记录
        var rows = $('#table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var ids = rows[0].jbid
        var msg = "您真的确定要删除么？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            $.ajax({
                url: "${ctx}/sjzd/sjjbgl/deleteList",
                type: "post",
                data: {
                    'svo.jbid': ids
                }, success: function (data) {
                    if (data == 0) {
                        alert("该级别正在被使用，不能删除！");
                    } else {
                        //刷新当前页面
                        window.location.reload();
                    }

                }
            });
        }
    }
    //添加事件
    $("#add_mota").click(function () {
        $("#jbmc").val("");
        $("#jbms").val("");
        $("#bz").val("");
    });
</script>
<script type="text/javascript">
    //(添加)表单验证
    function formValidator() {
        $('#validationForm').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                levelnames: {
                    message: '级别名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '级别名称是必须的，不能是空的'
                        },
                        remote: {
                            url: "${ctx}/sjzd/sjjbgl/nameValidation",
                            message: '该级别名称已被占用，请使用其他名称',
                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                levelofdescription: {
                    validators: {
                        notEmpty: {
                            message: '级别描述是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }
    //(修改)表单验证
    function formEditValidator() {
        $('#validationEditForm').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                levelnames: {
                    message: '级别名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '级别名称是必须的，不能是空的'
                        }
                    }
                },
                describeEdit: {
                    validators: {
                        notEmpty: {
                            message: '级别描述是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }
</script>
