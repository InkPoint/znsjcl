<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/10/26
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>数据对象管理(修改)</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Select2 styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--BootstrapValidator styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <style>
        /*Modal滚动条*/
        @media (min-width: 992px) {
            .modal-chat {
                width: 58.333%;
                height: 78.333%;
                overflow: scroll;
                overflow: auto;
                overflow: auto;
            }
        }

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
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span id="headerid" class="widget-caption"></span>
                </div>
                <div class="widget-body">


                    <form id="tablevalidation" method="post" class="form-horizontal">
                        <div class="form-group">
                            <div class="group">
                                <label class="col-sm-1 control-label">表名中文:</label>
                                <div class="col-sm-2">
                                    <input type="text" id="dxmczw" style="width: 160px;" name="chinesename"
                                           class="form-control">
                                </div>
                            </div>

                            <div class="group">
                                <label class="col-sm-1 control-label">表名英文:</label>
                                <div class="col-sm-2">
                                    <input type="text" id="dxmcyw" style="width: 160px;" name="englishname"
                                           class="form-control" readonly>
                                </div>
                            </div>

                            <div class="group">
                                <label class="col-sm-1 control-label">数据分区:</label>
                                <div class="col-sm-2">
                                    <select class="js-data-example-ajax" style="width: 160px;" id="sjfq"
                                            name="datapartition"></select>
                                </div>
                            </div>

                            <div class="group">
                                <label class="col-sm-1 control-label">数据来源:</label>
                                <div class="col-sm-2">
                                    <select class="js-data-sjly" style="width: 160px;" id="sjly"
                                            name="datasource"></select>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="group">
                                <label class="col-sm-1 control-label">实体类型:</label>
                                <div class="col-sm-2">
                                    <select class="input-xlarges" style="width: 160px;" id="stlx"
                                            name="entitytype"></select>
                                </div>
                            </div>

                            <div class="group">
                                <label class="col-sm-1 control-label">数据级别:</label>
                                <div class="col-sm-2">
                                    <select class="input-level" style="width: 160px;" id="sjjb"
                                            name="datalevel"></select>
                                </div>
                            </div>

                            <div class="group">
                                <label class="col-sm-1 control-label">业务标签:</label>
                                <div class="col-sm-2">
                                    <select class="select-business-tag" style="width: 160px;" id="business-tag-id"
                                            name="businessTag"></select>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="group">
                                <div class="col-sm-10 col-sm-offset-5">
                                    <button type="button" class="btn btn-info" style="width: 2cm;"
                                            onclick="saveTable()">保&nbsp;&nbsp;存
                                    </button>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-info btn-block"
                                            onclick="window.location.href='${ctx}/sjzd/sjdxgl/initSjdxgl'"
                                            style="width: 2cm;">返&nbsp;&nbsp;回
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
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
                    <div id="toolbar">
                        <button id="add_mota" type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                data-target="#addModal"><i class="glyphicon glyphicon-plus"></i>添加
                        </button>
                        <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#myModal" id="myEdit"><i
                                class="glyphicon glyphicon-pencil"></i>编辑
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="del()"><i
                                class="glyphicon glyphicon-remove"></i>删除
                        </button>
                    </div>
                    <table id="table" class="table table-striped table-bordered table-hover" data-height="433"></table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑</h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationForm" method="post" class="form-horizontal">
                        <%--数据项ID--%>
                        <input type="hidden" class="form-control" id="sjxid"/>
                        <%--旧列名--%>
                        <input type="hidden" class="form-control" id="oldcolumn"/>
                        <%--表名--%>
                        <input type="hidden" class="form-control" id="tablename"/>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">数据项中文名:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="sjxzwm" name="dataitemchinese"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">数据项英文名:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="sjxywm" name="dataitemenglish"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">字段类型:</label>
                            <div class="col-sm-5">
                                <select class="input-xlarges" style="width:100%;" id="zdlx" name="fieldtype">
                                    <option>VARCHAR2(50)</option>
                                    <option>VARCHAR2(100)</option>
                                    <option>VARCHAR2(200)</option>
                                    <option>VARCHAR2(400)</option>
                                    <option>VARCHAR2(600)</option>
                                    <option>VARCHAR2(1000)</option>
                                    <option>VARCHAR2(4000)</option>
                                    <option>NUMBER</option>
                                    <option>DATE</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">是否为空</label>
                            <div class="col-sm-5">
                                <select class="input-xlarges" style="width:100%;" id="sfwk" name="whetherisempty">
                                    <option>否</option>
                                    <option>是</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">是否主键</label>
                            <div class="col-sm-5">
                                <select class="input-xlarges" style="width:100%;" id="sfzj" name="whetherkey">
                                    <option>否</option>
                                    <option>是</option>
                                </select>
                            </div>
                        </div>
                        <div class="text-right">
                            <span id="returnMessage" class="glyphicon"></span>
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" onclick="saves()">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">添加</h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationAddForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">数据项中文名:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="addsjxzwm" name="dataitemchinese"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">数据项英文名:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="addsjxywm" name="dataitemenglish"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">字段类型:</label>
                            <div class="col-sm-5">
                                <select class="input-xlarges" style="width:100%;" id="addzdlx" name="fieldtype">
                                    <option>VARCHAR2(50)</option>
                                    <option>VARCHAR2(100)</option>
                                    <option>VARCHAR2(200)</option>
                                    <option>VARCHAR2(400)</option>
                                    <option>VARCHAR2(600)</option>
                                    <option>VARCHAR2(1000)</option>
                                    <option>VARCHAR2(4000)</option>
                                    <option>NUMBER</option>
                                    <option>DATE</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">是否为空</label>
                            <div class="col-sm-5">
                                <select class="input-xlarges" style="width:100%;" id="addsfwk" name="whetherisempty">
                                    <option>否</option>
                                    <option>是</option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">是否主键</label>
                            <div class="col-sm-5">
                                <select class="input-xlarges" style="width:100%;" id="addsfzj" name="whetherkey">
                                    <option>否</option>
                                    <option>是</option>
                                </select>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" onclick="addsaves()">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!--Basic Scripts-->
