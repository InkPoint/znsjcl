<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/12/7
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>元件管理</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Bootstrap Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <!--Bootstrap-table Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <!--zTree styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/zTreeStyle.css"/>
    <!--Select2 styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
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
<body style="background-color: white;">
<div class="container-fluid" id="bxx">
    <div class="row clearfix">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12 " style="width: 12%;height:100%;background-color: white; ">
            <div>&nbsp;</div>
            <ul id="tree" class="ztree"></ul>
        </div>
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12" style="width: 85%;height: 100%;background-color: white;">
            <div class="page-body" id="bt"  style="height:100%;">
                <div class="row" id="xx">
                    <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12" style="width: 100%;height: 45%;">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">查询结果</span>
                            </div>
                            <div class="widget-body">
                                <div id="toolbar">
                                    <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
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
                                    <button onclick="window.location.href='${ctx}/main/homepage/sjjgpage'" type="button" class="btn btn-info btn-sm" style="width: 2cm">返回</button>
                                </div>
                                <table id="table" class="table table-striped table-bordered table-hover"
                                       data-height="583"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Add data modal--%>
<div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    <form id="validationAdd" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">元件名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="yjmc" name="elementname"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">关键字:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="gjz" name="thekeyword"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">标签选择:</label>

                            <div class="col-sm-5">
                                <select id="bqid" class="input-yjbq" style="width:100%;height: 35px;"
                                        name="tagselection">
                                    <option/>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">口径描述:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="kjms" name="describe"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saves()">
                    提交
                </button>
            </div>

        </div>
    </div>

</div>
<%--End the add modal--%>
<%--Edit data modal--%>
<div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    <form id="validationEdit" method="post" class="form-horizontal">
                        <%--元件ID--%>
                        <input type="hidden" class="form-control" id="yjid"/>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">元件名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="edit-yjmc" name="editelementname"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">关键字:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="edit-gjz" name="editthekeyword"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">标签选择:</label>

                            <div class="col-sm-5">
                                <select id="edit-bqid" class="input-yjbq" style="width:100%;height: 35px;"
                                        name="edittagselection">
                                    <option/>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">口径描述:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="edit-kjms" name="editdescribe"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveEdit()">
                    提交
                </button>
            </div>

        </div>
    </div>

