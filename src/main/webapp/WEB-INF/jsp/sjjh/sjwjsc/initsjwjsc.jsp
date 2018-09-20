<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/11/8
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>文件上传</title>
    <%@ include file="/common/global.jsp" %>
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

    <%--文件上传 css--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput-rtl.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--Ztree--%>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
    <style>
        .mycolor {
            background: red;
        }

        .loading {
            width: 220px;
            height: 56px;
            position: absolute;
            top: 50%;
            left: 50%;
            line-height: 56px;
            color: #fff;
            padding-left: 20px;
            font-size: 15px;
            background: #000 url(${pageContext.request.contextPath}/_start/img/wjsc2.gif) no-repeat 350px 50%;
            opacity: 0.7;
            z-index: 9999;
            -moz-border-radius: 20px;
            -webkit-border-radius: 20px;
            border-radius: 20px;
            filter: progid:DXImageTransform.Microsoft.Alpha(opacity=70);
        }
    </style>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <script>
        function gobacks() {
            $(window.parent.goMenuPage());
        }
    </script>
</head>

<body style="overflow: hidden">

<!-- Page Body -->
<div class="page-body" id="bxx">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <!--Widget Header-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width:3cm;">任务名称:</td>
                            <td style="width:12cm;">
                                <input id="rwmc" type="text" style="width: 150px;" class="form-control"></td>
                            <td colspan="4"  width="2">
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="searchlist();">
                                    执行查询
                                </button>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%--<button type="button" class="btn btn-info btn-block" onclick="$(window.parent.goMenuPage());" style="width: 2cm;">返&nbsp;&nbsp;回</button>--%>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
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
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-body">
                    <div id="toolbar">
                        <button onclick="scwjbut()" type="button" class="btn btn-info btn-sm" data-toggle="modal">
                            <i class="glyphicon glyphicon-floppy-open"></i>上传文件数据导入
                        </button>
                    </div>
                    <table id="mytable" class="table table-striped table-bordered table-hover"
                           data-height="560" style="white-space: nowrap"></table>
                </div>
            </div>
        </div>
    </div>
</div>



<%--查看数据页面--%>
<div class="page-body" id="sjxx" style="display: none;">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <div style="margin-right: 98%;padding-top: 4px;padding-bottom: 3px" >
                        <button onclick="xsModel()" type="button" class="btn btn-info btn-block"
                                style="width: 2cm; ">返回
                        </button>
                    </div>
                </div>
                <div class="widget-body">
                    <%--数据项(表)信息展示--%>
                        <table id="viewtables" class="table table-striped table-bordered table-hover" data-height="680" style="white-space: nowrap" ></table>
                </div>

            </div>
        </div>
    </div>
</div>


