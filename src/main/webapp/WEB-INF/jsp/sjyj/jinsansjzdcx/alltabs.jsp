<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>添加模型</title>
    <%@ include file="/common/global.jsp"%>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>                                
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-table-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/weather-icons.min.css" />

    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css" />

    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--Beyond Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>


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
        <div class="page-body"  id="d1">
            <div id="condition" class="row">
                <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                    <div class="widget">
                        <div class="widget-header bg-blue">
                            <span class="widget-caption">金三数据表数量查询</span>
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
                        <div class="widget-body">
                            <form id="formss" >
                                <table class="table">
                                    <tr >
                                        <td style="vertical-align:middle;width: 3cm;">英文名称:</td>
                                        <td ><input id="ywmc" type="text" class="form-control" placeholder="" style="width: 200px;"></td>
                                        <td style="vertical-align:middle;width: 3cm;">中文名称:</td>
                                        <td ><input id="zwmc" type="text" class="form-control" placeholder="" style="width: 200px;"></td>
                                    </tr>
                                    <tr align="center">
                                        <td colspan="6">
                                            <%--<button type="button" class="btn btn-info" onclick="gohistory();" style="width: 2cm;">返&nbsp;&nbsp;回</button> &nbsp;&nbsp;&nbsp;&nbsp;--%>
                                            <button type="button" class="btn btn-info" onclick="query();" style="width: 2cm;">查&nbsp;&nbsp;询</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <!--Widget Body-->
                    </div>
                    <!--Widget-->
                </div>
            </div>
            <div id ="querys" class="row">
                <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
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
                        <div   class="widget-body">
                            <div id="toolbar">
                                <a   href="#">
                                    <button id="expert_mota" type="button" style="width:80px;" class="btn btn-success btn-sm"  data-toggle="modal" >
                                        导出</button>&nbsp;
                                </a>

                            </div>
                            <table class="table table-striped table-bordered table-hover" id="mytab" data-height="600" ></table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
<div   class="widget-body" id="d2" style="display:none;" align="center">
    <table class="table table-striped table-bordered table-hover" id="mytab1" data-height="600" style="white-space: nowrap;"></table>
    <a   href="#">
        <button  type="button" id="backhis" class="btn"  onclick="gobakcss()"  > 返  回 </button>&nbsp;
    </a>
</div>



</body>
</html>
<script>

    $(function(){
        query();

        $("#expert_mota").click(function(){
            var ywbm=$("#ywmc").val();
            var zwbm=$("#zwmc").val();
//            alert(213);
            <%--$.post('${pageContext.request.contextPath}/sjyj/jinsansjzdcx/exportdata',{ywmc:$('#ywmc').val(),zwmc:$('#zwmc').val()},function(){--%>
                            <%--alert("导出成功！");--%>
            <%--});--%>
            window.location.href="${pageContext.request.contextPath}/sjyj/jinsansjzdcx/exportdata?ywmc="+ywbm+"&zwmc="+zwbm;
        });
    });

    function query(){
        console.log("ywmc:",$('#ywmc').val());
        console.log("zwmc:",$('#zwmc').val());
        $('#mytab').bootstrapTable("destroy");
        $('#mytab').bootstrapTable({
            url:'${pageContext.request.contextPath}/sjyj/jinsansjzdcx/tabLists',
            search: false, //是否启用搜素
            showRefresh: false, //刷新按钮
            showPaginationSwitch: false,
            pagination: true, //是否分页
            queryParams:queryParams=function(params){
                return{
                    'ywmc':$('#ywmc').val(),
                    'zwmc':$('#zwmc').val(),
                    limit:params.limit,
                    offset:(params.offset/params.limit)+1
                };
            },
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            //sidePagination: "client",//表示客户端请求
            toolbar: '#toolbar',
            paginationLoop: false,
            uniqueId: 'ywbm',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "ywbm", //每一行的唯一标识，一般为主键列
//            showToggle: "false", //切换视图
//            showColumns: 'false', //是否显示内容列下拉框
            sidePagination:'server',
            queryParamsType:'limit',
            columns: [

                {
                    field: 'ywbm',
                    halign:'center',
                    align: 'left',
                    title: '英文表名',
                    width:'25%',
                    formatter:function(value,row,index){
                          return '<a href="javascript:void(0);" onclick="ywdetail(\''+value+'\')"  style="cursor:pointer;">'+value+'</a>';
                    }

                }, {
                    field: 'zwbm',
                    align: 'center',
                    title: '中文表名' ,
                    width:'65%'
                },  {
                    field: 'sjl',
                    align: 'center',
                    title: '数据量',
                    width: '10%'
                }
            ],
            onLoadSuccess:function(){

            }
        });
    }

    //表明细
    function ywdetail(ywmc){
           $("#d1").hide();
           querydetails(ywmc);
           $("#d2").show();
    }

    function querydetails(ywmc){
        $('#mytab1').bootstrapTable("destroy");
        $('#mytab1').bootstrapTable({
            url:'${pageContext.request.contextPath}/sjyj/jinsansjzdcx/querydetail',
            search: false, //是否启用搜素
            showRefresh: false, //刷新按钮
            showPaginationSwitch: false,
            pagination: true, //是否分页
            queryParams:queryParams=function(params){
                return{
                    'ywmc':ywmc,
                    limit:params.limit,
                    offset:(params.offset/params.limit)+1
                };
            },
            singleSelect: true,
            pageNumber: 1, //初始化加载第一页，默认第一页
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            //sidePagination: "client",//表示客户端请求
            paginationLoop: false,
            uniqueId: 'ywbm',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "ywbm", //每一行的唯一标识，一般为主键列
//            showToggle: "false", //切换视图
//            showColumns: 'false', //是否显示内容列下拉框
            sidePagination:'server',
            queryParamsType:'limit',
            columns: [

                {
                    field: 'COLMNID',
                    align: 'center',
                    title: '字段英文名',
                    width:100

                }, {
                    field: 'COLUMNNAME',
                    align: 'center',
                    title: '字段中文名' ,
                    width:100
                }
            ],
            onLoadSuccess:function(){

            }
        });
    }

    //返回
    function gobakcss(){
        $("#d1").show();
        $("#d2").hide();
    }

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjyjpage.jsp";
    }
</script>
