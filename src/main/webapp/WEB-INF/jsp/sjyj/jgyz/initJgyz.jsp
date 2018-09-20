<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/12/15
  Time: 17:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>结果验证</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css"
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
    <%--文件上传 css--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput-rtl.css"/>
    <%--验证--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <script>
        function gobacks() {
            $(window.parent.goMenuPage());
        }
    </script>
</head>
<body>
<!-- Page Body -->
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
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
                    <!--Widget Buttons-->
                </div>
                <!--Widget Header-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 2cm">分析任务:</td>
                            <td style="width: 24cm">
                                <div class="control-label">
                                    <select class="input-ywlx" style="width: 160px;" id="ywlx">
                                        <option></option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button type="button" class="btn btn-info" onclick="querys()">执行查询</button>
                                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                <%--<button type="button" class="btn btn-info btn-block" onclick="gobacks()"--%>
                                <%--style="width: 2cm;">返&nbsp;&nbsp;回--%>
                                <%--</button>--%>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--Widget Body-->
            </div>
            <!--Widget-->
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
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
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                data-target="#addData">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        <button type="button" class="btn btn-warning btn-sm" data-toggle="modal"
                                data-target="#editData" id="myEdit">
                            <i class="glyphicon glyphicon-pencil"></i>编辑
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                    </div>
                    <table id="mytab" class="table table-striped table-bordered table-hover"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--新增_模态框(Modal)--%>
<div class="modal fade" id="addData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 750px">
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
                <%--任务定制--%>
                <div class="ibox-content">
                    <form id="addDataValidator" method="post" class="form-horizontal">

                        <div class="form-group">
                            <label class="col-sm-4 control-label">分析任务:</label>

                            <div class="col-sm-2" style="width: 290px;">
                                <select id="model-ywlx" name="fxrw" class="input-ywlx" style="width:100%;height: 35px;">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">验证结论:</label>

                            <div class="col-sm-2" style="width: 290px;">
                                <textarea id="model-yzjl" name="yzjl" rows="4" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <%--<div class="form-group">--%>
                            <%--<label class="col-sm-4 control-label">文件上传:</label>--%>

                            <%--<div class="col-sm-2" style="width: 290px;">--%>
                                <%--<input type="file" class="file-loading" name="fileinput" id="fileinput"/>--%>
                            <%--</div>--%>
                        <%--</div>--%>



                        <div  class="form-group">
                            <label class="col-sm-4 control-label">文件上传:</label>

                            <div class="col-sm-2" style="width: 380px;">
                                <input type="file" class="file-loading" id="fileinput" name="fileinput" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div style="text-align: center">
                        <button  type="submit" class="btn btn-primary" data-dismiss="modal" onclick="addData()">
                            提交
                        </button>
                            </div>
                    </form>
                </div>
            </div>


        </div>
    </div>
</div>
<%--end 新增_模态框--%>
<%--编辑_模态框(Modal)--%>
<div class="modal fade" id="editData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 800px">
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
                <%--编辑--%>
                <div class="ibox-content">
                    <form method="post" class="form-horizontal">
                        <%--任务ID--%>
                        <input type="hidden" class="form-control" id="mod_rwid"/>

                        <div class="form-group">


                            <div class="form-group">
                                <label class="col-sm-5 control-label">文件名称:</label>

                                <div class="col-sm-2" style="width: 210px;">
                                    <input type="text" class="form-control" id="mod_wjmc" readonly/>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>

                            <div class="form-group">
                                <label class="col-sm-5 control-label">验证结论:</label>

                                <div class="col-sm-2" style="width: 210px;">
                                    <textarea id="mod_yzjl" rows="4" class="form-control"></textarea>
                                </div>
                            </div>


                            <%--<div class="form-group">--%>
                            <%--<label class="col-sm-5 control-label">分析任务:</label>--%>

                            <%--<div class="col-sm-2" style="width: 210px;">--%>
                            <%--<select id="mod_ywlx" class="input-ywlx"--%>
                            <%--style="width:100%;height: 35px;">--%>
                            <%--<option></option>--%>
                            <%--</select>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                            <%--<div class="hr-line-dashed"></div>--%>

                        </div>

                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="saveedit()">
                    提交
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
<%--时间--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<%--文件上传插件--%>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fileinput/fileinput.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fileinput/zh.js"></script>