<%--上传文件模态框--%>
<div class="modal fade" id="scwjmodal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1000px;height: 500px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    上传文件
                </h4>
            </div>
            <div class="modal-body">
                <%--任务定制--%>
                <div class="ibox-content">
                    <form id="fileinputForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">文件名称:</label>

                            <div class="col-sm-2" style="width: 250px">
                                <input type="text" class="form-control" id="fileinputwjmc" readonly="readonly"/>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span id="errortext" hidden="hidden" style="color: #ff0000;"></span>


                            <label style="margin-left:8%" class="col-sm-2 control-label">目标表:</label>

                            <div class="col-sm-2" style="width: 250px">
                                <select id="mbb" class="col-sm-3" class="form-control" name="mbb" style="width:220px;"
                                        onchange="selmbb();">
                                    <option></option>
                                </select>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>


                        <div class="form-group">
                            <div class="col-md-1"></div>
                            <div class="col-md-3 col-sm-offset-1">
                                <div class="panel panel-default ">
                                    <div class="panel-heading" style="text-align: center;">
                                        excel表头
                                    </div>
                                    <div id="excelcolumns" class="panel-body;"
                                         style=" height: 80px; overflow: auto ;text-align: center "
                                         style="margin-left: 20px; ">

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-3 col-sm-offset-1" style="margin-left: 25%">
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="text-align: center;">
                                        <button type="button"
                                                class="btn btn-primary btn-xs glyphicon glyphicon-arrow-up"
                                                onclick="movespan(1)">
                                        </button>
                                        目标表字段
                                        <button type="button"
                                                class="btn btn-primary btn-xs glyphicon glyphicon-arrow-down"
                                                onclick="movespan(2)">
                                        </button>
                                    </div>
                                    <div style=" height: 80px; overflow: auto;text-align: center ">
                                        <div class="panel-body" style="width:100px; margin-left: 50px" id="mbzd" >

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">批&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;次:</label>

                            <div class="col-sm-2" style="width: 250px">
                                <select id="pc" style="width: 220px">
                                    <option></option>
                                </select>
                            </div>


                            <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                    data-target="#addbatch">
                                <i class="glyphicon glyphicon-plus"></i>
                                添加
                            </button>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>

                            <div class="col-sm-2" style="width: 250px">
                                <input type="text" class="form-control" id="model-wjmc" readonly="readonly"/>
                            </div>


                            <label style="margin-left: 5px" class="col-sm-3  control-label">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>

                            <div class="col-sm-2" style="width: 250px">
                                <input type="text" class="form-control" id="model-wjlx" readonly="readonly"/>
                            </div>


                        </div>
                        <div class="hr-line-dashed"></div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小:</label>

                            <div class="col-sm-2" style="width: 250px">
                                <input type="text" class="form-control" id="model-wjdx" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>

                        <div style="text-align: center">
                            <button type="button" class="btn btn-primary " onclick="mysubmit()">提交</button>
                            <div class="container">
                                <div id="myModal" class="modal fade" data-keyboard="false" style="text-align: left;"
                                     data-backdrop="static" data-role="dialog"
                                     aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div id="loading" class="loading">文件上传中。。。</div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<%--Add batch--%>
    <div class="modal fade" id="addbatch" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 650px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
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
                            <%--<button type="button" class="btn btn-default" data-dismiss="modal">关闭--%>
                            <%--</button>--%>
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


<%--查看模态框--%>
<div id="ckmodala">
    <div class="modal fade" id="ckmodal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="ibox-content" style="height: 1px;">
                    <form method="post" class="form-horizontal">
                        <input id="editsqid" align="left" type="hidden" class="form-control">
                    </form>
                </div>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        查看文件
                    </h4>
                </div>
                <div class="modal-body">
                    <input id="ckdrid" align="left" type="hidden" class="form-control">

                    <div class="ibox-content" style="height:600px;;width:100%;">
                        <form method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-sm-5 control-label">文件名称:</label>

                                <div class="col-sm-2" style="width: 250px;">
                                    <input id="ckwjmc" type="text" class="form-control" placeholder=""
                                           readonly="readonly">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label">文件类型:</label>

                                <div class="col-sm-2" style="width: 250px;">
                                    <div class="control-label">
                                        <input id="ckwjlx" type="text" class="form-control" placeholder=""
                                               readonly="readonly">
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label">文件大小:</label>

                                <div class="col-sm-2" style="width: 250px;">
                                    <input id="ckwjdx" name="ckwjdx" type="text" class="form-control" placeholder=""
                                           readonly>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label">审核结果:</label>

                                <div class="col-sm-2" style="width: 250px;">
                                    <input id="ckshjg" type="text" class="form-control" placeholder=""
                                           readonly="readonly">
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <label class="col-sm-5 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>

                                <div class="col-sm-2" style="width: 250px;">
                                    <textarea id="ckbz" class="form-control" rows="4" readonly="readonly"></textarea>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="ckbc()">保存</button>
                    <button type="button" class="btn btn-primary" onclick="ckbc()">关闭</button>
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


