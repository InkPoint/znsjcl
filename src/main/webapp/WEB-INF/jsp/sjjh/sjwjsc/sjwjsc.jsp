<%--
  Created by IntelliJ IDEA.
  User: win7
  Date: 2017/11/8
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <title>文件上传</title>
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
    <%--文件上传 css--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fileinput.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/fileinput-rtl.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--Ztree--%>
    <link rel="stylesheet" href="${ctx}/assets/css/zTreeStyle.css"/>
    <style>
        .mycolor{background: red;}

    </style>
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
                            <td style="vertical-align:middle; width:1cm;text-align: right;">文件名称:</td>
                            <td style="width:6cm;">
                                <input id="searchwjmc" type="text" style="width: 250px;" class="form-control" placeholder="文件名称"></td>
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
                        <button onclick="scwjbut()" type="button" class="btn btn-info btn-sm" data-toggle="modal"
                                 data-target="#scwjmodal">
                            <i  class="glyphicon glyphicon-floppy-open"></i>
                            上传文件</button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="sc()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除</button>
                        <button type="button" class="btn btn-primary btn-sm" onclick="ck()">
                            <i class="glyphicon glyphicon-search"></i>
                            查看</button>
                    </div>
                    <table id="mytable">

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<%--上传文件模态框--%>
<div class="modal fade" id="scwjmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 750px">
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
                            <label class="col-sm-2 control-label">文件上传:</label>
                            <div class="col-sm-2" style="width: 450px;">
                                <input type="file" class="file-loading" name="fileinput" id="fileinput"/>
                            </div>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <span id="errortext"  hidden="hidden" style="color: #ff0000;"></span>
                        </div>


                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">目标表:</label>
                            <div class="col-sm-2" style="width: 290px">
                                <select  id="mbb" class="col-sm-5" class="form-control" name="mbb"  style="width:260px;" onchange="selmbb();"> </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div   class="form-group">
                            <div class="col-md-1"></div>
                            <div class="col-md-4 col-sm-offset-1"  >
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="text-align: center;">
                                        excel表头
                                    </div>
                                    <div  id="excelcolumns" class="panel-body" style="width:100px;"  style="margin-left: 80px">

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4" >
                                <div class="panel panel-default">
                                    <div class="panel-heading" style="text-align: center;">
                                        目标表字段 <button type="button" class="btn btn-primary" style="height:25px;"  onclick="movespan(1)">向上</button>
                                                   <button type="button" class="btn btn-primary" style="height:25px;" onclick="movespan(2)">向下</button>
                                    </div>
                                    <div class="panel-body"  style="width:180px;"  style="margin-left: 80px"   id="mbzd">

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">批&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;次:</label>
                            <div class="col-sm-2" style="width: 290px">
                                <select id="pc"></select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称:</label>
                            <div class="col-sm-2" style="width: 290px">
                                <input type="text" class="form-control" id="model-wjmc" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型:</label>
                            <div class="col-sm-2" style="width: 290px">
                                <input type="text" class="form-control" id="model-wjlx" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">大&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;小:</label>
                            <div class="col-sm-2" style="width: 290px" >
                                <input type="text" class="form-control" id="model-wjdx" readonly="readonly"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
                            <div class="col-sm-2" style="width: 290px;">
                                <textarea id="model-wjbz" rows="4" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="shutdown()">关闭</button>
                            <button type="button" class="btn btn-primary"  onclick="mysubmit()">
                                提交
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<%--查看模态框--%>
<div id = "ckmodala">
    <div class="modal fade" id="ckmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
      <div class="modal-dialog">
             <div class="modal-content">
                  <div class="ibox-content" style="height: 1px;">
                      <form   method="post" class="form-horizontal">
                          <input id="editsqid"  align="left" type="hidden" class="form-control">
                      </form>
                  </div>
                  <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                          &times;
                      </button>
                      <h4 class="modal-title" id="myModalLabel">
                          查看文件
                      </h4>
                  </div>
                   <div class="modal-body">
                        <input id="ckdrid"  align="left" type="hidden" class="form-control">
                       <div class="ibox-content" style="height:600px;;width:100%;">
                           <form   method="post" class="form-horizontal">
                              <div class="form-group">
                                  <label class="col-sm-5 control-label">文件名称:</label>
                                  <div  class="col-sm-2" style="width: 250px;">
                                      <input id="ckwjmc" type="text" class="form-control" placeholder="" readonly="readonly">
                                  </div>
                              </div>
                              <div class="hr-line-dashed"></div>
                              <div class="form-group">
                                  <label class="col-sm-5 control-label">文件类型:</label>
                                  <div  class="col-sm-2" style="width: 250px;">
                                      <div class="control-label">
                                          <input id="ckwjlx" type="text"  class="form-control" placeholder="" readonly="readonly">
                                      </div>
                                  </div>
                              </div>
                              <div class="hr-line-dashed"></div>
                              <div class="form-group">
                                  <label class="col-sm-5 control-label">文件大小:</label>
                                  <div  class="col-sm-2" style="width: 250px;">
                                      <input id="ckwjdx" type="text"  class="form-control" placeholder="" readonly="readonly">
                                  </div>
                              </div>
                              <div class="hr-line-dashed"></div>
                              <div class="form-group">
                                  <label class="col-sm-5 control-label">审核结果:</label>
                                  <div  class="col-sm-2" style="width: 250px;">
                                      <input id="ckshjg" type="text"  class="form-control" placeholder="" readonly="readonly">
                                  </div>
                              </div>
                              <div class="hr-line-dashed"></div>
                              <div class="form-group">
                                  <label class="col-sm-5 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>
                                  <div  class="col-sm-2" style="width: 250px;">
                                      <textarea id="ckbz" class="form-control" rows="4"  readonly="readonly"></textarea>
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
<%--文件上传插件--%>
<script src="${ctx}/assets/js/fileinput/fileinput.js"></script>
<script src="${ctx}/assets/js/fileinput/zh.js"></script>
<%--表单验证插件--%>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script>
    //是否上传成功的标志
    var flag=0;
    //上传的文件
    var file1="";

    function shutdown(){
        //上传文件模态框缓存关闭按钮
        $('#scwjmodal').on('hidden.bs.modal', function () {
            $(this).removeData("bs.modal");
            clearForm($('#scwjmodal'));
        });
    }
    //初始化文件上传的模态框
    function scwjbut(){
        //初始化文件是否上传标志
        flag=0;
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
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            url: "${pageContext.request.contextPath}/sjjh/sjwjsc/initsjdx",
            type:'post',
            dataType:'json',
            success: function(msg){
                //初始化表格
                $("#mbb").select2({
                    data:msg,
                    Width:200,
                    placeholder:'请选择',
                    allowClear:true
                });
            }
        });

    }


    $(function(){
    //fileinput文件上传
        $("#fileinput").fileinput({
            showUpload: true,    //是否显示上传按钮
            showPreview: false,   //是否显示预览
            uploadAsync: true,   //默认异步上传
            language: "zh",      //语言
            showCaption: true,//是否显示标题
            allowedFileExtensions: ['xls'],//允许接受的文件后缀
            dropZoneEnabled: false,//是否显示拖拽区域
//            minFileSize:0,//单位kb  最小文件大小
            maxFileSize: 15000,//单位kb  最大文件大小   0 为不限制文件大小
            maxFileCount: 1,//最大文件数量
            enctype: 'multipart/form-data',//模拟form数据类型
            uploadUrl: '${pageContext.request.contextPath}/sjjh/sjwjsc/uploadfile'   //上传请求地址
        });
        //异步上传结果处理
        $("#fileinput").on('fileerror', function (event, data, msg) {

        });
        //异步上传返回结果处理
        $("#fileinput").on('filepreupload', function (event, data, previewId, index) {
            flag=1;
            $("#errortext").text("");
        });
        //文件上传成功后方法
        $("#fileinput").on('fileuploaded', function (event, data) {
            $("#excelcolumns").empty();
            var myhtml="";
            //将读出的表头展示出来
            $.each(data.response,function(i,data1){
                myhtml=myhtml+ "<span  style='width:100%;height:25px;display:block;'  >"+data1+"</span>";
//                append("<span  style='width:100%;height:25px;display:block;' class='label label-primary'>"+data1+"</span>");
            });
            $("#excelcolumns").html(myhtml);
        });
        //选择文件后处理事件
        $("#fileinput").on('filebatchselected', function (event, files) {
//            console.log("files:",files);
            file1=files[0];
            var a=file1.name;
            //文件名称
            $("#model-wjmc").val(a.substring(0, a.indexOf('.')));
            //文件的类型
            $("#model-wjlx").val(a.substring(a.lastIndexOf('.')+1));
            //文件的大小
            $("#model-wjdx").val(file1.size/1024+'KB');


        });
    });

    //上传文件中的提交按钮
        function mysubmit(){
            var fileinputval= $("#fileinput").val();
                if(flag==0||fileinputval==null){
                    $("#errortext").removeAttr('hidden');
                    $("#errortext").text("请先上传文件");
                }
                else{
                //文件名称
                var wjmc= $("#model-wjmc").val();
                //文件类型
                var wjlx= $("#model-wjlx").val();
                //文件大小
                var wjdx = $("#model-wjdx").val();
                //获取数据表
                var mbbid= $("#mbb").select2("data")[0].id;
                var mbzdlen=$("#mbzd span").size();
                var excellen=$("#excelcolumns span").size();
                if(mbzdlen!=excellen){
                    alert("选择的表字段和导入文件列数不一致！");
                    return;
                }
//                console.log("mbzdlen:",mbzdlen);
                //获取顺序列名称

               var colu="";
                $("#mbzd span").each(function(i,data){
                    console.log("data:",$(this).text());
                    if(i==0){
                        colu= $.trim($(this).text());
                    }else{
                        colu=colu+","+$.trim($(this).text());
                    }
                });
                var parmssss = {wjmc:wjmc,wjlx:wjlx,wjdx:wjdx,solumns:colu,sjb:mbbid};
                console.log("parmssss",parmssss);
                var myurl = "${pageContext.request.contextPath}/sjjh/sjwjsc/savewjxx";
                var myfunctions = function() {
                    getTableData();

                };
                $.myajax.common("post",
                        parmssss,
                        myurl,
                        myfunctions
                );
            $("#scwjmodal").modal("hide");

        }
        }

    //点击删除按钮后调用此函数
    function sc() {
        var selectoptin = $("#mytable").bootstrapTable("getSelections");
        if (selectoptin.length != 1) {
            alert("请先选择一行数据后再进行删除操作");
            return false;
        }
        var msg = "您真的确定要删除么？";
        if (confirm(msg) == true) {
            var drid = $.map($('#mytable').bootstrapTable('getSelections'), function(row) {
                return row.drid;
            });
            scsj(drid);
        }
    }
    //删除数据后台请求
   function scsj(drid){

       var parmssss= {drid:drid};
       //提交url
       var myurl="${pageContext.request.contextPath}/sjjh/sjwjsc/delTableData";
       //成功方法
       var myfunctions=function(msg){
           // console.log("getTableData-->"+JSON.stringify(msg));
           $('#mytable').bootstrapTable("destroy");
           initbootstrap(msg);
       }
       //提交数据
       $.myajax.common("post",
               parmssss ,
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
       if(selectoptin.length == 1){
           var row =  $.map($('#mytable').bootstrapTable('getSelections'), function(row) {

               return row;
           });
        //  console.log("row-->"+JSON.stringify(row));
           cksj(row);
       }
   }
    /*查看初始化参数函数*/
   function cksj(row){
       var drid= row[0].drid ;
       var wjmc= row[0].wjmc ;
       var scsj= row[0].scsj ;
       var wjlx= row[0].wjlx ;
       var shr= row[0].shr ;
       var wjdx= row[0].wjdx ;
       var shjg= row[0].shjg ;
       var bz= $("#model-wjbz").val() ;

        $("#ckmodal").modal('show');
        $("#ckdrid").val(drid);
        $("#ckwjmc").val(wjmc);
        $("#ckwjlx").val(wjlx);
        $("#ckwjdx").val(wjdx);
        $("#ckshjg").val(shjg);
        $("#ckbz").val(bz);
   }

    //查看保存关闭函数
    function  ckbc(){
        $("#ckmodal").modal('hide');
    }
    getTableData("","");
    //查询
    function search(){
        var searchwjmc=$.trim($("#searchwjmc").val());
        getTableData(searchwjmc);
    }

    //获取页面数据
    function getTableData(searchwjmc) {

        //var parmssss= {wjmc:searchwjmc,sjly:searchsjly};
        var parmssss= {wjmc:searchwjmc};
        //提交url
        var myurl="${pageContext.request.contextPath}/sjjh/sjwjsc/getTableData";
        //成功方法
        var myfunctions=function(msg){
            $('#mytable').bootstrapTable("destroy");
            initbootstrap(msg);
        }
        //提交数据
        $.myajax.common("post",
                parmssss ,
                myurl,
                myfunctions
        );

    }

    function zxck(lyid,lymc){
       alert("在线查看功能未上线->数据来源id--->+["+lyid+"]<---数据来源名称");
    }
   // initbootstrap();
    //初始化页面内容
    function initbootstrap(getdata){
        $('#mytable').bootstrapTable({
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
                        width: '20%'

                    }, {
                        field: 'scsj',
                        align: 'center',
                        title: '上传时间',
                        width: '10%'
                    }, {
                        field: 'wjlx',
                        align: 'center',
                        title: '类型',
                        width: '10%'
                    }, {
                        field: 'scrmc',
                        align: 'center',
                        title: '上传人',
                        width: '10%'
                    },
                     {
                         field: 'shjg',
                         align: 'center',
                         title: '审核结果',
                         width: '10%'
                     },
                     {
                         field: 'shr',
                         align: 'center',
                         title: '审核人',
                         width: '10%'
                     },
                      {
                          field: 'wjdx',
                          align: 'center',
                          title: '文件大小',
                          width: '10%'
                      },
                      {
                            field: 'lymc',
                            align: 'center',
                            title: '数据来源'
                      }
                ],
            data:getdata
        });
    }
