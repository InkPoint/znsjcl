<%--
  Created by IntelliJ IDEA.
  User:  liduo
  Date: 2017/12/27
  Time: 10:44
  Modifier： PengWen Wang
  Modify the time: 2018/5/17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据批次管理</title>
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
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>

    <%--日期组件--%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/test/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/skin/jedate.css">

</head>
<body>

<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <!--小部件标题-->
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle; width:3cm;">批次名称:</td>
                            <td>
                                <input id="pcmc" type="text" class="form-control" style="vertical-align: middle;width: 150px"/>
                            </td>
                            <td style="vertical-align: middle;width: 4cm;">批次创建开始时间:</td>
                            <td>
                                <div class="col-sm-2" style="width: 200px;">
                                    <div class="jeinpbox"><input type="text" class="jeinput" id="cjsjbegin" placeholder="YYYY-MM-DD" readonly></div>
                                </div>
                            </td>
                            <td style="vertical-align: middle;width: 4cm">批次创建结束时间:</td>
                            <td>
                                <div class="col-sm-2" style="width: 200px;">
                                    <div class="jeinpbox"><input type="text" class="jeinput" id="cjsjend" placeholder="YYYY-MM-DD" readonly></div>
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="6">
                                <button type="button" class="btn btn-info" onclick="searchlist()">执行查询</button>
                                &nbsp;
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12" style="height: 40%">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">
                    <div id="toolbar">
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal" onclick="tj()" data-target="#addModal">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-warning btn-sm" data-toggle="modal"
                                data-target="#editModal" id="myEdit">
                            <i class="glyphicon glyphicon-pencil"></i>编辑
                        </button>
                        &nbsp;
                        <button type="button" class="btn btn-danger btn-sm" onclick="delet()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                    </div>
                    <table id="mytable" class="table table-striped table-bordered table-hover" data-height="590">
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- /Page Body -->
</div>
<%--新增_模态框(Modal)--%>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    增加
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form id="addData" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">批次代码:</label>
                            <div class="col-sm-5">
                                <input type="text"  name="validpcdm" class="form-control" id="addpcdm"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">批次名称:</label>

                            <div class="col-sm-5">
                                <input type="text" name="validpcmc" class="form-control" id="addpcmc"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注:</label>
                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="addbz"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary" data-dismiss="modal" onclick="addpc()">保存</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</div>
<%--end 新增_模态框--%>
<%--编辑_模态框(Modal)--%>
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title">
                    编辑
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content">
                    <form method="post" id="editData" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-5 control-label">批次代码:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" readonly id="editpcdm" name="validpcdm"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">批次名称:</label>

                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="editpcmc"/>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <label class="col-sm-5 control-label">备注:</label>

                            <div class="col-sm-5">
                                <textarea class="form-control" rows="4" id="editbz"></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary"  onclick="editpc()">
                    保存
                </button>
            </div>

        </div>
    </div>

