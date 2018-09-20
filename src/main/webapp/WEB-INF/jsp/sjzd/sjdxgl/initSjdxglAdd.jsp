<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/10/26
  Modify The Time: 2018/4/2
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>数据对象管理(建表)</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Bootstrap-table Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Select2 Styles--%>
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
                                    <input type="text" id="bmzw" style="width: 160px;" name="chinesename"
                                           class="form-control" placeholder="例:数据资源统计">
                                </div>
                            </div>

                            <div class="group">
                                <label class="col-sm-1 control-label">表名英文:</label>
                                <div class="col-sm-2">
                                    <input type="text" id="bmyw" style="width: 160px;" name="englishname"
                                           class="form-control" value="znsjcl_">
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
                                    <button type="button" class="btn btn-info col-lg-offset-3" style="width: 2cm;"
                                            onclick="saves()">保&nbsp;&nbsp;存
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
                    <span class="widget-caption">添加数据项</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button id="add_mota" class="btn btn-success btn-sm" onclick="btn_add()">
                            <i class="glyphicon glyphicon-plus"></i>添加
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>删除
                        </button>
                    </div>
                    <table id="table" data-height="542" class="table table-striped table-bordered table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1100px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加数据项</h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">数据项中文名</label>
                                    <input type="text" class="form-control" id="sjxzwm" name="dataitemchinese"
                                           placeholder="例:机关代码"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">数据项英文名</label>
                                    <input type="text" class="form-control" id="sjxywm" name="dataitemenglish"
                                           placeholder="例:JGDM"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">字段类型</label>
                                    <select class="input-xlarge" style="width:100%;" id="zdlx" name="fieldtype">
                                        <option></option>
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
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">是否为空</label>
                                    <select class="input-xlarge" style="width:100%;" id="sfwk" name="whetherisempty">
                                        <option></option>
                                        <option>是</option>
                                        <option>否</option>
                                    </select>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">是否主键</label>
                                    <select class="input-xlarge" style="width:100%;" id="sfzj" name="whetherkey">
                                        <option></option>
                                        <option>是</option>
                                        <option>否</option>
                                    </select>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    &nbsp;&nbsp;&nbsp; &nbsp;
                                    <button type="button" class="btn btn-info" onclick="continuetoadd()"
                                            style="margin-top: 25px;">
                                        继续添加
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
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
    //数据来源(下拉菜单)
    $.post("${ctx}/sjzd/sjdxgl/datasurce", null, function (data) {
        $(".js-data-sjly").select2({
            data: data,
            placeholder: '请选择',
            allowClear: true
        });
    });

    //业务标签(下拉菜单)
    $.post("${ctx}/sjzd/sjdxgl/businessTag", null, function (data) {
        $(".select-business-tag").select2({
            data: data,
            placeholder: '请选择',
            allowClear: true
        });
    });

    //数据分区(下拉菜单)
    $.post("${ctx}/sjzd/sjdxgl/getSjfqTree", null, function (data) {
        $(".js-data-example-ajax").select2({
            data: data,
            placeholder: '请选择',
            allowClear: true
        });
    });

    //字段类型(下拉菜单)
    $.post("${ctx}/sjzd/sjdxgl/businessTag", null, function (data) {
        $(".select-business-tag").select2({
            data: data,
            placeholder: '请选择',
            allowClear: true
        });
    });

    //字段类型(下拉菜单)
    $(".input-xlarge").select2({
        placeholder: '请选择',
        allowClear: true
    });

    //实体类型类型(下拉菜单)
    $.post("${ctx}/sjzd/sjdxgl/getStlxTree", null, function (data) {
        $(".input-xlarges").select2({
            data: data,
            placeholder: '请选择',
            allowClear: true
        });
    });

    //数据级别(下拉菜单)
    $.post("${ctx}/sjzd/sjjbgl/getSjjbTree", null, function (data) {
        $(".input-level").select2({
            data: data,
            placeholder: '请选择',
            allowClear: true
        });
    });

    $("#headerid").html("<a style=\"cursor:hand;text-decoration:none;color:#E0FFFF\" onclick=\"window.location.href='${ctx}/sjzd/sjdxgl/initSjdxgl'\"> 数据对象管理</a>" + "&nbsp;/&nbsp;" + "建表&nbsp;(注：请先添加相关数据项)");

    //销毁
    $('#table').bootstrapTable('destroy');

    //初始化表格，动态从服务器加载数据
    $('#table').bootstrapTable({
        method: "get",//使用get请求到服务器获取数据
        sidePagination: "server",//表示服务端请求
        pagination: true, //是否分页
        singleSelect: true,
        pageNumber: 1, //初始化加载第一页，默认第一页
        buttonsAlign: 'right', //按钮对齐方式
        pageSize: 10, //每页的记录行数
        onlyInfoPagination: false,
        toolbar: '#toolbar',
        pageList: [10, 20, 30, 50], //可供选择的每页行数
        paginationLoop: true,//设置为true启用分页条无线循环的功能
        clickToSelect: true, //是否启用点击选中行
        uniqueIS: "ck", //每一行的唯一标识，一般为主键列
        columns: [{
            field: 'ck',
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

    //初始化表单验证
    $(document).ready(function () {
        formValidator();
        //建表验证
        buildtablevalidator();
    });

    //Modal验证销毁重构
    $("#myModal").on('hidden.bs.modal', function () {
        $("#validationForm").data('bootstrapValidator').destroy();
        $("#validationForm").data('bootstrapValidator', null);
        formValidator();
    });

    //添加(清空)事件
    $("#add_mota").click(function () {
        $("#sjxzwm").val("");
        $("#sjxywm").val("");
        $("#zdlx").val("");
        $("#sfwk").val("");
        $("#sfzj").val("");
    });

    //删除
    function btn_delete() {
        //获取选中的行
        var dataArr = $('#table').bootstrapTable('getSelections');
        var str = [];
        for (var k = 0; k < dataArr.length; k++) {
            str[k] = dataArr[k].ck;
        }
        if (dataArr.length != 1) {
            alert("请选择一行删除!");
            return;
        }
        $('#table').bootstrapTable('remove', {field: 'ck', values: str});
    }

    // 添加方法
    function btn_add() {
        curopr = "添加";
        $("#myModal").modal('show');
        //置空
        $("#sjxzwm").val("");
        $("#sjxywm").val("");
        $("#zdlx").val("").select2();
        $("#sfwk").val("").select2();
        $("#sfzj").val("").select2();
    }

    //保存添加数据
    function addsaves() {
        //开启验证
        $("#validationForm").data('bootstrapValidator').validate();
        if (!$("#validationForm").data('bootstrapValidator').isValid()) {
            return;
        }
        if (curopr == "添加") {
            $("#table").bootstrapTable("insertRow",
                {
                    index: 0,
                    row: {
                        sjxmczw: $("#sjxzwm").val(),
                        sjxmcyw: $("#sjxywm").val(),
                        sjxlx: $("#zdlx").val(),
                        isnulls: $("#sfwk").val(),
                        iskey: $("#sfzj").val()
                    }
                });
        }
        //隐藏模态框
        $("#myModal").modal('hide');
    }

    //继续添加下一条
    function continuetoadd() {
        //开启验证
        $("#validationForm").data('bootstrapValidator').validate();
        if (!$("#validationForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取已经输入的数据
        $("#table").bootstrapTable("insertRow",
            {
                index: 0,
                row: {
                    sjxmczw: $("#sjxzwm").val(),
                    sjxmcyw: $("#sjxywm").val(),
                    sjxlx: $("#zdlx").val(),
                    isnulls: $("#sfwk").val(),
                    iskey: $("#sfzj").val()
                }
            });
        //清空输入的数据
        $("#sjxzwm").val("");
        $("#sjxywm").val("");
        $("#zdlx").val("").select2();
        $("#sfwk").val("").select2();
        $("#sfzj").val("").select2();
        $("#validationForm").data('bootstrapValidator').destroy();
        $("#validationForm").data('bootstrapValidator', null);
        formValidator();

    }

    //将表格数据和表单数据全部发送到后台
    function saves() {
        //开启验证
        $("#tablevalidation").data('bootstrapValidator').validate();
        if (!$("#tablevalidation").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取表名(中文)
        var bmzw = $("#bmzw").val();
        //获取表名(英文)
        var bmyw = $("#bmyw").val();
        //获取数据分区
        var sjfq = $("#sjfq").select2("data");
        var sjfqcon = "";
        if (sjfq != null && JSON.stringify(sjfq) != "{}" && typeof(sjfq) != "undefined" && sjfq.length > 0) {
            sjfqcon = sjfq[0].id;
        }

        //获取数据来源选择项
        var sjly = $("#sjly").select2("data");
        var sjlycon = "";
        if (sjly != null && JSON.stringify(sjly) != "{}" && typeof(sjly) != "undefined" && sjly.length > 0) {
            sjlycon = sjly[0].id;
        }

        //获取实体类型
        var stlx = $("#stlx").select2("data");
        var stlxcon = "";
        if (stlx != null && JSON.stringify(stlx) != "{}" && typeof(stlx) != "undefined" && stlx.length > 0) {
            stlxcon = stlx[0].id;
        }

        //获取数据级别
        var sjjb = $("#sjjb").select2("data");
        var sjjbcon = "";
        if (sjjb != null && JSON.stringify(sjjb) != "{}" && typeof(sjjb) != "undefined" && sjjb.length > 0) {
            sjjbcon = sjjb[0].id;
        }

        //获取业务标签
        var ywbq = $("#business-tag-id").select2("data");
        var ywbqcon = "";
        if (ywbq != null && JSON.stringify(ywbq) != "{}" && typeof(ywbq) != "undefined" && ywbq.length > 0) {
            ywbqcon = ywbq[0].id;
        }

        var dataArr = $('#table').bootstrapTable('getData');
        if (dataArr.length == 0) {
            alert("请添加相关数据项！");
            return;
        }

        //获取数据对象名称英文
        var sjdxmcyw = $("#bmyw").val();
        //提交参数
        var sub = {
            'datalist': JSON.stringify(dataArr),
            'svo.sjdxmcyw': sjdxmcyw,
            'svo.dxmczw': bmzw,
            'svo.dxmcyw': bmyw,
            'svo.fqid': sjfqcon,
            'svo.lyid': sjlycon,
            'svo.lxid': stlxcon,
            'svo.sjjb': sjjbcon,
            'svo.bqid': ywbqcon
        };
        //提交url
        var myurl = "${ctx}/sjzd/sjdxgl/savedata";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //页面跳转
            window.location.href = '${ctx}/sjzd/sjdxgl/initSjdxgl';
        }
        //提交数据
        $.myajax.common("post",
            sub,
            myurl,
            myfunctions
        );
    }

    //模态框表单校验
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
                            message: '数据项(中文)必须大于2且小于36的中文字符组成'
                        },
                        regexp: {
                            regexp: /^[\u4e00-\u9fa5][A-Za-z_0-9\u4e00-\u9fa5]+$/,
                            message: '数据项(中文)只能以中文字符开头，且只能输入中文、英文、数字、下划线'
                        }
                    }
                },
                dataitemenglish: {
                    message: '表名无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    validators: {
                        notEmpty: {
                            message: '数据项(英文)是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 50,
                            message: '数据项(英文)必须大于2且小于50的英文字符和下划线组成'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z][A-Za-z_0-9]+$/,
                            message: '数据项(英文)只能以英文字母开头，只能包含英文字母、数字、下划线'
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

    //建表校验
    function buildtablevalidator() {
        $('#tablevalidation').bootstrapValidator({
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                chinesename: {
                    message: '表名(中文)无效',
                    validators: {
                        notEmpty: {
                            message: '表名(中文)是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 36,
                            message: '表名(中文)必须大于2且小于36的字符组成'
                        }, regexp: {
                            regexp: /^[A-Za-z_0-9\u4e00-\u9fa5]+$/,
                            message: '表名(中文)只能包含中文、英文、数字和下划线'
                        }
                    }
                },
                englishname: {
                    message: '表名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    validators: {
                        notEmpty: {
                            message: '表名(英文)是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 50,
                            message: '表名(英文)必须大于2且小于50的英文字符和下划线组成'
                        }, regexp: {
                            regexp: /^[a-zA-Z][A-Za-z0-9_]+$/,
                            message: '表名(英文)只能以英文字母开头，只能包含英文字母、数字、下划线'
                        }, remote: {
                            url: "${ctx}/sjzd/sjdxgl/namevalidation",
                            message: '该表名称已被占用，请使用其他名称',
                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                datapartition: {
                    validators: {
                        notEmpty: {
                            message: '数据分区是必须的，不能是空的'
                        }
                    }
                },
                datasource: {
                    validators: {
                        notEmpty: {
                            message: '此项为必选项，不能是空的'
                        }
                    }
                },
                entitytype: {
                    validators: {
                        notEmpty: {
                            message: '此项为必选项，不能是空的'
                        }
                    }
                },
                datalevel: {
                    validators: {
                        notEmpty: {
                            message: '此项为必选项，不能是空的'
                        }
                    }
                },
                businessTag: {
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
