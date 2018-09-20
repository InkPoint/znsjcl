<%--
  Created by IntelliJ IDEA.
  User: WangPengWen
  Date: 2018/3/24
  Time: 09:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>信息采集(新增)</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <!--Bootstrap Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/assets/css/bootstrap.css"/>
    <%--Bootstrap-table Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <%--Font-awesome Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <!--Beyond Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--Select2 Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <%--BootstrapValidator Styles--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <!--bootstrap-datetimepicker Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
    <style>
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
    <div id="condition" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span id="headerid" class="widget-caption"></span>
                </div>
                <div class="widget-body">
                    <form id="tablevalidation" method="post" class="form-horizontal">
                        <!--onkeydown="focalSwitch()"-->
                        <table class="table">
                            <div class="form-group">
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">水行政主管部门:</label>
                                        <div class="input-group col-sm-10">
                                        <input type="text" id="shzzgb" name="shzzgbjy" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">取水所属期起:</label>
                                        <div id="qsssqq" class="input-group date form_date col-sm-10"
                                             data-date-format="yyyy/mm/dd"
                                             data-link-format="yyyy/mm/dd">
                                            <input id="qsssqqid" class="form-control" type="text" name="qsssqqjy"
                                                   readonly>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">取水所属期止:</label>
                                        <div id="qsssqz" class="input-group date form_date  col-sm-10"
                                             data-date-format="yyyy/mm/dd"
                                             data-link-format="yyyy/mm/dd">
                                            <input id="qsssqzid" class="form-control" type="text" name="qsssqzjy"
                                                   readonly>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">抄表日期:</label>
                                        <div id="cbrq" class="input-group date form_date  col-sm-10"
                                             data-date-format="yyyy/mm/dd"
                                             data-link-format="yyyy/mm/dd">
                                            <input id="cbrqid" class="form-control" type="text" name="cbrqjy" readonly>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">纳税人识别号:</label>
                                        <div class="input-group input-group-sm col-sm-10">
                                            <input type="text" id="nsrsbh" name="nsrsbhjy" class="form-control">
                                            <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" onclick="getnumber()">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">纳税人名称:</label>
                                        <div class="input-group input-group-sm col-sm-10">
                                            <input type="text" id="nsrmc" name="nsrmcjy" class="form-control"
                                                   onkeyup="document.getElementById('nsrqz').value=this.value">
                                            <span class="input-group-btn">
                                            <button class="btn btn-default" type="button" onclick="getthename()">
                                                <i class="glyphicon glyphicon-search"></i>
                                            </button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">联系人:</label>
                                        <div class="input-group col-sm-10">
                                        <input type="text" id="lxr" name="lxrjy" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">联系方式:</label>
                                        <div class="input-group col-sm-10">
                                        <input type="text" id="lxfs" name="lxfsjy" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">取水计划:</label>
                                        <div class="input-group col-sm-10">
                                        <input type="text" id="qsjh" name="qsjhjy" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">水源类型:</label>
                                        <select class="input-sylx col-sm-10" id="sylx" name="sylxjy"></select>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">取用水行业:</label>
                                        <select class="input-qyshy col-sm-10" id="qyshy" name="qyshyjy"></select>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">地下水超采区类型:</label>
                                        <select class="input-ccqlx col-sm-10" id="ccqlx" name="ccqlxjy"></select>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">地下水取水地点供水管网:</label>
                                        <select class="input-dxgsgw col-sm-10" id="dxgsgw" name="dxgsgwjy"></select>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">特殊用水类别:</label>
                                        <select class="input-tsyslb col-sm-10" id="tsyslb" name="tsyslbjy"></select>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">纳税人签章:</label>
                                        <div class="input-group col-sm-10">
                                        <input type="text" id="nsrqz" name="nsrqzjy" class="form-control" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">水量核定人签章:</label>
                                        <div class="input-group col-sm-10">
                                        <input type="text" id="slhdrqz" name="slhdrqzjy" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">税务机关受理人:</label>
                                        <div class="input-group col-sm-10">
                                        <input type="text" id="swjgslr" name="swjgslrjy" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-2">
                                        <label class="control-label">受理日期:</label>
                                        <div id="slrq" class="input-group date form_date col-sm-10"
                                             data-date-format="yyyy/mm/dd"
                                             data-link-format="yyyy/mm/dd">
                                            <input id="slrqid" class="form-control" type="text" name="slrqjy" readonly>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="hr-line-dashed"></div>
                            <div class="form-group">
                                <div class="group">
                                    <div class="col-sm-1 col-lg-offset-5">
                                        <button type="button" class="btn btn-info"
                                                onclick="window.location.href='${ctx}/sjjh/xxcj/initXxcj'">返&nbsp;&nbsp;&nbsp;回
                                        </button>
                                    </div>
                                </div>
                                <div class="group">
                                    <div class="col-sm-1">
                                        <button type="button" class="btn btn-info" onclick="saves();">保&nbsp;&nbsp;&nbsp;存</button>
                                    </div>
                                </div>
                            </div>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="querys" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">添加表信息</span>
                    <div class="col-sm-11">
                        <label class="control-label" style="margin-top: 10px">单位:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(m³)</label>
                    </div>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button id="add_mota" type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                data-target="#thenewdata">
                            <i class="glyphicon glyphicon-plus"></i>添加
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>删除
                        </button>
                    </div>
                    <table class="table table-striped table-bordered table-hover" id="mytab" data-height="542"></table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="thenewdata" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1100px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加表信息</h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="validationForm" method="post" class="form-horizontal" onkeydown="keyDown(event)">
                        <div class="form-group">
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">取水口地点:</label>
                                    <input type="text" class="form-control" id="newqskdd" name="newqskddjy"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">编号:</label>
                                    <input type="text" class="form-control" id="newbh" name="newbhjy"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">上期表底数(m³):</label>
                                    <input type="text" class="form-control" id="newsqbds" name="newsqbdsjy"
                                           style="text-align: right"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">本期表底数(m³):</label>
                                    <input type="text" class="form-control" id="newbqbds" name="newbqbdsjy"
                                           style="text-align: right"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">本期取水量(m³):</label>
                                    <input type="text" class="form-control" id="newbqqsl" name="newbqqsljy"
                                           style="text-align: right"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">累计取水量(m³):</label>
                                    <input type="text" class="form-control" id="newljqsl" name="newljqsljy"
                                           style="text-align: right"/>
                                </div>
                            </div>
                            <hr align="center" style="width: 1050px;border-top:5px">
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">计划取水量(m³):</label>
                                    <input type="text" class="form-control" id="newjhqsl" name="newjhqsljy"
                                           style="text-align: right"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">核定的计划内取水量(m³):</label>
                                    <input type="text" class="form-control" id="newhddjhnqsl"
                                           name="newhddjhnqsljy" style=" text-align: right"/>
                                </div>
                            </div>
                            <div class="group">
                                <div class="col-sm-2">
                                    <label class="control-label">核定的超计划取水量(m³):</label>
                                    <input type="text" class="form-control" id="newhddcjhqsl" name="newhddcjhqsljy"
                                           style="text-align: right"/>
                                </div>
                            </div>
                            <hr align="center" style="width: 1050px;border-top:5px">
                            <div class="group">
                                <div class="col-sm-2 col-md-offset-5">
                                    <button type="button" class="btn btn-info" onclick="continuetoadd()"
                                            style="margin-top: 25px;">继续添加
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="viewnumber" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 1100px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">纳税人信息</h4>
            </div>
            <table class="table">
                <div class="form-group">
                    </br>
                    <div class="group">
                        <label class="col-sm-1 control-label" style="width: 120px">纳税人识别号:</label>
                        <div class="col-sm-2">
                            <input type="text" id="nsrsbhjs" style="width: 160px;" class="form-control">
                        </div>
                    </div>
                    <div class="group">
                        <label class="col-sm-1 control-label" style="width: 110px">纳税人名称:</label>
                        <div class="col-sm-2">
                            <input type="text" id="nsrmcjs" style="width: 160px;" class="form-control">
                        </div>
                    </div>
                    <div class="group">
                        <div class="col-sm-2 col-sm-offset-1">
                            <button type="submit" class="btn btn-info btn-sm" onclick="thequerys()">执行查询</button>
                        </div>
                    </div>
                </div>
            </table>
            <div class="modal-body">
                <table id="viewtables" class="table table-striped table-bordered table-hover" data-height="475"
                       style="white-space: nowrap;"></table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<!--Basic Scripts-->
