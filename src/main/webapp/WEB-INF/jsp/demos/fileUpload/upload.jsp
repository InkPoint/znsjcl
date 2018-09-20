<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>文件上传</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="${pageContext.request.contextPath}/assets/js/bootstrap-table.min.css" rel="stylesheet">--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/weather-icons.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput-rtl.css" />
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/newuploadify/uploadify.css" />
    <!--Basic Scripts-->

    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/static/newuploadify/jquery.uploadify.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/fileinput/fileinput.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/fileinput/zh.js"></script>

    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--Beyond Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>

    <style>


    </style>


</head>
<body>
<%----%>
<%--<!-- 装载容器开始 -->--%>
<%--<div class="loading-container">--%>
    <%--<div class="loading-progress">--%>
        <%--<div class="rotator">--%>
            <%--<div class="rotator">--%>
                <%--<div class="rotator colored">--%>
                    <%--<div class="rotator">--%>
                        <%--<div class="rotator colored">--%>
                            <%--<div class="rotator colored"></div>--%>
                            <%--<div class="rotator"></div>--%>
                        <%--</div>--%>
                        <%--<div class="rotator colored"></div>--%>
                    <%--</div>--%>
                    <%--<div class="rotator"></div>--%>
                <%--</div>--%>
                <%--<div class="rotator"></div>--%>
            <%--</div>--%>
            <%--<div class="rotator"></div>--%>
        <%--</div>--%>
        <%--<div class="rotator"></div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<!-- Page Body -->--%>
        <%--<div class="page-body">--%>
            <%--<div id="condition" class="row">--%>
                <%--<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">--%>
                    <%--<div class="widget">--%>
                        <%--<div class="widget-header bg-blue">--%>
                            <%--<span class="widget-caption">文件上传</span>--%>
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
                            <%--<!--小部件按钮-->--%>
                        <%--</div>--%>
                        <%--<!--小部件标题-->--%>
                        <%--<div class="widget-body">--%>
                            <%--<form id="form1" method="post"   action="/demos/fileUpload/uploadfile"  enctype="multipart/form-data">--%>
                                <%--<table class="table">--%>
                                    <%--<tr>--%>
                                        <%--<td style="vertical-align:middle;width: 8cm;">实例1：(单文件上传：不显示文件):</td>--%>
                                        <%--<td >--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>

                                    <%--<tr>--%>
                                        <%--<td colspan="2" style="vertical-align:middle;align:center;width: 5cm;">--%>
                                            <%--<button type="submit" onclick="submitdata()" class="btn btn-info">提交数据</button>--%>
                                            <%--<button type="button" onclick="downloaddata()" class="btn btn-info">下载数据</button>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                <%--</table>--%>
                             <%--</form>--%>
                        <%--</div>--%>
                        <%--<!--Widget Body-->--%>
                    <%--</div>--%>
                    <%--<!--Widget-->--%>
                <%--</div>--%>
            <%--</div>--%>


        <%--</div>--%>

uploadify版本上传：<div id="fileQueue"></div>
<input type="file" name="file_upload" id="file_upload" />
fileinput版本：  <input type="file"  class="file-loading" name="fileinput1" id="fileinput1"    />
图片：<img src="/demos/fileUpload/dataViews"/>
</body>
</html>
<script>

    $(function(){
//        alert(123);
        <%--$("#file_upload").uploadify({--%>
            <%--'swf'          : '${pageContext.request.contextPath}/static/newuploadify/uploadify.swf',--%>
            <%--'uploader'    : '${pageContext.request.contextPath}/static/newuploadify/uploadify.php',--%>
            <%--'onSelect': function(file){--%>
                <%--alert("对");--%>
            <%--}--%>

        <%--});--%>

        //fileinput版本上传
        $("#fileinput1").fileinput({
            showUpload:true,    //是否显示上传按钮
            showPreview:false,   //是否显示预览
            uploadAsync:true,   //默认异步上传
            language:"zh",      //语言
            showCaption:true,//是否显示标题
            allowedFileExtensions:['xls'],//允许接受的文件后缀
            dropZoneEnabled:false,//是否显示拖拽区域
            maxFileSize:15000,//单位kb  最大文件大小   0 为不限制文件大小
            maxFileCount:1,//最大文件数量
            enctype:'multipart/form-data',//模拟form数据类型
            uploadUrl:'${pageContext.request.contextPath}/demos/fileUpload/uploadfileinput'   //上传请求地址

        });
        //异步上传结果处理
        $("#fileinput1").on('fileerror',function(event,data,msg){
            console.log(data);
        });
        //异步上传返回结果处理
        $("#fileinput1").on('filepreupload',function(event,data,previewId,index){
//              console.log("event:",event);
//              console.log("data:",data);
//              console.log("previewId:",previewId);
//              console.log("index:",index);
              //var form=data.form,files=data.files,extra=data.extra,response=data.response,reader=data.reader;
        });

    });




    //下载数据
    function downloaddata(){
        window.location.href="${pageContext.request.contextPath}/demos/fileUpload/downloadImage";

    }

</script>
