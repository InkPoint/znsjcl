<%--
  Created by IntelliJ IDEA.
  User: liduo
  Date: 2018/1/2
  Time: 10:34
  Modifier: PengWen Wang
  Modify: 2018/5/19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据产品主题</title>
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--时间--%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <%--Select2--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
    <%--页面提交数据--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <!--时间-->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/datetime/bootstrap-datepicker.js"></script>
</head>
<style>
    .yjbt {
        border: solid 1px powderblue;
        height: 40px;
        border-right: none;
    }

    .yjbt3 {
        border: solid 1px powderblue;
        height: 60px;
        border-right: none;
    }
</style>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <div class="col-sm-10 widget-caption" style="text-align: left">
                        <span>数据产品主题</span>
                    </div>
                </div>
                <div class="widget-body" style="height: 820px">
                    <div class="col-sm-2">
                        <div class="widget" style="height: 30%;">
                            <div class="widget-header bg-blue" style="text-align: center;">数据元件</div>
                            <div class="widget-body" style="height: 100%;overflow: auto">
                                <table class="table" id="sjyjtab"></table>
                            </div>
                        </div>
                        <div class="widget" style="height: 60%;margin-top: 100px">
                            <div class="widget-header bg-blue" style="text-align: center;">查询条件</div>
                            <div class="widget-body" style="height: 80%;overflow: auto">
                                <form id="addform" method="post">
                                    <div>
                                        <label class="control-label" style="text-align: left;width: 70%">所属机关</label>
                                        <button type="button" data-toggle="modal" class="btn btn-default"
                                                data-target="#ssjgmodal" style="width: 22%;">[+]
                                        </button>
                                    </div>
                                    <div id="ssfjhidden" class="form-group" style="display: none;width: 100%">
                                        <label class="control-label"
                                               style="text-align: left;width: 25%;float: left;color: mediumseagreen">所属分局:</label>
                                        <div style="width: 100%;color: mediumseagreen" id="ssfjdiv"></div>
                                    </div>
                                    <div id="sskshidden" class="form-group" style="display: none;width: 100%">
                                        <label class="control-label"
                                               style="text-align: left;width: 25%;float: left;color: mediumseagreen">所属科所:</label>
                                        <div style="width: 100%;color: mediumseagreen;word-break: break-all"
                                             id="ssksdiv"></div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div>
                                        <label class="control-label" style="text-align: left;width: 70%">纳税人状态</label>
                                        <button type="button" data-toggle="modal" class="btn btn-default"
                                                data-target="#nsrztmodal" style="width: 22%">[+]
                                        </button>
                                    </div>
                                    <div id="nsrzthidden" class="form-group" style="display: none;width: 100%">
                                        <label class="control-label"
                                               style="text-align: left;width: 30%;float: left;color: mediumseagreen">纳税人状态:</label>
                                        <div style="width: 100%;color: mediumseagreen;word-break: break-all"
                                             id="nsrztdiv"></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <%--表头信息--%>
                    <div class="widget col-sm-10" style="height: 100%;">
                        <div class="widget-body">
                            <table class="table">
                                <div id="yjbtdiv" style="text-align: center;"></div>
                            </table>
                        </div>
                        <div style="height: 15px"></div>
                        <div class="widget-body">
                            <table class="table">
                                <div style="text-align: center">
                                    <button type="submit" class="btn btn-info" onclick="zxcx()" style="width: 2cm;">
                                        在线查询
                                    </button>
                                    &nbsp;
                                    <button onclick="javascript:window.history.back(-1)" type="button"
                                            class="btn btn-info">返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回
                                    </button>
                                </div>
                            </table>
                        </div>
                        <div style="height: 15px"></div>
                        <div class="widget-body" style="height: 563px">
                            <table id="viewtables" data-height="512" style="white-space: nowrap;"></table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--所属机关的模态框--%>
<div class="modal fade" id="ssjgmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 550px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    所属机关
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form method="post" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-3"><label class="control-label">所属分局:</label></div>
                            <div class="col-sm-5">
                                <div class="control-label" style="text-align: left">
                                    <select id="ssfj" onchange="ks()" style="width: 300px;">
                                        <option></option>
                                    </select></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-3"><label class="control-label">所属科所:</label></div>
                            <div class="col-sm-5">
                                <div class="control-label" style="text-align: left">
                                    <select id="ssks" style="width: 300px;">
                                        <option></option>
                                    </select></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="sjjgsub()">
                    确定
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>

        </div>
    </div>
</div>
<%--纳税人状态的模态框--%>
<div class="modal fade" id="nsrztmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 550px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    纳税人状态
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form method="post" class="form-horizontal">
                        <div class="form-group">
                            <div class="col-sm-3"><label class="control-label">纳税人状态:</label></div>
                            <div class="col-sm-5">
                                <div class="control-label" style="text-align: left">
                                    <select id="nsrzt" style="width: 300px;">
                                        <option></option>
                                    </select></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="nsrztsub()">
                    确定
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>

        </div>
    </div>
