<%--
  Created by IntelliJ IDEA.
  User: cuihegn
  Date: 2018/4/18
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据标签维护</title>
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
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>

    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--时间--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <%--Select2--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
    <%--页面提交数据--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <%--表单验证插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
    <!--时间-->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datetime/bootstrap-datepicker.js"></script>
    <%--行内编辑--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable-revision/bootstrap-editable.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable/bootstrap-table-editable.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-editable.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>
    <!--zTree插件-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.ztree.core.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datetime/bootstrap-datepicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-treeview.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-treeview.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.ztree.core.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/jquery.ztree.excheck-3.5.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/jquery.ztree.exedit-3.5.js"></script>

</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm">数据来源:</td>
                            <td>
                                <select class="sjlb" style="width: 150px;" id="sjlb">
                                    <option></option>
                                </select>
                            </td>

                            <td style="vertical-align:middle;width: 3cm">业务标签:</td>
                            <td>

                                <input id="citySel" type="text" readonly value="" style="width:150px;"
                                       onclick="showMenu();"/>
                                <a id="menuBtn" href="#" onclick="showMenu(); return false;"></a>

                                <div id="menuContent" class="menuContent"
                                     style="display:none; position: absolute; z-index: 1">
                                    <ul id="treeDemo" class="ztree"
                                        style="margin-top:0; width:180px; height: 300px; "></ul>
                                </div>
                            </td>

                            <td style="vertical-align:middle;width: 3cm">表中文名称:</td>
                            <td>
                                <div class="col-sm-3">
                                    <input id="bzwm" type="text" class="form-control" style="width: 150px">
                                </div>
                            </td>


                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button type="button" class="btn btn-info" style="width: 2.5cm" onclick="searchlist()">
                                    执行查询
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                    </table>
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
                <div id="toolbar">
                    <button onclick="tjbq()" type="button" class="btn btn-info btn-sm" data-toggle="modal">
                        <i class="glyphicon glyphicon-pushpin"></i>添加标签
                    </button>
                    <button onclick="bjbq()" type="button" class="btn btn-warning btn-sm" data-toggle="modal">
                        <i class="glyphicon glyphicon-pushpin"></i>编辑标签
                    </button>
                </div>
                <div class="widget-body">
                    <table id="mytable" class="table table-striped table-bordered table-hover"
                           data-height="549"></table>
                </div>
            </div>
        </div>
    </div>
</div>

<%--添加标签模态框--%>
<div class="modal fade" id="tjbq" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;height: 500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    添加标签
                </h4>
            </div>
            <div class="modal-body">

                <div class="ibox-content">
                    <form id="fileinputForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">业务标签:</label>
                            <ul id="treeDemo1" class="ztree"></ul>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div style="text-align: center">
                            <button type="button" class="btn btn-primary " onclick="mysubmit()">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%--编辑标签模态框--%>
