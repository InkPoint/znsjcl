<%--
  Created by IntelliJ IDEA.
  User: liduo
  Date: 2018/1/18
  Time: 9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据验证</title>
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
    <%--Select2--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>

    <%--验证--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
    <script>
        function gobacks() {
            inittab();
        }
    </script>
</head>
<body>
<%--page body--%>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                   <%-- <span class="widget-caption">查询条件</span>
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
                    </div>--%>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width:3cm;">主题名称:</td>
                            <td>
                                <input id="yzmc" type="text" class="form-control" style="vertical-align: middle;width: 250px"/>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="2">
                                <button type="button" class="btn btn-info" style="width: 2.5cm" onclick="querys()">执行查询</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width:2cm;">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <%--查询条件end--%>
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header">
                    <span class="widget-caption">查询结果</span>
                    <%--<div class="widget-buttons">
                    <a href="#" data-toggle="maximize">
                    <i class="fa fa-expand"></i>
                    </a>
                    <a href="#" data-toggle="collapse">
                    <i class="fa fa-minus"></i>
                    </a>
                    <a href="#" data-toggle="dispose">
                    <i class="fa fa-times"></i>
                    </a>
                    </div>--%>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                onclick="openadd()">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="del()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                    </div>
                    <table id="mytab" class="table-striped" data-height="460"></table>
                </div>

            </div>
        </div>
    </div>
