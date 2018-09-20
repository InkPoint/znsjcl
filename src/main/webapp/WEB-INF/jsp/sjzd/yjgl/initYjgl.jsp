<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2017/12/7
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>元件管理</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <!--zTree-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <script>
        function gobacks() {
            $(window.parent.goMenuPage());
        }
    </script>
</head>
<body>
<div class="container-fluid">
    <div class="row clearfix">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12 " style="width: 15%; ">
            <div>&nbsp;</div>
            <ul id="tree" class="ztree"></ul>
        </div>
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12" style="width: 85%;height: 100%;">
            <div class="page-body" id="bt">
                <div class="row" id="xx">
                    <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12" style="width: 100%;height: 45%;">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">查询结果</span>

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
                                </div>
                                <table id="table"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--新增_模态框(Modal)--%>
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
                    <form id="EditData" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">元件名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="yjmc"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">关键字:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="gjz"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">标签选择:</label>

                            <div class="col-sm-5">
                                <input id="bqid" style="width: 220px;" class="mini-treeselect"
                                       url="${pageContext.request.contextPath}/sjzd/yjgl/getYwbqTree"
                                       textField="text"
                                       valueField="id" parentField="pid" popupWidth="220" allowInput="true"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">口径描述:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="kjms"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saves()">
                    提交
                </button>
            </div>

        </div>
    </div>

</div>
<%--end 新增_模态框--%>
<%--编辑_模态框(Modal)--%>
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
                    <form method="post" class="form-horizontal">
                        <%--元件ID--%>
                        <input type="hidden" class="form-control" id="yjid"/>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">元件名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="edit-yjmc"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">关键字:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="edit-gjz"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">标签选择:</label>

                            <div class="col-sm-5">
                                <input id="edit-bqid" style="width: 220px;" class="mini-treeselect"
                                       url="${pageContext.request.contextPath}/sjzd/yjgl/getYwbqTree"
                                       textField="text"
                                       valueField="id" parentField="pid" popupWidth="220" allowInput="false"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">口径描述:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="edit-kjms"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveEdit()">
                    提交
                </button>
            </div>

        </div>
    </div>

</div>
<%--end 编辑_模态框--%>
<%--查看描述_模态框--%>
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
<%--end 查看描述--%>
</body>
<script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<%--Select2--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<!--TreeSelect 树形选择框-->
<script src="${pageContext.request.contextPath}/public/css/TreeSelect/scripts/boot.js" type="text/javascript"></script>
<%--zTree插件--%>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ztree.core.js"></script>
</html>
<script>
    //定义选中的元件id
    var yjid = "";
    var zTree;
    var treeNodes;
    $(function () {
        getTabeldata();
        inittrees();
    });
    //获取表数据
    <!--获取所有标签 初始化树数据-->
    function getTabeldata() {
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/yjgl/selectAll",
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
            sidePagination: 'server',
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
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "yjid", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center'
            }, {
                field: 'yjid',
                align: 'center',
                title: '元件编号'
            }, {
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
            }],
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
    //zTree初始化
    function inittrees() {
        $.ajax({
            async: false,
            cache: false,
            type: 'post',
            datatType: "json",
            url: "${pageContext.request.contextPath}/sjzd/yjgl/list",
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
            url: '${pageContext.request.contextPath}/sjzd/yjgl/targetinfo',
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
        url: "${pageContext.request.contextPath}/sjzd/sjjbgl/getSjjbTree",
        dataType: 'json',
        success: function (datas) {
            $("js-example-basic-single").select2({
                data: datas,
                placeholder: '请选择',
                allowClear: true
            });
        }
    });
    //增
    function saves() {
        //元件名称
        var yjmc = $("#yjmc").val();
        //关键字
        var gjz = $("#gjz").val();
        //标签ID
        var bqid = $("#bqid").val();
        //口径描述
        var yjkj = $("#kjms").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/yjgl/insertlable',
            type: 'post',
            data: {
                'svo.yjmc': yjmc,
                'svo.gjz': gjz,
                'svo.bqid': bqid,
                'svo.yjkj': yjkj,
                'svo.pyjdm': yjid
            },
            success: function () {
                //重新加载树
                inittrees();
                //重新加载列表
                getzjd(yjid);
            }
        });
    }
    //删
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
                url: "${pageContext.request.contextPath}/sjzd/yjgl/deleteList",
                type: "post",
                data: {
                    'svo.yjid': ids
                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        }
        ;
    }
    //改
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
        $("#edit-bqid").val(row[0].bqid);
        //口径描述
        $("#edit-kjms").val(row[0].yjkj);
    }
    //保存_编辑
    function saveEdit() {
        //元件ID
        var yjid = $("#yjid").val();
        //元件名称
        var yjmc = $("#edit-yjmc").val();
        //关键字
        var gjz = $("#edit-gjz").val();
        //标签选择
        var bqid = "";
        if (mini.get("edit-bqid").getSelectedNode() != null || typeof(mini.get("edit-bqid").getSelectedNode()) != "undefined") {
            bqid = mini.get("edit-bqid").getSelectedNode().id;
        }
        //口径描述
        var yjkj = $("#edit-kjms").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/yjgl/modifydata',
            type: 'post',
            data: {
                'svo.yjid': yjid,
                'svo.yjmc': yjmc,
                'svo.gjz': gjz,
                'svo.bqid': bqid,
                'svo.yjkj': yjkj
            },
            success: function (msg) {
                alert("Data Saved: " + msg);
                //刷新当前页面
                window.location.reload();
            }
        });
    }
    //查看口径描述
    var str = "";
    function view(yjid) {
        var getyjid = yjid;
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/yjgl/viewDescribe",
            type: "post",
            data: {
                'svo.yjid': getyjid
            },
            success: function (data) {
                console.log("data:", data[0].yjkj);
                $("#viewDate").val(data[0].yjkj);
                str = data[0].yjkj;
            }
        })
    }
</script>