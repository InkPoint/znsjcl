<%--
  Created by IntelliJ IDEA.
  User: PengWen Wang
  Date: 2018/6/19
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>用户日志</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-wysiwyg/prettify.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-wysiwyg/index.css"/>
    <%--Fileinput Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fileinput.css"/>
</head>
<body>
<div class="container">
    <div class="hero-unit">
        <h1><br/>
            <small>今日完成工作</small>
        </h1>
        <hr/>
        <h3><br/>
            <small>主题</small>
        </h3>
        <input type="text" class="form-control" id="theTheme"/>
        <div id="theAttachment" class="form-group">
            <h3><br/>
                <small>附件</small>
            </h3>
            <div>
                <input id="fileinput" type="file" class="file-loading" name="fileinput" multiple/>
            </div>
        </div>
        <div id="alerts"></div>
        <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
            <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="字体">
                    <i class="glyphicon glyphicon-text-height"></i>&nbsp;<b class="caret"></b></a>
                <ul class="dropdown-menu">
                    <li><a data-edit="fontSize 4"><font size="4">大(24px)</font></a></li>
                    <li><a data-edit="fontSize 3"><font size="3">中(18px)</font></a></li>
                    <li><a data-edit="fontSize 1"><font size="1">小(14px)</font></a></li>
                </ul>
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="bold" title="加粗"><i class="glyphicon glyphicon-bold"></i></a>
                <a class="btn" data-edit="italic" title="倾斜"><i class="glyphicon glyphicon-italic"></i></a>
                <a class="btn" data-edit="strikethrough" title="删除线"><i class="glyphicon glyphicon-gbp"></i></a>
                <a class="btn" data-edit="underline" title="下划线"><i class="glyphicon glyphicon-text-width"></i></a>
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="insertunorderedlist" title="项目符号"><i class="glyphicon glyphicon-list"></i></a>
                <a class="btn" data-edit="insertorderedlist" title="编号"><i class="glyphicon glyphicon-list"></i></a>
                <a class="btn" data-edit="outdent" title="减少缩进量"><i class="glyphicon glyphicon-sort-by-order"></i></a>
                <a class="btn" data-edit="indent" title="增加缩进量"><i
                        class="glyphicon glyphicon-sort-by-order-alt"></i></a>
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="justifyleft" title="左对齐"><i class="glyphicon glyphicon-align-left"></i></a>
                <a class="btn" data-edit="justifycenter" title="居中对齐"><i
                        class="glyphicon glyphicon-align-center"></i></a>
                <a class="btn" data-edit="justifyright" title="右对齐"><i class="glyphicon glyphicon-align-right"></i></a>
                <a class="btn" data-edit="justifyfull" title="两端对齐"><i
                        class="glyphicon glyphicon-align-justify"></i></a>
            </div>
            <div class="btn-group">
                <a class="btn" data-edit="undo" title="撤销"><i class="glyphicon glyphicon-step-backward"></i></a>
                <a class="btn" data-edit="redo" title="恢复"><i class="glyphicon glyphicon-step-forward"></i></a>
            </div>
            <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
        </div>

        <div id="editor">
            Go ahead&hellip;
        </div>
        <div id="fileTable" class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                <div class="widget">
                    <div class="widget-body">
                        <table id="tableid" data-height="360" data-classes="table table-no-bordered"
                               class="table-hover"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div class="modal-body">
    <div class="ibox-content">
            <div class="text-center">
                <input type="button" class="btn btn-default" onclick="window.location.href='${ctx}/zzfwzx/yhrz/initCkrz'" value="返&nbsp;&nbsp;&nbsp;回">
                &nbsp;&nbsp;&nbsp;
                    <input type="button" class="btn btn-info" onclick="saveData()" value="提&nbsp;&nbsp;&nbsp;交"/>
            </div>
    </div>
