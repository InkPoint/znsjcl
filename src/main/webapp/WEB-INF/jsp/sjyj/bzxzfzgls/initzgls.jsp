<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="pageContext.request.contextPath" value="${pageContext.request.contextPath}"/>
<html>

<head>
    <title>保障性住房资格连审信息</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>

    <%--文件上传 css--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput-rtl.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/zTreeStyle.css"/>--%>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>

    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <script>
        function gobacks() {
            $(window.parent.goMenuPage());
        }


    </script>
</head>

<body style="overflow: hidden">
<div id="loading" style="position: absolute;left: 43%;top: 30%;width: 40%;height: 25px;z-index: 1;display:none;">数据正在生成中，大概需要5分钟，请您耐心等待,......   </div>
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
                      <div class="row">
                          <div class="jeitem">
                              <label class="jelabel">属期起：</label>
                              <div class="jeinpbox"><input type="text" class="jeinput" id="test12" placeholder="YYYY-MM-DD"></div>
                          </div>
                          <div class="jeitem">
                              <label class="jelabel">属期止：</label>
                              <div class="jeinpbox"><input type="text" class="jeinput" id="test13" placeholder="YYYY-MM-DD"></div>
                          </div>
                          <div class="item">
                              <button type="button" class="btn btn-info" style="width: 2cm;" onclick="scwjbut();">
                                  上传文件
                              </button>             &nbsp; &nbsp; &nbsp; &nbsp;
                              <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                          </div>

                      </div>
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
                        <button onclick="exportdata()" type="button" class="btn btn-info btn-sm" >
                            <i class="glyphicon glyphicon-floppy-open"></i>导出
                        </button>
                    </div>
                    <table id="mytab" class="table table-striped table-bordered table-hover"
                           data-height="560" style="white-space: nowrap"></table>
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
                            <label class="col-sm-2 control-label">文件选择:</label>

                            <div class="col-sm-8" style="width: 500px;">
                                <input type="file"  class="file-loading" name="fileinput1" id="fileinput1"    />
                            </div>
                            <div id="filenames" class="col-sm-8" style="width: 500px;display: none;"></div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div style="text-align: center">
                            <button type="button" class="btn btn-primary " onclick="mysubmit()">提交</button>
                            <button type="button" class="btn btn-primary " onclick="closewin()">关闭</button>
                        </div>
                    </form>
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
<!--Beyond Scripts-->
<script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>
<%--文件上传插件--%>
<script src="${pageContext.request.contextPath}/assets/js/fileinput/fileinput.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/fileinput/zh.js"></script>
<%--日期组件--%>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/test/jeDate-test.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/skin/jedate.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/v20/jeDate/src/jedate.js"></script>

