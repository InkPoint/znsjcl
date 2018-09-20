<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/4/13
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>元件检索</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Bootstrap Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
    <!--Bootstrap-table Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.min.css">
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <!--zTree styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>
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
                <div class="row">
                    <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                        <div class="widget">

                            <div class="widget-header bg-blue">
                                <span class="widget-caption">查询条件</span>
                            </div>
                            <div class="widget-body">
                                <table class="table">
                                    <tr>
                                        <td colspan="12">
                                            <form method="post" class="form-horizontal">
                                                <div class="form-group">
                                                    <label class="col-sm-1 control-label"
                                                           style="text-align: left;width: 2.5cm;">元件名称:</label>

                                                    <div class="col-sm-2" style="width: 190px;">
                                                        <input id="sjyjmc" align="left" type="text"
                                                               class="form-control">
                                                    </div>
                                                    <label class="col-sm-1 control-label"
                                                           style="text-align: left;width: 2.5cm;">标签名称:</label>

                                                    <div class="col-sm-2" style="width: 190px;">
                                                        <input id="bqmc" align="left" type="text" class="form-control">
                                                    </div>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="12" align="center">
                                            <button type="button" class="btn btn-info" style="width: 2cm;"
                                                    onclick="querys()">
                                                执行查询
                                            </button>
                                            <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" id="xx">
                    <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12" style="width: 100%;height: 45%;">
                        <div class="widget">
                            <div class="widget-header ">
                                <span class="widget-caption">查询结果</span>
                            </div>
                            <div class="widget-body">
                                <table id="table" class="table table-striped table-bordered table-hover" data-height="489"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/assets/assets/js/jquery-1.11.1.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${pageContext.request.contextPath}}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--zTree插件--%>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ztree.core.js"></script>
</html>
<script>
    //定义选中的元件id
    var yjid = "";
    var zTree;
    var treeNodes;
    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                querys();
            }
        });
        getTabeldata();
        inittrees();
    });
    //获取所有标签 初始化树数据
    function getTabeldata() {
        $.ajax({
            url: "${ctx}/zzfwzx/yjjs/selectAll",
            async: true,
            dataType: 'json',
            type: 'put',
            success: function (datas) {
                inittabs(datas);
            }
        });
    }

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/zzfwzxpage.jsp";
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
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
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
                field: 'bz',
                align: 'center',
                title: '备注'
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
            url: "${ctx}/zzfwzx/yjjs/list",
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
    //执行查询
    function querys() {
        //获取元件名称
        var yjmc = $("#sjyjmc").val().trim();
        //获取标签名称
        var bqmc = $("#bqmc").val().trim();
        $.ajax({
            url: '${ctx}/zzfwzx/yjjs/targetinfo',
            type: 'post',
            data: {
                'svo.yjmc': yjmc,
                'svo.bqmc': bqmc
            },
            success: function (data) {
                inittabs(data);
            }
        });
    }
    //获取父节点的基本信息和所有叶子节点列表信息
    function getzjd(yjid) {
        $.ajax({
            url: '${ctx}/zzfwzx/yjjs/targetinfo',
            type: 'post',
            data: {
                'svo.yjid': yjid
            },
            success: function (data) {
                inittabs(data);
            }
        });
    }
</script>