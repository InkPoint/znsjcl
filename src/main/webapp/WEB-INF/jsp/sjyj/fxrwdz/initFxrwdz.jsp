<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/11/30
  Time: 15:41
  The modifier: PengWen Wang
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>分析任务定制</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>

                    <%--<div class="widget-buttons">--%>
                    <%--<a href="#" data-toggle="maximize">--%>
                    <%--<i class="fa fa-expand"></i>--%>
                    <%--</a>--%>
                    <%--<a href="#" data-toggle="collapse">--%>
                    <%--<i class="fa fa-minus"></i>--%>
                    <%--</a>--%>
                    <%--<a href="#" data-toggle="dispose">--%>
                    <%--<i class="fa fa-times"></i>--%>
                    <%--</a>--%>
                    <%--</div>--%>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width: 2cm">任务名称:</td>
                            <td style="width: 22cm;">
                                <input id="rwmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>

                    <%--<div class="widget-buttons">--%>
                    <%--<a href="#" data-toggle="maximize">--%>
                    <%--<i class="fa fa-expand"></i>--%>
                    <%--</a>--%>
                    <%--<a href="#" data-toggle="collapse">--%>
                    <%--<i class="fa fa-minus"></i>--%>
                    <%--</a>--%>
                    <%--<a href="#" data-toggle="dispose">--%>
                    <%--<i class="fa fa-times"></i>--%>
                    <%--</a>--%>
                    <%--</div>--%>
                </div>
                <div class="widget-body">
                    <div id="toolbar">

                        <button type="button" class="btn btn-success btn-sm" onclick="btn_add()">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        &nbsp;

                        <button type="button" id="myEdit" class="btn btn-warning btn-sm">
                            <i class="glyphicon glyphicon-pencil "></i>
                            编辑
                        </button>
                        &nbsp;

                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                        &nbsp;
                        <%--Start new  Time：2018/4/23--%>
                        <button id="startthe" type="button" class="btn btn-primary btn-sm" onclick="startTheTask()">
                            <i class="glyphicon glyphicon-play"></i>
                            启动
                        </button>
                        <%--End of new--%>
                    </div>
                    <%--Modify Time：2018/4/23--%>
                    <table id="taskList_table" class="table table-striped table-bordered table-hover" data-height="543"
                           style="white-space: nowrap;"></table>
                    <!--添加任务模态框-->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-label="myModalLabel">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    &times;
                                </button>
                                <div class="modal-header">
                                    添加
                                </div>
                                <div class="modal-body">
                                    <%--<div class="widget-body" style="width: 100%;height: 80%;">--%>
                                    <form id="editForm" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">任务名称:</label>

                                            <div class="col-sm-5">
                                                <input id="tjrwmc" name="tjrwmc" type="text" style="width:200px;"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">任务描述：</label>
                                            <%--Modify time:2018/4/23 --%>
                                            <div class="col-sm-5">
                                                <textarea style="width: 200px" rows="2" id="tjrwms" name="tjrwms"
                                                          class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <div class="form-group">

                                            <label class="col-sm-4 control-label">模型列表:</label>
                                            <div class="col-sm-5">
                                                <select id="tjmxlb" name="tjmxlb" class="js-data2-example-ajax"
                                                        style="width: 200px;">
                                                    <option></option>
                                                </select>
                                            </div>
                                        </div>
                                        <%--<div class="hr-line-dashed"></div>--%>

                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-sm-4 control-label">执行时间:</label>--%>

                                        <%--<div id="tjzxsj" style="width: 50%;"--%>
                                        <%--class="input-group date form_date col-md-4"--%>
                                        <%--data-date=""--%>
                                        <%--data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">--%>
                                        <%--<input class="form-control">--%>
                                        <%--<span class="input-group-addon">--%>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="hr-line-dashed"></div>--%>
                                        <%--2018/4/23--%>
                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-sm-4 control-label">执行周期:</label>--%>
                                        <%--<div class="col-sm-5">--%>
                                        <%--<select id="tjzqid" name="tjzqid" class="js-data2-example-ajax"--%>
                                        <%--style="width: 200px;">--%>
                                        <%--<option></option>--%>
                                        <%--</select>--%>
                                        <%--</div>--%>

                                        <%--</div>--%>
                                        <div class="hr-line-dashed"></div>

                                        <div style="text-align: center">
                                            <button type="submit" class="btn btn-primary" onclick="tjbc()"
                                                    data-dismiss="modal">保存
                                            </button>
                                        </div>
                                    </form>
                                    <%--</div>--%>
                                </div>
                            </div>

                        </div>

                    </div>
                    <!--结束-->
                    <!-------------------------------------------------------------------------------------------->
                    <!--编辑任务模态框-->
                    <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-label="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <%--Start new  Time：2018/4/23--%>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title"> 编辑 </h4>
                                    <%--End of new--%>
                                </div>
                                <div class="modal-body">
                                    <%--<div class="widget-body" style="width: 100%;height: 80%;">--%>
                                    <form id="editForm1" method="post" class="form-horizontal">

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">任务名称:</label>

                                            <div class="col-sm-4">
                                                <input id="bjrwmc" type="text" style="width:200px;"
                                                       class="form-control">
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">任务描述：</label>

                                            <div class="col-sm-4">
                                                <textarea style="width: 200px" rows="2" id="bjrwms"
                                                          class="form-control"></textarea>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">模型列表：</label>
                                            <div class="col-sm-4">
                                                <select id="bjmxlb" class="js-data2-example-ajax" style="width: 200px;">
                                                    <option></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>

                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-sm-4 control-label">执行时间:</label>--%>

                                        <%--<div id="bjzxsj" style="width: 50%;"--%>
                                        <%--class="input-group date form_date col-md-4"--%>
                                        <%--data-date=""--%>
                                        <%--data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">--%>
                                        <%--<input class="form-control">--%>
                                        <%--<span class="input-group-addon">--%>
                                        <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                        <%--</span>--%>
                                        <%--</div>--%>
                                        <%--</div>--%>
                                        <%--<div class="hr-line-dashed"></div>--%>
                                        <%--2018/4/23--%>
                                        <%--<div class="form-group">--%>
                                        <%--<label class="col-sm-4 control-label">执行周期:</label>--%>
                                        <%--<select id="bjzqid" class="js-data2-example-ajax" style="width: 200px;">--%>
                                        <%--<option></option>--%>
                                        <%--</select>--%>
                                        <%--</div>--%>
                                        <%--<div class="hr-line-dashed"></div>--%>
                                        <%--The new time:2018/4/23 --%>
                                        <div style="text-align: center">
                                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>--%>
                                            <button type="button" class="btn btn-primary" onclick="xgbc()"
                                                    data-dismiss="modal">保存
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <%--Modify time:2018/4/23 --%>
                        <%--<div class="modal-footer">--%>
                        <%--<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>--%>
                        <%--<button type="button" class="btn btn-primary" onclick="xgbc()" data-dismiss="modal">保存--%>
                        <%--</button>--%>
                        <%--</div>--%>
                    </div>

                </div>
                <!--结束-->
            </div>
        </div>
    </div>