</div>
<%--End the edit data modal--%>
<%--View the data modal--%>
<div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    查看
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form method="post" class="form-horizontal">
                        <div class="form-group">

                            <div class="col-sm-12">
                                <textarea class="form-control" rows="4" id="viewDate" disabled></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<%--End view the data modal--%>

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
                    <table id="viewtables" class="table table-striped table-bordered table-hover" data-height="510" style="white-space: nowrap" ></table>
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
<%--Select2--%>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<%--Submit data Script--%>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
<%--zTree Script--%>
<script src="${ctx}/assets/js/jquery.ztree.core.js"></script>
<%--BootstrapValidator Script--%>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
</html>
<script>
    //定义选中的元件id
    var yjid = "";
    var zTree;
    var treeNodes;
    $(function () {
        //业务标签(下拉菜单)
        $.post("${ctx}/sjjg/yjgl/getYwbqTree", null, function (data) {
            $(".input-yjbq").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        getTabeldata();
        inittrees();
        //初始化表单验证
        $(document).ready(function () {
            //新增校验
            formAddValidator();
            //编辑校验
            formEditValidator();
        });
        //Modal验证销毁重构(新增)
        $("#myModal").on('hidden.bs.modal', function () {
            $("#validationAdd").data('bootstrapValidator').destroy();
            $("#validationAdd").data('bootstrapValidator', null);
            //刷新
            window.location.reload();
            formAddValidator();
        });
        //Modal验证销毁重构(编辑)
        $("#editModal").on('hidden.bs.modal', function () {
            $("#validationEdit").data('bootstrapValidator').destroy();
            $("#validationEdit").data('bootstrapValidator', null);
            //刷新
            window.location.reload();
            formEditValidator();
        });
    });
    //获取所有标签 初始化树数据
    function getTabeldata() {
        $.ajax({
            url: "${ctx}/sjjg/yjgl/selectAll",
            async: true,
            dataType: 'json',
            type: 'put',
            success: function (datas) {
                inittabs(datas);
            }
        });
    }
    // 表数据
    function inittabs(datas) {
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
            sidePagination: 'client',
            striped: true,//显示隔行换色效果
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            queryParams: function (params) {
                return {
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "yjid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center'
            },  {
                field: 'yjmc',
                align: 'center',
                title: '元件名称 '
            }, {
                field: 'bqmc',
                align: 'center',
                title: '标签名称 '
            }, {
                field: 'gjz',
                align: 'center',
                title: '元件关键字 '
            }, {
                field: 'yjkj',
                align: 'center',
                title: '口径描述',
                formatter: function (value, row, index) {
                    return '<button type="button" class="btn btn-info btn-sm glyphicon glyphicon-search" data-toggle="modal" data-target="#viewModal" onclick="view(\'' + row.yjid + '\')">查看</button>';
                }
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
            ],
            data: datas
        });
    }
    //定义初始化树属性
    var setting = {
        view: {
            dblClickExpand: true,//双击展开父节点
            showLine: true,//设置zTree是否显示节点之间的连线
            selectedMulti: false //设置是否允许同时选中多个节点
        },
        data: {
            key: {
                name: "yjmc"
            },
            simpleData: {
                enable: true,   //设置ztree是否开启异步加载
                idKey: "yjid",
                pIdKey: "pyjdm",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                yjid = treeNode.yjid;
                getzjd(yjid);

            }
        }
    };

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
                    pageSize: 10, //每页的记录行数
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




    //zTree初始化
    function inittrees() {
        $.ajax({
            async: false,
            cache: false,
            type: 'post',
            datatType: "json",
            url: "${ctx}/sjjg/yjgl/list",
            error: function () {
            },
            success: function (data) {
                treeNodes = data.rows;
                if (yjid == "") {
                    yjid = data.svo.yjid;
                }
                $.fn.zTree.init($("#tree"), setting, treeNodes);
            }
        });
    }
    //获取父节点的基本信息和所有叶子节点列表信息
    function getzjd(yjid) {
        $.ajax({
            url: '${ctx}/sjjg/yjgl/targetinfo',
            type: 'post',
            data: {
                'svo.yjid': yjid
            },
            success: function (data) {
                inittabs(data);
            }
        });
    }
    //业务标签(树形菜单)
    $.ajax({
        url: "${ctx}/sjzd/sjjbgl/getSjjbTree",
        dataType: 'json',
        success: function (datas) {
            $("js-example-basic-single").select2({
                data: datas,
                placeholder: '请选择',
                allowClear: true
            });
        }
    });
    //新增
    function saves() {
        //开启验证
        $("#validationAdd").data('bootstrapValidator').validate();
        if (!$("#validationAdd").data('bootstrapValidator').isValid()) {
            return;
        }
        //元件名称
        var yjmc = $("#yjmc").val();
        //关键字
        var gjz = $("#gjz").val();
        //标签ID
        var bqid = $("#bqid").val();
        //口径描述
        var yjkj = $("#kjms").val();
        $.ajax({
            url: '${ctx}/sjjg/yjgl/insertlable',
            type: 'post',
            data: {
                'svo.yjmc': yjmc,
                'svo.gjz': gjz,
                'svo.bqid': bqid,
                'svo.yjkj': yjkj,
                'svo.pyjdm': yjid
            },
            success: function (data) {
                $("#myModal").modal('hide');
                //初始化Ztree
                inittrees();
                //刷新BootstrapTable
                $("#table").bootstrapTable("refresh");
            }
        });
    }
    //删除
    function del() {
        //获取被选中的记录
        var rows = $('#table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var ids = rows[0].yjid;
        var msg = "您真的确定要删除么？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            $.ajax({
                url: "${ctx}/sjjg/yjgl/deleteList",
                type: "post",
                data: {
                    'svo.yjid': ids
                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        }
    }
    //编辑
    $("#myEdit").click(function () {
        var rows = $("#table").bootstrapTable("getSelections");
        if (rows.length != 1) {
            alert("请选择一条要编辑的记录!");
            return false;
        }
        btn_edit();
    });
    //获取要修改的数据
    function btn_edit() {
        //获取选择的数据
        var row = $("#table").bootstrapTable("getSelections");
        //元件ID
        $("#yjid").val(row[0].yjid);
        //元件名称
        $("#edit-yjmc").val(row[0].yjmc);
        //关键字
        $("#edit-gjz").val(row[0].gjz);
        //标签选择
        $("#edit-bqid").val(row[0].bqid).select2();
        //口径描述
        $("#edit-kjms").val(row[0].yjkj);
    }
    //保存编辑
    function saveEdit() {
        //开启验证
        $("#validationEdit").data('bootstrapValidator').validate();
        if (!$("#validationEdit").data('bootstrapValidator').isValid()) {
            return;
        }
        //元件ID
        var yjid = $("#yjid").val();
        //元件名称
        var yjmc = $("#edit-yjmc").val();
        //关键字
        var gjz = $("#edit-gjz").val();
        //标签选择
        var bqid = $("#edit-bqid").select2("data")[0].id.trim();
        //口径描述
        var yjkj = $("#edit-kjms").val();
        $.ajax({
            url: '${ctx}/sjjg/yjgl/modifydata',
            type: 'post',
            data: {
                'svo.yjid': yjid,
                'svo.yjmc': yjmc,
                'svo.gjz': gjz,
                'svo.bqid': bqid,
                'svo.yjkj': yjkj
            },
            success: function (msg) {
                $("#editModal").modal('hide');
                //初始化Ztree
                inittrees();
                //刷新BootstrapTable
                $("#table").bootstrapTable("refresh");
            }
        });
    }
    //查看口径描述
    var str = "";
    function view(yjid) {
        var getyjid = yjid;
        $.ajax({
            url: "${ctx}/sjjg/yjgl/viewDescribe",
            type: "post",
            data: {
                'svo.yjid': getyjid
            },
            success: function (data) {
                $("#viewDate").val(data[0].yjkj);
                str = data[0].yjkj;
            }
        })
    }
    //Add Form Validation
    function formAddValidator() {
        $('#validationAdd').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                elementname: {
                    message: '该字段无效，请重新输入',
                    validators: {
                        notEmpty: {
                            message: '元件名称是必须的，不能是空的'
                        }
                    }
                },
                thekeyword: {
                    validators: {
                        notEmpty: {
                            message: '关键字是必须的，不能是空的'
                        }
                    }
                },
                tagselection: {
                    validators: {
                        notEmpty: {
                            message: '标签选择是必须的，不能是空的'
                        }
                    }
                },
                describe: {
                    validators: {
                        notEmpty: {
                            message: '口径描述是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }
    //Edit Form Vaildation
    function formEditValidator() {
        $('#validationEdit').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                editelementname: {
                    message: '该字段名称无效，请重新输入',
                    validators: {
                        notEmpty: {
                            message: '元件名称是必须的，不能是空的'
                        }
                    }
                },
                editthekeyword: {
                    validators: {
                        notEmpty: {
                            message: '关键字是必须的，不能是空的'
                        }
                    }
                },
                edittagselection: {
                    validators: {
                        notEmpty: {
                            message: '标签选择是必须的，不能是空的'
                        }
                    }
                },
                editdescribe: {
                    validators: {
                        notEmpty: {
                            message: '口径描述是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }
</script>