</div>
<%--end 编辑_模态框--%>
</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
<%--Select2--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
<%--时间插件--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/v20/jeDate/src/jedate.js"></script>
</html>
<script>

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjzdpage.jsp";
    }

    var selectrow = new Array();
   $(function(){
       jeDate("#cjsjbegin",{
           format: "YYYY-MM-DD"
       });
       jeDate("#cjsjend",{
           format: "YYYY-MM-DD"
       });
       inittabs();
   });
    //执行查询按钮
    function searchlist(){
        //得到批次名称
        var pcmc= $.trim($("#pcmc").val());
        //创建的开始时间
        var cjsjbegin=$("#cjsjbegin").val();
        //创建的结束时间
        var cjsjend=$("#cjsjend").val();
        inittabs(pcmc,cjsjbegin,cjsjend);
    }
   function inittabs(pcmc,cjsjbegin,cjsjend) {
       //先销毁表格
       $("#mytable").bootstrapTable('destroy');
       $("#mytable").bootstrapTable({
           url:'${pageContext.request.contextPath}/sjzd/sjpcgl/list',
//           search: true, //是否启用搜素
//           showRefresh: true, //刷新按钮
//           showPaginationSwitch: true,
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
           uniqueId: 'cjsj',
           clickToSelect: true, //是否启用点击选中行
           uniqueIS: "cjsj", //每一行的唯一标识，一般为主键列
//           showToggle: "true", //切换视图
//           showColumns: 'true', //是否显示内容列下拉框
           sidePagination:'server',

           queryParams: function (params) {
               return {
                   'svo.pcmc': pcmc,
                   'svo.cjsjbegin': cjsjbegin,
                   'svo.cjsjend': cjsjend,
                   offset: (params.offset / params.limit) + 1,
                   limit: params.limit
               }
           },
           ueryParamsType: 'limit',
           columns:[{
               field: '',
               align:'center',
               checkbox:true,
               title:'选择'
           },

               {
               field:'pcmc',
               align:'center',
               title:'批次名称'
           },{
               field:'cjsj',
               align:'center',
               title:'创建时间'
           },{
               field:'bz',
               align:'center',
               title:'备注'
           }
           ]
       });
   }

   $(document).ready(function () {
       formValidator();
   });
   //Modal验证销毁重构
   $("#addModal").on('hidden.bs.modal', function () {
       $("#addData").data('bootstrapValidator').destroy();
       $("#addData").data('bootstrapValidator', null);
       formValidator();
   });
   //点击添加的方法
    function tj(){
        $('#addpcdm').val('');
        $('#addpcmc').val('');
        $('#addbz').val('');
    }
    //新增的方法
    function addpc(){
        //开启验证
        $("#addData").data('bootstrapValidator').validate();
        if (!$("#addData").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取批次代码的值
        var pcdm = $("#addpcdm").val();
        //获取批次名称的值
        var pcmc = $("#addpcmc").val();
       // console.log("pcmc",pcmc);
        //获取备注的值
        var bz = $("#addbz").val();
      //  console.log("bz",bz);
        //提交参数
        var sub = {
            'svo.pcdm': pcdm,
            'svo.pcmc': pcmc,
            'svo.bz': bz
        };
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjzd/sjpcgl/insertSjpc";
//        //成功方法
        var myfunctions = function () {
           // alert("nihao");
            inittabs();
        };
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );
        //提交后隐藏模态框
        $("#addModal").modal('hide');
    }
   //模态框表单验证
   function formValidator() {
       $('#addData').bootstrapValidator({
           //为每个字段指定通用提示语
           message: '这个值无效',
           feedbackIcons: {
               valid: 'glyphicon glyphicon-ok',
               invalid: 'glyphicon glyphicon-remove',
               validating: 'glyphicon glyphicon-refresh'
           },
           fields: {
               validpcdm: {
                   validators: {
                       //值不为空
                       notEmpty: {
                           message: '批次代码不能为空'
                       },
                       remote: {
                           url: "${pageContext.request.contextPath}/sjzd/sjpcgl/pcdmValidation",
                           message: '该批次代码已经被占用，请使用其他名称',
                           type: 'POST'
                       }
                   }
               },
               validpcmc: {
                   validators: {
                       notEmpty: {
                           message: '批次名称不能为空'
                       }
                   }
               }
           }
       });
   }
    //对于编辑按钮的事件
    $("#myEdit").click(function(){

        var selectdata = $("#mytable").bootstrapTable("getSelections");
        selectrow = selectdata;
        if (selectdata.length != 1) {
            alert("请选择一条要编辑的记录!");
            return false;
        } else {
            //批次代码
            $("#editpcdm").val(selectdata[0].pcdm);
            //批次名称
            $("#editpcmc").val(selectdata[0].pcmc);
            //备注
            $("#editbz").val(selectdata[0].bz);

        }
    });
    //修改的方法就是编辑
    function editpc(){
        //批次代码
         var pcdm= $("#editpcdm").val();
        //批次名称
        var pcmc= $("#editpcmc").val();
        //备注
        var bz= $("#editbz").val();
        $.ajax({
                url:'${pageContext.request.contextPath}/sjzd/sjpcgl/updateSjpc',
                type:'post',
                data: {
                        'svo.pcdm': pcdm,
                        'svo.pcmc': pcmc,
                        'svo.bz': bz
                     },
                success:function(json){
                    inittabs();
                }
        });
        $("#editModal").modal("hide");
    }
    //删除
    function delet(){
        //获取被选中的记录
        var rows = $('#mytable').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var ids = rows[0].pcdm;
       // console.log("ids", ids);
        var msg = "您真的确定要删除么？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            $.ajax({
                url: "${pageContext.request.contextPath}/sjzd/sjpcgl/deleteSjpc",
                type: "post",
                data: {
                    'svo.pcdm': ids
                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        };
    }

</script>