</div>
</div>

</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<%--Select2--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--时间--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>

<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script type="text/javascript">

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjyjpage.jsp";
    }

    <%--The new time 2018/4/28--%>
    $(function () {
        $("#rwmc").focus();
        $(document).keydown(function (event) {
            var myfocus = document.actionElement;
            if (document.getElementById("rwmc").contains(myfocus)) return;
            if (event.keyCode == 13) {
                searchlist();
            }
        });
    });

    //保存当前行数据
    var dqhsj = new Array();

    //初始化
    $(function () {
        //初始化表格
        inittabs();

        //时间
        $('#tjzxsj,#bjzxsj').datetimepicker({
            language: 'fr',
            weekStart: 1,
            todayBtn: 1,
            autoclose: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0
        });

        //(模型列表)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/fxrwdz/selectmxlb",
            dataType: 'json',
            success: function (datas1) {
                $("#tjmxlb,#bjmxlb").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        //(执行周期)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/fxrwdz/selectZxzq",
            dataType: 'json',
            success: function (datas1) {
                $("#tjzqid,#bjzqid").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //修改模态框
        $("#myEdit").click(function () {

            var allselecteddata = $("#taskList_table").bootstrapTable("getSelections");
            dqhsj = allselecteddata;
            if (allselecteddata.length != 1) {
                alert("请选择一条要编辑的记录!");
            } else {
                $('#myModal1').modal('show');
                //任务名称
                $("#bjrwmc").val(allselecteddata[0].rwmc);
                //任务描述
                $("#bjrwms").val(allselecteddata[0].rwms);
                //模型列表
                $("#bjmxlb").val(allselecteddata[0].mxid).select2();
                //周期
                $("#bjzqid").val(allselecteddata[0].zqid).select2();

            }

        });
    });


    function inittabs(rwmcs) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjyj/fxrwdz/selectList",
            //Modify time:2018/4/23
            //search: true, //是否启用搜素
            // showRefresh: true, //刷新按钮
            pagination: true, //是否分页
            queryParams: function (params) {
                return {
                    'svo.rwmc': rwmcs,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "nsrmc", //每一行的唯一标识，一般为主键列
            //Modify time:2018/4/23
            // showToggle: "true", //切换视图
            // showColumns: 'true', //是否显示内容列下拉框
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                width: 40,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'rwmc',
                    align: 'center',
                    title: '任务名称'
                }, {
                    field: 'rwms',
                    align: 'center',
                    title: '任务描述'
                }, {
                    field: 'mxmc',
                    align: 'center',
                    title: '模型'
                }, {
                    field: 'zxsj',
                    align: 'center',
                    title: '创建时间'
                }, {
                    field: 'yxzt',
                    align: 'center',
                    title: '运行状态'
                }
            ]
        });
    }

    //按照纳税人名称查询
    function searchlist() {
        //The new time2018/5/2
        //去除所有的空格replace(/\s+/g, "");
        var rwmc = $("#rwmc").val().replace(/\s+/g, "");
        //var rwmc = $("#rwmc").val();
        inittabs(rwmc);
    }

    //Modal验证销毁重构
    $("#myModal").on('hidden.bs.modal', function () {
        $("#editForm").data('bootstrapValidator').destroy();
        $("#editForm").data('bootstrapValidator', null);
        formValidator();
    });

    //添加验证
    $(document).ready(function () {
        formValidator();
    });

    //添加任务事件
    function btn_add() {
        $('#myModal').modal('show');
    }

    //添加
    function tjbc() {
        //开启验证
        $("#editForm").data('bootstrapValidator').validate();
        if (!$("#editForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取任务名称
        var rwmc = $("#tjrwmc").val();
        //获取任务描述
        var rwms = $("#tjrwms").val();
        //获取模型列表
        var mxlb = $("#tjmxlb").select2("data")[0].id;
        //console.log("模型列表ID=", mxlb);
        //获取执行时间
//        var zxsj = $("#tjzxsj").data("datetimepicker").getDate();
        //获取执行周期
        var zqid = $("#tjzqid").val();
        //提交参数
        var sub = {
            'svo.rwmc': rwmc,
            'svo.rwms': rwms,
            'svo.mxid': mxlb,
//            'svo.zxsj': zxsj,
            'svo.zqid': zqid
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjyj/fxrwdz/insertRw";
//        //成功方法
        var myfunctions = function () {
            //刷新当前页面
            window.location.reload();
        };
        $.myajax.common("post",
            sub,
            myurl,
            myfunctions
        );

    }
    ;

    //编辑任务事件
    function xgbc() {
        $('#myModal1').modal('show');
        //获取任务id
        var rwid = $("#rwid").val();
        //获取任务名称
        var rwmc = $("#bjrwmc").val();
        //获取任务描述
        var rwms = $("#bjrwms").val();
        //获取模型名称
        var mxmc = $("#bjmxlb").select2("data")[0].id;
        //console.log("mxmc :", mxmc);
        //(Modify the time 2018/5/7)获取执行周期
        // var zqid = $("#bjzqid").select2("data")[0].id;
        // console.log("-------------", dqhsj[0].rwid);
        $.ajax({
            url: '${pageContext.request.contextPath}/sjyj/fxrwdz/updateRw',
            type: 'post',
            data: {
                'svo.rwid': dqhsj[0].rwid,
                'svo.rwmc': rwmc,
                'svo.rwms': rwms,
                'svo.mxid': mxmc
                //Modify the time 2018/5/7
                //'svo.zqid': zqid
            },
            success: function (json) {
                $('#taskList_table').bootstrapTable('refresh');
            }
        });
    }

    //删除事件
    function btn_delete() {
        //获取被选中的记录
        var rows = $('#taskList_table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var rwids = rows[0].rwid;
        var msg = "您真的确定要删除么？";
        if (confirm(msg) == true) {
            $.ajax({
                url: "${pageContext.request.contextPath}/sjyj/fxrwdz/deleteRw",
                type: "post",
                data: {
                    'svo.rwid': rwids

                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        }
        ;
    }

    //The new time 2018/4/28
    function startTheTask() {
        alert("任务启动成功");
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
                tjrwmc: {
                    message: '任务名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '任务名称不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjyj/fxrwdz/nameValidation",
                            message: '该任务名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                tjrwms: {
                    validators: {
                        notEmpty: {
                            message: '任务描述不能为空'
                        }
                    }
                },
                tjmxlb: {
                    validators: {
                        notEmpty: {
                            message: '模型列表不能为空'
                        }
                    }
                },
                tjzqid: {
                    validators: {
                        notEmpty: {
                            message: '执行周期不能为空'
                        }
                    }
                }
            }
        });
    }
</script>
