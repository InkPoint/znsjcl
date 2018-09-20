<%--
  Created by IntelliJ IDEA.
  User:  cuiheng
  Date: 2017/12/11
  Time: 16:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据分区管理</title>
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
    <%--<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
</head>
<body>

<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <!--小部件标题-->
                <div class="widget-body">
                    <table class="table">
                        <td style="vertical-align:middle; width:3cm;">分区名称:</td>
                        <td>
                            <div class="control-label">
                                <select class="input-xlarge" style="width: 150px;" id="fqmc">
                                    <option></option>
                                </select>
                            </div>
                        </td>
                        <tr align="center">
                            <td colspan="12">
                                <button type="button" class="btn btn-info" onclick="searchlist()">执行查询</button>
                                &nbsp;
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="gohistory()">返回</button>

                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12" style="height: 40%">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal" data-target="#myModal">
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
                    <table id="table" class="table table-striped table-bordered table-hover  ">
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- /Page Body -->
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
                    增加
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="EditData" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">分区名称:</label>

                            <div class="col-sm-5">
                                <input type="text"  name="jyname" class="form-control" id="tjfqmc"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">分区描述:</label>
                            <div class="col-sm-5">
                                <input type="text" name="yzfq" class="form-control" id="tjfqms"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注:</label>
                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="tjbz"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" onclick="tjbc()">保存</button>
                        </div>
                    </form>
                </div>
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
                        <%--分区ID--%>
                        <%--<input type="hidden" class="form-control" id="jbid"/>--%>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">分区名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="bjfqmc"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">分区描述:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="bjfqms"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="editbz"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="bjbc()">
                    保存
                </button>
            </div>

        </div>
    </div>

</div>
<%--end 编辑_模态框--%>
</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<%--Select2--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script>



        //返回按钮
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjzdpage.jsp";
    }
    //保存当前行数据
    var dqhsj = new Array();
    //(数据分区)下拉菜单
    var datas = [];
    $(function () {
        //初始化数据分区下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/sjfqgl/selectzsfj",
            dataType: 'json',
            success: function (datas) {
                $("#fqmc").select2({
                    data: datas,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //初始化(数据对象管理)表格数据
        inittabs();
    });
    function inittabs(fqmc) {
        //先销毁表格
        $('#table').bootstrapTable('destroy');
        $('#table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjzd/sjfqgl/selectList",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.fqmc': fqmc,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true, //是否分页
            singleSelect: true,//设置为true禁止多选
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,//设置为true只显示总数据数，而不显示分页按钮
            toolbar: '#toolbar',
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "jbid", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center'

            }, {
                field: 'fqmc',
                align: 'center',
                title: '分区名称'

            }, {
                field: 'fqms',
                align: 'center',
                title: '分区描述'
            }, {
                field: 'cjsj',
                align: 'center',
                title: '创建时间'
            }, {
                field: 'bz',
                align: 'center',
                title: '备注'
            }]
        });
    }
    //查找事件
    function searchlist() {
        //获取分区名称
        var fqmc = $("#fqmc").select2("data")[0].text;
        inittabs(fqmc);
    }

    $(document).ready(function () {
        formValidator();
    });

    //Modal验证销毁重构
    $("#myModal").on('hidden.bs.modal', function () {
        $("#EditData").data('bootstrapValidator').destroy();
        $("#EditData").data('bootstrapValidator', null);
        formValidator();
    });

    //保存(新增)
    function tjbc() {
        //开启验证
        $("#EditData").data('bootstrapValidator').validate();
        if (!$("#EditData").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取分区名称
        var fqmc = $("#tjfqmc").val();
        //获取分区描述
        var fqms = $("#tjfqms").val();
        //获取备注
        var bz = $("#tjbz").val();

        //提交参数
        var sub = {
            'svo.fqmc': fqmc,
            'svo.fqms': fqms,
            'svo.bz': bz
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjzd/sjfqgl/insertSjfq";
//        //成功方法
        var myfunctions = function () {
            //刷新当前页面
//            window.location.reload();
            //关闭模态框
            $('#myModal').modal('hide');
            inittabs();

        };
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
    }

    //修改
    $("#myEdit").click(function () {
        var allselecteddata = $("#table").bootstrapTable("getSelections");
        dqhsj = allselecteddata;
        if (allselecteddata.length != 1) {
            alert("请选择一条要编辑的记录!");
            return false;
        } else {
            //级别ID
            $("#fqid").val(allselecteddata[0].fqid);
            //分区名称
            $("#bjfqmc").val(allselecteddata[0].fqmc);
            //分区描述
            $("#bjfqms").val(allselecteddata[0].fqms);
            //备注
            $("#editbz").val(allselecteddata[0].bz);
        }
    });
    //获取要修改的数据
    function bjbc() {
        //获取分区名称
        var fqmc = $("#bjfqmc").val();
        //获取分区描述
        var fqms = $("#bjfqms").val();
        //获取备注
        var bz = $("#editbz").val();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjzd/sjfqgl/updateSjfq',
            type: 'post',
            data: {
                'svo.fqid': dqhsj[0].fqid,
                'svo.fqmc': fqmc,
                'svo.fqms': fqms,
                'svo.bz': bz
            },
            success: function (json) {
                inittabs();
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
        var ids = rows[0].fqid
        console.log("ids", ids);
        var msg = "您真的确定要删除么？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            $.ajax({
                url: "${pageContext.request.contextPath}/sjzd/sjfqgl/deleteSjfq",
                type: "post",
                data: {
                    'svo.fqid': ids
                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        }
        ;
    }
</script>
<script type="text/javascript">
    //模态框表单验证
    function formValidator() {
        $('#EditData').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                jyname: {
                    message: '分区名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '分区名称不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjzd/sjfqgl/nameValidation",
                            message: '该分区名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                yzfq: {
                    validators: {
                        notEmpty: {
                            message: '分区描述不能为空'
                        }
                    }
                }
            }
        });
    }
</script>

