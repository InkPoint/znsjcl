<%--
  Created by IntelliJ IDEA.
  User: lihui
  Date: 2017/11/8
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>数据导入</title>
    <%@ include file="/common/global.jsp"%>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctx}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--Ztree--%>
    <link rel="stylesheet" href="${ctx}/assets/css/zTreeStyle.css"/>
    <script src="${ctx}/assets/js/skins.min.js"></script>
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
                    <!--Widget Buttons-->
                </div>
                <!--Widget Header-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td align="left" style="vertical-align:middle; width:2cm;">批次:</td>
                            <td style="width:6cm;">
                                <input id="searchpc"  type="text" style="width: 150px;" class="form-control" placeholder="批次"></td>
                            <td align="left" style="vertical-align:middle; width:2cm;">文件名称:</td>
                            <td><input id="searchwjmc" type="text" style="width: 150px;" class="form-control" placeholder="文件名称"></td>

                        </tr>
                        <tr>
                            <td colspan="12" align="center">
                                <button type="button" class="btn btn-info" style="width: 2cm;" onclick="search();">执行查询</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-info btn-block" onclick="$(window.parent.goMenuPage());" style="width: 2cm;">返&nbsp;&nbsp;回</button>

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
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <div>&nbsp;</div>
                        <button id="insertRow" type="button" class="btn btn-success btn-sm" onclick="xz()">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加</button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="sc()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除</button>
                    </div>
                    <table id="table">

                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- /Page Body -->
</div>


<div id="modal1">
    <div class="modal fade" id="modala" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        新增
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="ibox-content" style="height:400px;;width:100%;">
                            <form id="editForm" method="post" class="form-horizontal">
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">文件选择:</label>
                                    <div  class="col-sm-2" style="width: 250px;">
                                        <select id="inputwjmc" class="js-data-example-ajax" style="width: 220px;" >
                                         </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">选择表:</label>
                                    <div  class="col-sm-2" style="width: 250px;">
                                        <select id="tabList" class="js-data-example-ajax" style="width: 220px;" >
                                        </select>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">批&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;次:</label>
                                    <div  class="col-sm-2" style="width: 250px;">
                                        <div class="control-label">
                                           <select id="inputpc" class="js-data-example-ajax" style="width: 220px;" >
                                           </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小:</label>
                                    <div  class="col-sm-2" style="width: 250px;">
                                        <input type="text"  id="inputwjdx" class="form-control" placeholder="" width="50px" readonly="true">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                                <div class="form-group">
                                    <label class="col-sm-5 control-label">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>
                                    <div  class="col-sm-2" style="width: 250px;">
                                        <input type="text" id="inputwjlx"  class="form-control" placeholder="" readonly="true">
                                    </div>
                                </div>
                                <div class="hr-line-dashed"></div>
                            </form>
                        </div>
                </div>
                <div class="modal-footer" align="center">
                    <button type="button" class="btn btn-primary" align="center" onclick="bc()">保存1</button>
                    <button type="button" class="btn btn-default" align="center" data-dismiss="modal">关闭</button>
                </div>

            </div>
        </div>
        <%--end 模态框--%>
        </div>
    </div>
</div>
</body>

<!--Basic Scripts-->
<script src="${ctx}/public/static/js/jquery.min.js"></script>
<script src="${ctx}/public/static/js/bootstrap.min.js"></script>
<script src="${ctx}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${ctx}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<%--Select2--%>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<!--TreeSelect 树形选择框-->
<script src="${ctx}/public/css/TreeSelect/scripts/boot.js" type="text/javascript"></script>
<!--Beyond Scripts-->
<script src="${ctx}/assets/js/beyond.min.js"></script>
<%--Ztree--%>
<script src="${ctx}/assets/js/jquery.ztree.core.js"></script>
<script src="${ctx}/assets/js/jquery.ztree.excheck-3.5.js"></script>
<%--导出插件--%>
<script src="${ctx}/assets/js/bootstrap-table-develop/bootstrap-table-export.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-develop/tableExport.js"></script>


<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>