</html>
<script>
     var startny    ="";
     var csid="${param.csid}";
    function gohistory(){
        <%--window.location.href="${pageContext.request.contextPath}/sjjhpage.jsp";--%>
        window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/initSjcpzx?ztid="+csid;

    }


    //初始化文件上传的模态框
    function scwjbut() {
        var starttime=$("#test12").val();
        var endtime=$("#test13").val();
        if(starttime==""||starttime==null||endtime==""||endtime==null){
            alert("属期起或者属期止不能为空！");
            return ;
        }
        if(spraredate(starttime,endtime)){
            alert("属期起不能大于属期止！");
            return ;
        }
        $('#scwjmodal').modal('show');
        //$(".file-input").children().remove();
        initfileinput();
    }
    //关闭模态框
   function closewin(){
       $('#scwjmodal').modal('hide');
   }



    //上传文件中的提交按钮
    function mysubmit() {
           $('#mytab').bootstrapTable("destroy");
           $('#scwjmodal').modal('hide');
           $("#loading").show();
           //获取文件名：
           var filename=$("#filenames").text();
           var starttime=$("#test12").val();
           var endtime=$("#test13").val();
           startny= $("#test12").val().split("-")[0]+"年"+$("#test12").val().split("-")[1]+"月  至 "+ $("#test13").val().split("-")[0]+"年"+$("#test13").val().split("-")[1]+"月";
          console.log("startny:"+startny);
           if(starttime==""||starttime==null||endtime==""||endtime==null){
                alert("属期起或者属期止不能为空！");
               return ;
           }
           if(spraredate(starttime,endtime)){
               alert("属期起不能大于属期止！");
               return ;
           }
           console.log("filename:",filename);
           $.post("${pageContext.request.contextPath}/sjyj/bzxzfzgls/parseXlsfile",{filename:filename,starttime:starttime,endtime:endtime},function(data){
                   console.log("返回的结果：",data);
                   closediv();
                   inittabs(data);
           });

    }

    $(function(){
        jeDate("#test12",{
            format: "YYYY-MM-DD"
        });
        jeDate("#test13",{
            format: "YYYY-MM-DD"
        });
        initfileinput();

    });



    //初始化上传组件
    function  initfileinput(){
        $("#fileinput1").fileinput({
            showUpload:true,    //是否显示上传按钮
            showPreview:false,   //是否显示预览
            uploadAsync:true,   //默认异步上传
            language:"zh",      //语言
            showCaption:true,//是否显示标题
            allowedFileExtensions:['xls','xlsx'],//允许接受的文件后缀
            dropZoneEnabled:false,//是否显示拖拽区域
            maxFileSize:15000,//单位kb  最大文件大小   0 为不限制文件大小
            maxFileCount:1,//最大文件数量
            enctype:'multipart/form-data',//模拟form数据类型
            uploadUrl:'${pageContext.request.contextPath}/sjyj/bzxzfzgls/uploadfiles'   //上传请求地址

        });
        //异步上传返回结果处理
        $("#fileinput1").on('filepreupload',function(event,data,previewId,index){
            $("#filenames").html(data.files[0].name);
            //var form=data.form,files=data.files,extra=data.extra,response=data.response,reader=data.reader;
        });
    }

     //日期判断
    function spraredate(date1,date2){
       var startdate=new Date(Date.parse(date1));
        var enddate=new Date(Date.parse(date2));
        return (startdate>enddate) ;
    }


    //数据导出
    function exportdata(){
        window.location.href="${pageContext.request.contextPath}/sjyj/bzxzfzgls/downloadExcel?filenames="+$("#filenames").text();
    }


    //关闭加载中效果
    function closediv(){
        document.getElementById("loading").style.visibility='hidden';
    }


    //初始化表格
    function inittabs(datas){

        $('#mytab').bootstrapTable({
            <%--url:'${pageContext.request.contextPath}/demos/basicQuery/list',--%>
            data:datas,
            search: false, //是否启用搜素
            showRefresh: false, //刷新按钮
            showPaginationSwitch: false,
            pagination: true, //是否分页
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            sidePagination: "client",//表示客户端请求
            toolbar: '#toolbar',
            paginationLoop: true,
            uniqueId: 'RN',
//            idField:'TAXREGCODE',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "ppmxmc", //每一行的唯一标识，一般为主键列
            showToggle: "false", //切换视图
            showColumns: 'false', //是否显示内容列下拉框
//            sidePagination:'server',
            onClickRow:function(row,$element){
                curRow=row;
//                console.log("row:",row);
            },
            columns: [
                {
                    field: 'sqbh',
                    align:'center',
                    width:'10%'  ,
                    title:'申请编号'

                },
                {
                    field: 'sqr',
                    align: 'center',
                    title: '申请人',
                    width:'10%'

                }, {
                    field: 'xm',
                    align: 'center',
                    title: '姓名' ,
                    width:'10%'
                }, {
                    field: 'xb',
                    align: 'center',
                    title: '性别'       ,
                    width:'10%'
                }, {
                    field: 'gx',
                    align: 'center',
                    title: '与申请人关系'   ,
                    width:'10%'
                }, {
                    field: 'sfzhm',
                    align: 'center',
                    title: '身份证号码'   ,
                    width:'10%'
                }, {
                    field: 'ykzpsr',
                    align: 'center',
                    title: '可支配收入'   ,
                    width:'10%'
                } , {
                    field: 'jsr',
                    align: 'center',
                    title: startny+'月均收入'   ,
                    width:'10%'
                }  , {
                    field: 'ze',
                    align: 'center',
                    title: startny+ '个人所得税总额'   ,
                    width:'10%'
                }
            ],

            onLoadSuccess:function(){


            }
        });
    }
</script>