</div>
<%--新增模态框--%>
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
                            <label class="col-sm-4 control-label">主题:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <input class="form-control" type="text" id="yzmcmodal" name="yzmc" style="vertical-align: middle;"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">验证结论:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <textarea id="yzjlmodal" name="yzjl" rows="2" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">是否上传文件:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <select id="sfscwjmodal" name="sfscwj"  style="width:100%;height: 35px;" onchange="showdiv()">
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div id="hiddendiv" style="display: none">
                        <div  class="form-group">
                            <label class="col-sm-4 control-label">文件上传:</label>
                            <div class="col-sm-2" style="width: 380px;">
                                <input type="file" class="file-loading" id="fileinput" name="fileinput" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        </div>
                        <div style="text-align: center">
                            <button    class="btn btn-primary"  onclick="addData()">
                                提交
                            </button>
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
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjyjpage.jsp";
    }


    //文件名称
    var uploadpath1 = '';
    $(function(){
        var data = [{id:'1',text:'暂不上传'},{id:'2',text:'上传文件'}];
        //初始化是否上传文件的下拉框
        $("#sfscwjmodal").select2({
            data:data,
            placeholder: '请选择',
            allowClear: true
        });
        //初始化表格;
        inittab('');
    });
    //执行查询
    function querys(){
        //验证名称
        var yzmc = $("#yzmc").val();
        //初始化表格
        inittab(yzmc);
    }
    //初始化表格
    function inittab(yzmcs){
        console.log("21341645");
        //先销毁表格
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            url:'${pageContext.request.contextPath}/sjyj/sjyz/list',
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
//            showPaginationSwitch: true,
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            sidePagination: "server",//表示客户端请求
//          toolbar: '#toolbar',
            paginationLoop: true,
            uniqueId: 'rwid',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "rwid", //每一行的唯一标识，一般为主键列
//          showToggle: "true", //切换视图
//          showColumns: 'true', //是否显示内容列下拉框
            queryParams: function (params) {
                return {
                    'svo.yzmc': yzmcs,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            ueryParamsType: 'limit',
            columns:[{
                field: 'xa',
                align:'center',
                checkbox:true
//                title:'选择'
            },{
                field:'yzmc',
                align:'center',
                title:'主题'
            },{
                field:'yzjl',
                align:'center',
                title:'验证结论'
            },{
                field:'uploadpath',
                align:'center',
                title:'上传文件',
                formatter: function (value, row, index) {
                    if(value != null){
                    return '<a style="color:#057afd;"   onclick="viewdata(\'' + row.uploadpath + '\')">'+value+'</a>'
                    }
                }
            },{
                field:'yzsj',
                align:'center',
                title:'上传时间'
            }
            ]
        });
    }
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
    //删除
    function del(){
        var msg = "你确定要删除此数据吗？";
        var seldata = $('#mytab').bootstrapTable("getSelections");
        if (seldata.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        if(confirm(msg) == true){
            $.ajax({
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${pageContext.request.contextPath}/sjyj/sjyz/del",
                data: {'svo.rwid': seldata[0].rwid},
                type: 'post',
                dataType: 'json',
                success: function (msg) {
                    //刷新查询列表
                    $('#mytab').bootstrapTable('remove',{field:'rwid',values:[seldata[0].rwid]});
                }
            });
        }
    }
    //当选择上传文件 出现文件上传的组件
    function showdiv(){
        var sfscwj = $("#sfscwjmodal").val();
        if(sfscwj == '2'){
            $("#hiddendiv").show();
            //文件上传
            $("#fileinput").fileinput({
                showUpload: true,    //是否显示上传按钮
                showPreview: false,   //是否显示预览
                uploadAsync: true,   //默认异步上传
                language: "zh",      //语言
                showCaption: true,//是否显示标题
//              allowedFileExtensions:['xls'],//允许接受的文件后缀
                dropZoneEnabled: false,//是否显示拖拽区域
                maxFileSize: 15000,//单位kb  最大文件大小   0 为不限制文件大小
                maxFileCount: 1,//最大文件数量
                enctype: 'multipart/form-data',//模拟form数据类型
                uploadUrl: '${pageContext.request.contextPath}/sjyj/sjyz/uploadfileinput'   //上传请求地址
            });
            //异步上传结果处理
            $("#fileinput").on('fileerror', function (event, data, msg) {

            });
            //异步上传返回结果处理（上传成功）
            $("#fileinput").on('filepreupload', function (event, data, previewId, index) {
                uploadpath1 = data.files[0].name;
                //console.log("uploadpath1:"+uploadpath1);

            });
            //选择文件后处理事件
            $("#fileinput").on('filebatchselected', function (event, files) {
               // filename = files[0].name;
                //console.log("filename:"+filename);
            });
        }else{
            $("#hiddendiv").hide();
        }
    }
    //新增的保存按钮
    function addData(){
        //开启验证
        $("#addDataValidator").data('bootstrapValidator').validate();
        if (!$("#addDataValidator").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取验证名称
        var yzmc = $("#yzmcmodal").val();
        var yzjl = $("#yzjlmodal").val();
        //提交参数
        var sub = {
            'svo.yzmc':yzmc,
            'svo.yzjl':yzjl,
            'svo.uploadpath':uploadpath1
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjyj/sjyz/insertsjjh";
        //成功方法
        var myfunctions = function (msg) {
            //刷新
            $("#mytab").bootstrapTable("refresh");
        };
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        $("#addData").modal("hide");
    }
    //点击新增弹出模态框的事件
    function openadd(){
        //清空
        $("#yzmcmodal").val('');
        $("#yzjlmodal").val('');
        //默认选择不上传
        $("#sfscwjmodal").select2("val","1");
        $("#addData").modal("show");
    }
    //校验
    function formValidator(){
        $("#addDataValidator").bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                yzmc: {
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '主题名称不能为空'
                        }
                    }
                },
                yzjl: {
                    validators: {
                        notEmpty: {
                            message: '验证结论不能为空'
                        }
                    }
                },
                sfscwj: {
                    validators: {
                        notEmpty: {
                            message: '请选择是否上传文件'
                        }
                    }
                }
            }
        });
    }
    //下载
    function viewdata(uploadpath){
        //先判断文件是否存在
        $.ajax({
            type:'post',
            data:{'uploadpath':uploadpath},
            dataType:'json',
            url:'${pageContext.request.contextPath}/sjyj/sjyz/filexists',
            success:function(data){
               if(data=='y'){
                   window.location.href = "${pageContext.request.contextPath}/sjyj/sjyz/downdata?uploadpath="+uploadpath;
               }else{
                   alert("文件不存在或已经损坏");
               }
            }
        });

    }
</script>