</html>
<script>
    var wjxx= "";
    /*文件名称改变的时候 改换文件信息*/
    $("#inputwjmc").bind("change",function(){
//        console.log("inputwjmc-wjxx->"+JSON.stringify(wjxx));
        if(typeof($("#inputwjmc").select2("data")[0])!="undefined"&&$("#inputwjmc").select2("data")[0]!=""&&wjxx!="") {
            var wjid = $("#inputwjmc").select2("data")[0].id;
           //  alert("-->"+wjid);
           /// alert(wjxx);
            for(var i=0;i<wjxx.length;i++){
                for(var key in wjxx[i]){
                    if(key="id"&&wjid==wjxx[i][key]){
//                         console.log("文件名称--》"+wjxx[i]["text"]);
//                         console.log("文件类型--》"+wjxx[i]["wjlx"]);
//                         console.log("文件大小--》"+wjxx[i]["wjdx"]);
                       // $("#inputpc").val(wjxx[i]["pc"]);
                        $("#inputwjlx").val(wjxx[i]["wjlx"]);
                        $("#inputwjdx").val(wjxx[i]["wjdx"]);
                    }

                }
            }
        }else{
            $("#inputwjlx").val("");
            $("#inputwjdx").val("");
            $("#inputpc").val("");
        }
    });

    /*Ajax 获取文件名称下拉菜单的数据*/
   function xzwjmc() {
       var parmssss= {};
       //提交url
       var myurl="${pageContext.request.contextPath}/sjjh/sjdr/getWjmcData";
       //成功方法
       var myfunctions=function(json){
            console.log("getWjmcData-->"+JSON.stringify(json));
            wjxx=json.childrens;
           $("#inputwjmc").select2({
               data: wjxx,
               placeholder: '请选择',
               allowClear: true

           });
           $("#inputwjmc").select2("val","0");

           $("#tabList").select2({
               data: json.tabList,
               placeholder: '请选择',
               allowClear: true
           });
           $("#tablist").select2("val","0");
       }
       //提交数据
       $.myajax.common("post",
               parmssss ,
               myurl,
               myfunctions
       );
   }

    /*Ajax 获取批次表下拉菜单的数据*/
    function xzpc() {
        var parmssss= {};
        //提交url
        var myurl="${pageContext.request.contextPath}/sjjh/sjdr/getPcData";
        //成功方法
        var myfunctions=function(data){
        //    console.log("getPcData-->"+JSON.stringify(data));
            $("#inputpc").select2({
                data: data,
                placeholder: '请选择',
                allowClear: true

            });
            $("#inputpc").select2("val","0");
        }
        //提交数据
        $.myajax.common("post",
                parmssss ,
                myurl,
                myfunctions
        );
    }

    /*点击新增按钮触发这个事件*/
    function xz(){
        /*打开模态框*/
        $("#modala").modal('show');
        xzwjmc();//初始化文件名称下拉菜单
        xzpc();//初始化批次下来菜单
    }
    /*点击保存按钮后后台提交*/
    function bc(){
        /*获取数据，后台提交*/

        if(typeof($("#inputwjmc").select2("data")[0])=="undefined"||$("#inputwjmc").select2("data")[0]==""){
            alert("文件名称不能为空，请选择后保存");
            return false;
        }
        if(typeof($("#inputpc").select2("data")[0])=="undefined"||$("#inputpc").select2("data")[0]==""){
            alert("批次不能为空，请选择后保存");
            return false;
        }
        if(typeof($("#tabList").select2("data")[0])=="undefined"||$("#tabList").select2("data")[0]==""){
            alert("表不能为空，请选择表后保存");
            return false;
        }
        var drid="";
        var wjmc="";
        var sjb="";
        var wjlx=$("#inputwjlx").val();
        var wjdx=$("#inputwjdx").val();
        var inputpc="";
        if(typeof($("#inputwjmc").select2("data")[0])!="undefined"&&$("#inputwjmc").select2("data")[0]!=""){
             drid = $("#inputwjmc").select2("data")[0].id;
             wjmc = $("#inputwjmc").select2("data")[0].text;
              sjb = $("#tabList").select2("data")[0].id;
        }
        if(typeof($("#tabList").select2("data")[0])!="undefined"&&$("#tabList").select2("data")[0]!=""){
            sjb = $("#tabList").select2("data")[0].id;
        }
        if(typeof($("#inputpc").select2("data")[0])!="undefined"&&$("#inputpc").select2("data")[0]!=""){
            inputpc = $("#inputpc").select2("data")[0].id;
        }

       // console.log("faaafsfs-->"+inputpc);
        savepc(drid,wjmc,wjlx,wjdx,inputpc,sjb);
        $("#modala").modal('hide');
    }

    function savepc(drid,wjmc,wjlx,wjdx,pc,sjb){
        var parmssss= {drid:drid,wjmc:wjmc,wjlx:wjlx,wjdx:wjdx,pc:pc,sjb:sjb};
     //   console.log("parmssss-->",JSON.stringify(parmssss));
        //提交url
        var myurl="${pageContext.request.contextPath}/sjjh/sjdr/saveTableData";
        //成功方法
        var myfunctions=function(msg){
            // console.log("getTableData-->"+JSON.stringify(msg));
            $('#table').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parmssss ,
                myurl,
                myfunctions
        );
    }


    /*点击删除按钮后调用此函数*/
    function sc() {

        var selectoptin = $("#table").bootstrapTable("getSelections");
        if (selectoptin.length != 1) {
            alert("请先选择一行数据后再进行删除操作");
            return false;
        }
        if(selectoptin.length == 1){
            var drid = $.map($('#table').bootstrapTable('getSelections'), function(row) {
                return row.drid;
            });
            scsj(drid);
        }
    }
    /*删除数据后台请求*/
    function scsj(drid){

        var parmssss= {drid:drid};
        //提交url
        var myurl="${pageContext.request.contextPath}/sjjh/sjdr/delTableData";
        //成功方法
        var myfunctions=function(msg){
            // console.log("getTableData-->"+JSON.stringify(msg));
            $('#table').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parmssss ,
                myurl,
                myfunctions
        );
    }



    getTableData("","");
    /*查询*/
    function search(){
        var searchpc=$.trim($("#searchpc").val());//批次
        var searchwjmc=$.trim($("#searchwjmc").val());//文件名称
        getTableData(searchpc,searchwjmc);
    }

    /*获取页面数据*/
    function getTableData(searchpc,searchwjmc) {

        var parmssss= {pcmc:searchpc,wjmc:searchwjmc};
        //提交url
        var myurl="${pageContext.request.contextPath}/sjjh/sjdr/getTableData";
        //成功方法
        var myfunctions=function(msg){
           // console.log("getTableData-->"+JSON.stringify(msg));
            $('#table').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parmssss ,
                myurl,
                myfunctions
        );

    }


   // initbootstrap();
    /*初始化页面内容*/
    function initbootstrap(getdata){

        $('#table').bootstrapTable({
            search: true, //是否启用搜素
            showRefresh: true, //刷新按钮
            showPaginationSwitch: true,
            pagination: true, //是否分页
            singleSelect: true,
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
            showToggle: "true", //切换视图
            showColumns: 'true', //是否显示内容列下拉框
            clickToSelect: true, //是否启用点击选中行
                    columns: [{
                        field: 'id',
                        checkbox: true,
                        align: 'center'

                    }, {
                        field: 'wjmc',
                        align: 'center',
                        title: '文件名称 ',
                        width: '40%'

                    }, {
                        field: 'pcmc',
                        align: 'center',
                        title: '批次',
                        width: '10%'
                    }, {
                        field: 'sjdrsj',
                        align: 'center',
                        title: '导入时间',
                        width: '20%'
                    }, {
                        field: 'wjlx',
                        align: 'center',
                        title: '文件类型',
                        width: '20%'
                    },
                     {
                         field: 'wjdx',
                         align: 'center',
                         title: '文件大小',
                         width: '10%'
                     },
                ],
            data:getdata
        });
    }

</script>
