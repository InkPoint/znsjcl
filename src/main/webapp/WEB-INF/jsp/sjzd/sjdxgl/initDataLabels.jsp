<%--
  Created by IntelliJ IDEA.
  User: win7
  Date: 2017/10/26
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据标签</title>
    <link href="${ctx}/public/static/css/bootstrap.min.css" rel="stylesheet">
    <!--小图标-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${ctx}/public/static/css/style.min.css"/>
    <!--边框样式-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--Ztree--%>
    <link rel="stylesheet" href="${ctx}/assets/css/zTreeStyle.css"/>
</head>
<body>
<div class="row">
    <div class="col-sm-12">
        <div class="widget">
            <div class="widget-header bg-blue">
						<span class="widget-caption">
							<i class=" glyphicon glyphicon-file"></i>
							数据标签</span>

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
                <!--小部件按钮-->
            </div>
            <!--------------->
            <div class="ibox-content" style="height: 755px;">
                <form id="editForm" method="post" class="form-horizontal">
                    <div class="col-md-2 col-sm-offset-4" style="margin-right: -30px">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                选择标签
                            </div>
                            <div class="panel-body" style="height: 450px;">
                                <ul id="treeDemo" class="ztree"></ul>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-1">
                        <div class="panel panel-default">
                            <div class="panel-heading" style="text-align: center">
                                操作
                            </div>
                            <div class="panel-body" style="height: 450px;">
                                </br></br></br></br></br>
                                <%--<i class="fa fa-forward fa-2x"></i>--%>
                                <button type="button" class="btn btn-info  btn-block glyphicon glyphicon-fast-forward"
                                        onclick="nodeCheck();">
                                </button>
                                </br></br></br></br></br></br>
                                <button type="button" class="btn btn-info  btn-block glyphicon glyphicon-fast-backward">
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2" style="margin-left: -30px">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                已选标签
                            </div>
                            <div class="panel-body" style="height: 450px;">
                                <%----%>
                                <ul id="log" class="log" style="list-style-type: none"></ul>
                            </div>
                        </div>
                    </div>

                    <div class="hr-line-dashed"></div>
                    <div class="form-group"></div>
                    <%--预留--%>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <div class="col-sm-1 col-sm-offset-5">
                            <button type="button" class="btn btn-info btn-default">确&nbsp;&nbsp;认</button>
                        </div>
                        <div class="col-sm-1 col-sm-offset-1">
                            <%--<a href="${pageContext.request.contextPath}/sjzd/sjdxgl/initSjdxgl">--%>
                                <button type="button" class="btn btn-info btn-default" onclick="javascript:history.go(-1)">返&nbsp;&nbsp;回
                                </button>
                            <%--</a>--%>
                        </div>
                    </div>
                </form>
            </div>
            <!------------------------>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/public/static/js/jquery.min.js"></script>
<script src="${ctx}/public/static/js/bootstrap.min.js"></script>
<script src="${ctx}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<script src="${ctx}/public/static/js/plugins/bootstrapValidator/bootstrapValidator.min.js"></script>
<%--Ztree--%>
<script src="${ctx}/assets/js/jquery.ztree.core.js"></script>
<script src="${ctx}/assets/js/jquery.ztree.excheck-3.5.js"></script>
</html>
<SCRIPT type="text/javascript">
    var tNodes;
    $.ajax({
        async: false,
        cache: false,
        type: 'get',
        datatType: "json",
        url: "${ctx}/sjzd/sjdxgl/getYwbqTree",
        error: function () {
        },
        success: function (data) {
            tNodes = data;
        }
    });
    var setting = {
        view: {
            dblClickExpand: false,//双击展开父节点
            showLine: true,//设置zTree是否显示节点之间的连线
            selectedMulti: false //设置是否允许同时选中多个节点
        }, check: {
            enable: true
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
                    zTree.expandNode(treeNode);
                    return false;
                }
            },
            onClick: function (event, treeId, treeNode) {
                $("#bqmc").val(treeNode.name);

            },
            beforeClick: beforeClick
        }
    };

    var log, className = "dark";
    function beforeClick(treeId, treeNode, clickFlag) {
        className = (className === "dark" ? "" : "dark");
//        console.log("treeNode:",treeNode);
        showLog(treeNode.bqmc);
        return (treeNode.click != false);
    }
    function showLog(str,strid) {
        if (!log) log = $("#log");
        log.append("<li id='"+strid+"' class='" + className + "'>" + str + "</li>");
        if (log.children("li").length > 22) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }

    //动态设置zTree的所有节点有CheckBox
    function nodeCheck() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        var oncheckobj=zTree.getCheckedNodes();
        console.log("oncheckobj:",oncheckobj);
        //遍历每一个节点然后动态更新nocheck属性值
        for (var i = 0; i < oncheckobj.length; i++) {
            if(typeof(oncheckobj[i].children)=='undefined'||oncheckobj[i].children==null||oncheckobj[i].children.length==0){
                showLog(oncheckobj[i].bqmc,oncheckobj[i].bqid);
            }

        }
    }
    $(document).ready(function () {
        $.fn.zTree.init($("#treeDemo"), setting, tNodes);
    });


</SCRIPT>
