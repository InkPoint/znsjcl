<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2017/11/15
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导入任务定制</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--基本样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/weather-icons.min.css"/>

    <!--风格样式-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css"/>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>


    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <%--Select2插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>

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
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <%--表单验证插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</head>
<body>
<!-- Page Body -->
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <!--Widget Header-->
                <div class="widget-body">
                    <table class="table">

                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">任务名称:</td>
                            <td style="width: 6cm;"><input id="rwmcs" type="text" style="width: 150px;"
                                                             class="form-control"></td>

                            <td align="left" style="vertical-align:middle;width: 3cm; ">目标源表:</td>
                            <td>
                                <div class="control-label">
                                    <select id="mbbs" class="js-data-example-ajax" style="width: 150px;">
                                        <option></option>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12" align="center">

                                <button type="button" onclick=" searchlist()" class="btn btn-info" style="width: 2cm;">
                                    执行查询
                                </button>
                                <button onclick="gohistory()" type="button" class="btn btn-info" style="width: 2cm">返回</button>

                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="height: 45%">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">

                    <div id="toolbar">
                        <button type="button" class="btn btn-info btn-sm" onclick="rwdz()">
                            <i class="glyphicon glyphicon-floppy-disk "></i>
                            任务定制
                        </button>
                        <button type="button" class="btn btn-danger btn-sm" onclick="sc()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                        <div style="height: 10px"></div>
                    </div>
                    <!--表数据-->
                    <table class="table table-striped table-bordered table-hover" id="taskList_table" data-height="560" style="white-space: nowrap"></table>
                </div>

            </div>
        </div>
    </div>
</div>

<!---------------------(任务定制模态框)Model  添加--------------------------->
<div class="modal fade" id="myModal" role="dialog" aria-label="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" >
                    添加
                </h4>
            </div>
            <div class="modal-body">
                <form id="editForm" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">任务名称:</label>

                        <div class="col-sm-5">
                            <input id="rwmc" name="yzmc" type="text" class="form-control">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">数据源表:</label>
                        <div class="col-sm-5">
                            <select id="yb" name="yzyb" class="js-data-example-ajax" onchange="sjxchangeDate()" style="width:100%; ">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">数据项:</label>
                        <div class="col-sm-5">
                            <select id="sjx" name="sjx" class="js-data-example-ajax"  style="width:100%; ">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">目标表:</label>
                        <div class="col-sm-5">
                            <select id="mbb" name="yzmbb" class="js-data1-example-ajax" style="width:100%;">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">执行周期:</label>
                        <div class="col-sm-5">
                            <select id="zqid" name="yzzq" class="js-data2-example-ajax" style="width: 100%;">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">备注:</label>
                        <div class="col-sm-4">
                                            <textarea id="bz" class="form-control" rows="4"
                                                      style="width:200px;"></textarea>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div style="text-align: center">
                        <button type="submit" class="btn btn-primary" onclick="bc1()">保存</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!------------------------------添加模态框结束--------------------------------------------->

<!-----------------------(任务定制模态框)Model  编辑-------------------------------------------------------->
<div class="modal fade" id="myModal1"  role="dialog" aria-label="myModalLabel" style="height: 80%">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    编辑
                </h4>
            </div>

            <div class="widget-body" style="width: 100%;height: 80%;">
                <form id="editForm1" method="post" class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-4 control-label">任务名称:</label>

                        <div class="col-sm-4">
                            <input id="rwmc1" readonly type="text" style="width:200px;" class="form-control">
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">数据源表:</label>

                        <div class="col-sm-5">
                            <select id="yb1" class="js-data-example-ajax" style="width:200px; ">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">目标源表:</label>

                        <div class="col-sm-5">
                            <select id="mbb1" class="js-data1-example-ajax" style="width:200px; ">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>

                    <div class="form-group">
                        <label class="col-sm-4 control-label">执行周期:</label>

                        <div class="col-sm-5">
                            <select id="zqid1" class="js-data2-example-ajax" style="width: 200px;">
                                <option></option>
                            </select>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>

                        <div class="col-sm-4">
                                            <textarea id="bz1" class="form-control" rows="4"
                                                      style="width:200px;"></textarea>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div style="text-align: center">
                        <button type="submit" class="btn btn-primary" onclick="bc2()" data-dismiss="modal">保存</button>
                    </div>
                </form>

            </div>

        </div>
    </div>

