<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/4/11
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>自定义处理任务</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.min.css">
    <%--Select2 styles--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--BootstrapValidator styles--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--bootstrap-editable Styles--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-editable.css"/>
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
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width:2cm;">批次:</td>
                            <td style="width: 6cm;">
                                <div class="col-sm-2" style="width: 190px;">
                                    <select id="pc" class="input-batch" style="width:100%;height: 35px;">
                                        <option/>
                                    </select>
                                </div>
                            </td>
                            <td style="vertical-align:middle; width:2.5cm;">任务名称:</td>
                            <td>
                                <div class="col-sm-2" style="width: 190px;">
                                    <input id="rwmc" align="left" type="text" class="form-control"
                                           placeholder="请输入名称">
                                </div>
                            </td>

                        </tr>

                        <tr>
                            <td colspan="12" align="center">
                                <button type="submit" class="btn btn-info" style="width: 2cm;" onclick="querys()">
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
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                data-target="#addModal">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        <%--<button type="button" class="btn btn-warning btn-sm" data-toggle="modal"--%>
                        <%--data-target="#editData" id="myEdit">--%>
                        <%--<i class="glyphicon glyphicon-pencil"></i>编辑--%>
                        <%--</button>--%>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                        <button id="startthe" type="button" class="btn btn-primary btn-sm" onclick="btn_bootup()">
                            <i class="glyphicon glyphicon-play"></i>
                            启动
                        </button>
                    </div>
                    <table id="mytab" class="table table-striped table-bordered table-hover" data-height="560"
                           style="white-space: nowrap;"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Add data modal--%>
<div class="modal fade" id="addModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 650px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title"> 新增 </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">任务名称</label>

                            <div class="col-sm-2" style="width: 210px;">
                                <input type="text" class="form-control" id="mod_rwmc" name="missionname"/>
                            </div>
                            <label class="col-sm-2 control-label">处理类型</label>

                            <div class="col-sm-2" style="width: 210px;">
                                <select id="mod_clmx" class="input-xlarge" style="width:100%;height: 35px;"
                                        name="processingmodel" onchange="updatedats()">
                                    <option/>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div id="tohidea" style="display: none">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">模型</label>

                                <div class="col-sm-2" style="width: 210px;">
                                    <select id="modelmx" class="input-model" onchange="modelmatch()"
                                            style="width:100%;height: 35px;" name="model">
                                    </select>
                                </div>
                                <label class="col-sm-2 control-label">源数据表</label>

                                <div class="col-sm-2" style="width:210px;">
                                    <select id="mod_ysjb" class="input-tablemenu" style="width:100%;height: 35px;"
                                            name="metadatatable" onchange="checkthedata()">
                                        <option/>
                                    </select>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                        </div>
                        <%--匹配说明--%>
                        <p id="match-that" style="display: none;color: #2828FF"></p>
                        <%--数据清洗Bootstrap-Table--%>
                        <div id="linkage" style="display: none">
                            <div id="tool">
                                <button class="btn btn-success btn-sm" onclick="viewmodal()">
                                    <i class="glyphicon glyphicon-plus"></i>
                                    添加
                                </button>
                                <button type="button" class="btn btn-danger btn-sm" onclick="deletenewdata()">
                                    <i class="glyphicon glyphicon-remove"></i>
                                    删除
                                </button>
                            </div>
                            <table id="add-data-the-modal" data-height="200"></table>
                            </br>
                        </div>
                        <%--End 数据清洗 Bootstrap-Table--%>
                        <%--数据匹配操作--%>
                        <div id="matching" style="display: none">
                            <table id="data-matching" data-height="200"></table>
                            <br>
                        </div>
                        <%--End 数据匹配操作--%>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">批次</label>

                            <div class="col-sm-3" style="width: 210px;">
                                <select id="mod_pc" class="input-batch" style="width:100%;height: 35px;"
                                        name="batch" onclick="getpcmenu()">
                                </select>
                            </div>
                            <div class="col-sm-1"></div>
                            <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                    data-target="#addbatch">
                                <i class="glyphicon glyphicon-plus"></i>
                                添加
                            </button>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">备注</label>

                            <div class="col-sm-4" style="width: 210px">
                                <textarea id="mod_bz" rows="1" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="addData()">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Close the add data modal--%>