<script src="${ctx}/assets/js/jquery-2.0.3.min.js"></script>
<%--Bootstrap Scripts--%>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<%--Bootstrap-table Scripts--%>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<%--Select2 Scripts--%>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<%--BootstrapValidator--%>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
<%--Submit data Script--%>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
<%--Bootstrap-datetimepicker Script--%>
<script src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctx}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    var djxhs;
    var ref = "";
    var inputs = document.getElementById("validationForm").getElementsByTagName("INPUT");
    var inputSwitch = document.getElementById("tablevalidation").getElementsByTagName("INPUT");

    $(function () {
        $(document).keydown(function (event) {
            //返回获得的焦点元素
            var myfocus = document.activeElement;
            if (!document.getElementById("validationForm").contains(myfocus)) return;
            if (event.keyCode == 13) {
                continuetoadd();
                $("#newqskdd").focus();
                return false;
            }
        });
    });

    //切换Modal输入框焦点
    function keyDown(event) {
        var focus = document.activeElement;
        if (!document.getElementById("validationForm").contains(focus)) return;
        var event = window.event || event;
        var key = event.keyCode;
        for (var i = 0; i < inputs.length; i++) {
            if (inputs[i] === focus) break;
        }
        switch (key) {
            case 38:
                if (i > 0) inputs[i - 1].focus();
                break;
            case 40:
                if (i < inputs.length - 1) inputs[i + 1].focus();
                break;
        }
    }

    //切换(表头)输入框焦点
    function focalSwitch() {
        var focus = document.activeElement;
        if (!document.getElementById("tablevalidation").contains(focus)) return;
        var event = window.event || event;
        var key = event.keyCode;
        for (var i = 0; i < inputSwitch.length; i++) {
            if (inputSwitch[i] === focus) break;
        }
        switch (key) {
            case 38:
                if (i > 0) inputSwitch[i - 1].focus();
                break;
            case 40:
                if (i < inputSwitch.length - 1) inputSwitch[i + 1].focus();
                break;
        }
    }

    //每10秒销毁重构一次
    ref = setInterval(function () {
        refactoring();
    }, 10000);

    //Bootstrap-datetimepicker
    $('.form_date').datetimepicker({
        language: 'zh-CN',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    $("#cbrqid,#qsssqqid,#qsssqzid,#slrqid").attr('value', getNowFormatDate());

    $("#nsrsbh").mousemove(function () {
        var nsrsbh = $("#nsrsbh").val();
        $("#nsrsbh").attr('title', nsrsbh);
    });

    $("#nsrmc").mousemove(function () {
        var nsrmc = $("#nsrmc").val();
        $("#nsrmc").attr('title', nsrmc);
    });

    $("#nsrqz").mousemove(function () {
        var nsrqz = $("#nsrqz").val();
        $("#nsrqz").attr('title', nsrqz);
    });

    //初始化校验
    $(document).ready(function () {
        //表头校验
        //buildtablevalidator();
        //表信息校验
        //formValidator();
    });

    //获取当前日期时间
    function getNowFormatDate() {
        var date = new Date();
        var tung = "/";
        var thecolon = ":";
        var month = date.getMonth() + 1;
        var strDate = date.getDate();
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 1 && strDate <= 9) {
            strDate = "0" + strDate
        }
        // var currentTime = date.getFullYear() + tung + month + tung + strDate + " " + date.getHours() + thecolon + date.getMinutes() + thecolon + date.getSeconds();
        var currentTime = date.getFullYear() + tung + month + tung + strDate;
        return currentTime;
    }

    //获取当前日期的(后一天)时间
    function getAfterTheTime() {
        var date = new Date();
        var tung = "/";
        var month = date.getMonth() + 1;
        var strDate = date.getDate() + 1;
        if (month >= 1 && month <= 9) {
            month = "0" + month;
        }
        if (strDate >= 1 && strDate <= 9) {
            strDate = "0" + strDate
        }
        var currentTime = date.getFullYear() + tung + month + tung + strDate;
        return currentTime;
    }

    //(纳税人信息)销毁重构
    $("#viewnumber").on('hidden.bs.modal', function () {
        $("#nsrsbhjs").val("");
        $("#nsrmcjs").val("");
    });

    //Modal验证销毁重构(新增)
    $("#thenewdata").on('hidden.bs.modal', function () {
        $("#validationForm").data('bootstrapValidator').destroy();
        $("#validationForm").data('bootstrapValidator', null);
        formValidator();
    });

    //(表头)销毁重构
    function refactoring() {
        $("#tablevalidation").data('bootstrapValidator').destroy();
        $("#tablevalidation").data('bootstrapValidator', null);
        buildtablevalidator();
    }

    //初始化(下拉菜单、表)
    $(function () {
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                thequerys();
            }
        });
        //初始化表
        inittabs();
        initviewtable();
        //水源类型（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/sylxcd", null, function (data) {
            $(".input-sylx").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //取用水行业（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/qyshycd", null, function (data) {
            $(".input-qyshy").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //地下水超采类型（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/dxscclxcd", null, function (data) {
            $(".input-ccqlx").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //地下水取水地点供水管网（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/gsgwcd", null, function (data) {
            $(".input-dxgsgw").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //特殊用水类别（下拉菜单）
        $.post("${ctx}/sjjh/xxcj/tsyslbcd", null, function (data) {
            $(".input-tsyslb").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true
            });
        });
        //隐藏序号列
        $('#mytab').bootstrapTable("hideColumn", "xh");

        $("#headerid").html("<a style=\"cursor:hand;text-decoration:none;color:#E0FFFF\" onclick=\"window.location.href='${ctx}/sjjh/xxcj/initXxcj'\"> 水资源信息采集</a>" + "&nbsp;/&nbsp;" + "信息录入");

    });

    //删除
    function btn_delete() {
        //获取选中的行
        var dataArr = $('#mytab').bootstrapTable('getSelections');
        var str = [];
        for (var k = 0; k < dataArr.length; k++) {
            str[k] = dataArr[k].ck;
        }
        if (dataArr.length != 1) {
            alert("请选择一行删除!");
            return;
        }
        $('#mytab').bootstrapTable('remove', {field: 'ck', values: str});
    }

    //主表
    function inittabs() {
        //先销毁表格
        $('#mytab').bootstrapTable('destroy');
        $('#mytab').bootstrapTable({
            sidePagination: "client",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            toolbar: '#toolbar',
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "ck", //每一行的唯一标识，一般为主键列
            columns: [{
                field: 'ck',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'qskdd',
                    align: 'left',
                    halign: 'center',
                    title: '取水口地点'
                }, {
                    field: 'bh',
                    align: 'center',
                    halign: 'center',
                    title: '编号'
                }, {
                    field: 'sqbds',
                    align: 'right',
                    halign: 'center',
                    title: '上期表底数'
                }, {
                    field: 'bqbds',
                    align: 'right',
                    halign: 'center',
                    title: '本期表底数'
                }, {
                    field: 'bqqsl',
                    align: 'right',
                    halign: 'center',
                    title: '本期取水量'
                }, {
                    field: 'ljqsl',
                    align: 'right',
                    halign: 'center',
                    title: '累计取水量'
                }, {
                    field: 'jhqsl',
                    align: 'right',
                    halign: 'center',
                    title: '计划取水量'
                }, {
                    field: 'hddjhnqsl',
                    align: 'right',
                    halign: 'center',
                    title: '核定的计划内取水量'
                }, {
                    field: 'hddcjhqsl',
                    align: 'right',
                    halign: 'center',
                    title: '核定的超计划取水量'
                }
            ]
        });
    }

    //继续添加
    function continuetoadd() {
        //开启验证
//        $("#validationForm").data('bootstrapValidator').validate();
//        if (!$("#validationForm").data('bootstrapValidator').isValid()) {
//            return;
//        }
        //获取Bootstrap-table内有多少行数据
        var tabdata = $('#mytab').bootstrapTable("getData");
        if (tabdata.length == 6) {
            alert("温馨提示：最多只能添加6行");
            $("#thenewdata").modal("hide");
            return;
        }
        //获取已经输入的数据
        $("#mytab").bootstrapTable("insertRow", {
            index: tabdata.length,
            row: {
                qskdd: $("#newqskdd").val(),
                bh: $("#newbh").val(),
                sqbds: $("#newsqbds").val(),
                bqbds: $("#newbqbds").val(),
                bqqsl: $("#newbqqsl").val(),
                ljqsl: $("#newljqsl").val(),
                jhqsl: $("#newjhqsl").val(),
                hddjhnqsl: $("#newhddjhnqsl").val(),
                hddcjhqsl: $("#newhddcjhqsl").val(),
                xh: tabdata.length + 1
            }
        });
        //置空
        $("#newqskdd").val("");
        $("#newbh").val("");
        $("#newsqbds").val("");
        $("#newbqbds").val("");
        $("#newbqqsl").val("");
        $("#newljqsl").val("");
        $("#newjhqsl").val("");
        $("#newhddjhnqsl").val("");
        $("#newhddcjhqsl").val("");
//        $("#validationForm").data('bootstrapValidator').destroy();
//        $("#validationForm").data('bootstrapValidator', null);
        //formValidator();
    }

    //将表格数据和表单数据全部发送到后台
    function saves() {
        //开启验证
//        $("#tablevalidation").data('bootstrapValidator').validate();
//        if (!$("#tablevalidation").data('bootstrapValidator').isValid()) {
//            return;
//        }
        //水行政主管部
        var shzzgb = $("#shzzgb").val();
        //取水所属期起
        var qsssqq = $("#qsssqqid").val();
        //取水所属期止
        var qsssqz = $("#qsssqzid").val();
        //抄表日期
        var cbrq = $("#cbrqid").val();
        //纳税人识别号
        var nsrsbh = $("#nsrsbh").val();
        //纳税人名称
        var nsrmc = $("#nsrmc").val();
        //联系人
        var lxr = $("#lxr").val();
        //联系方式
        var lxfs = $("#lxfs").val();
        //取水计划
        var qsjh = $("#qsjh").val();
        //水源类型
        var sylx = $("#sylx").select2("data");
        var sylxcon = "";
        if (sylx != null && JSON.stringify(sylx) != "{}" && typeof(sylx) != "undefined" && sylx.length > 0) {
            sylxcon = sylx[0].id;
        }
        //取用水行业
        var qyshy = $("#qyshy").select2("data");
        var qyshycon = "";
        if (qyshy != null && JSON.stringify(qyshy) != "{}" && typeof(qyshy) != "undefined" && qyshy.length > 0) {
            qyshycon = qyshy[0].id;
        }
        //超采区类型
        var ccqlx = $("#ccqlx").select2("data");
        var ccqlxcon = "";
        if (ccqlx != null && JSON.stringify(ccqlx) != "{}" && typeof(ccqlx) != "undefined" && ccqlx.length > 0) {
            ccqlxcon = ccqlx[0].id;
        }
        //地下供水管网
        var dxgsgw = $("#dxgsgw").select2("data");
        var dxgsgwcon = "";
        if (dxgsgw != null && JSON.stringify(dxgsgw) != "{}" && typeof(dxgsgw) != "undefined" && dxgsgw.length > 0) {
            dxgsgwcon = dxgsgw[0].id;
        }
        //特殊用水类别
        var tsyslb = $("#tsyslb").select2("data");
        var tsyslbcon = "";
        if (tsyslb != null && JSON.stringify(tsyslb) != "{}" && typeof(tsyslb) != "undefined" && tsyslb.length > 0) {
            tsyslbcon = tsyslb[0].id;
        }
        var dataArr = $('#mytab').bootstrapTable('getData');
        if (dataArr.length == 0) {
            alert("请添加相关表信息！");
            return;
        }
        //纳税人签章
        var nsrqz = $("#nsrqz").val();
        //水量核定人签章
        var slhdrqz = $("#slhdrqz").val();
        //税务机关受理人
        var swjgslr = $("#swjgslr").val();
        //受理日期
        var slrq = $("#slrqid").val();
        //提交参数
        var sub = {
            'datalist': JSON.stringify(dataArr),
            //水行政主管部
            'svo.sxzzgbm': shzzgb,
            //取水所属期起
            'svo.qslssqq': qsssqq,
            //取水所属期止
            'svo.qslssqz': qsssqz,
            //抄表日期
            'svo.cbrq': cbrq,
            //纳税人识别号
            'svo.nsrsbh': nsrsbh,
            //纳税人名称
            'svo.nsrmc': nsrmc,
            //联系人
            'svo.lxr': lxr,
            //联系方式
            'svo.lxfs': lxfs,
            //取水计划
            'svo.qsjh': qsjh,
            //水源类型
            'svo.sylx': sylxcon,
            //取用水行业
            'svo.qyshy': qyshycon,
            //超采区类型
            'svo.dxsccqlx': ccqlxcon,
            //地下供水管网
            'svo.dxsqsddgsgw': dxgsgwcon,
            //特殊用水类别
            'svo.tsyslb': tsyslbcon,
            //登记序号
            'svo.djxh': djxhs,
            //纳税人签章
            'svo.nsrqz': nsrqz,
            //水量核定人签章
            'svo.slhdrqz': slhdrqz,
            //税务机关受理人
            'svo.swjgslr': swjgslr,
            //受理日期
            'svo.slrq': slrq
        };
        //提交url
        var myurl = "${ctx}/sjjh/xxcj/newaddition";
        //成功方法
        var myfunctions = function (msg) {
            alert("Data Saved: " + msg);
            //页面跳转
            window.location.href = '${ctx}/sjjh/xxcj/initXxcj';
        }
        //提交数据
        $.myajax.common("post",
            sub,
            myurl,
            myfunctions
        );
    }

    //获取纳税人识别号
    function getnumber() {
        var nsrsbh = $("#nsrsbh").val().trim();
        $("#viewnumber").modal("show");
        $("#nsrsbhjs").val(nsrsbh);
        initviewtable("", nsrsbh);
    }

    //获取纳税人名称
    function getthename() {
        var nsrmc = $("#nsrmc").val().trim();
        $("#viewnumber").modal("show");
        $("#nsrmcjs").val(nsrmc);
        initviewtable(nsrmc);
    }

    //根据纳税人识别号、纳税人名称进行检索
    function thequerys() {
        var nsrmc = $("#nsrmcjs").val().trim();
        var nsrsbh = $("#nsrsbhjs").val().trim();
        initviewtable(nsrmc, nsrsbh);
    }

    //获取选中的纳税人识别号
    function thevalueof(nsrsbh, nsrmc, djxh) {
        djxhs = djxh;
        //置input为不可编辑状态
        $("#nsrsbh").attr("readonly", "readonly");
        $("#nsrmc").attr("readonly", "readonly");
        $("#nsrsbh").val(nsrsbh);
        $("#nsrmc").val(nsrmc);
        $("#nsrqz").val(nsrmc);
        $("#viewnumber").modal("hide");
    }

    //纳税人信息(表)
    function initviewtable(nsrmc, nsrsbh) {
        $('#viewtables').bootstrapTable('destroy');
        $('#viewtables').bootstrapTable({
            url: "${ctx}/sjjh/xxcj/taxdata",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    'svo.nsrmc': nsrmc,
                    'svo.nsrsbh': nsrsbh,
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
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 25, 50, 100, 'All'], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            ueryParamsType: 'limit',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'djxh',
                    align: 'left',
                    halign: 'center',
                    title: '登记序号'
                }, {
                    field: 'nsrmc',
                    align: 'left',
                    halign: 'center',
                    title: '纳税人名称'
                }, {
                    field: 'nsrsbh',
                    align: 'left',
                    halign: 'center',
                    title: '纳税人识别号',
                    formatter: function (value, row, index) {
                        return '<button type="button" class="btn btn-link btn-lg" onclick="thevalueof(\'' + row.nsrsbh + '\',\'' + row.nsrmc + '\',\'' + row.djxh + '\')">' + value + '</button>'
                    }
                }, {
                    field: 'fddbrxm',
                    align: 'left',
                    halign: 'center',
                    title: '法人'
                }, {
                    field: 'nsrztmc',
                    align: 'left',
                    halign: 'center',
                    title: '纳税人状态'
                }, {
                    field: 'zcdz',
                    align: 'left',
                    halign: 'center',
                    title: '注册地址'
                }, {
                    field: 'scjydz',
                    align: 'left',
                    halign: 'center',
                    title: '生产经营地址'
                }, {
                    field: 'djzclxmc',
                    align: 'left',
                    halign: 'center',
                    title: '登记注册类型'
                }, {
                    field: 'hymc',
                    align: 'left',
                    halign: 'center',
                    title: '行业'
                }, {
                    field: 'fj',
                    align: 'left',
                    halign: 'center',
                    title: '分局'
                }, {
                    field: 'ks',
                    align: 'left',
                    halign: 'center',
                    title: '科所'
                }, {
                    field: 'swryxm',
                    align: 'left',
                    halign: 'center',
                    title: '税收管理员'
                }
            ]
        });

    }

    //表头校验
    function buildtablevalidator() {
        $('#tablevalidation').bootstrapValidator({
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                shzzgbjy: {
                    validators: {
                        notEmpty: {
                            message: '水行政主管部是必须的，不能是空的'
                        }
                    }
                },
                qsssqqjy: {
                    validators: {
                        intrger: {},
                        notEmpty: {
                            message: '取水所属期起不能大于取水所属期止且不能为空'
                        }, callback: {
                            message: '取水所属期起不能是2017/12/31以前',
                            callback: function (value, validator, $field, options) {
                                var beginDate = value;
                                var endDate = "2017/12/31";
                                //当前日期的后一天
                                var afterTheTime = getAfterTheTime();
                                var begin = new Date(beginDate.replace(/\-/g, "\/"));
                                var end = new Date(endDate.replace(/\-/g, "\/"));
                                var afterDate = new Date(afterTheTime.replace(/\-/g, "\/"));
                                if (beginDate != "" && endDate != "" && afterTheTime != "") {
                                    return begin > end && begin < afterDate;
                                }
                            }
                        }
                    }
                },
                qsssqzjy: {
                    validators: {
                        intrger: {},
                        notEmpty: {
                            message: '取水所属期止不能小于取水所属期起'
                        }, callback: {
                            message: '取水所属期止不能是2017/12/31之前、大于或等于取水所属期起、不能是今日以后',
                            callback: function (value, validator, $field, options) {
                                //取水属期止
                                var endDate = value;
                                //取水属期起
                                var beginDate = $('#qsssqqid').val();
                                //指定时间
                                var theSpecifiedDate = "2017/12/31";
                                //当前日期的后一天
                                var afterTheTime = getAfterTheTime();
                                var begin = new Date(beginDate.replace(/\-/g, "\/"));
                                var end = new Date(endDate.replace(/\-/g, "\/"));
                                var afterDate = new Date(afterTheTime.replace(/\-/g, "\/"));
                                var theSpecified = new Date(theSpecifiedDate.replace(/\-/g, "\/"));
                                if (beginDate != "" && endDate != "" && afterDate != "") {
                                    return begin <= end && end < afterDate && end > theSpecified;
                                }
                            }
                        }
                    }
                },
                cbrqjy: {
                    validators: {
                        notEmpty: {
                            message: '抄表日期是必须的，不能是空的'
                        }, callback: {
                            message: '抄表日期不能是2017/12/31以前且不能是今日以后',
                            callback: function (value, validator, $field, options) {
                                //当前时间
                                var theCurrentDate = value;
                                //指定时间
                                var theSpecifiedDate = "2017/12/31";
                                //今日时间的后一天时间
                                var afterTheTime = getAfterTheTime();
                                //当前
                                var theCurrent = new Date(theCurrentDate.replace(/\-/g, "\/"));
                                //指定
                                var theSpecified = new Date(theSpecifiedDate.replace(/\-/g, "\/"));
                                //之后
                                var afterDate = new Date(afterTheTime.replace(/\-/g, "\/"));
                                if (theCurrentDate != "" && theSpecifiedDate != "" && afterTheTime != "") {
                                    return theCurrent > theSpecified && afterDate > theCurrent;
                                }
                            }
                        }
                    }
                },
                nsrsbhjy: {
                    validators: {
                        notEmpty: {
                            message: '纳税人识别号是必须的，不能是空的'
                        }
                    }
                },
                nsrmcjy: {
                    validators: {
                        notEmpty: {
                            message: '纳税人名称是必须的，不能是空的'
                        }
                    }
                },
                lxrjy: {
                    validators: {
                        notEmpty: {
                            message: '联系人是必须的，不能是空的'
                        }
                    }
                },
                lxfsjy: {
                    validators: {
                        notEmpty: {
                            message: '联系方式是必须的，且只能输入11位'
                        }, regexp: {
                            regexp: /^[0-9-]{11}$/,
                            message: '联系方式是必须的,且只能输入国内电话号码'
                        }
                    }
                },
                qsjhjy: {
                    validators: {
                        notEmpty: {
                            message: '取水计划是必须的，不能是空的'
                        }, regexp: {
                            regexp:  /^[0-9-]{11}$/,
                            message: '上期表底数只能输入数字且非零开头'
                        }
                    }
                },
                sylxjy: {
                    validators: {
                        notEmpty: {
                            message: '水源类型是必须的，不能是空的'
                        }
                    }
                },
                qyshyjy: {
                    validators: {
                        notEmpty: {
                            message: '取用水行业是必须的，不能是空的'
                        }
                    }
                },
                ccqlxjy: {
                    validators: {
                        notEmpty: {
                            message: '超采区类型是必须的，不能是空的'
                        }
                    }
                },
                dxgsgwjy: {
                    validators: {
                        notEmpty: {
                            message: '地下供水管网是必须的，不能是空的'
                        }
                    }
                },
                tsyslbjy: {
                    validators: {
                        notEmpty: {
                            message: '特殊用水类别是必须的，不能是空的'
                        }
                    }
                },
                nsrqzjy: {
                    validators: {
                        notEmpty: {
                            message: '纳税人签章是必须的，不能是空的'
                        }
                    }
                },
                slhdrqzjy: {
                    validators: {
                        notEmpty: {
                            message: '水量核定人签章是必须的，不能是空的'
                        }
                    }
                },
                swjgslrjy: {
                    validators: {
                        notEmpty: {
                            message: '税务机关受理人是必须的，不能是空的'
                        }
                    }
                },
                slrqjy: {
                    validators: {
                        notEmpty: {
                            message: '受理日期是必须的，不能是空的'
                        }, callback: {
                            message: '受理日期不能是2017/12/31以前且不能是今日以后',
                            callback: function (value, validator, $field, options) {
                                //获取input里面时间
                                var theCurrentTime = value;
                                //之前时间
                                var beforeTheTime = "2017/12/31";
                                //之后时间（当前日后一天）
                                var afterTheTime = getAfterTheTime();
                                var theCurrent = new Date(theCurrentTime.replace(/\-/g, "\/"));
                                var begin = new Date(beforeTheTime.replace(/\-/g, "\/"));
                                var end = new Date(afterTheTime.replace(/\-/g, "\/"));
                                if (theCurrentTime != "" && beforeTheTime != "" && afterTheTime != "") {
                                    return theCurrent < end && theCurrent > begin;
                                }
                            }
                        }
                    }
                }
            }
        });
    }

    //表信息校验
    function formValidator() {
        $('#validationForm').bootstrapValidator({
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                newqskddjy: {
                    validators: {
                        notEmpty: {
                            message: '取水口地点是必须的，不能是空的'
                        }
                    }
                },
                newbhjy: {
                    validators: {
                        notEmpty: {
                            message: '编号是必须的，不能是空的'
                        }
                    }
                },
                newsqbdsjy: {
                    validators: {
                        notEmpty: {
                            message: '上期表底数是必须的，不能是空的'
                        }, regexp: {
                            regexp: /^(\d)+(\.\d)?$/,
                            message: '上期表底数只能输入数字,且非零开头的最多带4位小数的数字'
                        }
                    }
                },
                newbqbdsjy: {
                    validators: {
                        notEmpty: {
                            message: '本期表底数是必须的，不能是空的'
                        }, regexp: {
                            regexp: /^(\d)+(\.\d)?$/,
                            message: '本期表底数只能输入数字,且非零开头的最多带4位小数的数字'
                        }
                    }
                },
                newbqqsljy: {
                    validators: {
                        notEmpty: {
                            message: '本期取水量是必须的，不能是空的'
                        }, regexp: {
                            regexp: /^(\d)+(\.\d)?$/,
                            message: '本期取水量只能输入数字,且非零开头的最多带4位小数的数字'
                        }
                    }
                },
                newljqsljy: {
                    validators: {
                        notEmpty: {
                            message: '累计取水量是必选的，不能是空的'
                        }, regexp: {
                            regexp:/^(\d)+(\.\d)?$/,
                            message: '累计取水量只能输入数字,且非零开头的最多带4位小数的数字'
                        }
                    }
                },
                newjhqsljy: {
                    validators: {
                        notEmpty: {
                            message: '计划取水量是必选的，不能是空的'
                        }, regexp: {
                            regexp: /^(\d)+(\.\d)?$/,
                            message: '计划取水量只能输入数字,且非零开头的最多带4位小数的数字'
                        }
                    }
                },
                newhddjhnqsljy: {
                    validators: {
                        notEmpty: {
                            message: '核定的计划内取水量是必选的，不能是空的'
                        }, regexp: {
                            regexp: /^(\d)+(\.\d)?$/,
                            message: '核定的计划内取水量只能输入数字,且非零开头的最多带4位小数的数字'
                        }
                    }
                },
                newhddcjhqsljy: {
                    validators: {
                        notEmpty: {
                            message: '核定的超计划取水量是必选的，不能是空的'
                        }, regexp: {
                            regexp:/^(\d)+(\.\d)?$/,
                            message: '核定的超计划取水量只能输入数字,且非零开头的最多带4位小数的数字'
                        }
                    }
                }
            }
        });
    }
</script>
