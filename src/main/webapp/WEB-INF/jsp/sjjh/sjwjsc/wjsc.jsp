
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>文件上传</title>
    <%@ include file="/common/global.jsp"%>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/uploadify/uploadify.css"/>

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.js"></script>
    <script src="${ctx}/assets/js/bootstrap-editable.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
    <script src="${ctx}/static/js/jquery.ts.js"></script>
    <script src="${ctx}/assets/js/util.js"></script>
    <script src="${ctx}/static/uploadify/jquery.uploadify.min.js"></script>

    <!--TreeSelect 树形选择框-->
    <script src="${ctx}/public/css/TreeSelect/scripts/boot.js" type="text/javascript"></script>
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${ctx}/assets/js/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/weather-icons.min.css"/>


    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/demo.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/typicons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/animate.min.css"/>

    <script src="${ctx}/assets/js/skins.min.js"></script>
    <!--Beyond Scripts-->
    <script src="${ctx}/assets/js/beyond.min.js"></script>
    <style>


    </style>


</head>
<body>
<!-- 装载容器开始 -->
<div class="loading-container">
    <div class="loading-progress">
        <div class="rotator">
            <div class="rotator">
                <div class="rotator colored">
                    <div class="rotator">
                        <div class="rotator colored">
                            <div class="rotator colored"></div>
                            <div class="rotator"></div>
                        </div>
                        <div class="rotator colored"></div>
                    </div>
                    <div class="rotator"></div>
                </div>
                <div class="rotator"></div>
            </div>
            <div class="rotator"></div>
        </div>
        <div class="rotator"></div>
    </div>
</div>
<!-- Page Body -->
<from>
    <div class="page-body">
        <div id="condition" class="row">
            <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                <div class="widget">
                    <div class="widget-header bg-blue">
                        <span class="widget-caption">文件上传</span>

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
                    <!--小部件标题-->
                    <div class="widget-body" style="width: 100%;height: 100%;">
                        <form id="form1" method="post" action="/sjjh/sjwjsc/uploadfile" enctype="multipart/form-data"
                              class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-5 control-label">文件上传1:</label>

                                <div class="col-sm-2">
                                    <input type="file" name="uploadedFile" id="file_upload_1"/>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                 <label class="col-sm-5 control-label">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
                                 <div class="col-sm-2">
                                     <input type="text" name="wjmc" id="wjmc" />
                                 </div>
                             </div>
                             <div class="hr-line-dashed"></div>
                             <div class="form-group">
                                    <label class="col-sm-5 control-label">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="wjlx" id="wjmc" />
                                    </div>
                             </div>
                             <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label">大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小:</label>

                                <div class="col-sm-2">
                                    <input type="text" name="wjdx" id="wjmc"/>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
<%--                            <div class="form-group">
                                <label class="col-sm-5 control-label">数据来源:</label>
                                <input type="hidden" id="inputsjly">
                                <div class="col-sm-2">
                                    <ul id="sjly" style="width: 150px;" class="mini-treeselect"
                                        url="${ctx}/sjjh/sjwjsc/getSjlyTree"
                                        textField="text"
                                        valueField="id" parentField="pid" popupWidth="153" allowInput="true"/>
                                </div>
                            </div>--%>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>

                                <div class="col-sm-2">
                                    <textarea class="form-control" rows="4"></textarea>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="col-sm-1 col-sm-offset-5">
                                    <button type="submit" onclick="submitdata()" class="btn btn-info" align="center">
                                        提交数据
                                    </button>
                                </div>
                                <div class="col-sm-1">
                                    <button type="button" onclick="downloaddata()" class="btn btn-info" align="center">
                                        下载数据
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!--Widget Body-->
                </div>
                <!--Widget-->
            </div>
        </div>
    </div>
</from>
</body>
</html>
<script>

    /*数据来源改变的时候 触发*/

    //提交表单
    function submitdata() {
        alert("1")_;
        var sjly = "";
        if (typeof(mini.get("sjly").getSelectedNode()) != "undefined" && mini.get("sjly").getSelectedNode() != "") {
            sjly = mini.get("sjly").getSelectedNode().id;
        }
        alert("sjly-->" + sjly);
        return false;
         if(sjly==""){
             alert("数据来源不能为空");
            return false;
         }else{
            $("#inputsjly").val(sjly)  ;
         }
        return true;

    }


    var tree = mini.get("sjly");
    tree.on("nodeselect", function (e) {
        alert("1");
        //console.log(e.node.id);
    });


    $(function () {
        initupload();
    });

    function initupload() {
        $("#file_upload_1").uploadify({
            height: 20,
            width: 80,
            auto: true,
            uploader: '${pageContext.request.contextPath}/static/uploadify/uploadify.swf',
            swf: '${pageContext.request.contextPath}/static/uploadify/uploadify.swf',
            buttonText: '请选则要上传的文件',
            folder: '/UploadFile',
            fileObjName: 'uploadedFile',
            fileDataName: 'filedatas',
            buttonClass: 'some-class',
            'queueID': 'fileQueueId',
            formData    : {'sjly': '1234654545'},
            'onInit': function () {
                alert("1");
            },
            auto: false,
            'onSelect': function (e, queueId, fileObj) {
                alert("1");
                console.log("name-->" + fileObj.name);
                console.log("size-->" + fileObj.size);
                console.log("creationDate-->" + fileObj.creationDate);
                console.log("type-->" + fileObj.type);
            },
            'onUploadSuccess': function (file, data, response) {
                //alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
                //appendDataList(data,file.name);
                alert("文件上传成功！");
            }
        });
    }

    //下载数据
    function downloaddata() {
        window.location.href = "${pageContext.request.contextPath}/demos/fileUpload/downloadImage";
    }

</script>