<script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--Select2 Scripts--%>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<%--Submit data Script--%>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
<%--BootstrapValidator Script--%>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
</html>
<script>
    //获取传递的对象id
    var dxid = "${param.dxid}";
    //获取对象名称英文
    var dxmcyw = "${param.dxmcyw}";

    //业务标签(下拉菜单)
    $.post("${ctx}/sjzd/sjdxgl/businessTag", null, function (data) {
        $(".select-business-tag").select2({
            data: data,
            placeholder: '请选择',
            allowClear: true
        });
    });

    //编辑
    $(function () {
        $(".input-xlarges").select2();
        //获取表名(中文)、表名(英文)
        $.ajax({
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            url: '${ctx}/sjzd/sjdxgl/editData',
            type: 'post',
            data: {
                'svo.dxid': dxid
            },
            success: function (json) {
                var sjfqid = json.jbxx[0].fqid;
                var sjlxid = json.jbxx[0].lxid;
                var sjlyid = json.jbxx[0].lyid;
                var sjjbid = json.jbxx[0].sjjb;
                var ywbqid = json.jbxx[0].bqid;
                $("#stlx").select2({
                    data: json.stlx,
                    placeholder: '请选择',
                    allowClear: true
                });
                //分区
                $(".js-data-example-ajax").select2({
                    data: json.sjfq,
                    placeholder: '请选择',
                    allowClear: true
                });
                //数据来源
                $(".js-data-sjly").select2({
                    data: json.sjly,
                    placeholder: '请选择',
                    allowClear: true
                });
                //数据级别
                $(".input-level").select2({
                    data: json.sjjb,
                    placeholder: '请选择',
                    allowClear: true
                });
                //赋值(对象名称中文)
                $("#dxmczw").val(json.jbxx[0].dxmczw);
                //对象名称英文
                $("#dxmcyw").val(json.jbxx[0].dxmcyw);
                //数据来源
                $("#sjly").val(json.jbxx[0].lyid);
                //分区选中项赋值
                $("#sjfq").val(sjfqid).select2();
                //实体类型选中项赋值
                $("#stlx").val(sjlxid).select2();
                //数据来源选中项赋值
                $("#sjly").val(sjlyid).select2();
                //数据级别选中项赋值
                $("#sjjb").val(sjjbid).select2();
                //业务标签选中项赋值
                $("#business-tag-id").val(ywbqid).select2();
            }
        });
        inittabs(dxid);
    });

    $("#headerid").html("<a style=\"cursor:hand;text-decoration:none;color:#E0FFFF\" onclick=\"window.location.href='${ctx}/sjzd/sjdxgl/initSjdxgl'\"> 数据对象管理</a>" + "&nbsp;/&nbsp;" + "编辑");

    $("#myEdit").click(function () {
        //获取选择的数据
        var allselecteddata = $("#table").bootstrapTable("getSelections");
        if (allselecteddata.length != 1) {
            alert("请选择一条要编辑的记录!");
            return false;
        }
        //数据项ID
        $("#sjxid").val(allselecteddata[0].sjxid);
        //Old column
        $("#oldcolumn").val(allselecteddata[0].sjxmcyw);
        //表名
        $("#tablename").val(allselecteddata[0].sjdxmcyw);
        //数据中文名
        $("#sjxzwm").val(allselecteddata[0].sjxmczw);
        //数据英文名
        $("#sjxywm").val(allselecteddata[0].sjxmcyw);
        //字段类型
        $("#zdlx").val(allselecteddata[0].sjxlx).select2();
        //是否为空
        $("#sfwk").val(allselecteddata[0].isnulls).select2();
        //是否主键
        $("#sfzj").val(allselecteddata[0].iskey).select2();
    });

    //初始化表格
    function inittabs(dxids) {
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
            url: "${ctx}/sjzd/sjdxgl/sjxList",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    'svo.dxid': dxids,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',//工具按钮用哪个容器
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sjxid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: 'id',
                checkbox: true,
                align: 'center'

            }, {
                field: 'sjxmczw',
                align: 'center',
                title: '数据项中文名'
            }, {
                field: 'sjxmcyw',
                align: 'center',
                title: '数据项英文名'
            }, {
                field: 'sjxlx',
                align: 'center',
                title: '字段类型 '
            }, {
                field: 'isnulls',
                align: 'center',
                title: '是否为空'
            }, {
                field: 'iskey',
                align: 'center',
                title: '是否主键 '
            }]
        });
    }

    //(编辑)将表格数据和表单数据全部发送到后台
    function saves() {
        //开启验证
        $("#validationForm").data('bootstrapValidator').validate();
        if (!$("#validationForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //数据数据项ID
        var sjxid = $("#sjxid").val();
        //获取要修改的column
        var oldcolumn = $("#oldcolumn").val();
        //表名
        var sjdxmcyw = $("#tablename").val();
        //获取数据项中文名称
        var sjxzwm = $("#sjxzwm").val();
        //获取数据项英文名称
        var sjxywm = $("#sjxywm").val();
        //字段类型
        var zdlx = $("#zdlx").val();
        //是否为空
        var sfwk = $("#sfwk").val();
        //是否主键
        var sfzj = $("#sfzj").val();
        //提交参数
        $.post("${ctx}/sjzd/sjdxgl/updatedata", {
            'svo.sjxid': sjxid,
            'svo.oldcolumn': oldcolumn,
            'svo.sjdxmcyw': sjdxmcyw,
            'svo.sjxmczw': sjxzwm,
            'svo.sjxmcyw': sjxywm,
            'svo.sjxlx': zdlx,
            'svo.isnulls': sfwk,
            'svo.iskey': sfzj
        }, function (data) {
            alert("Data Saved: " + data);
        });
    }

    //清空数据
    function emptydata() {
        //清空输入框的数据
        $("#addsjxzwm").val("");
        $("#addsjxywm").val("");
        $("#addzdlx").val("").select2();
        $("#addsfwk").val("").select2();
        $("#addsfzj").val("").select2();
    }

    //(添加)将表格数据和表单数据全部发送到后台
    function addsaves() {
        //开启验证
        $("#validationAddForm").data('bootstrapValidator').validate();
        if (!$("#validationAddForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取数据项中文名称
        var sjxzwm = $("#addsjxzwm").val();
        //获取数据项英文名称
        var sjxywm = $("#addsjxywm").val();
        //字段类型
        var zdlx = $("#addzdlx").val();
        //是否为空
        var sfwk = $("#addsfwk").val();
        //是否主键
        var sfzj = $("#addsfzj").val();
        //提交参数
        var sub = {
            'svo.dxid': dxid,
            'svo.sjdxmcyw': dxmcyw,
            'svo.sjxmczw': sjxzwm,
            'svo.sjxmcyw': sjxywm,
            'svo.sjxlx': zdlx,
            'svo.isnulls': sfwk,
            'svo.iskey': sfzj
        };
        var myurl = "${ctx}/sjzd/sjdxgl/adddata";
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            $("#table").bootstrapTable('refresh');
        }
        $.myajax.common("post",
            sub,
            myurl,
            myfunctions
        );
    }

    //初始化表单验证
    $(document).ready(function () {
        //编辑
        formValidator();
        //添加
        formAddValidator();
    });
    //Modal验证销毁重构
    $("#myModal").on('hidden.bs.modal', function () {
        $("#validationForm").data('bootstrapValidator').destroy();
        $("#validationForm").data('bootstrapValidator', null);
        formValidator();
    });
    //Modal验证销毁重构（新增）
    $("#addModal").on('hidden.bs.modal', function () {
        emptydata();
        $("#validationAddForm").data('bootstrapValidator').destroy();
        $("#validationAddForm").data('bootstrapValidator', null);
        formAddValidator();
    });

    //修改表名且保存
    function saveTable() {
        //获取对象名称中文
        var dxmczw = $("#dxmczw").val();
        //获取对象英文名称
        var dxmcyw = $("#dxmcyw").val();
        //获取数据分区
        var sjfq = $("#sjfq").val();
        //获取数据来源
        var sjly = $("#sjly").val();
        //获取实体类型
        var stlx = $("#stlx").val();
        //获取数据级别
        var sjjb = $("#sjjb").val();
        //获取业务标签
        var bqid = $("#business-tag-id").val();
        //提交参数
        var sub = {
            'svo.dxmczw': dxmczw,
            'svo.dxmcyw': dxmcyw,
            'svo.fqid': sjfq,
            'svo.lyid': sjly,
            'svo.lxid': stlx,
            'svo.sjjb': sjjb,
            'svo.bqid': bqid
        };
        var myurl = "${ctx}/sjzd/sjdxgl/updatetable";
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            window.location.reload();
        }
        $.myajax.common("post",
            sub,
            myurl,
            myfunctions
        );
    }

    //删除
    function del() {
        //获取被选中的记录
        var rows = $('#table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        //id
        var ids = rows[0].sjxid;
        //The column name
        var columnname = rows[0].sjxmcyw;
        //Table name
        var tablename = dxmcyw;
        var msg = "该数据删除后无法恢复，你确定要删除吗？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            $.ajax({
                url: "${ctx}/sjzd/sjdxgl/deldata",
                type: "post",
                data: {
                    'svo.sjxid': ids,
                    'svo.sjxmcyw': columnname,
                    'svo.dxmcyw': tablename
                },
                success: function (data) {
                    alert(data);
                    $("#table").bootstrapTable('refresh');
                }
            });
        }
    }