<%--Add batch--%>
<div class="modal fade" id="addbatch" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 650px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    新增批次
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="batchformvaildation" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">批次代码:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="pcdm" name="batchcode"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">批次名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="pcmc" name="batchnames"/>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="submit" class="btn btn-primary" data-dismiss="modal"
                                    onclick="savesbatch()">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Close the add batch--%>
<%--Edit modal--%>
<div class="modal fade" id="editData" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">编辑</h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationEditForm" method="post" class="form-horizontal">
                        <input type="hidden" class="form-control" id="mod_rwid"/>

                        <div class="form-group">
                            <label class="col-sm-5 control-label">任务名称</label>

                            <div class="col-sm-2" style="width: 210px;">
                                <input type="text" class="form-control" id="mod_rwmcs" name="missionname"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">处理类型</label>

                            <div class="col-sm-2" style="width: 210px;">
                                <select id="mod_clmxs" class="input-xlarge" style="width:100%;height: 35px;"
                                        name="processingmodel" onchange="mxmenu()">
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">模型</label>

                            <div class="col-sm-2" style="width: 210px;">
                                <select id="model_mx" class="input-mx"
                                        style="width:100%;height: 35px;" name="model">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">源数据表</label>

                            <div class="col-sm-2" style="width:210px;">
                                <select id="mod_ysjbs" class="input-tablemenu" style="width:100%;height: 35px;"
                                        name="metadatatable" onchange="sjxmenu()">
                                    <option/>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">批次</label>

                            <div class="col-sm-2" style="width: 210px;">
                                <select id="mod_pcs" class="input-batch" style="width:100%;height: 35px;" name="batch">
                                    <option/>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注</label>

                            <div class="col-sm-2" style="width: 210px;">
                                <textarea id="mod_bzs" rows="4" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary" onclick="saveedit()">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Close the edit data--%>
<%--Add indicator--%>
<div class="modal fade" id="thenewindicator" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width: 650px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    添加
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="indicatorvaildation" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">数据项:</label>

                            <div class="col-sm-5">
                                <select id="mod_zd" class="input-sjx" style="width:100%;height: 35px;"
                                        name="addfields">
                                    <option/>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">指标:</label>

                            <div class="col-sm-5">
                                <select id="mod_zb" class="input-zb" style="width:100%;height: 35px;"
                                        name="addindicators">
                                    <option/>
                                </select>
                            </div>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                            </button>
                            <button type="button" class="btn btn-primary" onclick="submitanew()">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--Close the add indicator--%>