//选择目标表
    function selmbb(){
        //获取选中的项
        var mydata=$("#mbb").select2("data")[0].id;
        //请求表对应数据项的信息
        if(mydata!=""){
            $.ajax({
                //contentType:'application/json',
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${pageContext.request.contextPath}/sjjh/sjwjsc/getsjxinfo",
                type:'post',
                dataType:'json',
                data:{mbb:mydata},
                success: function(msg){
//                    console.log("msg:",msg);
                    $("#mbzd").empty();
                    //初始化表格
                    $.each(msg,function(i,data){
                        $("#mbzd").append("<span    style='width:100%;height:25px;display:block;'   onclick='updatecolor(event)' >"+data.SJXMCYW+"</span>");
                    });
                }
            });
        }
    }
   //改变颜色
   function updatecolor(event){
       var e=event||window.event;
       var target=e.target||e.srcElement;
       $(target).addClass("mycolor");
       $(target).siblings().removeClass("mycolor");
   }
  //移动span
 function movespan(flag){
      if(flag==1){
          //向上移动
          var mbspan=$(".mycolor").html();
          var $nextys=$(".mycolor").prev();
//          console.log("$nextys:",$nextys.length);
          if($nextys.length>0){
              $(".mycolor").remove();
              $nextys.before("<span    style='width:100%;height:25px;display:block;' class='mycolor'   onclick='updatecolor(event)' >"+mbspan+"</span>");
          }
      }else if(flag==2){
          //向下移动
          var mbspan=$(".mycolor").html();
          var $nextys=$(".mycolor").next();
//          console.log("$nextys:",$nextys.length);
          if($nextys.length>0){
              $(".mycolor").remove();
              $nextys.after("<span    style='width:100%;height:25px;display:block;'  class='mycolor'      onclick='updatecolor(event)' >"+mbspan+"</span>");
          }
      }
 }

 //初始化
 $(function(){
     //初始化批次
     $.ajax({
         //contentType:'application/json',
         contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
         url: "${pageContext.request.contextPath}/sjjh/sjwjsc/initpc",
         type:'post',
         dataType:'json',
         success: function(msg){
             //初始化表格
             $("#pc").select2({
                 data:msg,
                 Width:200,
                 placeholder:'请选择',
                 allowClear:true
             });
         }
     });

 });
</script>
