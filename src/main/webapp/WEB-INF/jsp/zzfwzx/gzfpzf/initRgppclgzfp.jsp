<%--
  Created by IntelliJ IDEA.
  User: ld
  Date: 2018/2/2
  Time: 15:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>未匹配数据工作分配</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--基本样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>

    <!--风格样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css"/>
    <%--验证--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <%--Select2插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
    <!--皮肤脚本：在head中，这个脚本用于加载皮肤和支持的脚本-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>

    <!--Beyond Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>

    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <!--table-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/assets/js/bootstrap-table/bootstrap-table-zh-CN.js"></script>
    <%--页面提交数据--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <%--验证--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">未匹配数据工作分配详情</span>
                </div>
                <div class="widget-body">
                    <%--<form id="subform">--%>
                    <table class="table">
                        <tr style="height: 100px;">
                            <td style="vertical-align:middle; width:600px;">数据总量:
                                &nbsp;<span id="wppxxzl" style="color: #ff4500"></span>&nbsp;&nbsp;条
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;未分配数据:
                                <span id="wfpsj" style="color: #ff4500"></span>&nbsp;&nbsp;条
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;已分配数据:
                                &nbsp;<span id="yfpsj" style="color: #ff4500"></span>&nbsp;&nbsp;条
                            <%--</td>
                            <td style="vertical-align:middle; width:300px;">未分配数据:
                                &nbsp;<span id="wfpsj" style="color: #ff4500"></span>&nbsp;&nbsp;条
                            </td>
                            <td style="vertical-align:middle; width:300px;">已分配数据:
                                &nbsp;<span id="yfpsj" style="color: #ff4500"></span>&nbsp;&nbsp;条--%>
                            </td>
                            <td style="vertical-align:middle;">
                                <%--<div style="float: left">分配开始序号:&nbsp;&nbsp;</div>--%>
                                <%--<div class="control-label" style="float: left">--%>
                                    <%--&lt;%&ndash;<select class="input-xlarge" style="width: 100px;" name="fpbegin" id="fpbegin">--%>
                                        <%--<option></option>--%>
                                    <%--</select>&ndash;%&gt;--%>
                                    <%--<input type="text" name="fpbegin" id="fpbegin" readonly style="width: 100px;"/>--%>
                                <%--</div>--%>
                                <div style="float: left">&nbsp;分配数据量&nbsp;</div>
                                <div class="control-label" style="float: left">
                                    <%--<select class="input-xlarge" style="width: 100px;" name="fpend" id="fpend">
                                        <option></option>
                                    </select>--%>
                                    <input type="text" name="fpend" id="fpend" style="width: 100px;"/>
                                </div>
                                <div style="float: left">&nbsp;条给&nbsp;</div>
                                <div class="control-label" style="float: left">
                                    <select class="input-xlarge" style="width: 100px;" name="ppr" id="ppr">
                                        <option></option>
                                    </select>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </div>

                                <div style="float: left;">
                                    <button class="btn btn-info" style="width: 2cm;" id="fpbut" onclick="fpsj()">
                                        分配
                                    </button>
                                    <button onclick="window.location.href='${pageContext.request.contextPath}/zzfwzxpage.jsp'" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                                </div>
                            </td>
                        </tr>
                        <%--<tr style="height: 100px;">--%>
                        <%--</tr>--%>
                    </table>
                    <%--</form>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-sm-6 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">未分配数据</span>
                </div>
                <div class="widget-body">
                    <table id="fptab" class="table table-striped table-bordered table-hover" data-height="542"></table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script>
    //初始化数据量
    $(function(){
        //查看未匹配数据总量
        ckwppzl();
        //查看未分配数据总量
        ckwfpsj();
        //查看已分配数据总量
        ckyfpsj();
        //分配开始的信息
//        fpbegin();
        /*
        //分配结束
        fpend();*/
        //初始化查询
        inittab();
        //匹配人下拉框
        $.ajax({
            type:'post',
            dataType:'json',
            url:'${pageContext.request.contextPath}/zzfwzx/gzfpzf/ckppr',
            success:function(data3){
                $('#ppr').select2({
                    data: data3,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
    });
    //查看未匹配数据总量
    function ckwppzl(){
        $.ajax({
            type:'post',
            dataType:'json',
            url:'${pageContext.request.contextPath}/zzfwzx/gzfpzf/wppzl',
            success: function(data0){
                $('#wppxxzl').html(data0.wppzl);
            }
        });
    }
    //查看未分配数据总量
    function ckwfpsj(){
        $.ajax({
            type:'post',
            dataType:'json',
            url:'${pageContext.request.contextPath}/zzfwzx/gzfpzf/wfpsj',
            success: function(data1){
                $('#wfpsj').html(data1.wfpzl);
            }
        });
    }
    //查看未分配数据总量
    function ckyfpsj(){
        $.ajax({
            type:'post',
            dataType:'json',
            url:'${pageContext.request.contextPath}/zzfwzx/gzfpzf/yfpsj',
            success: function(data2){
                $('#yfpsj').html(data2.yfpzl);
            }
        });
    }
    <%--function fpbegin(){--%>
        <%--$.ajax({--%>
            <%--type:'post',--%>
            <%--dataType:'json',--%>
            <%--url:'${pageContext.request.contextPath}/sjcl/gzfp/fpbegin',--%>
            <%--success: function(data){--%>
                <%--$('#fpbegin').val($.trim(data[0].wid));--%>
               <%--/* $('#fpbegin').select2({--%>
                    <%--data: data,--%>
                    <%--placeholder: '请选择',--%>
                    <%--allowClear: true--%>
                <%--});*/--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
    //初始化查询为分配信息
    function inittab(){
        //销毁表格
        $('#fptab').bootstrapTable('destroy');
        $('#fptab').bootstrapTable({
            url: "${pageContext.request.contextPath}/zzfwzx/gzfpzf/selectAll",//获取数据的Select地址
            sidePagination: "server",//表示服务端请求(分页方式：client客户端分页，server服务端分页)
            queryParams: function (params) {
                return {
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            pagination: true, //是否分页
            dataType:'json',
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            onlyInfoPagination: false,
//            toolbar: '#toolbar',
            cache: false,//是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            paginationLoop: true,//设置为true启用分页条无线循环的功能
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "wid", //每一行的唯一标识，一般为主键列
            ueryParamsType: 'limit',
            columns: [{
                field: '',
                checkbox: true,
                align: 'center'
            },{
                field: 'wid',
                align: 'center',
                title:'编号'
            },{
                field: 'ybywm',
                align: 'center',
                title: '原表名称'
            }, {
                field: 'ybzd',
                align: 'center',
                title: '原表字段'
            }, {
                field: 'ppz',
                align: 'center',
                title: '匹配值'
                }
            ]
        });
    }
    /*//分配结束
    function fpend(){
        $.ajax({
            type:'post',
            dataType:'json',
            url:'${pageContext.request.contextPath}/zzfwzx/gzfpzf/fpend',
            success: function(data4){
                $('#fpend').select2({
                    data: data4,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
    }*/
    //分配按钮
    function fpsj(){
        document.getElementById('fpbut').disabled=true;
        //开启验证
//        $("#subform").data('bootstrapValidator').validate();
//        if (!$("#subform").data('bootstrapValidator').isValid()) {
//            return;
//        }
        var reg = /^\d+$/;
//        var fpbegintext = $.trim($('#fpbegin').val());
        var fpendtext = $.trim($('#fpend').val());
        var pprtext = $('#ppr').val();
        var wfpsjl = $('#wfpsj').val();
        if(fpendtext==''||pprtext==''){
            alert('请确定分配情况,再分配');
            document.getElementById('fpbut').disabled=false;
        }else if(!reg.test(fpendtext)||fpendtext=='0'){
            alert('请输入正整数');
            document.getElementById('fpbut').disabled=false;
        }
        else if(parseInt(wfpsjl)<parseInt(fpendtext)){
            alert('分配的数据量不能多于未分配总量');
            document.getElementById('fpbut').disabled=false;
        }
        else{
            $.ajax({
                dataType:'json',
                type:'post',
                data:{
                    'fpend':fpendtext,
                    'ppr':pprtext
                },
                url:'${pageContext.request.contextPath}/zzfwzx/gzfpzf/updatappr',
                success:function(meg){

                    alert(meg);
                    document.getElementById('fpbut').disabled=false;
                    $('#fpbegin').val("");
                    $('#fpend').val("");
                    //重置一下未分配和已分配的数量 和前面两个下拉框
                    ckwfpsj();
                    ckyfpsj();
                    inittab();
                }
            });


            <%--$.ajax({--%>
                <%--dataType:'json',--%>
                <%--type:'post',--%>
                <%--url:'${pageContext.request.contextPath}/sjcl/gzfp/sjlwid',--%>
                <%--data:{--%>
                    <%--'fpend':fpendtext,--%>
                    <%--'fpbegin':fpbegintext--%>
                <%--},--%>
                <%--success:function(data1){--%>
                    <%--$.ajax({--%>
                        <%--dataType:'json',--%>
                        <%--type:'post',--%>
                        <%--data:{--%>
                            <%--'fpbegin':fpbegintext,--%>
                            <%--'fpend':data1[0].wid,--%>
                            <%--'ppr':pprtext--%>
                        <%--},--%>
                        <%--url:'${pageContext.request.contextPath}/sjcl/gzfp/updatappr',--%>
                        <%--success:function(meg){--%>
                            <%--$('#fpbegin').val("");--%>
                            <%--$('#fpend').val("");--%>
                            <%--//重置一下未分配和已分配的数量 和前面两个下拉框--%>
                            <%--ckwfpsj();--%>
                            <%--ckyfpsj();--%>
                            <%--fpbegin();--%>
                            <%--inittab();--%>
                            <%--alert(meg);--%>
                        <%--}--%>
                    <%--});--%>
                <%--}--%>
            <%--});--%>

        }

    }
//    $(document).ready(function () {
//        $('#subform').bootstrapValidator({
//            live:'disabled',//验证时机
//            submitButtons:'#fpbut',
//            message:'验证不通过',
//            feedbackIcons: {
//                valid: 'glyphicon glyphicon-ok',
//                invalid: 'glyphicon glyphicon-remove',
//                validating: 'glyphicon glyphicon-refresh'
//            },
//            fields: {
//                fpbegin: {
//                    //验证器
//                    validators: {
//                        //值不为空
//                        notEmpty: {
//                            message: '不能为空'
//                        }
//                    }
//                },
//                fpend: {
//                    validators: {
//                        notEmpty: {
//                            message: '不能为空'
//                        }
//                    }
//                },
//                ppr: {
//                    validators: {
//                        notEmpty: {
//                            message: '不能为空'
//                        }
//                    }
//                }
//            }
//        });
//    });
</script>