</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/assets/assets/js/jquery-1.11.1.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${pageContext.request.contextPath}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--Select2 Scripts--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--Submit data Script--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<%--bootstrap-editable Script--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable-revision/bootstrap-editable.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable/bootstrap-table-editable.js"></script>
<%--BootstrapValidator Script--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
</html>
<script>
    var purging = [];
    var match = [];
    var mxidcon = "";
    //对象ID
    var publicvariable = "";
    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                querys();
            }
        });
        //模型(下拉菜单)
        $(".input-model").select2({
            placeholder: '请选择',
            allowClear: true
        });
        //数据项(下拉菜单)
        $(".input-sjx").select2({
            placeholder: '请选择'
        });
        //处理模型(下拉菜单)
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/processingmodel", null, function (data) {
            $(".input-xlarge").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //源数据表、目标数据表（下拉菜单）
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/tablemenu", null, function (data) {
            $(".input-tablemenu").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        // 批次（下拉菜单）
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/batch", null, function (data) {
            $(".input-batch").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //初始化Table
        inittabs();
        adddatathemodal();
        //初始化新增Table
        newmatch();
        //隐藏id列
        $('#add-data-the-modal').bootstrapTable("hideColumn", "sjx");
        $('#add-data-the-modal').bootstrapTable("hideColumn", "zb");
    });

    function getpcmenu() {
        $(".input-batch").val("").select2();
        $(".input-batch").empty();
        // 批次（下拉菜单）
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/batch", null, function (data) {
            $(".input-batch").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
    }
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/zzfwzxpage.jsp";
    }

    //Add data the modal box
    function adddatathemodal() {
        //先销毁表格
        $('#add-data-the-modal').bootstrapTable('destroy');
        //初始化表格，动态从服务器加载数据
        $('#add-data-the-modal').bootstrapTable({
            sidePagination: "server",//表示服务端请求(服务器端处理分页)
            toolbar: '#tool',
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "fields", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'id',
                checkbox: true,
                align: 'center'
            }, {
                field: 'fields',
                align: 'center',
                title: '数据项'
            }, {
                field: 'indicators',
                align: 'center',
                title: '指标'
            }, {
                field: 'sjx',
                align: 'center',
                title: '数据项英文名'
            }]
        });
    }

    //Submit new data
    function submitanew() {
        //开启验证
        $("#indicatorvaildation").data('bootstrapValidator').validate();
        if (!$("#indicatorvaildation").data('bootstrapValidator').isValid()) {
            return;
        }
        //字段
        var sjx = $("#mod_zd").select2('data');
        var sjxcon = sjx[0].text;
        var sjxyw = sjx[0].id;
        //指标
        var zb = $("#mod_zb").select2('data');
        var zbcon = zb[0].text;
        var zbid = zb[0].id;
        $("#add-data-the-modal").bootstrapTable("insertRow", {
            index: 0,
            row: {
                fields: sjxcon,
                indicators: zbcon,
                sjx: sjxyw,
                zbid: zbid
            }
        });
        $("#mod_zd").val("").select2();
        $("#mod_zb").val("").select2();
        $("#thenewindicator").modal("hide");
    }

    //Delete new data
    function deletenewdata() {
        //获取选中行
        var rowsofdata = $("#add-data-the-modal").bootstrapTable("getSelections");
        var str = [];
        for (var k = 0; k < rowsofdata.length; k++) {
            str[k] = rowsofdata[k].fields;
        }
        if (rowsofdata.length != 1) {
            alert("请选择一行删除!");
            return;
        }
        $('#add-data-the-modal').bootstrapTable('remove', {field: 'fields', values: str});
    }

    //字符、指标(添加)模态框
    function viewmodal() {
        var mxid = $("#modelmx").select2('data');
        mxidcon = mxid[0].id;
        if (mxidcon != null && JSON.stringify(mxidcon) != "{}" && typeof(mxidcon) != "undefined" && mxidcon.length > 0) {
            $("#thenewindicator").modal("show");
            //置空数据项
            $("#model_sjx").empty();
            //置空指标
            $("#mod_zb").empty();
            //获取数据项菜单
            sjxmenu();
        }
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/theindexmenu", {"svo.mxid": mxidcon}, function (data) {
            $(".input-zb").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
    }

    //Table data
    function inittabs(pcs, rwmcs) {
        //销毁表格
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            url: "${pageContext.request.contextPath}/zzfwzx/zdyrwcl/selectAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.pc': pcs,
                    'svo.rwmc': rwmcs,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "rwid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'rwmc',
                    align: 'left',
                    halign: 'center',
                    title: '任务名称'
                }, {
                    field: 'clmx',
                    align: 'left',
                    halign: 'center',
                    title: '处理模型'
                }, {
                    field: 'yb',
                    align: 'left',
                    halign: 'center',
                    title: '源数据表'
                }, {
                    field: 'pc',
                    align: 'left',
                    halign: 'center',
                    title: '批次'
                }, {
                    field: 'zxsj',
                    align: 'left',
                    halign: 'center',
                    title: '执行时间'
                }, {
                    field: 'yxzt',
                    align: 'left',
                    halign: 'center',
                    title: '运行状态'
                }, {
                    field: 'bz',
                    align: 'left',
                    halign: 'center',
                    title: '备注'
                }

            ]
        });

    }

    //Search
    function querys() {
        //获取批次
        var pc = $("#pc").select2("data");
        var pccon = "";
        if (pc != null && JSON.stringify(pc) != "{}" && typeof(pc) != "undefined" && pc.length > 0) {
            pccon = pc[0].id;
        }
        //获取任务名称
        var rwmc = $("#rwmc").val().trim();
        inittabs(pccon, rwmc);
    }

    $("#myEdit").click(function () {
        //返回被选元素的后代元素
        var allselecteddata = $("#mytab").bootstrapTable("getSelections");
        if (allselecteddata.length != 1) {
            alert("请选择一条要编辑的记录!");
            return false;
        }
        if (allselecteddata[0].yxzt == ("运行完成")) {
            alert("该任务已运行完成，不可进行编辑操作！");
            return false;
        }
        //任务id
        $("#mod_rwid").val(allselecteddata[0].rwid);
        //任务名称
        $("#mod_rwmcs").val(allselecteddata[0].rwmc);
        //处理类型
        $("#mod_clmxs").val(allselecteddata[0].clmxdm).select2();
        mxmenu();
        //模型(后来新增)
        $("#model_mx").val(allselecteddata[0].mxid).select2();
        //源数据表
        $("#mod_ysjbs").val(allselecteddata[0].ybdm).select2();
        //数据项(后来新增)
        $("#model_sjx").val(allselecteddata[0].sjx).select2();
        //批次
        $("#mod_pcs").val(allselecteddata[0].pcdm).select2();
        //备注
        $("#mod_bzs").val(allselecteddata[0].bz);
    });

    //保存(编辑)
    function saveedit() {
        //开启验证
        $("#validationEditForm").data('bootstrapValidator').validate();
        if (!$("#validationEditForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取任务id
        var rwid = $("#mod_rwid").val();
        //获取任务名称
        var rwmc = $("#mod_rwmcs").val();
        //数据处理类型
        var clmx = $("#mod_clmxs").select2("data")[0].id.trim();
        //模型（后来新增）
        var mx = $("#model_mx").select2("data")[0].id.trim();
        //获取源数据表
        var yb = $("#mod_ysjbs").select2("data")[0].id.trim();
        //获取批次
        var pc = $("#mod_pcs").select2("data")[0].id.trim();
        //获取备注信息
        var bz = $("#mod_bzs").val();
        //提交参数
        var sub = {
            'svo.rwid': rwid,
            'svo.rwmc': rwmc,
            'svo.clmx': clmx,
            'svo.mxid': mx,
            'svo.yb': yb,
            'svo.pc': pc,
            'svo.bz': bz
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/zzfwzx/zdyrwcl/modifydata";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新
            $("#mytab").bootstrapTable("refresh")
        }
        //提交数据
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        $("#editData").modal("hide");
    }

    //保存(新增)
    function addData() {
        //开启验证
        $("#validationForm").data('bootstrapValidator').validate();
        if (!$("#validationForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取任务名称
        var rwmc = $("#mod_rwmc").val();
        //数据处理类型
        var clmx = $("#mod_clmx").select2("data")[0].id.trim();
        //获取模型(后来新增)
        var mx = $("#modelmx").select2("data")[0].id.trim();
        //获取源数据表
        var yb = $("#mod_ysjb").select2("data")[0].id.trim();
        //获取批次
        var pc = $("#mod_pc").select2("data")[0].id.trim();
        //获取备注信息
        var bz = $("#mod_bz").val();
        //清洗Bootstrap-table
        var dataArr = $('#add-data-the-modal').bootstrapTable('getData');
        //(清洗)提交参数
        var sub = {
            'datalist': JSON.stringify(dataArr),
            'svo.rwmc': rwmc,
            'svo.clmx': clmx,
            'svo.mxid': mx,
            'svo.yb': yb,
            'svo.pc': pc,
            'svo.bz': bz
        };
        //(匹配)数据Bootstrap-table
        var allmatchingdata = $('#data-matching').bootstrapTable('getData');
        //(匹配)数据
        var matchingdata = {
            'datalist': JSON.stringify(allmatchingdata),
            'svo.rwmc': rwmc,
            'svo.clmx': clmx,
            'svo.mxid': mx,
            'svo.yb': yb,
            'svo.pc': pc,
            'svo.bz': bz
        };
        //(匹配)模型ID是“1”
        if (clmx == "1") {
            //提交url
            var submiturl = "${ctx}/zzfwzx/zdyrwcl/newamatchingdata";
            //成功方法
            var successfunctions = function (msg) {
                alert("Data Saved: " + msg);
                //刷新
                $("#mytab").bootstrapTable("refresh")
            }
            //提交数据
            $.myajax.common("post",
                    matchingdata,
                    submiturl,
                    successfunctions
            );
            $("#addModal").modal('hide');
            return;
        }
        if (dataArr.length == 0) {
            alert("请添加相关数据项！");
            return;
        }
        //提交url(清洗)
        var myurl = "${ctx}/zzfwzx/zdyrwcl/newaddition";
        //成功方法(清洗)
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新
            $("#mytab").bootstrapTable("refresh")
        }
        //提交数据(清洗)
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        $("#addModal").modal('hide');
    }

    //相关校验
    $(function () {
        //初始化表单验证
        $(document).ready(function () {
            //新增校验
            formValidator();
            //修改校验
            formEditValidator();
            //批次校验
            batchvalidator();
            //指标校验
            indicatorsvalidator();
        });
        //Modal验证销毁重构(新增)
        $("#editData").on('hidden.bs.modal', function () {
            $("#validationForm").data('bootstrapValidator').destroy();
            $("#validationForm").data('bootstrapValidator', null);
            //刷新
            window.location.reload();
            formEditValidator();
        });
        //Modal验证销毁重构(编辑)
        $("#addModal").on('hidden.bs.modal', function () {
            $("#validationEditForm").data('bootstrapValidator').destroy();
            $("#validationEditForm").data('bootstrapValidator', null);
            //刷新
            window.location.reload();
            formEditValidator();
        });
        //Modal验证销毁重构(批次)
        $("#addbatch").on('hidden.bs.modal', function () {
            $("#batchformvaildation").data('bootstrapValidator').destroy();
            $("#batchformvaildation").data('bootstrapValidator', null);
            batchvalidator();
        });
        //Modal验证销毁重构(添加_字段、指标)
        $("#thenewindicator").on('hidden.bs.modal', function () {
            $("#indicatorvaildation").data('bootstrapValidator').destroy();
            $("#indicatorvaildation").data('bootstrapValidator', null);
            indicatorsvalidator();
        });
    });

    //启动
    function btn_bootup() {
        var bootup = $('#mytab').bootstrapTable("getSelections");
        if (bootup.length == 0) {
            alert("请选择要启动的任务！");
            return;
        }
        if (bootup[0].yxzt == ("运行完成") || bootup[0].yxzt == ("正在运行")) {
            alert("该任务已" + bootup[0].yxzt + "，不可再次启动！");
            return;
        }
        //把启动按钮置灰
        $("#startthe").attr("disabled", "true");
        $.ajax({
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            url: "${pageContext.request.contextPath}/zzfwzx/zdyrwcl/bootup",
            data: {
                'svo.rwid': bootup[0].rwid,
                'svo.ytable': bootup[0].ytable,
                'svo.sjx': bootup[0].sjx,
                'svo.clmxdm': bootup[0].clmxdm
            },
            type: 'post',
            dataType: 'json',
            success: function (msg) {
                alert(msg);
                //刷新
                window.location.reload();

            }
        });
    }

    //删除数据
    function btn_delete() {
        var msg = "你确定要删除此数据吗？";
        var seldata = $('#mytab').bootstrapTable("getSelections");
        if (seldata == "[]") {
            if (seldata[0].yxzt == ("正在运行")) {
                alert("该任务" + seldata[0].yxzt + "，不能进行删除操作！");
                return false;
            }
        }

        if (seldata.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        if (confirm(msg) == true) {
            $.ajax({
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${pageContext.request.contextPath}/zzfwzx/zdyrwcl/deletedata",
                data: {'svo.rwid': seldata[0].rwid},
                type: 'post',
                dataType: 'json',
                success: function (msg) {
                    //刷新查询列表
                    $('#mytab').bootstrapTable("destroy");
                    inittabs();
                }
            });
        }
    }

    function updatedats() {
        $("#tohidea").removeAttr("style");
        //清空
        $("#modelmx").empty();
        var mx = $("#mod_clmx").select2("data")[0].text;
        if (mx == "匹配模型") {
            //显示 被隐藏的(数据匹配Table)
            $("#matching").show();
            //移除 数据清洗Bootstrap-table
            $("#linkage").hide();
            //匹配模型(下拉菜单)
            $.ajax({
                url: "${pageContext.request.contextPath}/zzfwzx/zdyrwcl/getmatch",
                dataType: 'json',
                success: function (match) {
                    $(".input-model").select2({
                        data: match,
                        placeholder: '请选择',
                        allowClear: true
                    });
                    //置空默认选中项
                    $(".input-model").val("").select2();
                }
            });
        } else if (mx == "清洗模型") {
            //显示 被隐藏的(数据清洗Table)
            $("#linkage").show();
            //清空(数据项)菜单
            $("#matching").hide();
            //隐藏(匹配)说明
            $("#match-that").hide();
            //清洗模型(下拉菜单)
            $.ajax({
                url: "${pageContext.request.contextPath}/sjcl/dzxtdsclrw/getpurging",
                dataType: 'json',
                success: function (purging) {
                    $(".input-model").select2({
                        data: purging,
                        placeholder: '请选择',
                        allowClear: true
                    });
                    //置空默认选中项
                    //$(".input-model").val("").select2();
                }
            });
        }
    }

    //(源数据表)事件
    function checkthedata() {
        //获取 源表ID
        var dxid = $("#mod_ysjb").select2("data")[0].id;
        publicvariable = dxid;
        //数据项(下拉菜单) 'svo.dxid': dxid
        $(".input-sjx").empty();
        $.post("${ctx}/zzfwzx/zdyrwcl/sjxmenu", {"svo.dxid": dxid}, function (data) {
            $(".input-sjx").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
    }

    //编辑时(获取模型菜单)
    function mxmenu() {
        //清空
        $("#model_mx").empty();
        var mx = $("#mod_clmxs").select2("data")[0].text;
        if (mx == "匹配模型") {
            //匹配模型(下拉菜单)
            $.ajax({
                url: "${pageContext.request.contextPath}/sjcl/dzxtdsclrw/getmatch",
                dataType: 'json',
                success: function (match) {
                    $(".input-mx").select2({
                        data: match,
                        placeholder: '请选择',
                        allowClear: true
                    });
                }
            });
        } else if (mx == "清洗模型") {
            //清洗模型(下拉菜单)
            $.ajax({
                url: "${pageContext.request.contextPath}/sjcl/dzxtdsclrw/getpurging",
                dataType: 'json',
                success: function (purging) {
                    $(".input-mx").select2({
                        data: purging,
                        placeholder: '请选择',
                        allowClear: true
                    });
                }
            });
        }
    }

    //编辑时(获取数据项菜单)
    function sjxmenu() {
        //清空(数据项)菜单
        $("#model_sjx").empty();
        //获取 源表ID
        var dxid = $("#mod_ysjbs").select2("data")[0].id;
        //数据项(下拉菜单) 'svo.dxid': dxid
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/sjxmenu", {"svo.dxid": dxid}, function (data) {
            $(".input-sjx").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
    }

    //Save Batch
    function savesbatch() {
        //开启验证
        $("#batchformvaildation").data('bootstrapValidator').validate();
        if (!$("#batchformvaildation").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取批次代码
        var pcdm = $("#pcdm").val();
        //获取批次名称
        var pcmc = $("#pcmc").val();
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/addbatch", {
            'svo.pcdm': pcdm,
            'svo.pcmc': pcmc
        }, function (data) {
            //重新加载批次菜单
            getpcmenu();
        });
        $("#addbatch").modal("hide");
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/batch", null, function (data) {
            $(".input-batch").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
    }

    //（数据匹配）数据提交
    function datasubmit() {
        //开启验证
        $("#validationForm").data('bootstrapValidator').validate();
        if (!$("#validationForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取任务名称
        var rwmc = $("#mod_rwmc").val();
        //数据处理类型
        var clmx = $("#mod_clmx").select2("data")[0].id.trim();
        //获取模型(后来新增)
        var mx = $("#modelmx").select2("data")[0].id.trim();
        //获取源数据表
        var yb = $("#mod_ysjb").select2("data")[0].id.trim();
        //获取批次
        var pc = $("#mod_pc").select2("data")[0].id.trim();
        //获取备注信息
        var bz = $("#mod_bz").val();
        var dataArr = $('#add-data-the-modal').bootstrapTable('getData');
        if (dataArr.length == 0) {
            alert("请添加相关数据项！");
            return;
        }
        //提交参数
        var sub = {
            'datalist': JSON.stringify(dataArr),
            'svo.rwmc': rwmc,
            'svo.clmx': clmx,
            'svo.mxid': mx,
            'svo.yb': yb,
            'svo.pc': pc,
            'svo.bz': bz
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/zzfwzx/zdyrwcl/newaddition";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新
            $("#mytab").bootstrapTable("refresh")
        }
        //提交数据
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        $("#addModal").modal('hide');
    }

    //获取(模型)匹配项
    function modelmatch() {
        //获取模型菜单选中项ID
        var mxid = $("#modelmx").select2("data")[0].id;
        //数据处理类型
        var clmx = $("#mod_clmx").select2("data")[0].id.trim();
        $.post("${pageContext.request.contextPath}/zzfwzx/zdyrwcl/getmatchthat", {'svo.mxid': mxid}, function (data) {
            //清洗模型ID 0
            if (clmx != "0") {
                if (data != "") {
                    $("#match-that").show();
                    $("#match-that").html("匹配说明：" + data[0].ppsm);
                } else {
                    $("#match-that").show();
                    $("#match-that").html("匹配说明：" + "暂无相关的匹配说明");
                }
            }
        });
        newmatch(mxid);
    }

    //新增匹配项
    function newmatch(mxid) {
        //先销毁表格
        $('#data-matching').bootstrapTable('destroy');
        //初始化表格，动态从服务器加载数据
        $('#data-matching').bootstrapTable({
            url: "${ctx}/zzfwzx/zdyrwcl/getamatch",//获取数据的Select地址
            queryParams: function (params) {
                return {
                    'svo.mxid': mxid
                }
            },
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            columns: [{
                checkbox: true,
                align: 'center'
            }, {
                field: 'ppxyw',
                align: 'center',
                title: '匹配项英文'
            }, {
                field: 'ppxzw',
                align: 'center',
                title: '匹配项中文'
            }, {
                field: 'sjx',
                align: 'center',
                title: '源表数据项',
                width: '200',
                editable: {
                    mode: 'inline',
                    type: 'select',
                    title: '数据项',
                    source: function () {
                        var result = [];
                        $.ajax({
                            url: "${ctx}/zzfwzx/zdyrwcl/getdataitembyid",
                            async: false,
                            type: "get",
                            data: {"svo.dxid": publicvariable},
                            success: function (data, status) {
                                $.each(data, function (key, value) {
                                    result.push({value: value.id, text: value.text});
                                });
                            }
                        });
                        return result;
                    }
                }
            }]
        });
    }

    function gohistory(){
        window.location.href="${ctx}/zzfwzxpage.jsp";
    }
</script>
<script type="text/javascript">
    //Add Form Validation
    function formValidator() {
        $('#validationForm').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                missionname: {
                    message: '任务名称无效',
                    threshold: 2,//只有两个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '任务名称是必须的，不能是空的'
                        }
                    }
                },
                processingmodel: {
                    validators: {
                        notEmpty: {
                            message: '处理模型是必须的，不能是空的'
                        }
                    }
                },
                metadatatable: {
                    validators: {
                        notEmpty: {
                            message: '源数据表是必须的，不能是空的'
                        }
                    }
                },
                batch: {
                    validators: {
                        notEmpty: {
                            message: '批次是必须的，不能是空的'
                        }
                    }
                },
                model: {
                    validators: {
                        notEmpty: {
                            message: '模型是必须的，不能是空的'
                        }
                    }
                }, adataitem: {
                    validators: {
                        notEmpty: {
                            message: '数据项是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }

    //Edit Form Vaildation
    function formEditValidator() {
        $('#validationEditForm').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                missionname: {
                    message: '任务名称无效',
                    threshold: 2,//只有两个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '任务名称是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }

    //Batch Form Vaildation
    function batchvalidator() {
        $('#batchformvaildation').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                batchcode: {
                    message: '批次代码无效',
                    threshold: 2,//只有两个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '批次代码是必须的，不能是空的'
                        },
                        stringLength: {
                            min: 2,
                            max: 50,
                            message: '批次代码必须大于2且小于50的英文字符和下划线组成'
                        },
                        regexp: {
                            regexp: /[A-Za-z_0-9]+$/,
                            message: '批次代码只能包含英文字母、数字、下划线'
                        }
                    }
                }, batchnames: {
                    validators: {
                        notEmpty: {
                            message: '批次名称是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }

    //Indicators Form Vaildation
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
                addfields: {
                    message: '该值无效',
                    threshold: 2,//只有两个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '选择字段是必须的，不能是空的'
                        }
                    }
                }, addindicators: {
                    validators: {
                        notEmpty: {
                            message: '选择指标是必须的，不能是空的'
                        }
                    }
                }
            }
        });
    }
</script>