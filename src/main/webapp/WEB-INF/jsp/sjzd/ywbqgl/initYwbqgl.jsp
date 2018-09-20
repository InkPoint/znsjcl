<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/10/23
  Time: 14:59
  业务标签管理
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>业务标签管理</title>
    <%@ include file="/common/global.jsp" %>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--基本样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/weather-icons.min.css"/>

    <!--风格样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css"/>
    <!--table-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.css"/>
    <!--zTree样式-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>
    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--zTree插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.ztree.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datetime/bootstrap-datepicker.js"></script>
    <!--皮肤脚本：在head中，这个脚本用于加载皮肤和支持的脚本-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--样式背景插件-->
    <script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>
    <%--bootstrap Table--%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--表单验证插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>

</head>
<body>
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 " style="width: 13%;height:100%;background-color:white; "   >
            <div>&nbsp;</div>
            <ul id="tree" class="ztree"></ul>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12" style="width: 85%;height: 100%;background-color: white">
            <div class="page-body" id="bt" style="height: 100%">
                <div class="row">
                    <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header bg-blue">
                                <span class="widget-caption">业务标签修改</span>
                            </div>
                            <div class="widget-body">
                                <table class="table">
                                    <tr>
                                        <td style="vertical-align:middle; width:2.5cm;">标签名称:</td>
                                        <td style="width: 3cm;"><input id="bqmc" type="text" style="width: 150px;"
                                                                       class="form-control" placeholder=""></td>
                                        <td align="left" style="vertical-align:middle; width:2.5cm;">标签描述:</td>
                                        <td align="left" style="width: 4cm;"><input id="bqms" type="text"
                                                                                    style="width: 150px;"
                                                                                    class="form-control"
                                                                                    placeholder=""></td>
                                        <td style="vertical-align:middle; width:2cm;">备注:</td>
                                        <td align="left"><input id="bz" type="text" style="width: 150px;"
                                                                class="form-control"
                                                                placeholder=""></td>
                                    </tr>
                                    <tr>
                                        <td colspan="12" align="center">
                                            <button onclick="updateLable()" type="button" class="btn btn-info"
                                                    style="width: 2cm;">修改
                                            </button>
                                            &nbsp;
                                            <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="xx">
                    <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12" >
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
                                    <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                                        <i class="glyphicon glyphicon-remove"></i>
                                        删除
                                    </button>
                                    <div style="height: 10px"></div>
                                </div>
                                <table id="table" class="table table-striped table-bordered table-hover" data-height="390" style="white-space: nowrap"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="tjLable" class="row" style=" display:none ">
            <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12" style="width: 98%;height: 80%; margin-top: 100px">
                <div class="widget">
                    <div class="widget-header bg-blue">
                        <span class="widget-caption">添加标签</span>

                        <div class="widget-buttons">
                            <a href="#" data-toggle="maximize">
                                <i class="fa fa-expand"></i>
                            </a>
                            <a href="#" data-toggle="collapse">
                                <i class="fa fa-minus"></i>
                            </a>
                            <a href="#" data-toggle="dispose">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-label="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="height: 400px">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                &times;
            </button>
            <div class="modal-header">
                添加标签
            </div>
            <div class="modal-body">
                <%--<div class="widget-body" style="width: 100%;height: 80%;">--%>
                <form id="editForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">标签名称:</label>

                        <div class="col-sm-4">
                            <input id="bqmc1" name="yzbq" type="text" style="width:200px;" class="form-control">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">标签描述:</label>

                        <div class="col-sm-4">
                            <input id="bqms1" name="yzms" type="text" class="form-control" style="width:200px;"
                                   placeholder="">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>

                        <div class="col-sm-4">
                            <input name="yzxh" id="xh1" type="number" min="1" style="width:200px;"/>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>

                        <div class="col-sm-4">
                                            <textarea id="bz1" class="form-control" rows="4"
                                                      style="width:200px;"></textarea>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="text-center">
                        <button style="text-align: center" type="submit" class="btn btn-primary" onclick="bc1()">保存
                        </button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
</body>

