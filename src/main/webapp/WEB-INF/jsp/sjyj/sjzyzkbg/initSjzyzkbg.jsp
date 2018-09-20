<%--
  Created by IntelliJ IDEA.
  User: ld
  Date: 2018/3/12
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="com.zhuozhengsoft.pageoffice.*,java.awt.*" %>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po" %>--%>

<%--<%--%>
    <%--PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);--%>
    <%--poCtrl1.setServerPage("poserver.do"); //此行必须--%>
    <%--poCtrl1.setCaption("任务书");--%>
    <%--poCtrl1.setTitlebar(true); //隐藏标题栏--%>
    <%--poCtrl1.setMenubar(false); //隐藏菜单栏--%>
    <%--poCtrl1.setOfficeToolbars(false);//隐藏Office工具条--%>
    <%--poCtrl1.setCustomToolbar(false);//隐藏自定义工具栏--%>
    <%--//指定打开的文件，例如：./lwwj/1.doc--%>
    <%--poCtrl1.webOpen("D:\\uploadfiles\\sjzyzkbg\\知识汇总.doc", OpenModeType.docNormalEdit, "1");--%>
    <%--poCtrl1.setTagId("PageOfficeCtrl1");--%>
<%--%>--%>
<html>
<head>
    <title>数据资源状况报告</title>
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
</head>
<body>
<%--bodystart--%>
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
                            <td style="vertical-align:middle; width:3cm;">报告标题:</td>
                            <td>
                                <input class="form-control" id="bgbt" style="vertical-align: middle;width: 150px"/>
                            </td>
                            <td style="vertical-align:middle; width:3cm;">文件名称:</td>
                            <td>
                                <input class="form-control" id="filename" style="vertical-align: middle;width: 150px"/>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="4">
                                <button type="button" class="btn btn-info" style="width: 2cm" onclick="querys()">执行查询</button>
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
                <div class="widget-header">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button type="button" class="btn btn-success btn-sm" onclick="btn_add()">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        &nbsp;
                        <button type="button" onclick="btn_edit()" class="btn btn-warning btn-sm">
                            <i class="glyphicon glyphicon-pencil "></i>
                            编辑
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                    </div>
                    <table id="zkbatab" class="table table-striped table-bordered table-hover" data-height="530"></table>
                </div>
            </div>
        </div>

    </div>
</div>
<%--addmodal--%>
<div class="modal fade" id="addBg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                <%--任务定制--%>
                <div class="ibox-content">
                    <form id="addDataValidator" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">报告标题:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <input class="form-control" type="text" id="addbgbt" name="bgbttext" style="vertical-align: middle;"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">报告描述:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <textarea id="addbgms" name="bgmstext" rows="3" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">文件上传:</label>
                            <div class="col-sm-2" style="width: 380px;">
                                <input type="file" class="file-loading" id="fileinput" name="fileinput" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">文件名称:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <input class="form-control" type="text" id="addfilename" readonly  name="filenametext" style="vertical-align: middle;"/>
                            </div>
                        </div>
                        <div style="text-align: center">
                            <button    class="btn btn-primary"  onclick="saveData()">
                                提交
                            </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button    class="btn btn-primary"  onclick="addfh()">
                                返回
                            </button>
                        </div>
                    </form>
                </div>
            </div>


        </div>
    </div>