<div class="modal fade" id="bjbq" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;height: 500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    编辑标签
                </h4>
            </div>
            <div class="modal-body">

                <div class="ibox-content">
                    <form id="fileinputForm1" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">业务标签:</label>
                            <ul id="treeDemo2" class="ztree"></ul>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div style="text-align: center">
                            <button type="button" class="btn btn-primary " onclick="edit_mysubmit()">提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>

    var pbqid = '';
    var bqid = '';
    var zNodes = '';
    $(function () {
        //业务标签下拉框初始化
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/sjywbqwh/selectYwbqhn",
            dataType: 'json',
            success: function (datas) {
                $(".ywbq").select2({
                    data: datas,
                    placeholder: '请选择',
                    allowClear: true
                });
                $.fn.zTree.init($("#treeDemo"), setting, datas);
                $.fn.zTree.init($("#treeDemo1"), setting, datas);
                $.fn.zTree.init($("#treeDemo2"), setting, datas);
            }
        });

        //数据来源下拉框
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/sjywbqwh/selectSjlb",
            dataType: 'json',
            success: function (datas) {
                $(".sjlb").select2({
                    data: datas,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //初始化表格
        inittabs();
    });
    //查询
    function searchlist() {
        //数据来源
        var sjly = $("#sjlb").find('option:selected').text();
        //业务标签
        var bqmc = $("#citySel").val();
        //表中文名称
        var bzwmc = $("#bzwm").val().trim();
        inittabs(sjly, bqmc, bzwmc);
    }


    //添加标签
    function tjbq() {
        var selectoptin = $("#mytable").bootstrapTable("getSelections");
        if (selectoptin.length == 0) {
            alert("请先选择需要添加标签的数据");
            return false;
        }
        $('#tjbq').modal('show');
    }

    //添加标签提交方法
    function mysubmit() {
        //获取选中标签的id
        var aa = $.fn.zTree.getZTreeObj("treeDemo1");
        nodes = aa.getCheckedNodes(true);
        var bqstr = "";
        for (var i = 0; i < nodes.length; i++) {
            if (i == 0) {
                bqstr = nodes[i].id;
            } else {
                bqstr += "," + nodes[i].id;
            }
        }

        //获取表格所有数据
        var tabdatas = $("#mytable").bootstrapTable("getSelections");
        //提交参数
        var parmssss = {nsrxxlist: JSON.stringify(tabdatas), bqstr: bqstr};
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjyj/sjywbqwh/insertbqid";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新当前页面
            window.location.reload();
        }
        //提交数据
        $.myajax.common("post",
                parmssss,
                myurl,
                myfunctions
        );

    }

    //编辑标签
    function bjbq() {
        var selectoptin = $("#mytable").bootstrapTable("getSelections");
        if (selectoptin.length != 1) {
            alert("请先选择一条需要编辑标签的数据");
            return false;
        }
        $('#bjbq').modal('show');
    }

    function edit_mysubmit(){
        var selectoptin = $("#mytable").bootstrapTable("getSelections");
        //获取选中行的表英文名称
        var bywmc ="";
        bywmc = selectoptin[0].bywmc;
       //获取选中行的表中文名称
        var bzwmc ="";
        bzwmc = selectoptin[0].bzwmc;

        //获取选中标签的id
        var aa = $.fn.zTree.getZTreeObj("treeDemo2");
        nodes = aa.getCheckedNodes(true);
        var bqstr1 = "";
        for (var i = 0; i < nodes.length; i++) {
            if (i == 0) {
                bqstr1 = nodes[i].id;
            } else {
                bqstr1 += "," + nodes[i].id;
            }
        }
        var sub = {
            'svo.bywmc': bywmc,
            'svo.bzwmc': bzwmc,
            'bqstr':bqstr1
        }

        var myurl = "${pageContext.request.contextPath}/sjyj/sjywbqwh/updateBqid";
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新当前页面
            window.location.reload();
        }
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        $("#bjbq").modal('hide');

    }


    //初始化表格
    function inittabs(sjly, bqmc, bzwmc) {
        //先销毁表格
        $('#mytable').bootstrapTable('destroy');
        $('#mytable').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/sjywbqwh/selectAll",//获取数据的Select地址
            //使用client分页方式，可以加载数据，可以导出【选中】
            //使用server分页方式，数据可以正常加载，但数据只能导出当前页所有的数据，不能导出选中
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.sjly': sjly,
                    'svo.bqmc': bqmc,
                    'svo.bzwmc': bzwmc,
                    pageSize: params.limit,
                    pageNumber: params.pageNumber,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true, //是否分页
            singleSelect: false,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "cpid", //每一行的唯一标识，一般为主键列
            //  ueryParamsType: 'limit',
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'

            }, {
                field: 'bzwmc',
                align: 'center',
                title: '表中文名称'

            }, {
                field: 'bywmc',
                align: 'center',
                title: '表中文名称'

            }, {
                field: 'bsjl',
                align: 'center',
                title: '数据量'
            }, {
                field: 'name',
                align: 'center',
                title: '维护人员'
            }, {
                field: 'tjsj',
                align: 'center',
                title: '维护时间'
            }, {
                field: 'sjly',
                align: 'center',
                title: '数据来源'
            }, {
                field: 'bqmc',
                align: 'center',
                title: '标签名称'
            },

            ]

        });
    }

    //查询条件中的ztree
    var setting = {
        check: {
            enable: true,
            chkboxType: {"Y": "", "N": ""}
        },
        view: {
            dblClickExpand: false
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: beforeClick,
            onCheck: onCheck
        }
    };

    function showMenu() {
        var cityObj = $("#citySel");
        var cityOffset = $("#citySel").offset();
        $("#menuContent").css({
            left: cityOffset.left + "px",
            top: cityOffset.top + cityObj.outerHeight() + "px"
        }).slideDown("fast");
        $("body").bind("mousedown", onBodyDown);
    }

    function beforeClick(treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.checkNode(treeNode, !treeNode.checked, null, true);
        return false;
    }


    function onCheck(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
                nodes = zTree.getCheckedNodes(true),
                v = "";
        for (var i = 0, l = nodes.length; i < l; i++) {
            v += nodes[i].name + ",";
        }
        if (v.length > 0) v = v.substring(0, v.length - 1);
        var cityObj = $("#citySel");
        cityObj.attr("value", v);
    }

    function hideMenu() {
        $("#menuContent").fadeOut("fast");
        $("body").unbind("mousedown", onBodyDown);
    }
    function onBodyDown(event) {
        if (!(event.target.id == "menuBtn" || event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
            hideMenu();
        }
    }


    //添加标签中的ztree
    var setting1 = {
        check: {
            enable: true,
            chkboxType: {"Y": "", "N": ""}
        },
        view: {
            dblClickExpand: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: beforeClick1,
            onCheck: onCheck1
        }
    };

    function beforeClick1(treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo1");
        zTree.checkNode(treeNode, !treeNode.checked, null, true);
        return false;
    }

    function onCheck1(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo1"),
                nodes = zTree.getCheckedNodes(true),
                v = "";
        for (var i = 0, l = nodes.length; i < l; i++) {
            v += nodes[i].name + ",";
        }
        if (v.length > 0) v = v.substring(0, v.length - 1);

    }

    //修改标签中的ztree
    var setting2 = {
        check: {
            enable: true,
            chkboxType: {"Y": "", "N": ""}
        },
        view: {
            dblClickExpand: true
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            beforeClick: beforeClick2,
            onCheck: onCheck2
        }
    };

    function beforeClick2(treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo2");
        zTree.checkNode(treeNode, !treeNode.checked, null, true);
        return false;
    }

    function onCheck2(e, treeId, treeNode) {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo2"),
                nodes = zTree.getCheckedNodes(true),
                v = "";
        for (var i = 0, l = nodes.length; i < l; i++) {
            v += nodes[i].name + ",";
        }
        if (v.length > 0) v = v.substring(0, v.length - 1);
    }

</script>
