</script>
<script type="text/javascript">
    //（编辑）模态框表单验证
    function formValidator() {
        $('#validationForm').bootstrapValidator({
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                dataitemchinese: {
                    message: '表名(中文)无效',
                    validators: {
                        notEmpty: {
                            message: '表名(中文)是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 36,
                            message: '表名(中文)必须大于2且小于36的字符组成'
                        }
                    }
                },
                dataitemenglish: {
                    validators: {
                        notEmpty: {
                            message: '表名(英文)是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 50,
                            message: '表名(英文)必须大于2且小于50的英文字符和下划线组成'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z][A-Za-z_0-9]+$/,
                            message: '表名(英文)只能以英文字母开头，只能包含英文字母、数字、下划线'
                        }
                    }
                },
                fieldtype: {
                    validators: {
                        notEmpty: {
                            message: '字段类型是必须的，不能是空的'
                        }
                    }
                },
                whetherisempty: {
                    validators: {
                        notEmpty: {
                            message: '此项为必选项，不能是空的'
                        }
                    }
                },
                whetherkey: {
                    validators: {
                        notEmpty: {
                            message: '此项为必选项，不能是空的'
                        }
                    }
                }
            }
        });
    }

    //（添加）模态框表单验证
    function formAddValidator() {
        $('#validationAddForm').bootstrapValidator({
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                dataitemchinese: {
                    message: '表名(中文)无效',
                    validators: {
                        notEmpty: {
                            message: '表名(中文)是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 36,
                            message: '表名(中文)必须大于2且小于36的中文字符组成'
                        }
                    }
                },
                dataitemenglish: {
                    validators: {
                        notEmpty: {
                            message: '表名(英文)是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 50,
                            message: '表名(英文)必须大于2且小于50的英文字符和下划线组成'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z][A-Za-z_0-9]+$/,
                            message: '表名(英文)只能以英文字母开头，只能包含英文字母、数字、下划线'
                        }
                    }
                },
                fieldtype: {
                    validators: {
                        notEmpty: {
                            message: '字段类型是必须的，不能是空的'
                        }
                    }
                },
                whetherisempty: {
                    validators: {
                        notEmpty: {
                            message: '此项为必选项，不能是空的'
                        }
                    }
                },
                whetherkey: {
                    validators: {
                        notEmpty: {
                            message: '此项为必选项，不能是空的'
                        }
                    }
                }
            }
        });
    }
</script>
