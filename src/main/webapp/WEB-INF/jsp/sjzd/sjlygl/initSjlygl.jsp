<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/12/12
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据来源管理</title>
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

    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <!--tree-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.ztree.core.js"></script>

    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.fr.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datetime/bootstrap-datepicker.js"></script>

    <!--皮肤脚本：在head中，这个脚本用于加载皮肤和支持的脚本-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>

    <!--Beyond Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>

    <!--table-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.css"/>
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
<body style="background-color: white;">
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 " style="width: 12%;height:100%;background-color: white; ">
            <div>&nbsp;</div>
            <ul id="tree" class="ztree"></ul>
        </div>
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12" style="width: 87%;height: 100%;background-color: white; ">
            <div class="page-body" id="bt" style="height:100%;">
                <div class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header bg-blue">
                                <span class="widget-caption">数据来源修改</span>
                            </div>
                            <div class="widget-body">
                                <table class="table">
                                    <tr>
                                        <td style="vertical-align:middle; width:2.5cm;">来源名称:</td>
                                        <td style="width: 3cm;"><input id="lymc" type="text" style="width: 150px;"
                                                                       class="form-control" placeholder=""></td>
                                        <td align="left" style="vertical-align:middle; width:2.5cm;">来源描述:</td>
                                        <td align="left" style="width: 4cm;"><input id="lyms" type="text"
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
                                            <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!--row开始-->
                <div class="row" id="xx">
                    <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12" style="width: 100%;height: 45%;">
                        <div class="widget-header ">
                            <span class="widget-caption">查询结果</span>
                        </div>
                        <div class="widget-body">
                            <div id="toolbar">
                                <div>&nbsp;</div>
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
                            <table id="table" class="table table-striped table-bordered table-hover"
                                   data-height="450" style="white-space: nowrap"></table>
                        </div>
                    </div>
                </div>
                <!--row结束-->
                <!----------------------------------------添加开始-------------------------------------------->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-label="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content" style="height: 400px">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                &times;
                            </button>
                            <div class="modal-header">
                                数据来源添加
                            </div>
                            <div class="modal-body">
                                <%--<div class="widget-body" >--%>
                                <form id="editForm" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">来源名称:</label>

                                        <div class="col-sm-4">
                                            <input id="lymc1" name="yzlymc" type="text" style="width:200px;"
                                                   class="form-control">
                                        </div>
                                    </div>

                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">来源描述:</label>

                                        <div class="col-sm-4">
                                            <input id="lyms1" name="yzlyms" type="text" class="form-control"
                                                   style="width:200px;"
                                                   placeholder="">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">序&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:</label>

                                        <div class="col-sm-4">
                                            <input id="xh1" type="number" min="1" name="yzxh" style="width:200px;"/>
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
                                        <button type="submit" class="btn btn-primary" onclick="bc1()">保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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

    //定义选中的父类标签id
    var plyid = "";
    // 初始化添加页面日期组件
    $('.date-picker').datepicker();
    //zTree树
    sendLedControl();
    var zTree;
    var treeNodes;
    $(function () {
        inittrees();
        ssss(plyid);
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
                name: "lymc"
            },
            simpleData: {
                enable: true,   //设置ztree是否开启异步加载
                idKey: "lyid",
                pIdKey: "plyid",
                rootPId: ""
            }
        },
        callback: {
            beforeClick: function (treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree");
                if (treeNode.isParent) {
                    plyid = treeNode.lyid;
                    ssss(plyid);
                    return false;
                }
            },
            onClick: function (event, treeId, treeNode) {
                $("#lymc").val(treeNode.name);
                $("#lyid").val(treeNode.lyid);
                plyid = treeNode.lyid;
                targetinfo(treeNode.lyid)
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
            url: "${pageContext.request.contextPath}/sjzd/sjlygl/list",
            error: function () {
            },
            success: function (data) {
                treeNodes = data.rows;
                if (plyid == "") {
                    plyid = data.svo.lyid;
                }
                $.fn.zTree.init($("#tree"), setting, treeNodes);

            }
        });
    }
    <!--获取所有标签 初始化树数据-->
    function sendLedControl() {
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/sjlygl/selectAll",
            async: true,
            dataType: 'json',
            type: 'put',
            success: function (data1) {
                getchildrens(data1);
            }
        });
    }
    //获取父节点的基本信息和所有叶子节点列表信息
    function ssss(plyid) {
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/sjlygl/targetinfo',
            type: 'post',
            data: {
                'svo.lyid': plyid
            },
            success: function (json) {
                //赋值
                $("#lymc").val(json.pvo.lymc);
                $("#lyms").val(json.pvo.lyms);
                $("#bz").val(json.pvo.bz);
                $('#table').bootstrapTable("destroy");
                getchildrens(json.childrens);
            }

        });
    }
    //获取叶子节点（子标签）信息
    function targetinfo(lyid) {
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/sjlygl/targetinfo',
            type: 'post',
            data: {
                'svo.lyid': lyid
            },
            success: function (json) {
                //赋值
                $("#lymc").val(json.pvo.lymc);
                $("#lyms").val(json.pvo.lyms);
                $("#bz").val(json.pvo.bz);
                $('#table').bootstrapTable("destroy");
            }
        });
    }
    $(document).ready(function () {
        formValidator();
    });

    // 创建表数据
    function getchildrens(data1) {
        $('#table').bootstrapTable({
            sidePagination: 'client',
            striped: true,//显示隔行换色效果
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            //sidePagination: "client",//表示客户端请求
            toolbar: '#toolbar',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sqbt", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center'

            }, {
                field: 'lymc',
                align: 'center',
                title: '来源名称 '
            }, {
                field: 'lyms',
                align: 'center',
                title: '来源描述 '

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

    //保存
    function bc1() {
        $("#jbmc").val("");
        $("#jbmc").val("");
        $("#jbmc").val("");


        //开启验证
        $("#editForm").data('bootstrapValidator').validate();
        if (!$("#editForm").data('bootstrapValidator').isValid()) {
            return;
        }
        var lymc1 = $("#lymc1").val();
        var lyms1 = $("#lyms1").val();
        var xh1 = $("#xh1").val();
        var bz1 = $("#bz1").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/sjlygl/insertlable',
            type: 'post',
            data: {
                'svo.lymc': lymc1,
                'svo.lyms': lyms1,
                'svo.xh': xh1,
                'svo.bz': bz1,
                'svo.plyid': plyid
            },
            success: function (json) {
                //重新加载树
                inittrees();
                //  重新加载列表
                ssss(plyid);
                $('#myModal').modal('hide');

            }
        });
    }

    //修改标签基本信息
    function updateLable() {
        var lymc = $.trim($("#lymc").val());
        var lyms = $.trim($("#lyms").val());
        var bz = $.trim($("#bz").val());
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/sjlygl/updateLable',
            type: 'post',
            data: {
                'svo.lyid': plyid,
                'svo.lymc': lymc,
                'svo.lyms': lyms,
                'svo.bz': bz
            },
            success: function (json) {
                inittrees();
                //展开父节点
                var ztree_menu = $.fn.zTree.getZTreeObj("tree");
                var node = ztree_menu.getNodeByParam("lyid", plyid);
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
        var lyid = alldata[0].lyid;
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/sjlygl/deleteLable',
            type: 'post',
            data: {
                'svo.lyid': lyid
            },
            success: function (json) {
                //重新加载树
                inittrees();
                ssss(plyid)
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
                yzlymc: {
                    message: '分区名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '来源名称不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjzd/sjlygl/nameValidation",
                            message: '该来源名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                yzlyms: {
                    validators: {
                        notEmpty: {
                            message: '来源描述不能为空'
                        }
                    }
                },
                yzxh: {
                    validators: {
                        notEmpty: {
                            message: '序号不能为空'
                        }
                    }
                }
            }
        });
    }
</script>