<!--TreeSelect 树形选择框-->
<script src="${pageContext.request.contextPath}/public/css/TreeSelect/scripts/boot.js" type="text/javascript"></script>
<!--Beyond Scripts-->
<script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>
<%--Ztree--%>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ztree.core.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.ztree.excheck-3.5.js"></script>
<%--导出插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-develop/tableExport.js"></script>

<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<%--文件上传插件--%>
<script src="${pageContext.request.contextPath}/assets/js/fileinput/fileinput.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fileinput/zh.js"></script>
<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script>


    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjjhpage.jsp";
    }

    //是否上传成功的标志
    var flag = 0;
    //上传的文件
    var file1 = "";

    //目标表表名称
    var mbbmc = "";
    //初始化表单验证
    $(document).ready(function () {
        //批次校验
        batchvalidator();
    });
    //Modal验证销毁重构(批次)
    $("#addbatch").on('hidden.bs.modal', function () {
        $("#batchformvaildation").data('bootstrapValidator').destroy();
        $("#batchformvaildation").data('bootstrapValidator', null);
        batchvalidator();
    });

    function shutdown() {
        //上传文件模态框缓存关闭按钮
        $('#scwjmodal').on('hidden.bs.modal', function () {
            $(this).removeData("bs.modal");
            clearForm($('#scwjmodal'));
        });
    }
    function formatJsonToSelect(data) {
        jsonData = JSON.parse(data);//把后台传过来的数据转为json格式
        //jsonData是二维数组，因为实体类ChartSeries的字段也是个list
//        for (x in jsonData) {//遍历json格式的数组元素，x代表下标
//            for (y in jsonData[x].data) {
//                alert(jsonData[x].occurTime[y]);//一次获取
//                alert(jsonData[x].data[y]);
//            }
//        }

    }
    //初始化文件上传的模态框
    function scwjbut() {

        var selectoptin = $("#mytable").bootstrapTable("getSelections");

        if (selectoptin.length != 1) {
            alert("请先选择一条记录后再进行操作");
            return false;
        }
        if (selectoptin[0].wjsczt == 1) {
            alert("该文件已上传...");
            return false;
        }

        //获取当前行数据
        var allselecteddata = $("#mytable").bootstrapTable("getSelections");
        //获取文件名称
        $("#fileinputwjmc").val(allselecteddata[0].savepath);
        var filepath = allselecteddata[0].savepath;
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjh/sjwjsc/readExcelColumns",
            dataType: 'json',
            data: {filepath: filepath},
            success: function (datas) {
                var str = JSON.stringify(datas) == "{}";
                if (str == true) {
                    alert("本地文件不存在...");
                    return false;
                }
                $('#scwjmodal').modal('show');
                list = datas.cloums
                var arr = [];
                for (var i = 0; i < list.length; i++) {
                    arr.push("<span>" + list[i] + "</span><br/>");
                }
                console.log("arrssssss:", arr);
                $("#excelcolumns").html(arr);
                //文件大小
                $("#model-wjdx").val(datas.size);
                //文件名称
                $("#model-wjmc").val(filepath);
                //备注
                $("#model-wjbz").val(allselecteddata[0].bz);
                //类型
//                var lx = filepath.split(".",1);
//
                $("#model-wjlx").val("xls");

            }
        });

        //初始化文件是否上传标志
        flag = 0;
        $("#errortext").text("");
        $("#fileinput").fileinput('clear');
        $("#model-wjmc").val("");
        //文件的类型
        $("#model-wjlx").val("");
        //文件的大小
        $("#model-wjdx").val("");
        //备注
        $("#model-wjbz").val("");

        //初始化文件列表
        $.ajax({
            //contentType:'application/json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            url: "${pageContext.request.contextPath}/sjjh/sjwjsc/initsjdx",
            type: 'post',
            dataType: 'json',
            success: function (msg) {
                //初始化表格
                $("#mbb").select2({
                    data: msg,
                    Width: 200,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
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
        $.post("${pageContext.request.contextPath}/sjcl/zdyclrw/addbatch", {
            'svo.pcdm': pcdm,
            'svo.pcmc': pcmc
        });
        $("#addbatch").modal("hide");
//        setInterval('mypc()', 1500);
        mypc()
    }
    function mypc() {
        $("#pc").empty();
        $.post("${pageContext.request.contextPath}/sjcl/zdyclrw/batch", null, function (data) {
            $("#pc").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
    }


    //上传文件中的提交按钮
    function mysubmit() {
        $('#myModal').modal('show');
        //文件名称
        var wjmc = $("#model-wjmc").val();
        //文件类型
        var wjlx = $("#model-wjlx").val();
        //文件大小
        var wjdx = $("#model-wjdx").val();







        //获取数据表
        console.log("------", $("#excelcolumns").html());
        var mbbid = $("#mbb").select2("data")[0].id;
        var mbzdlen = $("#mbzd span").size();
        var excellen = $("#excelcolumns span").size();
        console.log("目标字段列=", mbzdlen);
        console.log("Excel=", excellen);

        //获取选中行id
        var dqhsj = $("#mytable").bootstrapTable("getSelections");
        var rwid = dqhsj[0].rwid;
        var sub = {
            'svo.rwid': rwid
        };


        //目标表表名
        var mbb1 = $("#mbb").select2("data");
        mbb = mbb1[0].text;
        mbbmc = mbb1[0].id;

        //获取批次id
        var pc1 = $("#pc").select2("data");
        pc = pc1[0].id

        console.log("目标表名------------"+mbbmc);
        console.log("批次---------------"+pc);

        //列名
        if (mbzdlen != excellen) {
            alert("选择的表字段和导入文件列数不一致！");
            return;
        }

        //获取顺序列名称
        var colu = "";
        $("#mbzd span").each(function (i, data) {
            if (i == 0) {
                colu = $.trim($(this).text());

            } else {
                colu = colu + "," + $.trim($(this).text());
            }
        });
        var parmssss = {wjmc: wjmc, wjlx: wjlx, wjdx: wjdx, solumns: colu, sjb: mbbid, rwid: rwid, mbbmc: mbbmc,pc:pc};
        console.log("parmssss", parmssss);
        //文件上传等待页面
        /*       var myfunctions= function (url) {
         $('#myModal').modal('show');
         setTimeout(function () {
         $('#myModal').modal('hide');
         }, 1000);

         }*/
        var myurl = "${pageContext.request.contextPath}/sjjh/sjwjsc/savewjxx";
        var myfunctions = function () {
            setTimeout(function () {
                $('#myModal').modal('hide');
            }, 0);
//            alert("文件上传成功");
            getTableData();
            $("#scwjmodal").modal("hide");
        };


        $.myajax.common("post",
                parmssss,
                myurl,
                myfunctions
        );


    }

    //点击删除按钮后调用此函数
    function sc() {
        var selectoptin = $("#mytable").bootstrapTable("getSelections");
        if (selectoptin.length != 1) {
            alert("请先选择一行数据后再进行删除操作");
            return false;
        }
        var msg = "您真的确定要删除么？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            var drid = $.map($('#mytable').bootstrapTable('getSelections'), function (row) {
                return row.drid;
            });
            scsj(drid);
        }
    }
    //删除数据后台请求
    function scsj(drid) {

        var parmssss = {drid: drid};
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjh/sjwjsc/delTableData";
        //成功方法
        var myfunctions = function (msg) {
            // console.log("getTableData-->"+JSON.stringify(msg));
            $('#mytable').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parmssss,
                myurl,
                myfunctions
        );
    }
    //点击查看后调用此函数
    function ck() {
        var selectoptin = $("#mytable").bootstrapTable("getSelections");
        if (selectoptin.length != 1) {
            alert("请先选择一行数据后再进行操作");
            return false;
        }
        if (selectoptin.length == 1) {
            var row = $.map($('#mytable').bootstrapTable('getSelections'), function (row) {

                return row;
            });
            //  console.log("row-->"+JSON.stringify(row));
            cksj(row);
        }
    }
    /*查看初始化参数函数*/
    function cksj(row) {
        var drid = row[0].drid;
        var wjmc = row[0].wjmc;
        var scsj = row[0].scsj;
        var wjlx = row[0].wjlx;
        var shr = row[0].shr;
        var wjdx = row[0].wjdx;
        var shjg = row[0].shjg;
        var bz = $("#model-wjbz").val();

        $("#ckmodal").modal('show');
        $("#ckdrid").val(drid);
        $("#ckwjmc").val(wjmc);
        $("#ckwjlx").val(wjlx);
        $("#ckwjdx").val(wjdx);
        $("#ckshjg").val(shjg);
        $("#ckbz").val(bz);
    }

    //查看保存关闭函数
    function ckbc() {
        $("#ckmodal").modal('hide');
    }
    getTableData("", "");
    //查询
    function searchlist() {
        var rwmc = $("#rwmc").val();
        console.log("是否拿到的任务名称：", rwmc);
        //任务名称
        var myrwmc = {"svo.rwmc": rwmc};
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjh/sjwjsc/getTableData";
        //成功方法
        var myfunctions = function (msg) {
            $('#mytable').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                myrwmc,
                myurl,
                myfunctions
        );
    }

    //获取页面数据
    function getTableData(searchwjmc, rwmc) {

        //var parmssss= {wjmc:searchwjmc,sjly:searchsjly};
        var parmssss = {wjmc: searchwjmc};
        //任务名称
        var myrwmc = {rwmc: rwmc};
        console.log("我的任务名称：", myrwmc);
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjh/sjwjsc/getTableData";
        //成功方法
        var myfunctions = function (msg) {
            $('#mytable').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parmssss,
                myurl,
                myfunctions
        );

    }

    function zxck(lyid, lymc) {
        alert("在线查看功能未上线->数据来源id--->+[" + lyid + "]<---数据来源名称");
    }
    //初始化页面内容
    function initbootstrap(getdata) {
        $('#mytable').bootstrapTable({
//            search: true, //是否启用搜素
//            showRefresh: true, //刷新按钮
//            showPaginationSwitch: true,
            pagination: true, //是否分页
            singleSelect: true,
            queryParams: {
                'svo.rwmc': rwmc
            },
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            //sidePagination: "client",//表示客户端请求
            toolbar: '#toolbar',
            paginationLoop: true,
            uniqueId: 'drid',
            uniqueIS: "drid", //每一行的唯一标识，一般为主键列
//            showToggle: "true", //切换视图
//            showColumns: 'true', //是否显示内容列下拉框
            clickToSelect: true, //是否启用点击选中行
            columns: [{
                field: 'id',
                checkbox: true,
                align: 'center'

            }, {
                field: 'rwmc',
                align: 'center',
                title: '申请名称 '


            }, {
                field: 'savepath',
                align: 'center',
                title: '文件名称 '


            }, {
                field: 'cjsj',
                align: 'center',
                title: '上传时间'
            }, {
                field: 'rwsm',
                align: 'center',
                title: '文件说明'

            }, {
                field: 'name',
                align: 'center',
                title: '上传人'

            },
                {
                    field: 'bz',
                    align: 'center',
                    title: '备注'

                },
//                {
//                    field: 'shzt',
//                    align: 'center',
//                    title: '审核结果',
//                    formatter: function (value, row, index) {
//                        if (value == 0) {
//                            return '未审核'
//                        } else if (value == 1) {
//                            return '审核通过'
//                        } else {
//                            return '审核不通过'
//                        }
//
//                    }
//                },
                {
                    field: 'wjsczt',
                    align: 'center',
                    title: '上传状态',
                    formatter: function (value, row, index) {
                        if (value == 1) {
                            return '文件已导入'
                        } else {
                            return ''
                        }
                    }
                },
                {
                    field: 'dxmczw',
                    align: 'center',
                    title: '上传文件名称'

                }, {
                    field: 'ywbm',
                    align: 'center',
                    title: '数据查看',
                    formatter: function (value, row, index) {
                        if (value == null) {
                            return '-';
                        } else {
                            return '[<a style="color:#057afd;" href="javascript:void(0);" onclick="myviewdata(\'' + row.ywbm + '\')">查看数据</a>]';
                        }
                    }
                }

            ],
            data: getdata
        });
    }


    //查看上传文件数据
    function myviewdata(dxmcyws) {
        var dxmcyw = dxmcyws;

        viewthedata(dxmcyw);
    }

    //关闭弹出页面显示主页面
    function xsModel(){
        $('#bxx').show();
        $('#sjxx').hide();
    }


    //查看数据
    function viewthedata(dxmcyws) {
        $('#bxx').hide();
        $('#sjxx').show();

        //销毁表格
        $.ajax({
            url: "${pageContext.request.contextPath}/sjzd/sjdxgl/getheader",
            dataType: 'json',
            data: {'svo.dxmcyw': dxmcyws},
            success: function (header) {
                $("#viewtables").bootstrapTable('destroy');
                $("#viewtables").bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjzd/sjdxgl/viewthedata",
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            'svo.dxmcyw': dxmcyws,
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                    singleSelect: true,//设置为true 禁止多选
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 15, //每页的记录行数
                    pageList: [10, 20, 30, 50], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    columns: header
                });
            }
        });
    }


    //选择目标表
    function selmbb() {
        //获取选中的项
        var mydata = $("#mbb").select2("data")[0].id;
        //请求表对应数据项的信息
        if (mydata != "") {
            $.ajax({
                //contentType:'application/json',
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${pageContext.request.contextPath}/sjjh/sjwjsc/getsjxinfo",
                type: 'post',
                dataType: 'json',
                data: {mbb: mydata},
                success: function (msg) {
//                    console.log("msg:",msg);
                    $("#mbzd").empty();
                    //初始化表格
                    $.each(msg, function (i, data) {
                        $("#mbzd").append("<span    style='width:100%;height:25px;display:block;'   onclick='updatecolor(event)' >" + data.SJXMCYW + "</span>");
                        //把下拉框英文赋值给mbbmc

                    });


                }
            });
        }
    }
    //改变颜色
    function updatecolor(event) {
        var e = event || window.event;
        var target = e.target || e.srcElement;
        $(target).addClass("mycolor");
        $(target).siblings().removeClass("mycolor");
    }
    //移动span
    function movespan(flag) {
        if (flag == 1) {
            //向上移动
            var mbspan = $(".mycolor").html();
            var $nextys = $(".mycolor").prev();
//          console.log("$nextys:",$nextys.length);
            if ($nextys.length > 0) {
                $(".mycolor").remove();
                $nextys.before("<span    style='width:100%;height:25px;display:block;' class='mycolor'   onclick='updatecolor(event)' >" + mbspan + "</span>");
            }
        } else if (flag == 2) {
            //向下移动
            var mbspan = $(".mycolor").html();
            var $nextys = $(".mycolor").next();
//          console.log("$nextys:",$nextys.length);
            if ($nextys.length > 0) {
                $(".mycolor").remove();
                $nextys.after("<span    style='width:100%;height:25px;display:block;'  class='mycolor'      onclick='updatecolor(event)' >" + mbspan + "</span>");
            }
        }
    }

    //初始化
    $(function () {
        //初始化批次
        $.ajax({
            //contentType:'application/json',
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            url: "${pageContext.request.contextPath}/sjjh/sjwjsc/initpc",
            type: 'post',
            dataType: 'json',
            success: function (msg) {
                //初始化表格
                $("#pc").select2({
                    data: msg,
                    Width: 200,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

    });

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
</script>