</div>
</body>
<!--Basic Scripts-->
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/assets/js/bootstrap-wysiwyg/jquery.hotkeys.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-wysiwyg/bootstrap-wysiwyg.js"></script>
<%--File upload script--%>
<script src="${ctx}/assets/js/fileinput/fileinput.js"></script>
<script src="${ctx}/assets/js/fileinput/zh.js"></script>
</html>
<script>
    var filename = "";
    var filepath = "";
    var logid = "${param.logid}";
    var theme="${param.theme}";

    $(function () {
        $("#theTheme").val(theme);
        theLogTable(logid);
        if (logid) {//"",undefined,NaN
            $.post("${ctx}/zzfwzx/yhrz/modifyTheText", {'svo.logid': logid}, function (data) {
                $(document).ready(function () {
                    $("#editor").html(data[0].thetext);
                });
            });
        } else {
            $("#fileTable").hide();
        }
    });

    $(function () {
        function initToolbarBootstrapBindings() {
            var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                    'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                    'Times New Roman', 'Verdana'],
                fontTarget = $('[title=Font]').siblings('.dropdown-menu');
            $.each(fonts, function (idx, fontName) {
                fontTarget.append($('<li><a data-edit="fontName ' + fontName + '" style="font-family:\'' + fontName + '\'">' + fontName + '</a></li>'));
            });
            $('a[title]').tooltip({container: 'body'});
            $('.dropdown-menu input').click(function () {
                return false;
            })
                .change(function () {
                    $(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');
                })
                .keydown('esc', function () {
                    this.value = '';
                    $(this).change();
                });

            $('[data-role=magic-overlay]').each(function () {
                var overlay = $(this), target = $(overlay.data('target'));
                overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
            });
            if ("onwebkitspeechchange" in document.createElement("input")) {
                var editorOffset = $('#editor').offset();
                $('#voiceBtn').css('position', 'absolute').offset({
                    top: editorOffset.top,
                    left: editorOffset.left + $('#editor').innerWidth() - 35
                });
            } else {
                $('#voiceBtn').hide();
            }
        };

        function showErrorAlert(reason, detail) {
            var msg = '';
            var ref = "";
            if (reason === 'unsupported-file-type') {
                msg = "不支持的格式" + detail;
            }
            else {
                console.log("error uploading file", reason, detail);
            }
            $('<div id="prompt" class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>' +
                '<strong>文件上传错误</strong> ' + msg + ' </div>').prependTo('#alerts');
            ref = setInterval(function () {
                $("#prompt").remove();
            }, 3000);
        };
        initToolbarBootstrapBindings();
        $('#editor').wysiwyg({fileUploadError: showErrorAlert});
        window.prettyPrint && prettyPrint();
    });

    $(document).on('ready', function () {
        if (logid) {
            $("#fileinput").fileinput({
                showUpload: true,                        //是否显示上传按钮
                showPreview: false,                      //是否显示预览
                dropZoneEnabled: false,                  //是否显示拖拽区域
                maxFileCount: 1,                         //最大文件数量
                mainClass: "input-group-lg",
                uploadAsync: true,                       //默认异步上传
                language: "zh",                          //语言
                allowedFileExtensions: ['xls', 'doc', 'xlsx', 'docx', 'jpg', 'png', 'jpeg', 'ppt', 'pptx'], //允许接受的文件后缀
                maxFileSize: 51200,                      //单位kb  最大文件大小   0 为不限制文件大小
                enctype: 'multipart/form-data',          //模拟form数据类型
                uploadUrl: '${ctx}/zzfwzx/yhrz/baseUuidUpload',//上传请求地址
                uploadExtraData: {"logid": logid}
            });
        } else {
            $("#fileinput").fileinput({
                showUpload: true,                        //是否显示上传按钮
                showPreview: false,                      //是否显示预览
                dropZoneEnabled: false,                  //是否显示拖拽区域
                maxFileCount: 1,                         //最大文件数量
                mainClass: "input-group-lg",
                uploadAsync: true,                       //默认异步上传
                language: "zh",                          //语言
                allowedFileExtensions: ['xls', 'doc', 'xlsx', 'docx', 'jpg', 'png', 'jpeg', 'ppt', 'pptx'], //允许接受的文件后缀
                maxFileSize: 51200,                      //单位kb  最大文件大小   0 为不限制文件大小
                enctype: 'multipart/form-data',          //模拟form数据类型
                uploadUrl: '${ctx}/zzfwzx/yhrz/fileUpload'//上传请求地址
            });
        }
        //异步上传结果处理
        $("#fileinput").on('fileerror', function (event, data, msg) {
        });
        //异步上传返回结果处理
        $("#fileinput").on('filepreupload', function (event, data, previewId, index) {
            $.post("${ctx}/zzfwzx/yhrz/theFilePath", null, function (data) {
                filepath = data;
            });
        });
        //选择文件后处理事件
        $("#fileinput").on('filebatchselected', function (event, files) {
            if (files[0] != undefined) {
                filename = files[0].name;
            }
        });
    });

    function saveData() {
        var thetext = $("#editor").html();
        var theme=$("#theTheme").val();
        if (logid) {
            $.post("${ctx}/zzfwzx/yhrz/saveModifyTheText", {
                'svo.logid': logid,
                'svo.thetext': thetext,
                'svo.theme': theme
            }, function (data) {
                window.location.href = '${ctx}/zzfwzx/yhrz/initCkrz';
            });
        }else{
            $.post("${ctx}/zzfwzx/yhrz/saveData", {
                'svo.filename': filename,
                'svo.thetext': thetext,
                'svo.filepath': filepath,
                'svo.theme': theme
            }, function (data) {
                window.location.href = '${ctx}/zzfwzx/yhrz/initCkrz';
            });
        }
    }

    function theLogTable(logid) {
        //先销毁表格
        $('#tableid').bootstrapTable('destroy');
        $('#tableid').bootstrapTable({
            url: "${ctx}/zzfwzx/yhrz/getUploadedFile",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.logid': logid,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            toolbar: '#toolbar',
            pagination: true,                       //是否分页
            singleSelect: true,                     //设置为true将禁止多选
            pageNumber: 1,                          //初始化加载第一页，默认第一页
            buttonsAlign: 'left',                   //按钮对齐方式
            pageSize: 5,                           //每页的记录行数
            onlyInfoPagination: false,             //设置为true只显示总数据数，而不是显示分页按钮
            cache: false,                          //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50],             //可供选择的每页行数
            paginationLoop: true,                   //设置为true启用分页条无线循环的功能
            clickToSelect: true,                    //是否启用点击选中行
            uniqueIS: "xxcjid",                     //每一行的唯一标识，一般为主键列
            queryParamsType: 'limit',               //设置为“limit”则会发送符合RESTFui格式的参数
            columns: [{
                title: '',
                align: 'center',
                width: '5%',
                formatter: function (value, row, index) {
                    //获取每页的数据量
                    var pagesize = $("#tableid").bootstrapTable('getOptions').pageSize;
                    //获取当前是第几页
                    var pageNumber = $("#tableid").bootstrapTable('getOptions').pageNumber;
                    //返回序号(从0开始)
                    return pagesize * (pageNumber - 1) + index + 1;
                }
            }, {
                field: 'filename',
                align: 'left',
                halign: 'left',
                title: '已上传文件'
            }, {
                field: 'entrytime',
                align: 'center',
                title: '上传时间'
            }, {
                field: 'cz',
                align: 'center',
                title: '操作 ',
                sortatable: true,
                formatter: function (value, row, index) {
                    return '<div class="btn-group">' +
                        '<button type="button" class="btn btn-default btn-sm" onclick="fileDownload(\'' + row.uuid + '\',\'' + row.filename + '\')"><i class="glyphicon glyphicon-cloud-download"></i>下载</button>' +
                        '<button type="button" class="btn btn-default btn-sm" style="color: #dd514c" onclick="deleteTheAttachment(\'' + row.uuid + '\')"><i class="glyphicon glyphicon-remove"></i>删除</button>' + '</div>';
                }
            }]
        });
    }

    //文件下载
    function fileDownload(uuid, filenames) {
        $.post("${ctx}/zzfwzx/yhrz/queryFilePath", {
            'svo.uuid': uuid
        }, function (data) {
            if (data[0] != null) {
                var filepath = encodeURI(data[0].filepath);
                var filename = encodeURI(filenames);
                window.location.href = "${ctx}/zzfwzx/yhrz/downloadFiles?filepath=" + filepath + "&" + "filename=" + filename;
            } else {
                alert("温馨提示：该文件不存在");
            }
        });
    }

    //删除附件
    function deleteTheAttachment(uuid) {
        $.post("${ctx}/zzfwzx/yhrz/deleteTheAttachment", {'svo.uuid': uuid}, function (data) {
            $('#tableid').bootstrapTable("destroy");
            theLogTable(logid);
        });
    }
</script>
