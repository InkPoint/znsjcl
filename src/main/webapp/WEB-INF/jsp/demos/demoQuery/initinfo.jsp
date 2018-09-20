<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/25
  Time: 11:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>demo数据资源状况查询</title>
    <meta name="description" content="simple and responsive tables" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Scripts-->
    <script src="${ctx}/assets/js/jquery.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.js"></script>
    <script src="${ctx}/assets/js/bootstrap-editable.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
    <script src="${ctx}/static/js/jquery.ts.js"></script>
    <script src="${ctx}/assets/js/util.js"></script>

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${ctx}/assets/js/bootstrap-table.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/weather-icons.min.css" />

    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/demo.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/typicons.min.css" />
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/animate.min.css" />

    <script src="${ctx}/assets/js/skins.min.js"></script>
    <!--Beyond Scripts-->
    <script src="${ctx}/assets/js/beyond.min.js"></script>


</head>
<body>
<h1>数据资源状况查询...</h1>
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
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">纳税人名称:</td>
                            <td ><input id="nsrmc" type="text" class="form-control" placeholder="输入纳税人名称" style="width: 200px;"></td>
                            <td style="vertical-align:middle;width: 3cm;">管理代码:</td>
                            <td ><input id="gldm" type="text" class="form-control" placeholder="管理代码" style="width: 200px;"></td>
                            <td style="vertical-align:middle;width: 3cm;">法人:</td>
                            <td ><input id="fr" type="text" class="form-control" placeholder="法人" style="width: 200px;"></td>
                        </tr>
                        <tr align="center">
                            <td colspan="6">
                                <button type="button" class="btn btn-info" onclick="selectList()" style="width: 2cm;">执行查询</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-info" onclick="bnt_out()" style="width: 2cm;">导&nbsp;&nbsp;出</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-info" onclick="bnt_savedb()" style="width: 2cm;">导&nbsp;&nbsp;入</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                <button type="button" class="btn btn-info btn-block" onclick="gobacks()" style="width: 2cm;">返&nbsp;&nbsp;回</button>
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
                <div class="widget-header  bg-blue ">
                    <span class="widget-caption">查询结果(共有数据: <span id="zgs"></span> 类)</span>

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
                    <!---------------------------------------------------------------------------->
                    <div id="toolbar">
                        <a href="#">
                            <button type="button" class="btn btn-success btn-sm" onclick="btn_add()">
                                <i class="glyphicon glyphicon-plus"></i>
                                添加</button>&nbsp;
                        </a>
                        <a href="#">
                            <button type="button" class="btn btn-warning btn-sm" onclick="btn_edit()">
                                <i class="glyphicon glyphicon-pencil"></i>编辑</button>&nbsp;
                        </a>
                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除</button>
                        <a href="#">
                            <button type="button" class="btn btn-success btn-sm" onclick="btn_save()">
                                <i class="glyphicon glyphicon-save"></i>
                                保存</button>&nbsp;
                        </a>
                    </div>
                    <!--------------------------------------------------------------------------------->
                    <table class="table   table-bordered table-hover" id="mytab"></table>
                </div>
            </div>
        </div>
    </div>
    <div id="add" class="row" style="display: none;">
        <div class="col-sm-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">添加信息</span>
                    <div class="widget-buttons">
                        <a href="#" data-toggle="maximize">
                            <i class="fa fa-expand"></i>
                        </a>
                        <a href="#" data-toggle="collapse">
                            <i class="fa fa-minus"></i>
                        </a>
                        <a href="#" data-toggle="dispose" onclick="javascrip:history.go(-1)">
                            <i class="fa fa-times"></i>
                        </a>
                    </div>
                    <!--小部件按钮-->
                </div>
                <!--------------->
                <div class="ibox-content" style="height: 755px;">
                    <form id="editForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">纳税人名称</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_nsrmc" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">管理代码</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_gldm" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">创建时间</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_cjsj" />
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">法人</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="edit_fr" />
                            </div>
                        </div>

                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-1 col-sm-offset-5">
                                <button type="button" class="btn btn-info btn-block" onclick="addsaves()">保存</button>
                            </div>
                            <div class="col-sm-1 ">
                                <button type="button" class="btn btn-info btn-block" onclick="showmains()">返回</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!------------------------>
            </div>
        </div>

    </div>