</div>
<!----------------------------------编辑模态框结束--------------------------------------------------------->
</body>

</html>
<script>

    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjjhpage.jsp";
    }

    //保存当前行数据
    var dqhsj = new Array();

    //(数据源表)下拉菜单
    $(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjh/drrwdz/selectYb",
            dataType: 'json',
            success: function (datas) {
                $("#mbb0,#mbb,#mbb1,#yb,#yb1,#mbbs").select2({
                    data: datas,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        //(执行周期)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjh/drrwdz/selectZxzq",
            dataType: 'json',
            success: function (datas1) {
                $("#zqid1,#zqid").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
        inittabs();
        //修改模态框
        $("#myEdit").click(function () {
            var allselecteddata = $("#taskList_table").bootstrapTable("getSelections");
            dqhsj = allselecteddata;
            if (allselecteddata.length != 1) {
                alert("请选择一条要编辑的记录!");
            } else {
                $('#myModal1').modal('show');
                //任务名称
                $("#rwmc1").val(allselecteddata[0].rwmc);
                //源表
                $("#yb1").val(allselecteddata[0].yb).select2();
                //目标表
                $("#mbb1").val(allselecteddata[0].mbb).select2();
                //周期
                $("#zqid1").val(allselecteddata[0].zqid).select2();
                //备注
                $("#bz1").val(allselecteddata[0].bz);
            }

        });
    });



    //时间
    $('.form_date').datetimepicker({
        language: 'fr',
        weekStart: 1,
        todayBtn: 1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0
    });

    function sjxchangeDate(){
        //下拉框获取text
        var sjx = $("#yb option:selected").html();
        $.ajax({
            url: '${pageContext.request.contextPath}/sjjh/drrwdz/selectSjx',
            type: 'post',
            dataType: 'json',
            data: {
                'svo.sjx': sjx
            },
            success:function(data){
                console.log(data);
                $("#sjx").select2({
                    data: data,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });
    }



    //初始化表格
    function inittabs(rwmc, mbyb) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/drrwdz/list",
            pagination: true, //是否分页
            singleSelect: true,
            ueryParamsType: 'limit',
            queryParams: function (params) {
                return {
                    'svo.rwmc': rwmc,
                    'svo.mbb': mbyb,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            //sidePagination: "client",//表示客户端请求
            toolbar: '#toolbar',
            paginationLoop: true,
            uniqueId: 'sqid',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "sqid", //每一行的唯一标识，一般为主键列
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center'
            }, {
                field: 'rwmc',
                align: 'center',
                title: '任务名称    '
            }, {
                field: 'ybzwm',
                align: 'center',
                title: '数据源表    '
            }, {
                field: 'mbbzwm',
                align: 'center',
                title: '目标源表   '
            }, {
                field: 'zqmc',
                align: 'center',
                title: '执行周期   '
            },
                {
                field: 'zxsj',
                align: 'center',
                title: '创建时间  '
            },
                {
                field: 'bz',
                align: 'center',
                title: '备注  '
            }, {
                field: 'ztmc',
                align: 'center',
                title: '运行状态  '
            },{
                field: 'name',
                align: 'center',
                title: '执行人  '
                }
            ]
        });
    }

    //查找(将搜索栏条件全部发送到后台)
    function searchlist() {
        //获取任务名称
        var rwmc = $("#rwmcs").val();
        //获取目标源表
        var mbb = $("#mbbs").val();
        //获取申请时间
        inittabs(rwmc, mbb);
    }

    $(document).ready(function () {
        formValidator();
    });

    //Modal验证销毁重构
    $("#myModal").on('hidden.bs.modal', function () {
        $("#editForm").data('bootstrapValidator').destroy();
        $("#editForm").data('bootstrapValidator', null);
        formValidator();
    });

    //导入任务定制
    function rwdz() {
        $('#myModal').modal('show');
    }

    //添加任务
    function bc1() {

        //开启验证
        $("#editForm").data('bootstrapValidator').validate();
        if (!$("#editForm").data('bootstrapValidator').isValid()) {
            return;
        }
        //获取任务名称
        var rwmc = $("#rwmc").val();
        //获取执行时间
//        var zxsj = $("#zxsj").data("datetimepicker").getDate();
        //获取数据源表
        var yb = $("#yb").val();
        //获取目标表
        var mbb = $("#mbb").val();
        //获取执行周期
        var zqid = $("#zqid").val();
        //获取备注
        var bz = $("#bz").val();
        //获取数据项
        var sjx = $("#sjx").val();

        //提交参数
        var sub = {
            'svo.rwmc': rwmc,
            'svo.yb': yb,
            'svo.mbb': mbb,
            'svo.zqid': zqid,
            'svo.bz': bz,
            'svo.sjx':sjx
        };
        console.log("sub:", sub);
        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjh/drrwdz/newaddition";
        //成功方法
        var myfunctions = function () {

       //刷新当前页面
            window.location.reload();
        };
        if(yb!=mbb){
            $.myajax.common("post",
                    sub,
                    myurl,
                    myfunctions
            );
        }else{
            alert("目标表与源表不能为同一张表");
        }

    }

    //编辑事件
    function bc2() {
        //获取任务id
        var rwid = $("#rwid").val();
        //获取任务名称
        var rwmc = $("#rwmc1").val();
        //获取数据源表
        var yb = $("#yb1").val();
        //获取目标表
        var mbb = $("#mbb1").val();
        //获取执行周期
        var zqid = $("#zqid1").val();
        //获取备注
        var bz = $("#bz1").val();

        $.ajax({
            url: '${pageContext.request.contextPath}/sjjh/drrwdz/updateDrrw',
            type: 'post',
            data: {
                'svo.rwid': dqhsj[0].rwid,
                'svo.rwmc': rwmc,
                'svo.yb': yb,
                'svo.mbb': mbb,
                'svo.zqid': zqid,
                'svo.bz': bz
            },

            success: function (json) {
                inittabs();

            }
        });

    }

    //删除事件
    function sc() {
        //获取被选中的记录
        var rows = $('#taskList_table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var rwids = rows[0].rwid;
        var jobids = rows[0].jobid;

        var msg = "您真的确定要删除么？";
        //confirm显示一个带有指定消息的对话框
        if (confirm(msg) == true) {
            $.ajax({
                url: "${pageContext.request.contextPath}/sjjh/drrwdz/deleteDrrw",
                type: "post",
                data: {
                    'svo.rwid': rwids,
                    'svo.jobid': jobids
                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        };
    }


</script>

<script type="text/javascript">
    //模态框表单验证
    function formValidator() {
        $('#editForm').bootstrapValidator({
            //为每个字段指定通用提示语
            message: '这个值无效',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                yzmc: {
                    message: '任务名称无效',
                    threshold: 1,//只有一个字符以上才触发ajax请求
                    //验证器
                    validators: {
                        //值不为空
                        notEmpty: {
                            message: '任务名称不能为空'
                        },
                        remote: {
                            url: "${pageContext.request.contextPath}/sjjh/drrwdz/nameValidation",
                            message: '任务名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                            type: 'POST'
                        }
                    }
                },
                yzyb: {
                    validators: {
                        notEmpty: {
                            message: '数据源表不能为空'
                        }
                    }
                },
                yzmbb: {
                    validators: {
                        notEmpty: {
                            message: '目标表表不能为空'
                        }
                    }
                },
                yzzq: {
                    validators: {
                        notEmpty: {
                            message: '执行周期不能为空'
                        }
                    }
                }
            }
        });
    }
</script>