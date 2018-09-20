<%--
  Created by IntelliJ IDEA.
  User: cuihemng
  Date: 2018/2/6
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>申请</title>
    <%--
      Created by IntelliJ IDEA.
      User: cuiheng
      Date: 2017/10/23
      Time: 16:57
      To change this template use File | Settings | File Templates.
      数据审批流程
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>申请</title>
        <meta name="description" content="simple and responsive tables"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

        <!--基本样式-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"
              rel="stylesheet"/>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/css/weather-icons.min.css"/>

        <!--风格样式-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/demo.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/typicons.min.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.min.css"/>
        <!--Basic Scripts-->
        <script src="${pageContext.request.contextPath}/assets/js/jquery-2.0.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>


        <%--新版时间插件--%>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/test/jeDate-test.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/skin/jedate.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/v20/jeDate/src/jedate.js"></script>

        <!--时间-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>


        <!--皮肤脚本：在head中，这个脚本用于加载皮肤和支持的脚本-->
        <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>

        <!--Beyond Scripts-->
        <script src="${pageContext.request.contextPath}/assets/js/beyond.min.js"></script>

        <!--table-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-table.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-table.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-editable.css"/>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/js/bootstrap-editable.js"></script>
        <script type="text/javascript"
                src="${pageContext.request.contextPath}/assets/js/bootstrap-table/bootstrap-table-zh-CN.js"></script>

        <!--王鹏文-->
        <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrapValidator/bootstrapValidator.min.js"></script>
        <!--小图标-->
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
        <link href="${pageContext.request.contextPath}/public/static/css/animate.min.css" rel="stylesheet">
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrapValidator/bootstrapValidator.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/qxzh.css"/>
        <%--文件上传 css--%>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput.css"/>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/fileinput-rtl.css"/>

        <!--边框样式-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
        <%--Select2--%>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
        <%--Select2插件--%>
        <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>

        <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
        <%--文件上传插件--%>
        <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/fileinput/fileinput.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/fileinput/zh.js"></script>


        <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
        <script src="${pageContext.request.contextPath}/static/bootstrap-datetimepicker/js/bootstrap-datetimepicker.zh-CN.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/datetime/bootstrap-datepicker.js"></script>
        <link rel="stylesheet" type="text/css"
              href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>
        <%--新版时间插件--%>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/test/jeDate-test.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/skin/jedate.css">
        <script type="text/javascript" src="${pageContext.request.contextPath}/v20/jeDate/src/jedate.js"></script>

    </head>

    <body>

    <!-- Page Body -->
    <div class="page-body">
        <div class="row" id="xx">
            <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
                <div class="widget">
                    <div class="widget-header bg-blue">
                        <span class="widget-caption">查询条件</span>
                    </div>
                    <div class="widget-body">
                        <table class="table">
                            <tr>
                                <td style="vertical-align:middle;width: 3cm;">申请标题:</td>
                                <td style="width: 5cm"><input id="sqbt" type="text" class="form-control" placeholder=""
                                                              style="width: 150px;">
                                </td>
                                <td style="vertical-align:middle;width: 3cm;">需求分类:</td>
                                <td>
                                    <select id="classification-of-demand" class="js-data-example-ajax"
                                            style="width: 150px;">
                                        <option></option>
                                    </select>
                                </td>

                                <td style="vertical-align: middle;width: 4cm;">申请时间起:</td>
                                <td>
                                    <div class="col-sm-2" style="width: 200px;">
                                        <%--<div id="cjsjbegin" style="width: 100%;"--%>
                                             <%--class="input-group date form_date col-md-5" data-date=""--%>
                                             <%--data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">--%>
                                            <%--<input class="form-control" style="width: 100%;" type="text" value=""/>--%>
                                                <%--<span class="input-group-addon">--%>
                                                    <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                                <%--</span>--%>
                                        <%--</div>--%>
                                            <div class="jeinpbox"><input type="text" class="jeinput" id="cjsjbegin" placeholder="YYYY-MM-DD"></div>
                                    </div>
                                </td>
                                <td style="vertical-align: middle;width: 4cm">申请时间止:</td>
                                <td>
                                    <div class="col-sm-2" style="width: 200px;">
                                        <%--<div id="cjsjend" style="width: 100%;"--%>
                                             <%--class="input-group date form_date col-md-5" data-date=""--%>
                                             <%--data-date-format="yyyy-mm-dd" data-link-format="yyyy-mm-dd">--%>
                                            <%--<input class="form-control" style="width: 100%;" type="text" value=""/>--%>
                                                <%--<span class="input-group-addon">--%>
                                                    <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                                <%--</span>--%>
                                        <%--</div>--%>
                                    </div>
                                        <div class="jeinpbox"><input type="text" class="jeinput" id="cjsjend" placeholder="YYYY-MM-DD"></div>
                                </td>


                            </tr>
                            <tr align="center">
                                <td colspan="12">
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
    </div>
    <div class="row" id="cxjg">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12" style="width: 98%;height: 42%; margin-left: 1%">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>
                </div>
                <div class="widget-body">

                    <div id="toolbar">
                        <button type="button" class="btn btn-success btn-sm" data-toggle="modal"
                                data-target="#myModal" onclick="sss()">
                            <i class="glyphicon glyphicon-plus"></i>
                            添加
                        </button>
                        &nbsp;
                        </a>

                        <button type="button" class="btn btn-danger btn-sm" onclick="btn_delete()">
                            <i class="glyphicon glyphicon-remove"></i>
                            删除
                        </button>
                        <div style="height: 10px"></div>
                    </div>
                    <!--表数据-->
                    <div id="sqmodel">
                        <table class="table table-striped table-bordered table-hover" id="taskList_table"
                               data-height="580" style="white-space: nowrap"></table>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <!--------------------------------------------------申请模态框------------------------------------------->
    <div class="modal fade" id="myModal" role="dialog" aria-label="myModalLabel" style="   height: 820px">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title">
                        申请
                    </h4>
                </div>

                <div class="widget-body" style="width: 100%;height: 65%;">
                    <form id="editForm" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">申请标题:</label>

                            <div class="col-sm-4">
                                <input id="setdatalcid" type="hidden" style="width:200px;" class="form-control">
                                <input id="setrwid" type="hidden" style="width:200px;" class="form-control">
                                <input id="rwmc1" name="rwmc1" type="text" style="width:200px;" class="form-control">
                            </div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">申请内容:</label>

                            <div class="col-sm-4">
                                <input id="rwsm1" name="rwsm1" type="text" class="form-control" style="width:200px;">
                            </div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">申请分类:</label>

                            <div class="col-sm-5">
                                <select id="lcmc1" name="lcmc1" class="js-data-example-ajax"

                                        style="width:200px; ">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">是否审核:</label>

                            <div class="col-sm-5">
                                <select id="sfsh" name="sfsh"
                                        style="width:200px; ">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>


                        <div class="form-group">
                            <label class="col-sm-4 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>

                            <div class="col-sm-4">
                                <textarea id="bz1" class="form-control" rows="4" style="width:200px;"></textarea>
                            </div>
                        </div>

                        <%--<div class="hr-line-dashed"></div>--%>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">处理截止日期:</label>

                            <div class="col-sm-5">
                                <%--<div class="input-group date form_date" data-date="" data-date-format="yyyy-mm-dd "--%>
                                     <%--data-link-format="yyyy-mm-dd ">--%>
                                    <%--<input id="jzrq1" name="jzrq1" style="width: 100%;" value="" placeholder=""/>--%>
                                        <%--<span class="input-group-addon">--%>
                                            <%--<span class="glyphicon glyphicon-calendar"></span>--%>
                                        <%--</span>--%>
                                <%--</div>--%>
                                    <div class="jeinpbox"><input type="text" class="jeinput" id="jzrq1" name="jzrq1" placeholder="YYYY-MM-DD"></div>

                            </div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">是否上传文件:</label>

                            <div class="col-sm-5">
                                <select id="sfscwj" name="sfscwj" onchange="scwjxs()" style="width:200px; ">
                                    <option></option>
                                </select>
                            </div>
                        </div>
                        <%--<div class="hr-line-dashed"></div>--%>

                        <div class="form-group">
                            <div id="wjsc" style="display: none" class="form-group">
                                <label class="col-sm-4 control-label">文件上传:</label>

                                <div class="col-sm-2" style="width: 380px;">
                                    <input type="file" class="file-loading" name="fileinput" id="fileinput"/>
                                </div>
                                <%--<div class="hr-line-dashed"></div>--%>
                            </div>
                        </div>


                        <div class="hr-line-dashed"></div>

                        <div style="text-align: center">
                            <button type="submit" class="btn btn-primary" onclick="bc1()" data-dismiss="modal">保存
                            </button>
                        </div>
                    </form>
                </div>

            </div>

        </div>

    </div>
    <!-----------------------------------------------------申请 模态框（结束）-------------------------------------------------->


    </body>
    </html>
    <script type="text/javascript">

        function gohistory(){
            window.location.href="${pageContext.request.contextPath}/sqsppage.jsp";
        }

        //是否审核
        var shdata = [{id: '0', text: '是'}, {id: '1', text: '否'}];

        //是否上传文件

        var curclickdata = {};
        var curflage = 1;
        var ljbz;
        var i;
        var wjmc = "";

        $(function () {
            //时间
//            $('.form_date').datetimepicker({
//                language: 'zh-CN',
//                weekStart: 1,
//                todayBtn: 1,
//                autoclose: 1,
//                todayHighlight: 1,
//                startView: 2,
//                minView: 2,
//                forceParse: 0
//            });
            //初始化

            //时间初始化
            //初始化
            jeDate("#cjsjbegin",{
                format: "YYYY-MM-DD"
            });
            jeDate("#cjsjend",{
                format: "YYYY-MM-DD"
            });
            jeDate("#jzrq1",{
                format: "YYYY-MM-DD"
            });


            inittabs();

            $("#sfsh,#sfscwj").select2({
                data: shdata,
                width: 200,
                placeholder: '请选择',
                allowClear: true

            });
        });


        //判断是否显示文件上传标志
        function xs() {
            var lcid = $("#lcmc1").select2("val");
            $.ajax({
                url: '${pageContext.request.contextPath}/sjsplc/sjdrsq/pdscbz',
                type: 'post',
                data: {"lcid": lcid},
                success: function (data) {
                    if (data[0].SCBZ == '1') {
                        $('#wjsc').show();
                    }
                }
            });
        }

        //判断是否显示文件上传
        function scwjxs() {
            var sfscwj = $("#sfscwj").select2("val");
            if (sfscwj == 0) {
                $('#wjsc').show();
            } else {
                $('#wjsc').hide();
            }

        }


        //下拉框
        $(".input-date").select2();
        <!--日期-->
        $('.date-picker').datepicker();

        function sss() {
            //获取选中option的标签选项
            var ccc = $("#sqlxid1").select2('val');
        }

        //(需求分类)下拉菜单
        var datas = [];
        $(function () {
            //初始化数据分区下拉菜单
            $.ajax({
                url: "${pageContext.request.contextPath}/sjsplc/sjdrsq/selecTittle",
                dataType: 'json',
                success: function (datas) {
                    $(".js-data-example-ajax").select2({
                        data: datas,
                        placeholder: '请选择',
                        allowClear: true
                    });
                }
            });


        });

        //初始化表格
        function inittabs(rwmc, lcmc, sqnr, cjsjbegin, cjsjend) {
            //先销毁表格
            $('#taskList_table').bootstrapTable('destroy');
            $('#taskList_table').bootstrapTable({
                url: "${pageContext.request.contextPath}/sjsplc/sjdrsq/list",
                queryParams: function (params) {
                    return {
                        'svo.rwmc': rwmc,
                        'svo.lcmc': lcmc,
                        'svo.rwsm': sqnr,
                        'svo.cjsjbegin': cjsjbegin,
                        'svo.cjsjend': cjsjend,
                        pageSize: params.limit,
                        pageNumber: params.pageNumber,
                        offset: (params.offset / params.limit) + 1,
                        limit: params.limit
                    }
                },
                pagination: true, //是否分页
                singleSelect: true,
                pageNumber: 1, //初始化加载第一页，默认第一页
                buttonsAlign: 'right', //按钮对齐方式
                pageSize: 10, //每页的记录行数
                pageList: [10, 20, 30, 50], //可供选择的每页行数
                onlyInfoPagination: false,
                toolbar: '#toolbar',
                paginationLoop: true,
                clickToSelect: true, //是否启用点击选中行
                uniqueIS: "rwid", //每一行的唯一标识，一般为主键列
                sidePagination: 'server',
                undefinedText: '-',
                columns: [{
                    field: 'select',
                    checkbox: true,
                    align: 'center'
                }, {
                    field: 'rwmc',
                    align: 'center',
                    title: '申请标题'

                }, {
                    field: 'hjmc',
                    align: 'center',
                    title: '申请分类 '
                }, {
                    field: 'rwsm',
                    align: 'center',
                    title: '申请内容  '
                }, {
                    field: 'cjsj',
                    align: 'center',
                    title: '申请时间 '
                }, {
                    field: 'jzrq',
                    align: 'center',
                    title: '处理截止日期  '
                }, {
                    field: 'savepath',
                    align: 'center',
                    title: '文件名称'

                }, {
                    field: 'bz',
                    align: 'center',
                    title: '备注  '
                }, {
                    field: 'shzt',
                    align: 'center',
                    title: '审核状态 ',
                    formatter: function (value, row, index) {
                        if (value == 0) {
                            return '未审核'
                        } else if (value == 1) {
                            return '审核通过'
                        } else {
                            return '审核不通过'
                        }

                    }
                }, {
                    field: 'wcjd',
                    align: 'center',
                    title: '完成进度  ',
                    formatter: function (value, row, index) {
                        var res = parseInt(row.wcjd);
                        if (value == undefined) {
                            value = 0;
                        } else {
                            return ["<div class='progress progress-striped active'><div class='progress-bar progress-bar-info' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100'style='width:" + res.toFixed(2) + "% '>" + res.toFixed(0) + "%" + "</div></div>"];
                        }

                    }
                }
                ]
            });
        }


        //查找(将搜索栏条件全部发送到后台)
        function searchlist() {
            //获取申请标题
            var rwmc = $("#sqbt").val();
            //获取数据类型ID
            var lcmc = $("#classification-of-demand").val();
            //申请内容
            var sqnr = $("#apple-for-content").val();
            //创建的开始时间
            var cjsjbegin = $("#cjsjbegin").val();
            //创建的结束时间
            var cjsjend = $("#cjsjend").val();
            inittabs(rwmc, lcmc, sqnr, cjsjbegin, cjsjend);
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

        //导入申请添加
        function bc1() {
            //开启验证
            $("#editForm").data('bootstrapValidator').validate();
            if (!$("#editForm").data('bootstrapValidator').isValid()) {
                return;
            }
            var lcid = $("#setdatalcid").val();
            var rwid = $("#setrwid").val();
            var rwmc1 = $("#rwmc1").val();
            var rwsm1 = $("#rwsm1").val();
            var lcmc1 = $("#lcmc1").val();
            var bz1 = $("#bz1").val();
            var jzrq = $("#jzrq1").val().trim();
            var sfsh = $("#sfsh").val();


            $.ajax({
                url: '${pageContext.request.contextPath}/sjsplc/sjdrsq/insertlable',
                type: 'post',
                data: {
                    'svo.rwid': rwid,
                    'svo.rwmc': rwmc1,
                    'svo.rwsm': rwsm1,
                    'svo.lcid': lcmc1,
                    'svo.bz': bz1,
                    'svo.lcmc': lcmc1,
                    'svo.lcid': lcid,
                    'svo.wjmc': wjmc,
                    'svo.jzrq': jzrq,
                    'svo.sfsh': sfsh
                },
                success: function (data) {
                    $('#myModal').modal('hide');
                    $("#taskList_table").bootstrapTable('refresh');
                }
            });
        }

        //编辑导入申请
        var cursqid = "";
        var lcid = "";
        $(function () {
            $("#myEdit").click(function () {
                var allselecteddata = $("#taskList_table").bootstrapTable("getSelections");
                if (allselecteddata.length != 1) {
                    alert("请选择一条要编辑的记录!");
                    return false;
                }
                cursqid = allselecteddata[0].rwid;
                lcid = allselecteddata[0].lcid;
                btn_edit();
                //表格刷新
                inittabs();
            });
        });
        function ddd() {
            $.ajax({
                url: '${pageContext.request.contextPath}/sjsplc/sjdrsq/insertlable',
                type: 'post',
                data: {
                    'svo.rwid': rwid,
                    'svo.lcid': lcid
                }
            });
        }
        //编辑方法
        function btn_edit() {
            var alldate = $("#taskList_table").bootstrapTable("getSelections");
            cursqid = alldate[0].sqid;
            $("#setdatalcid").val(alldate[0].lcid);
            $("#setrwid").val(alldate[0].rwid);
            $("#rwmc1").val(alldate[0].rwmc);
            $("#rwsm1").val(alldate[0].rwsm);
            $("#lcmc1").val(alldate[0].lcid).select2();
            $("#bz1").val(alldate[0].bz);
        }

        //删除导入申请
        function btn_delete() {
            var alldate = $("#taskList_table").bootstrapTable("getSelections");
            var rwid = alldate[0].rwid;
            $.ajax({
                url: '${pageContext.request.contextPath}/sjsplc/sjdrsq/deleteInformation',
                type: 'post',
                data: {
                    'svo.rwid': rwid
                },
                success: function (json) {
                    //表格刷新
                    inittabs();
                }
            });
        }


        //文件上传
        $(function () {
            $("#fileinput").fileinput({
                showUpload: true,    //是否显示上传按钮
                showPreview: false,   //是否显示预览
                uploadAsync: true,   //默认异步上传
                language: "zh",      //语言
                showCaption: true,//是否显示标题
                dropZoneEnabled: false,//是否显示拖拽区域
                maxFileSize: 0,//单位kb  最大文件大小   0 为不限制文件大小
                maxFileCount: 1,//最大文件数量
                enctype: 'multipart/form-data',//模拟form数据类型
                uploadUrl: '${pageContext.request.contextPath}/sjsplc/sjdrsq/uploadfileinput'   //上传请求地址
            });
            //异步上传结果处理
            $("#fileinput").on('fileerror', function (event, data, msg) {

            });
            //异步上传返回结果处理（上传成功）
            $("#fileinput").on('filepreupload', function (event, data, previewId, index) {
                wjmc = data.files[0].name;
            });
            //选择文件后处理事件
            $("#fileinput").on('filebatchselected', function (event, files) {
                filename = files[0].name;
            });
        });

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
                    rwmc1: {
                        message: '任务名称无效',
                        threshold: 1,//只有一个字符以上才触发ajax请求
                        //验证器
                        validators: {
                            //值不为空
                            notEmpty: {
                                message: '任务名称不能为空'
                            },
                            remote: {
                                url: "${pageContext.request.contextPath}/sjsplc/sjdrsq/nameValidation",
                                message: '任务名称已被占用，请使用其他名称',
//                            delay: 1000,//延迟
                                type: 'POST'
                            }
                        }
                    },
                    rwsm1: {
                        validators: {
                            notEmpty: {
                                message: '任务说明不能为空'
                            }
                        }
                    },
                    lcmc1: {
                        validators: {
                            notEmpty: {
                                message: '申请分类不能为空'
                            }
                        }
                    }, sfsh: {
                        validators: {
                            notEmpty: {
                                message: '是否审核不能为空'
                            }
                        }
                    }
                }
            });
        }
    </script>