</div>
<%--editmodal--%>
<div class="modal fade" id="editBg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 650px">
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
                <%--任务定制--%>
                <div class="ibox-content">
                    <form id="editDataValidator" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">报告标题:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <input class="form-control" type="text" id="editbgbt" name="editbgbttext" style="vertical-align: middle;"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">报告描述:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <textarea id="editbgms" name="editbgmstext" rows="3" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">是否重新上传文件:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <select id="sfcxsc" name="sfcxsctext"  style="width:100%;height: 35px;" onchange="showdiv()">
                                </select>
                            </div>
                        </div>
                        <div id="hiddendiv" style="display: none">
                            <div class="form-group">
                                <label class="col-sm-4 control-label">文件上传:</label>
                                <div class="col-sm-2" style="width: 380px;">
                                    <input type="file" class="file-loading" id="editfileinput" name="editfileinput" />
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">文件名称:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <input class="form-control" type="text" id="editfilename" readonly  name="editfilenametext" style="vertical-align: middle;"/>
                            </div>
                        </div>
                        <div style="text-align: center">
                            <button    class="btn btn-primary"  onclick="editData()">
                                提交
                            </button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <button    class="btn btn-primary"  onclick="editfh()">
                                返回
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
<script type="text/javascript">

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjyjpage.jsp";
    }
    $(function(){
        //初始化页面
        inittab();
        //初始化校验表单
        formValidator();
        formValidator1();
        //文件上传
        $("#fileinput").fileinput({
            showUpload: true,    //是否显示上传按钮
            showPreview: false,   //是否显示预览
            uploadAsync: true,   //默认异步上传
            language: "zh",      //语言
            showCaption: true,//是否显示标题
//            allowedFileExtensions:['doc','docx'],//允许接受的文件后缀
            dropZoneEnabled: false,//是否显示拖拽区域
            maxFileSize: 15000,//单位kb  最大文件大小   0 为不限制文件大小
            maxFileCount: 1,//最大文件数量
            enctype: 'multipart/form-data',//模拟form数据类型
            uploadUrl: '${pageContext.request.contextPath}/sjyj/sjzyzkbg/uploadfile'   //上传请求地址
        });
        //异步上传结果处理
        $("#fileinput").on('fileerror', function (event, data, msg) {

        });
        //异步上传返回结果处理（上传成功）
        $("#fileinput").on('filepreupload', function (event, data, previewId, index) {
            console.log(files[0].name);
            $('#addfilename').val(data.files[0].name);
            //console.log("uploadpath1:"+uploadpath1);

        });
        //选择文件后处理事件
        $("#fileinput").on('filebatchselected', function (event, files) {
            // filename = files[0].name;
            //console.log("filename:"+filename);
        });
        var data = [{id:'1',text:'暂不上传'},{id:'2',text:'上传文件'}];
        //初始化是否上传文件的下拉框
        $("#sfcxsc").select2({
            data:data,
            placeholder: '请选择',
            allowClear: true
        });

    });
    //加载table数据
    function inittab(bgbt,filename){
        //销毁表格
        $('#zkbatab').bootstrapTable('destroy');
        $('#zkbatab').bootstrapTable({
            url:'${pageContext.request.contextPath}/sjyj/sjzyzkbg/selectall',
            queryParams: function (params) {
                return {
                    'svo.bgbt': bgbt,
                    'svo.filename':filename,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            uniqueId: 'zyid',
            uniqueIS: "zyid", //每一行的唯一标识，一般为主键列
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
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
            ueryParamsType: 'limit',
            columns: [
                {
                    field: '',
                    align: 'center',
                    checkbox: true

                }, {
                    field: 'bgbt',
                    align: 'center',
                    title: '报告标题'
                }, {
                    field: 'filename',
                    align: 'center',
                    title: '文件名称(点击可预览)',
                    formatter: function (value, row, index) {
                        if(value != null){
                            return '<a style="color:#057afd;"   onclick="wjyl(\'' + row.filename + '\')">'+value+'</a>'
                        }
                    }
                }, {
                    field: 'username',
                    align: 'center',
                    title: '上传人'
                }, {
                    field: 'uploadtime',
                    align: 'center',
                    title: '上传时间'
                }, {
                    field: 'bgms',
                    align: 'center',
                    title: '报告描述'
                },{
                    field:'cz',
                    align:'center',
                    title:'操作',
                    formatter:function(value,row,index){
                        return '<button class="btn btn-info btn-sm" onclick="wjxz(\'' + row.filename + '\')">文件下载</button>'
                               /* +
                                '<button class="btn btn-info btn-sm" onclick="wjyl(\'' + row.zyid + '\')">文件预览</button>';*/
                    }
                }
            ]
        });
    }
    //基本查询
    function querys(){
        //得到报告标题内容
        var bgbt = $('#bgbt').val();
        //得到文件名称
        var filename = $('#filename').val();
        inittab(bgbt,filename);
    }
    //文件下载
    function wjxz(filename){
        //先判断文件是否存在
        $.ajax({
            type:'post',
            data:{'filename':filename},
            dataType:'json',
            url:'${pageContext.request.contextPath}/sjyj/sjzyzkbg/filexit',
            success:function(data){
                if(data=='y'){
                    window.location.href = "${pageContext.request.contextPath}/sjyj/sjzyzkbg/downloadfile?filename="+filename;
                }else{
                    alert("文件不存在或已经损坏");
                }
            }
        });
    }
    //新增
    function btn_add(){
        $('#addBg').modal('show');
        //置为空
        $('#addfilename').val("");
        $('#addbgbt').val("");
        $('#addbgms').val("");
    }
    //编辑
    function btn_edit(){
    //获取被选中的记录
        var rows = $('#zkbatab').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要编辑的记录！");
            return;
        }else{
            $('#editbgbt').val(rows[0].bgbt);
            $('#editbgms').val(rows[0].bgms);
            $('#editfilename').val(rows[0].filename);
            $('#editBg').modal('show');
        }
    }
    //编辑中的保存事件
    function editData(){
        //开启验证
        $("#editDataValidator").data('bootstrapValidator').validate();
        if (!$("#editDataValidator").data('bootstrapValidator').isValid()) {
            return;
        }
        var onerow = $('#zkbatab').bootstrapTable('getSelections');
        var ebgbt = $('#editbgbt').val();
        var ebgms = $('#editbgms').val();
        var efilename = $('#editfilename').val();
        var ezyid = onerow[0].zyid;
        $.ajax({
            type:'post',
            dataType:'json',
            data:{
                'svo.bgbt':ebgbt,
                'svo.bgms':ebgms,
                'svo.filename':efilename,
                'svo.zyid':ezyid
            },
            url:'${pageContext.request.contextPath}/sjyj/sjzyzkbg/updatezybgdata',
            success:function(data1){
                inittab();
                $('#editBg').modal('hide');
            }
        });


    }
    //编辑中的返回按钮
    function editfh(){
        $('#editBg').modal('hide');
    }
    //editModal验证销毁重构
    $("#editBg").on('hidden.bs.modal', function () {
        $("#editDataValidator").data('bootstrapValidator').destroy();
        $("#editDataValidator").data('bootstrapValidator', null);
        formValidator1();
    });
    //addModal验证销毁重构
    $("#addBg").on('hidden.bs.modal', function () {
        $("#addDataValidator").data('bootstrapValidator').destroy();
        $("#addDataValidator").data('bootstrapValidator', null);
        formValidator();
    });
    //新增的保存按钮
    function saveData(){
        //开启验证
        $("#addDataValidator").data('bootstrapValidator').validate();
        if (!$("#addDataValidator").data('bootstrapValidator').isValid()) {
            return;
        }
        //报告标题
        var bgbtadd = $('#addbgbt').val();
        //报告描述
        var bgmsadd = $('#addbgms').val();
        //文件名称
        var filenameadd = $('#addfilename').val();
        $.ajax({
            type:'post',
            dataType:'json',
            data:{
                'svo.bgbt':bgbtadd,
                'svo.bgms':bgmsadd,
                'svo.filename':filenameadd
            },
            url:'${pageContext.request.contextPath}/sjyj/sjzyzkbg/addzybgdata',
            success:function(data0){
                inittab();
                $('#addBg').modal('hide');
            }

        });
    }
    //新增的返回按钮
    function addfh(){
        $('#addBg').modal('hide');
    }
    //校验添加表单
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
                bgbttext: {
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '报告标题不能为空'
                        }
                    }
                },
                fileinput: {
                    validators: {
                        notEmpty: {
                            message: '上传文件不能为空'
                        }
                    }
                }
