<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/1/9
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>审核</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">

    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <!--时间-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css"/>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/assets/css/bootstrap.css"/>


    <%--新版时间插件--%>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/test/jeDate-test.css">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/v20/jeDate/skin/jedate.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/v20/jeDate/src/jedate.js"></script>
</head>
<body>
<div class="page-body">
    <div class="row">
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
                                        <div class="jeinpbox"><input type="text" class="jeinput" id="cjsjend" placeholder="YYYY-MM-DD"></div>
                                </div>
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
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
        <div class="col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">查询结果</span>

                </div>
                <div class="widget-body">

                    <table id="taskList" class="table table-striped table-bordered table-hover "
                           data-height="580" style="white-space: nowrap"></table>
                    <!---------------------------------------------------（审核模态框）Model---------------------------------------------------->
                    <div class="modal fade" id="shModal" tabindex="-1" role="dialog" aria-label="myModalLabel"
                         style="height: 600px">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">
                                        审核
                                    </h4>
                                </div>

                                <div class="widget-body" style="width: 100%;">
                                    <form id="editForm1" method="post" class="form-horizontal">
                                        <%--获取任务ID--%>
                                        <input id="rwid" type="hidden">

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">申请标题:</label>

                                            <div class="col-sm-4">
                                                <input id="rwmc2" readonly type="text" style="width:200px;"
                                                       class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">申请分类:</label>

                                            <div class="col-sm-4">
                                                <input id="lcmc2" onclick="ck()" readonly type="text"
                                                       class="form-control"
                                                       style="width:200px;">
                                            </div>
                                        </div>

                                        <div class="form-group" style="display: none" id="ckwj">
                                            <label class="col-sm-4 control-label">文件名:</label>

                                            <div class="col-sm-4">
                                                <input id="fileupload" readonly type="text" class="form-control"
                                                       style="width:200px;">
                                            </div>

                                            <div class="col-sm-2">
                                                <button type="button" class="btn btn-success btn-sm" id="filedowload">
                                                    <i class="glyphicon glyphicon-download-alt "></i>
                                                    下载
                                                </button>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">申请人:</label>

                                            <div class="col-sm-4">
                                                <input id="cjr2" readonly type="text" class="form-control"
                                                       style="width:200px;">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</label>

                                            <div class="col-sm-4">
                                                <textarea id="bz2" readonly class="form-control" rows="4"
                                                          style="width:200px;"></textarea>
                                            </div>
                                        </div>


                                        <div class="form-group">
                                            <label class="col-sm-4 control-label">审核:</label>

                                            <div class="col-sm-4">
                                                <select id="sh">
                                                    <option></option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>


                                    </form>
                                    <div style="text-align: center">
                                        <button type="button" class="btn btn-primary" onclick="confirm()"
                                                data-dismiss="modal">保存
                                        </button>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
                <!--------------------------------------------------审核(结束)------------------------------------------------------------->


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
<%--Select2--%>
<script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
<%--时间--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script>
<%--页面提交数据--%>
<script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>

