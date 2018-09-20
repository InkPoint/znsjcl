<%--
  Created by IntelliJ IDEA.
  User: cuiheng
    To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>

    <title>添加模型</title>
    <%@ include file="/common/global.jsp" %>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Font-awesome Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--Select2 styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <%--BootstrapValidator Styles--%>
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
<!-- Page Body -->
<div class="page-body">
    <div id="condition" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">模型基本信息设置&nbsp;&nbsp;(注：请先添加相关规则)</span>
                </div>
                <div class="widget-body">
                    <form id="tablevalidation" method="post" class="form-horizontal">
                        <table class="table">
                            <div class="form-group">
                                <div class="group">
                                    <label class="col-sm-1 control-label">模型名称:</label>

                                    <div class="col-sm-2">
                                        <input type="text" id="mxmc" style="width: 180px;" name="themodelname"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="group">
                                    <label class="col-sm-1 control-label">匹配说明:</label>

                                    <div class="col-sm-2">
                                        <input type="text" id="ppsm" style="width: 180px;" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <tr align="center">
                                <td colspan="6">
                                    <button type="button" class="btn btn-info" onclick="savemx();" style="width: 2cm;">保&nbsp;&nbsp;存</button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-info btn-block"
                                            onclick="window.location.href='${ctx}/sjcl/glppmx/initmx'"
                                            style="width: 2cm;">返&nbsp;&nbsp;回
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="querys" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">模型对应规则设置</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <a href="#">
                            <button id="add_mota" type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                    data-target="#thenewindicator">
                                <i class="glyphicon glyphicon-plus"></i>添加
                            </button>
                            &nbsp;
                        </a>
                        <%--<a href="#">--%>
                            <%--<button id="edit_mota" type="button" class="btn btn-warning btn-sm" data-target="#adds">--%>
                                <%--<i class="glyphicon glyphicon-pencil"></i>修改--%>
                            <%--</button>--%>
                            <%--&nbsp;--%>
                        <%--</a>--%>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="mytab" data-height="542"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--添加模型对应关系--%>
<div class="modal fade" id="thenewindicator" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加模型对应关系
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="indicatorvaildation" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">匹配项中文名:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="ppxzwm" name="dataitemchinese"/>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">匹配项英文名:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="ppxywm" name="dataitemenglish"/>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">匹配规则:</label>

                            <div class="col-sm-5">
                                <select class="match-rule" style="width:100%;" id="ppgz" name="matchrule">
                                </select>
                            </div>
                        </div>

                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="submitanew()">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
<!--Basic Scripts-->
<script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--Select2 Scripts--%>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<%--BootstrapValidator--%>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
<%--Submit data Script--%>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
<script>
    $(function () {
        //初始化表格
        inittabs();
        //源表（下拉菜单）
        $.post("${ctx}/zzfwzx/glppmx/tablemenu", null, function (data) {
            $(".the-source-table").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //规则（下拉菜单）
        $.post("${ctx}/zzfwzx/glppmx/therules", null, function (data) {
            $(".match-rule").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //Modal验证销毁重构(添加_字段、指标)
        $("#thenewindicator").on('hidden.bs.modal', function () {
            $("#indicatorvaildation").data('bootstrapValidator').destroy();
            $("#indicatorvaildation").data('bootstrapValidator', null);
            indicatorsvalidator();
        });
        //隐藏id列（规则ID）
        $('#mytab').bootstrapTable("hideColumn", "gzid");
    });
    //删除数据
    function btn_delete() {
        //获取选中的行
        var dataArr = $('#mytab').bootstrapTable('getSelections');
        var str = [];
        for (var k = 0; k < dataArr.length; k++) {
            str[k] = dataArr[k].ck;
        }
        if (dataArr.length != 1) {
            alert("请选择一行删除!");
            return;
        }
        $('#mytab').bootstrapTable('remove', {field: 'ck', values: str});
    }
    //(数据对象管理)初始化表格
    function inittabs() {
        //先销毁表格
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            sidePagination: "client",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            toolbar: '#toolbar',
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "ck", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'ppxzw',
                    align: 'center',
                    title: '匹配项中文名'
                }, {
                    field: 'ppxyw',
                    align: 'center',
                    title: '匹配项英文名'
                }, {
                    field: 'gzmc',
                    align: 'center',
                    title: '规则'
                }, {
                    field: 'xh',
                    align: 'center',
                    title: '执行顺序'
                }
            ]
        });
    }
    //将表格数据和表单数据全部发送到后台
    function savemx() {
        //开启验证
        $("#tablevalidation").data('bootstrapValidator').validate();
        if (!$("#tablevalidation").data('bootstrapValidator').isValid()) {
            return;
        }
        //模型名称
        var mxmc = $("#mxmc").val();
        //匹配说明
        var ppsm = $("#ppsm").val();
        var dataArr = $('#mytab').bootstrapTable('getData');
        if (dataArr.length == 0) {
            alert("请添加相关模型规则！");
            return;
        }
        //提交参数
        var sub = {
            'datalist': JSON.stringify(dataArr),
            'svo.mxmc': mxmc,
            'svo.ppsm': ppsm
        };
        //提交url
        var myurl = "${ctx}/zzfwzx/glppmx/newaddition";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //页面跳转
            window.location.href = '${ctx}/zzfwzx/glppmx/initmx';
        }
        //提交数据
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
    }
    //新增匹配项、规则等
    function submitanew() {
        //开启验证
        $("#indicatorvaildation").data('bootstrapValidator').validate();
        if (!$("#indicatorvaildation").data('bootstrapValidator').isValid()) {
            return;
        }
        //规则
        var gz = $(".match-rule").select2('data');
        var gztext = gz[0].text;
        var gzid = gz[0].id;
        //获取Bootstrap-table内有多少行数据
        var tabdata = $('#mytab').bootstrapTable("getData");
        $("#mytab").bootstrapTable("insertRow", {
            index: tabdata.length,
            row: {
                ppxzw: $("#ppxzwm").val(),
                ppxyw: $("#ppxywm").val(),
                gzmc: gztext,
                gzid: gzid,
                xh: tabdata.length + 1
            }
        });
        //置空
        $("#ppxzwm").val("");
        $("#ppxywm").val("");
        $(".match-rule").val("").select2();
        //添加一条后关闭Model
        $("#thenewindicator").modal("hide");
        //继续添加(预留)
        //$("#indicatorvaildation").data('bootstrapValidator').destroy();
        //$("#indicatorvaildation").data('bootstrapValidator', null);
        //indicatorsvalidator();
    }
    //初始化表单验证
    $(document).ready(function () {
        //规则名称验证
        buildtablevalidator();
        //Model新增规则校验
        indicatorsvalidator();
    });
    //匹配模型规则
    function buildtablevalidator() {
        $('#tablevalidation').bootstrapValidator({
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                themodelname: {
                    message: '模型名称无效',
                    validators: {
                        notEmpty: {
                            message: '模型名称是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }
    //Model新增规则校验
    function indicatorsvalidator() {
        $('#indicatorvaildation').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                dataitemchinese: {
                    message: '该值无效',
                    //验证器
                    validators: {
                        notEmpty: {
                            message: '匹配项中文名是必须的，不能是空的'
                        }
                    }
                }, dataitemenglish: {
                    validators: {
                        notEmpty: {
                            message: '匹配项英文名是必须的，不能是空的'
                        }
                    }
                }, matchrule: {
                    validators: {
                        notEmpty: {
                            message: '匹配规则是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }
</script>