<%--验证--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script>
    var filename = "";
    var datas = [];
    var uploadpath="";
    $(function () {
        // 分析任务（下拉菜单）
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/jgyz/selectzsfj",
            dataType: 'json',
            success: function (datas) {
                $(".input-ywlx").select2({
                    data: datas,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //初始化表格
        inittabs();
    });
    function shutdown() {
        //清除模态框缓存
        $('#addData').on('hidden.bs.modal', function () {
            $(this).removeData("bs.modal");
            clearForm($('#addData'));
        });
    }
    //清除文本框内容
    function clearForm(form) {
        //input清空
        $(':input', form).each(function () {
            var type = this.type;
            var tag = this.tagName.toLowerCase();
            if (type == 'text' || type == 'password' || tag == 'textarea')
                this.value = "";
        });
    }
    //查询
    //(结果验证)初始化表格
    function inittabs(ywlxcons) {
        //先销毁表格
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
//            method: "post",//使用get请求到服务器获取数据
            url: "${pageContext.request.contextPath}/sjyj/jgyz/selectFxrw",//获取数据的Select地址
            //使用client分页方式，可以加载数据，可以导出【选中】
            //使用server分页方式，数据可以正常加载，但数据只能导出当前页所有的数据，不能导出选中
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
//            showRefresh: true, //刷新按钮
//            showExport: true,//是否显示导出按钮
//            search: true, //是否启用搜素
//            showPaginationSwitch: true,
            queryParams: {
                'svo.lxid': ywlxcons
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
//            showToggle: "true", //切换视图
//            showColumns: 'true', //是否显示内容列下拉框
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'yzmc',
                    align: 'center',
                    title: '分析任务'
                }, {
                    field: 'yzjl',
                    align: 'center',
                    title: '验证结论'
                }, {
                    field: 'uploadpath',
                    align: 'center',
                    title: '上传文件'
                }, {
                    field: 'yzsj',
                    align: 'center',
                    title: '验证时间'
                }
            ]
        });

    }
    //执行查询
    function querys() {
        //获取（下拉菜单）业务类型ID
        var ywlx = $("#ywlx").select2("data");
        var ywlxcon = "";
        if (ywlx != null && JSON.stringify(ywlx) != "{}" && typeof(ywlx) != "undefined" && ywlx.length > 0) {
            ywlxcon = ywlx[0].id;
        }
        inittabs(ywlxcon);
    }
    $("#myEdit").click(function () {
        var toobtain = $("#mytab").bootstrapTable("getSelections");
        if (toobtain.length != 1) {
            alert("请选择一条要编辑的记录!");
            return false;
        }
        //任务id
        $("#mod_rwid").val(toobtain[0].rwid);
        //文件名称
        $("#mod_wjmc").val(toobtain[0].yzmc);
        //业务类型
        $("#mod_ywlx").val(toobtain[0].lxmc).select2();
        //验证结论
        $("#mod_yzjl").val(toobtain[0].yzjl);
    });

    //初始化校验表单
    $(document).ready(function () {
            formValidator();
        });

    //Modal验证销毁重构
    $("#addData").on('hidden.bs.modal', function () {
        $("#addDataValidator").data('bootstrapValidator').destroy();
        $("#addDataValidator").data('bootstrapValidator', null);
        formValidator();
    });


    //保存(--新增--)
    function addData() {
        //开启验证
        $("#addDataValidator").data('bootstrapValidator').validate();
        if (!$("#addDataValidator").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取上传文件名
        var file = filename;
        //获取业务类型(下拉菜单)
        var ywlx = $("#model-ywlx").select2("data")[0].text;
        console.log("ywlx", ywlx);
        //获取验证结论
        var yzjl = $("#model-yzjl").val();
        //获取上传文件名称

        console.log("uploadpath:"+uploadpath);

        //提交参数
        var sub = {
            //验证业务名称
            'svo.yzmc': file,
            //业务类型ID
            'svo.yzmc': ywlx,
            //验证结论
            'svo.yzjl': yzjl,
            //文件名称
            'svo.uploadpath':uploadpath
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjyj/jgyz/insertFxrw";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新表
            $("#mytab").bootstrapTable("refresh")
        }
        //提交数据
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
    };

    //保存(编辑)
    function saveedit() {

        //获取任务id
        var rwid = $("#mod_rwid").val();
        console.log("rwid",rwid);
        //获取文件名称
        var yzmc = $("#mod_wjmc").val();
        console.log("yzmc",yzmc);
        //业务类型ID
//        var lxid = $("#mod_ywlx").select2("data")[0].id;
//        console.log("lxid",lxid)
        //获取验证结论
        var yzjl = $("#mod_yzjl").val();
        console.log("yzjl:"+yzjl);
        //提交参数
        var sub = {
            'svo.rwid': rwid,
            'svo.yzmc': yzmc,
//            'svo.lxid': lxid,
            'svo.yzjl': yzjl
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjyj/jgyz/updateFxrw";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //刷新
            // window.location.reload();
            $("#mytab").bootstrapTable("refresh");
        }
        //提交数据
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
    }

    //删除数据
    function btn_delete() {
        var msg = "你确定要删除此数据吗？";
        var seldata = $('#mytab').bootstrapTable("getSelections");
        if (seldata.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        if (confirm(msg) == true) {
            $.ajax({
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${pageContext.request.contextPath}/sjyj/jgyz/deleteFxrw",
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


    //文件上传
    $(function () {
        $("#fileinput").fileinput({
            showUpload: true,    //是否显示上传按钮
            showPreview: false,   //是否显示预览
            uploadAsync: true,   //默认异步上传
            language: "zh",      //语言
            showCaption: true,//是否显示标题
            dropZoneEnabled: false,//是否显示拖拽区域
            maxFileSize: 15000,//单位kb  最大文件大小   0 为不限制文件大小
            maxFileCount: 1,//最大文件数量
            enctype: 'multipart/form-data',//模拟form数据类型
            uploadUrl: '${pageContext.request.contextPath}/sjyj/jgyz/uploadfileinput'   //上传请求地址
        });
        //异步上传结果处理
        $("#fileinput").on('fileerror', function (event, data, msg) {

        });
        //异步上传返回结果处理（上传成功）
        $("#fileinput").on('filepreupload', function (event, data, previewId, index) {
            uploadpath = data.files[0].name;

        });
        //选择文件后处理事件
        $("#fileinput").on('filebatchselected', function (event, files) {
            filename = files[0].name;
            console.log("filename:"+filename);
        });

    });

</script>


<script type="text/javascript">
    //模态框表单验证
    function formValidator() {
        $("#addDataValidator").bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                fxrw: {
                    message: '任务名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '分析任务不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjyj/jgyz/nameValidation",
                            message: '该分析任务已存在',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                yzjl: {
                    validators: {
                        notEmpty: {
                            message: '验证结论不能为空'
                        }
                    }
                }
//                myfileinputs: {
//                    validators: {
//                        notEmpty: {
//                            message: '请上传文件'
//                        }
//                    }
//                }
            }
        });
    }
</script>