</div>
</body>
</html>
<script>
    var c = 0;
    //数组是为了得到弹出模态框的id以及值
    var arr = new Array();
    //元件名称
    var nameOfTheElement = "";
    //所属机关代码
    var jgdmcon = "";
    //所属科所代码
    var ksdmcon = "";
    //纳税人状态代码
    var nsrztdmcon = "";

    $(function () {
        //通过数据产品id查询出相应的数据元件
        //传过来的产品主题id
        var ztid = "${param.ztid}";
        //提交的参数
        var sub = {"svo.ztid": ztid};
        var myurl = "${pageContext.request.contextPath}/sjyj/sjcpzt/sjyjlist";
        var myfunction = function (data1) {
            for (var i = 0; i < data1.length; i++) {
                var order = i + 1;
                var jsonobj = data1[i];
                var sjyjdiv = '<div  style="height: height: 30px"><label  style="text-align: left;width: 70%;">' + jsonobj.yjmc + '</label>' +
                    '<button id="but' + order + '" type="button"  class="btn btn-default" onclick="addsjyj(' + jsonobj.yjid + ')" style="width: 22%;text-align:center;">[+]' +
                    '</button><div><br>';
                $("#sjyjtab").append(sjyjdiv);
            }
        };
        $.myajax.common(
            'post',
            sub,
            myurl,
            myfunction
        );
        //默认加载表头
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: {'svo.ztid': '${param.ztid}'},
            url: '${pageContext.request.contextPath}/sjyj/sjcpzt/yjbtlist',
            success: function (data) {
                $.each(data, function (i, obj) {
                    c = i;
                    $('#yjbtdiv').append('<div class="jfbtdiv" style="border: solid 1px powderblue;padding: 0px;float: left;">' +
                        '<div class="yjbt">' + String.fromCharCode(65 + i) + '<span id="yjid' + c + '" hidden="hidden">' + obj.yjid + '</span></div>' +
                        '<div class="yjbt" id="yjmc' + c + '">' + obj.yjmc + '</div><div class="yjbt3" hidden="hidden">' + obj.yjly + '</div><div id="yjcs' + c + '" hidden="hidden">all|all|2016-01-01|1700-1-1|9999-1-1|all|all|</div></div>');
                });
                //均分表头
                jfbt();
            }
        });
        //添加所属分局
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '${pageContext.request.contextPath}/sjyj/sjcpzt/ssfjlist',
            success: function (data) {
                $("#ssfj").select2({
                    data: data,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //纳税人状态下拉框
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '${pageContext.request.contextPath}/sjyj/sjcpzt/nsrztlist',
            success: function (data) {
                $("#nsrzt").select2({
                    data: data,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
    });

    //添加数据元件
    function addsjyj(yjid) {
        c++;
        $("#but" + c).attr("disabled", "disabled");
        $.post("${ctx}/sjyj/sjcpzt/queryByID", {'svo.yjid': yjid}, function (datas) {
            var onecol = '<div class="jfbtdiv" style="border: solid 1px powderblue;padding: 0px;float: left;">' +
                '<div class="yjbt">' + String.fromCharCode(65 + c) + '<span id="yjid' + c + '" hidden="hidden"></span></div>' +
                '<div class="yjbt" id="yjmc' + c + '">' + datas[0].yjmc + '</div><div class="yjbt3" id="yjcstext' + c + '" hidden="hidden">' + datas[0].yjly + '</div><div hidden="hidden" id="yjcs' + c + '"></div></div>';
            $('#yjbtdiv').append(onecol);
            var gitDivText = document.getElementById("yjcstext" + c).innerText + ",";
            nameOfTheElement += gitDivText;
            jfbt();
        });
    }

    function viewthedata(nameOfTheElement) {
        $.ajax({
            url: "${pageContext.request.contextPath}/sjyj/sjcpzt/getHeader",
            dataType: 'json',
            data: {'svo.producetheproduct': nameOfTheElement},
            success: function (header) {
                for (var i in header)
                    $("#viewtables").bootstrapTable('destroy');
                $("#viewtables").bootstrapTable({
                    url: "${pageContext.request.contextPath}/sjyj/sjcpzt/produceTheProduct?svo.producetheproduct=" + nameOfTheElement,
                    sidePagination: "server",//表示服务端请求
                    pagination: true, //是否分页
                    queryParams: function (params) {
                        return {
                            'svo.djjgdm': jgdmcon,//机关代码
                            'svo.zgswskfjdm': ksdmcon,//科所代码
                            'svo.nsrztdm': nsrztdmcon,//纳税人状态
                            offset: (params.offset / params.limit) + 1,
                            limit: params.limit
                        }
                    },
                    queryParamsType: 'limit',//设置为‘limit’则会发送符合RESTFul格式的参数
                    singleSelect: true,//设置为true 禁止多选
                    pageNumber: 1, //初始化加载第一页，默认第一页
                    buttonsAlign: 'right', //按钮对齐方式
                    pageSize: 10, //每页的记录行数
                    pageList: [10, 25, 50, 100], //可供选择的每页行数
                    clickToSelect: true, //是否启用点击选中行
                    cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
                    undefinedText: '-',//当数据为undefined时显示的字符
                    columns: header
                });
            }
        });
    }

    //查询条件中的所属分局onchange事件
    function ks() {
        //清空原本的下拉框
        var options = $("#ssks").find('option');
        if (options != '') {
            options.remove();
        }
        var swjgdm = $("#ssfj").val();
        if (swjgdm != '') {
            var swjg_dm = swjgdm.substr(0, 7);
            $.ajax({
                type: 'post',
                dataType: 'json',
                data: {'svo.swjg_dm': swjg_dm},
                url: '${pageContext.request.contextPath}/sjyj/sjcpzt/sskslist',
                success: function (data1) {
                    console.log(data1);
                    $("#ssks").select2({
                        data: data1,
                        placeholder: '请选择',
                        allowClear: true
                    });
                }
            });
        } else {
            alert("请先选择分局");
        }
    }

    //所属机关模态框的确定按钮?对于要提交的数据没有获取
    function sjjgsub() {
        $("#ssfjhidden").hide();
        $("#sskshidden").hide();
        //所属分局
        var ssfj = $("#ssfj").find("option:selected").text();
        //所属科所
        var ssks = $("#ssks").find("option:selected").text();
        if (ssfj != "") {
            $("#ssfjdiv").text(ssfj);
            $("#ssfjhidden").show();
        }
        if (ssks != "") {
            $("#ssksdiv").text(ssks);
            $("#sskshidden").show();
        }
        //所属机关代码
        var jgdm = $("#ssfj").select2("data");
        if (jgdm != null && JSON.stringify(jgdm) != "{}" && typeof(jgdm) != "undefined" && jgdm.length > 0) {
            jgdmcon = jgdm[0].id;
        }

        //所属科所代码
        var ksdm = $("#ssks").select2("data");
        console.log("ksdm:", ksdm);
        if (ksdm != null && JSON.stringify(ksdm) != "{}" && typeof(ksdm) != "undefined" && ksdm.length > 0) {
            ksdmcon = ksdm[0].id;
        }
    }

    //排序方式
    function pxfs() {
        //清空原本的下拉框
        var options = $("#pxsjyj").find('option');
        if (options != '') {
            options.remove();
        }
        var data = [];
        var data1 = [{id: 'asc', text: '升序'}, {id: 'desc', text: '降序'}];
        for (var i = 0; i <= c; i++) {
            data.push({id: $("#yjid" + i).text(), text: $("#yjmc" + i).text()});
        }
        ;
        $("#pxsjyj").select2({
            data: data,
            allowClear: true,
            placeholder: '请选择'
        });
        $("#pxfs").select2({
            data: data1,
            allowClear: true,
            placeholder: '请选择'
        });
        $("#pxfsmodal").modal("show");
    }

    //排序方式模态框的确定按钮
    function pxfssub() {
        $("#pxsjyjhidden").hide();
        $("#pxfshidden").hide();
        //数据元件的名称
        var sjyj = $("#pxsjyj").find("option:selected").text();
        //排序方式
        var pxfs = $("#pxfs").find("option:selected").text();
        if (sjyj != '') {
            $("#pxsjyjdiv").text(sjyj);
            $("#pxsjyjhidden").show();
            $("#pxfsdiv").text(pxfs);
            $("#pxfshidden").show();
        }
    }

    //纳税人状态模态框的确定按钮
    function nsrztsub() {
        $("#nsrzthidden").hide();
        //纳税人状态
        var nsrzt = $("#nsrzt").find("option:selected").text();
        if (nsrzt != '') {
            $("#nsrztdiv").text(nsrzt);
            $("#nsrzthidden").show();
        }
        //纳税人状态代码
        var nsrztdm = $("#nsrzt").select2("data");
        if (nsrztdm != null && JSON.stringify(nsrztdm) != "{}" && typeof(nsrztdm) != "undefined" && nsrztdm.length > 0) {
            nsrztdmcon = nsrztdm[0].id;
        }
    }

    //分组方式
    function fzfs() {
        $(".fzopt").remove();
        for (var i = 0; i <= c; i++) {
            $("#fzfs").append('<option class="fzopt" value="' + $("#yjid" + i).text() + '">' + $("#yjmc" + i).text() + '</option>');
        }
        $("#fzfsmodal").modal("show");
    }

    //分组方式模态框的确定按钮
    function fzfssub() {
        var fztext = '';
        $("#fzfshidden").hide();
        $("#fzfs option:selected").each(function () {
            fztext += $(this).text() + '  ';
        });
        if (fztext != '') {
            $("#fzfsdiv").text(fztext);
            $("#fzfshidden").show();
        }

    }

    //在线查询
    function zxcx() {
        viewthedata(nameOfTheElement);
    }

    //均分表头的方法
    function jfbt() {
        var divwidth = $("#yjbtdiv").width();
        var eachdiv = divwidth / (c + 1) - 1;
        $(".jfbtdiv").css({'width': eachdiv});
    }
</script>