//                ,
//                filenametext: {
//                    validators: {
//                        notEmpty: {
//                            message: '文件名称不能为空'
//                        }
//                    }
//                }
            }
        });
    }
    //校验编辑表单
    function formValidator1(){
        $("#editDataValidator").bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                editbgbttext: {
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '报告标题不能为空'
                        }
                    }
                },
                sfcxsctext: {
                    validators: {
                        notEmpty: {
                            message: '请选择是否重新上传文件'
                        }
                    }
                },
//                ,
//                filenametext: {
//                    validators: {
//                        notEmpty: {
//                            message: '文件名称不能为空'
//                        }
//                    }
//                }
                editfileinput: {
                    validators: {
                        notEmpty: {
                            message: '上传文件不能为空'
                        }
                    }
                }
            }
        });
    }
    //编辑modal里面onchage事件
    function showdiv(){
        var sfscwj = $("#sfcxsc").val();
        if(sfscwj=='2'){
            $('#editfilename').val("");
            $('#hiddendiv').show();
            $("#editfileinput").fileinput({
                showUpload: true,    //是否显示上传按钮
                showPreview: false,   //是否显示预览
                uploadAsync: true,   //默认异步上传
                language: "zh",      //语言
                showCaption: true,//是否显示标题
//                allowedFileExtensions:['doc','docx'],//允许接受的文件后缀
                dropZoneEnabled: false,//是否显示拖拽区域
                maxFileSize: 15000,//单位kb  最大文件大小   0 为不限制文件大小
                maxFileCount: 1,//最大文件数量
                enctype: 'multipart/form-data',//模拟form数据类型
                uploadUrl: '${pageContext.request.contextPath}/sjyj/sjzyzkbg/uploadfile'   //上传请求地址
            });
            //异步上传结果处理
            $("#editfileinput").on('fileerror', function (event, data, msg) {

            });
            //异步上传返回结果处理（上传成功）
            $("#editfileinput").on('filepreupload', function (event, data, previewId, index) {
                $('#editfilename').val(data.files[0].name);
                //console.log("uploadpath1:"+uploadpath1);

            });
            //选择文件后处理事件
            $("#editfileinput").on('filebatchselected', function (event, files) {
                // filename = files[0].name;
                //console.log("filename:"+filename);
            });
        }else{
            $('#hiddendiv').hide();
            var rows = $('#zkbatab').bootstrapTable('getSelections');
            $('#editfilename').val(rows[0].filename);
        }
    }
    //删除按钮
    function btn_delete(){
        var msg = "你确定要删除此数据吗？";
        var seldata = $('#zkbatab').bootstrapTable("getSelections");
        if (seldata.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        if(confirm(msg) == true){
            var zyid = seldata[0].zyid;
            $.ajax({
                type:'post',
                dataType:'json',
                data:{
                    'svo.zyid':zyid
                },
                url:'${pageContext.request.contextPath}/sjyj/sjzyzkbg/delzybgdata',
                success:function(msg){
                    //刷新查询列表
                    $('#zkbatab').bootstrapTable('remove',{field:'zyid',values:[seldata[0].zyid]});
                }
            });
        }
    }
    //文件预览
    /*function wjyl(filename){
        $.ajax({
            type:'post',
            dataType:'json',
            data:{
                'svo.filename':filename
            },
            url:'${pageContext.request.contextPath}/sjyj/sjzyzkbg/wjyl',
            success:function(page1){
                console.log("page1:"+page1);
               // document.getElementById(zyid).WebOpen("../doc/test.doc", "docNormalEdit", "aaa");//打开文件
            }
        });



    }*/
</script>