<%--表单验证插件--%>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
</html>
<script type="text/javascript">
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sqsppage.jsp";
    }

    //审核下拉框
    var shdata = [{id: '0', text: '审核通过'}, {id: '1', text: '审核不通过'}];

    //初始化
    $(function () {
        //初始时间
//        $('.form_date').datetimepicker({
//            language: 'zh-CN',
//            weekStart: 1,
//            todayBtn: 1,
//            autoclose: 1,
//            todayHighlight: 1,
//            startView: 2,
//            minView: 2,
//            forceParse: 0
//        });
        //初始化
        jeDate("#cjsjbegin",{
            format: "YYYY-MM-DD"
        });
        jeDate("#cjsjend",{
            format: "YYYY-MM-DD"
        });

        //初始化表格
        mytable();
        $("#sh").select2({
            data: shdata,
            width: 200,
            placeholder: '请选择',
            allowClear: true

        });

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

        //下载文件
        $("#filedowload").click(function () {
            var wjmc = $("#fileupload").val();
            URLDecoder.decode
            window.location.href = "${pageContext.request.contextPath}/sjsplc/sjdrsq/dowload?wjmc=" + wjmc;
        });

    });


    //初始化表格
    function mytable(rwmc, lcmc, sqnr, cjsjbegin, cjsjend) {
        //先销毁表格
        $('#taskList').bootstrapTable('destroy');
        $('#taskList').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjsplc/sjdrsq/listsh",
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
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
            toolbar: '#tool',
            paginationLoop: true,
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
                title: '申请标题',
                formatter: function (value, row, index) {
                    return '<a style="color:#057afd;" href="#"  onclick="derivation(\'' + row.rwmc + '\',\'' + row.bz + '\',\'' + row.lcmc + '\',\'' + row.lcmc + '\',\'' + row.username + '\',\'' + row.rwid + '\',\'' + row.wjmc + '\',\'' + row.xyhjid + '\')">' + value + '</a>';

                }
            }, {
                field: 'lcmc',
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
                field: 'wjmc',
                align: 'center',
                title: '文件名称',
                formatter: function (value, row, index) {
                    if (row.wjmc == undefined) {
                        return '-';
                    } else {
                        return '<span style="color:#057afd;cursor:hand;"  onclick="filedowload1(\'' + row.wjmc + '\')">' + value + '</apan>';
//                        alert("/sjsplc/sjdrsq/dowload?wjmc="+row.wjmc+"");
//                        return '<a  style="color:#057afd;" href="/sjsplc/sjdrsq/dowload?wjmc="+row.wjmc+"">'+value+ '</a>'
                    }
                }

            }, {
                field: 'bz',
                align: 'center',
                title: '备注  '
            }, {
                field: 'jzrq',
                align: 'center',
                title: '处理截止日期  '
            }, {
                field: 'username',
                align: 'center',
                title: '申请人'
            }
            ]
        });
    }


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

        mytable(rwmc, lcmc, sqnr, cjsjbegin, cjsjend);
    }

    //审核
    function derivation(rwmcs, bzs, lcmcs, rwsms, cjrs, rwids, wjmcs) {
        var rwmc = rwmcs;
        var bz = bzs;
        var lcmc = lcmcs;
        var username = cjrs;
        var lcmc = lcmcs;//流程名称
        var rwid = rwids;//任务ID
        var wjmc = wjmcs;//文件名称

        //模态框数据显示
        $('#shModal').modal('show');
        cursqid = rwids;
        curclickdata = {rwid: rwids, rwmc: rwmcs, bz: bzs, lcmc: lcmcs, cjrs: cjrs};
        //任务id
        $("#rwid").val(rwid);
        //任务名称
        $("#rwmc2").val(rwmc);
        //流程名称
        $("#lcmc2").val(lcmc);
        //备注
        $("#bz2").val(bz);
        //创建人
        $("#cjr2").val(username);
        $("#fileupload").val(wjmc);
        //判断是否显示查看文件文本框
        var ckwj = $("#lcmc2").val();
        var wjmc = $("#lcmc2").val();

        if (ckwj == "数据导入") {
            $("#ckwj").show();
        }
    }

    //审核是否通过
    function confirm() {
        var dqhjid;
        var shbz = $("#sh").select2("data")[0].id;
        var alldate = $("#taskList").bootstrapTable("getSelections");

        $.ajax({
            url: '${pageContext.request.contextPath}/sjsplc/sjdrsq/dqhjid',
            type: 'post',
            data: {
                'svo.shbz': shbz,
                'svo.lcid': alldate[0].lcid,
                'svo.hjid': alldate[0].hjid,
                'svo.rwid': alldate[0].rwid,
                'svo.xyhjid': alldate[0].xyhjid
            },
            success: function (msg) {
                alert(msg)
                //隐藏模态框
                $('#shModal').modal('hide');
                $("#taskList").bootstrapTable('refresh');
            }
        });
    }


    //审核时文件下载
    function filedowload1(wjmc) {
        //获取当前行数据
        window.location.href = "${pageContext.request.contextPath}/sjsplc/sjdrsq/dowload?wjmc=" + wjmc;
    }

</script>



