<%--
  Created by IntelliJ IDEA.
  User: cuihegn
  Date: 2018/3/9
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>清洗模型管理</title>
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
<div class="page-body">
    <div id="condition" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>

                </div>
                <!--小部件标题-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 4cm;text-align: right;">清洗模型名称:</td>
                            <td ><input id="mxmcss" type="text" class="form-control" placeholder="输入清洗模型名称" style="width: 200px;"></td>
                            <td style="vertical-align:middle;width: 4cm;text-align: right;">清洗指标:</td>
                            <td ><input id="zbss" type="text" class="form-control" placeholder="输入清洗指标名称" style="width: 200px;"></td>
                        </tr>
                        <tr align="center">
                            <td colspan="4">
                                <button type="button" class="btn btn-info" onclick="querys();">执行查询</button> &nbsp;&nbsp;&nbsp;&nbsp;
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
    <div id ="querys" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>

                </div>
                <div class="widget-body">
                    <!---------------------------------------------------------------------------->
                    <div id="toolbar">
                        <a   href="#">
                            <button id="add_mota" type="button" class="btn btn-success btn-sm"  data-toggle="modal" data-target="#adds">
                                <i class="glyphicon glyphicon-plus"></i>添加</button>&nbsp;
                        </a>
                        <a href="#">
                            <button id="edit_mota" type="button" class="btn btn-warning btn-sm"  data-target="#adds">
                                <i class="glyphicon glyphicon-pencil"></i>修改</button>&nbsp;
                        </a>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除</button>
                    </div>
                    <!--------------------------------------------------------------------------------->
                    <table class="table table-striped table-bordered table-hover" id="mytabsss"></table>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
<script>
    var con_mxmc="${param.con_mxmc}";
    var con_zb="${param.con_zb}";
    var curinputvalue="";
    var clickindexs=-1;
    var data1=[{id:1,text:'最高'},{id:2,text:'高'},{id:3,text:'一般'},{id:4,text:'低'}];
    $(function(){
        //初始化查询条件
        if(con_mxmc!=null&&con_mxmc!=null&&typeof(con_mxmc)!="undefined"){
            $("#zbmcss").val(con_mxmc);
        }
        if(con_zb!=null&&con_zb!=null&&typeof(con_zb)!="undefined"){
            $("#gzss").val(con_zb);
        }
        //初始化表格
        query("","");

        //注册添加按钮单击事假
        $("#add_mota").click(function(){
            window.location.href="${pageContext.request.contextPath}/zzfwzx/qxmxgl/addmx?con_mxmc="+con_mxmc+"&con_gz="+con_zb;
        });

        //注册添加模态框修改单击事件
        $("#edit_mota").click(function(){
            //获取选中行的数据
//            alert("修改清洗模型");
            var seldata=$('#mytabsss').bootstrapTable("getSelections");
            var mxid=seldata[0].mxid;
            console.log("seldata[0]:",mxid);
            window.location.href="${pageContext.request.contextPath}/zzfwzx/qxmxgl/addmx?mxid="+mxid+"&con_mxmc="+con_mxmc+"&con_zb="+con_zb;
        });



    });


    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/zzfwzxpage.jsp";
    }
    //查询
    function query(mxmc,zb){
        curinputvalue=mxmc;
        $('#mytabsss').bootstrapTable({
            url:'${pageContext.request.contextPath}/zzfwzx/qxmxgl/list',
            pagination: true, //是否分页
            queryParams: function queryParams(params){
                return{
                    'svo.con_mxmc':mxmc,
                    'svo.con_zb':zb,
                    offset:(params.offset/params.limit)+1,
                    limit:params.limit
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
            paginationLoop: true,
            uniqueId: 'mxid',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "mxid", //每一行的唯一标识，一般为主键列
            sidePagination:'server',
            queryParamsType:'limit',
            onCheck:function(row,$element){
                clickindexs=$element.data("index");
            },
            columns: [
                {
                    field: '',
                    align:'center',
                    checkbox:true,
                    width:100,
                    title:'选择'

                },
                {
                    field: 'mxmc',
                    align: 'center',
                    title: '模型名称',
                    width:100

                }, {
                    field: 'mxms',
                    align: 'center',
                    title: '模型描述' ,
                    width:100
                },  {
                    field: 'ppzbstr',
                    align: 'center',
                    title: '清洗指标',
                    width:100
                } , {
                    field: 'bz',
                    align: 'center',
                    title: '备注'   ,
                    width:100
                },{
                    field: 'cjsj',
                    align: 'center',
                    title: '创建时间'   ,
                    width:100
                } , {
                    field: 'cjr',
                    align: 'center',
                    title: '创建人'   ,
                    width:100
                }
            ],
            onLoadSuccess:function(){

            }
        });
    }
    //执行查询
    function querys(){
        var mxmc= $.trim($("#mxmcss").val());
        var zb= $.trim($("#zbss").val());
        $('#mytabsss').bootstrapTable("destroy");
        query(mxmc,zb) ;
    }
    //删除数据
    function btn_delete(){
        var seldata=$('#mytabsss').bootstrapTable("getSelections");
        if(JSON.stringify(seldata)=="{}"||seldata==null||typeof(seldata)=="undefined"||seldata.length==0){
            alert("请选择一行！");
        }else{
            $.ajax({
                contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                url: "${pageContext.request.contextPath}/zzfwzx/qxmxgl/deletes",
                data: {'svo.mxid':seldata[0].mxid},
                type:'post',
                dataType:'json',
                success: function(msg){
                    //刷新查询列表;
                    $('#mytabsss').bootstrapTable('remove',{field:'mxid',values:[seldata[0].mxid]});

                }
            });
        }

    }
</script>