</html>
<script>

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjzdpage.jsp";
    }

    //清除模态框源数据
    $('#myModal').on("hidden.bs.modal", function () {
        $(this).removeData("bs.modal");
    })

    //定义选中的父类标签id
    var pbqid = "";
    //zTree树
    sendLedControl();
    var zTree;
    var treeNodes;
    $(function () {
        inittrees();
        ssss(pbqid);
    });
    //定义初始化树属性
    var setting = {
        view: {
            dblClickExpand: true,//双击展开父节点
            showLine: true,//设置zTree是否显示节点之间的连线
            selectedMulti: false //设置是否允许同时选中多个节点
        },
        data: {
            key: {
                name: "bqmc"
            },
            simpleData: {
                enable: true,   //设置ztree是否开启异步加载
                idKey: "bqid",
                pIdKey: "pbqid",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    pbqid = treeNode.bqid;
                    ssss(pbqid);
                    return false;
                }
            },
            onClick: function (event, treeId, treeNode) {
                $("#bqmc").val(treeNode.name);
                $("#bqid").val(treeNode.bqid);
                pbqid = treeNode.bqid;
                targetinfo(treeNode.bqid)
            }
        }
    };
    //zTree初始化
    function inittrees() {
        $.ajax({
            async: false,
            cache: false,
            type: 'post',
            datatType: "json",
            url: "${pageContext.request.contextPath}/sjzd/ywbqgl/list",
            error: function () {
            },
            success: function (data) {
                treeNodes = data.rows;
                if (pbqid == "") {
                    pbqid = data.svo.bqid;
                }
                $.fn.zTree.init($("#tree"), setting, treeNodes);

            }
        });
    }
    <!--获取所有标签 初始化树数据-->
    function sendLedControl() {
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/ywbqgl/selectAll",
            async: true,
            dataType: 'json',
            type: 'put',
            success: function (data1) {
                getchildrens(data1);
            }
        });
    }
    //获取父节点的基本信息和所有叶子节点列表信息
    function ssss(pbqid) {
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/ywbqgl/targetinfo',
            type: 'post',
            data: {
                'svo.bqid': pbqid
            },
            success: function (json) {
                //赋值
                $("#bqmc").val(json.pvo.bqmc);
                $("#bqms").val(json.pvo.bqms);
                $("#bz").val(json.pvo.bz);
                $('#table').bootstrapTable("destroy");
                getchildrens(json.childrens);
            }

        });
    }
    //获取叶子节点（子标签）信息
    function targetinfo(bqid) {
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/ywbqgl/targetinfo',
            type: 'post',
            data: {
                'svo.bqid': bqid
            },
            success: function (json) {
                //赋值
                $("#bqmc").val(json.pvo.bqmc);
                $("#bqms").val(json.pvo.bqms);
                $("#bz").val(json.pvo.bz);
                $('#table').bootstrapTable("destroy");
            }
        });
    }

    // 创建表数据
    function getchildrens(data1) {
        $('#table').bootstrapTable({
            method: 'get',
            sidePagination: 'client',
            striped: true,//显示隔行换色效果
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            uniqueId: 'id',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sqbt", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center'

            }, {
                field: 'bqmc',
                align: 'center',
                title: '标签名称 '
            }, {
                field: 'bqms',
                align: 'center',
                title: '标签描述 '

            }, {
                field: 'cjsj',
                align: 'center',
                title: '创建时间 '
            }, {
                field: 'bz',
                align: 'center',
                title: '备注 '
            }
            ],
            data: data1
        });
    }
    //Modal验证销毁重构
    $("#myModal").on('hidden.bs.modal', function () {
        $("#editForm").data('bootstrapValidator').destroy();
        $("#editForm").data('bootstrapValidator', null);
        formValidator();
    });
    $(document).ready(function () {
        formValidator();
    });
    //保存
    function bc1() {
        //开启验证
        $("#editForm").data('bootstrapValidator').validate();
        if (!$("#editForm").data('bootstrapValidator').isValid()) {
            return;
        }
        var bqmc1 = $("#bqmc1").val();
        var bqms1 = $("#bqms1").val();
        var xh1 = $("#xh1").val();
        var bz1 = $("#bz1").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/ywbqgl/insertlable',
            type: 'post',
            data: {
                'svo.bqmc': bqmc1,
                'svo.bqms': bqms1,
                'svo.xh': xh1,
                'svo.bz': bz1,
                'svo.pbqid': pbqid
            },
            success: function (json) {
                //重新加载树
                inittrees();
                //  重新加载列表
                ssss(pbqid);
                $('#myModal').modal('hide');
                $("#bqmc1").val("");
                $("#bqms1").val("");
                $("#xh1").val("");
                $("#bz1").val("");


            }
        });
    }

    //修改标签基本信息
    function updateLable() {
        var bqmc = $.trim($("#bqmc").val());
        var bqms = $.trim($("#bqms").val());
        var bz = $.trim($("#bz").val());
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/ywbqgl/updateLable',
            type: 'post',
            data: {
                'svo.bqid': pbqid,
                'svo.bqmc': bqmc,
                'svo.bqms': bqms,
                'svo.bz': bz
            },
            success: function (json) {
                inittrees();
                //展开父节点
                var ztree_menu = $.fn.zTree.getZTreeObj("tree");
                var node = ztree_menu.getNodeByParam("bqid", pbqid);
                ztree_menu.expandNode(node, true, false);
            }
        });
    }

    //删除事件
    function btn_delete() {
        sc();
    }
    function sc() {
        var alldata = $("#table").bootstrapTable("getSelections");
        var bqid = alldata[0].bqid;
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/ywbqgl/deleteLable',
            type: 'post',
            data: {
                'svo.bqid': bqid
            },
            success: function (json) {
                //重新加载树
                inittrees();
                ssss(pbqid)
            }
        });
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
                yzbq: {
                    message: '标签名称名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '标签名称不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjzd/ywbqgl/nameValidation",
                            message: '该标签名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                yzms: {
                    validators: {
                        notEmpty: {
                            message: '标签描述不能为空'
                        }
                    }
                },
                yzxh: {
                    validators: {
                        notEmpty: {
                            message: '标签序号不能为空'
                        }
                    }
                }
            }
        });
    }
</script>