</div>

</body>
</html>
<script>
    $(function(){
        <!--初始化-->
        initTable();
        selectNum();
    });



    <!-- 分页 初始化 查询table数据-->
    function initTable(nsrmc, gldm, fr){
             $('#mytab').bootstrapTable('destroy');
             $('#mytab').bootstrapTable({
                 url:'${pageContext.request.contextPath}/demos/demoQuery/list',
                 queryParams: {
                     'svo.nsrmc': nsrmc ,
                     'svo.gldm': gldm ,
                     'svo.fr': fr
                 },
                search: false, //是否启用搜素
                showRefresh: false, //刷新按钮
                showPaginationSwitch: true,
                pagination: true, //是否分页
                singleSelect: false,
                pageNumber: 1, //初始化加载第一页，默认第一页
                buttonsAlign: 'right', //按钮对齐方式
                pageSize: 10, //每页的记录行数
                pageList: [10, 20, 30, 50], //可供选择的每页行数
                onlyInfoPagination: false,
                //sidePagination: "client",//表示客户端请求
                toolbar: '#toolbar',
                paginationLoop: true,
                uniqueId: 'RN',
                clickToSelect: true, //是否启用点击选中行
                uniqueIS: "ppmxmc", //每一行的唯一标识，一般为主键列
                showToggle: "true", //切换视图
                showColumns: 'true', //是否显示内容列下拉框
                sidePagination:'server',

                columns: [
                    {
                        field: '',
                        field: '',
                        align: 'center',
                        checkbox:true,
                        width:'5%',
                        title:'选择'

                    },
                    {
                        field: 'taxpayername',
                        align: 'center',
                        title: '纳税人名称',
                        width:'20%'  ,
                        formatter:function(value,row,index){
                            return "<a href=\"#\" name=\"taxpayername\" data-type=\"text\" data-pk=\""+row.id+" data-title=\"纳税人名称\">"+value+"</a>";
                        }

                    }, {
                        field: 'taxregcode',
                        align: 'center',
                        title: '管理代码' ,
                        width:'20%'  ,
                        formatter:function(value,row,index){
                            return "<a href=\"#\" name=\"taxregcode\" data-type=\"text\" data-pk=\""+row.id+" data-title=\"管理代码\">"+value+"</a>";
                        }
                    }, {
                        field: 'acceptdate',
                        align: 'center',
                        title: '创建时间'       ,
                        width:'20%'  ,
                        formatter:function(value,row,index){
                            return "<a href=\"#\" name=\"checkattribute\" data-type=\"text\" data-pk=\""+row.id+" data-title=\"创建时间\">"+value+"</a>";
                        }
                    }, {
                        field: 'jurpname',
                        align: 'center',
                        title: '法人'   ,
                        width:'20%'  ,
                        formatter:function(value,row,index){
                            return "<a href=\"#\" name=\"jurpname\" data-type=\"text\" data-pk=\""+row.id+" data-title=\"法人\">"+value+"</a>";
                        }
                    }],

                onLoadSuccess:function(){
                       //添加行编辑模式
                     $("#mytab a").editable({
                     url:function(params){
                     var aname=$(this).attr("name");
                     curRow[aname]=params.value;
                     }
                     });

                }
            });
        }
    <!--模糊查询-->
    function selectList(){
        //获取 文本框的value
        var nsrmc = $("#nsrmc").val().trim();
        var gldm = $("#gldm").val().trim();
        var fr = $("#fr").val().trim();

        //传参数查询并更新table
        initTable(nsrmc, gldm, fr);
        selectNum();
    }
    <!--查询个数-->
    function selectNum(){
        //获取 文本框的value
        var nsrmc = $("#nsrmc").val().trim();
        var gldm = $("#gldm").val().trim();
        var fr = $("#fr").val().trim();
        $.ajax({
            type: 'post',
            dataType: 'json',
            data: {
                'svo.nsrmc': nsrmc,
                'svo.gldm': gldm,
                'svo.fr': fr
            },
            url: '${pageContext.request.contextPath}/demos/demoQuery/selectNum',
            success: function (num) {
                $("#zgs").html(num);
            }
        });

    }

</script>