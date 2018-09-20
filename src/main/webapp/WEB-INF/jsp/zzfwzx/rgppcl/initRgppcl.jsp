<%--
  Created by IntelliJ IDEA.
  User: cuiheng
  Date: 2018/4/2
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人工匹配</title>
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
    <%--行内编辑--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable-revision/bootstrap-editable.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable/bootstrap-table-editable.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-editable.css"/>
</head>
<body>
<!-- Page Body -->
<div class="page-body" id="bxx">
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
                            <td style="vertical-align:middle;width: 3cm;">数据表:</td>
                            <td>
                                <div class="control-label">
                                    <select id="sjb" class="js-data-example-ajax" style="width: 150px;">
                                        <option></option>
                                    </select>
                                </div>
                            </td>
                            <td align="left" style="vertical-align:middle;width: 3cm; ">数据来源:</td>

                            <td>
                                <div class="control-label">
                                    <select id="sjly" class="js-data-example-ajax" style="width: 150px;">
                                        <option></option>
                                    </select>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="12" align="center">

                                <button type="button" onclick="querylist()" class="btn btn-info" style="width: 2cm;">
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
                        <button onclick="qrppdata()" type="button" class="btn btn-success btn-sm" data-toggle="modal">
                            <i class="glyphicon glyphicon-floppy-open"></i>确认匹配
                        </button>
                    </div>
                    <!--表数据-->
                    <table class="table table-striped table-bordered table-hover" id="taskList_table" data-height="620"
                           style="white-space: nowrap"></table>
                </div>

            </div>
        </div>
    </div>
</div>


<%--查看原始信息模态框--%>
<div class="modal fade" id="myModal" role="dialog" aria-label="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                原始信息
            </div>
            <div class="modal-body">
                <form id="editForm1" method="post" class="form-horizontal">
                    <span id="renderHtmlObject"></span>
                </form>
                <div class="text-right">
                    <button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
                </div>
            </div>
        </div>

    </div>
</div>


<%--匹配信息弹出页面--%>
<div class="page-body" id="ppydiv" style="display: none;">
    <%--查看匹配源--%>
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">查询条件</span>
                </div>
                <div class="widget-body">
                    <table class="table">
                        <tr>
                            <td style="vertical-align:middle;width: 3cm;">纳税人名称:</td>
                            <td style="width: 5cm"><input id="getnsrmc" type="text" class="form-control"
                                                          style="width: 150px;">
                            </td>
                            <td style="width: 3cm ">
                                <button onclick=" searchlist()" type="button" class="btn btn-info">执行查询
                                </button>
                            </td>

                            <td>
                                <button type="button" class="btn btn-info btn-block" style="width: 2cm;"
                                        onclick="returndiv()">关闭
                                </button>
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
                    <div id="tool">
                        <button type="button" class="btn btn-warning btn-sm" onclick="btn_edit()">
                            <i class="glyphicon glyphicon-pencil"></i>提取
                        </button>
                    </div>

                    <!--表数据-->
                    <table class="table table-striped table-responsive table-bordered table-hover"
                           style="white-space: nowrap" id="taskList" data-height="560">
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
<script>

    var flag = '0';
    var sjbxx = [];
    var result1 = [];
    var sjbs = [];
    var sjbxlk = [];
    //数据来源
    var sjlydata = [{id: '1', text: '审核退回'}, {id: '0', text: '未匹配'}];
    //(数据源表)下拉菜单
    $(function () {
        //数据表下拉框
        $.ajax({
            url: "${pageContext.request.contextPath}/zzfwzx/rgppcl/selectSjb",
            dataType: 'json',
            success: function (datas) {
                sjbxx = datas.xffj;//下法分局
                result1 = datas.ppy;//审核原因
                sjbs = datas.sjb;//数据表
                //数据表下拉框
                $("#sjb").select2({
                    data: sjbs,
                    width: 200,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        //数据来源下拉框
        $("#sjly").select2({
            data: sjlydata,
            width: 200,
            placeholder: '请选择',
            allowClear: true
        });
        //初始化表格
        inittabs();

    });


    //初始化表格
    function inittabs(sjb, sjly) {
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/zzfwzx/rgppcl/selectList",
            pagination: true, //是否分页
//            singleSelect: true,
            ueryParamsType: 'limit',
            queryParams: function (params) {
                return {
                    'svo.ybywm': sjb,
                    'svo.sjly': sjly,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
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
                field: 'dxmczw',
                align: 'left',
                halign: 'center',
                title: '源表',
                formatter: function (value, row, index) {
                    return '<a style="color:#057afd;cursor:hand" onclick="myviewdata(\'' + row.ybywm + '\',\'' + row.ppz + '\',\'' + row.ybzd + '\',\'' + row.wid + '\')">' + value + '</a>';

                }
            }, {
                field: 'ppz',
                align: 'left',
                halign: 'center',
                title: '主体名称',
                formatter: function (value, row, index) {
                    return '<a style="color:#057afd;cursor:hand" onclick="ppycx(\'' + row.ybywm + '\',\'' + row.ppz + '\',\'' + row.ybzd + '\')">' + value + '</a>';
                }
            }, {
                field: 'sjly',
                align: 'center',
                title: '数据来源',
                formatter: function (value, row, index) {
                    if (value == 0) {
                        return '未匹配'
                    }
                    else if
                    (value == 1)
                    {
                        return '审核退回'
                    }

                }
            }, {
                field: 'djxh',
                align: 'center',
                title: '金三登记序号   '
            }, {
                field: 'xffj',
                align: 'center',
                width: '280',
                title: '下发至基层局匹配',
                editable: {
                    type: 'select',
                    title: '请选择',
                    source: function () {
                        return sjbxx;
                    }
                }
            },

//                {
//                    field: '',
//                    align: 'center',
//                    title: '完成 ',
//                    formatter: function (value, row, index) {
//                        return '<button type="button" style="cursor:hand" class="btn btn-info btn-sm glyphicon glyphicon-check" onclick="qrppdata(\'' + row.wid + '\',\'' + row.djxh + '\')">确认匹配</button>';
//                    }
//                },

                {
                    field: 'wfpp',
                    align: 'center',
                    title: '无法匹配原因 ',
                    editable: {
                        type: 'select',
                        title: '请选择',
                        source: function () {
                            return result1;
                        }
                    }
                }
            ],
            onEditableSave: function (field, row, oldValue, $el) {
                console.log(row);
                $.ajax({
                    type: "post",
                    url: "${pageContext.request.contextPath}/zzfwzx/rgppcl/xfjcfj",
                    data: {wid: row.wid, xfdw: row.xffj, wfpp: row.wfpp},
                    dataType: "json",
                    success: function (data, status) {
                        inittabs();
                    }
                });
            }
        });
    }


    //主查询
    function querylist() {
        var sjb = $('#sjb').val();
//        var sjb = $('#sjb').find('option:selected').text()
        var sjly = $('#sjly').val();
        inittabs(sjb, sjly);
    }

    //查看原始信息
    function myviewdata(ybywm, ppz, ybzd, wid) {
        ybywm1 = ybywm;
        ppz1 = ppz;
        ybzd1 = ybzd;
        wid1 = wid;

        $.ajax({
            type: 'post',
            //判断当前匹配值在原表里面有几条数据 给原表加登记序号
            url: '${pageContext.request.contextPath}/sjcl/rgpp/pdsjgs',
            data: {
                'svo.ybywm': ybywm,
                'svo.ppz': ppz,
                'svo.ybzd': ybzd
            },
            dataType: 'json',
            success: function (data0) {
                $('#myModal').modal('show');
                //查询原始信息列
                $.ajax({
                    type: 'post',
                    url: "${pageContext.request.contextPath}/sjcl/rgpp/viewthedata",
                    data: {
                        'svo.ybywm': ybywm,
                        'svo.ppz': ppz,
                        'svo.ybzd': ybzd
                    },
                    dataType: 'json',
                    success: function (datas1) {
                        var columndata = '';
                        var renderTableObject = "";
                        for (var i = 0; i < datas1.length; i++) {
                            columndata = datas1[i].columndata;
                            if (typeof (columndata) == 'undefined') {
                                columndata = ' ';
                            }
                            renderTableObject += "<div class=\"form-group\">" +
                            "<label class=\"col-sm-4 control-label\">" + datas1[i].columnszw + ":</label>" +
                            "<div class=\"col-sm-4\">" +
                            "<input id='" + datas1[i].columnsyw + "' readonly type=\"text\" style=\"width:200px;\" class=\"form-control\" value='" + columndata + "'>" +
                            "</div>" +
                            "</div>" +
                            "<div class=\"hr-line-dashed\"></div>";
                        }
                        $("#renderHtmlObject").html(renderTableObject);
                    }
                });
            }
        });
    }


    function ppycx(ybywm, ppz, ybzd) {
        var selecter = window.getSelection();
        if (selecter != "") {
            document.getElementById("getnsrmc").value = selecter;
        } else {
            $('#getnsrmc').val(ppz);
        }
        var nsrmc = $('#getnsrmc').val();
        mytable(nsrmc);
        $('#bxx').hide();
        $('#ppydiv').show();
    }

    //关闭登记序号查询页面
    function returndiv() {
        $('#ppydiv').hide();
        $('#bxx').show();
    }

    //确认匹配
    function qrppdata() {
        var mydata = $("#taskList_table").bootstrapTable("getSelections");
        var djxhs = [];
        for (var i = 0; i < mydata.length; i++) {
            djxhs.push({"djxh": mydata[i].djxh, "wid": mydata[i].wid});
        }
        var parmssss = {
            'datalist': JSON.stringify(djxhs)
        };

        //提交url
        var myurl = '${pageContext.request.contextPath}/zzfwzx/rgppcl/qrpp';
        //成功方法
        var myfunctions = function (msg) {
            if ('1' == msg) {
                alert("Data Saved: 匹配成功");

                inittabs();
            } else {
                alert("Data Saved: 匹配失败");
            }
        };
        if (djxhs.length == 0) {
            alert("请先匹配数据！");
        } else {
            // 提交数据
            $.myajax.common("post",
                    parmssss,
                    myurl,
                    myfunctions
            );
        }
    }

</script>

<script>
    var extractiondjxh = "";
    //初始化表格
    function mytable(nsrmcs) {
        //先销毁表格
        $('#taskList').bootstrapTable('destroy');
        $('#taskList').bootstrapTable({
            url: "${pageContext.request.contextPath}/zzfwzx/rgppcl/selecrPpxx",
            pagination: true, //是否分页
            singleSelect: true,
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#tool',
            queryParams: function (params) {
                return {
                    'svo.nsrmc': nsrmcs,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            ueryParamsType: 'limit',
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "djxh", //每一行的唯一标识，一般为主键列
            showColumns: false, //是否显示内容列下拉框
            sidePagination: 'server',
            columns: [{
                field: '',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'djxh',
                    align: 'center',
                    title: '登记序号'
                }, {
                    field: 'shxydm',
                    align: 'center',
                    title: '社会信用代码'
                }, {
                    field: 'nsrmc',
                    align: 'center',
                    title: '纳税人名称 '
                }, {
                    field: 'ssdabh',
                    align: 'center',
                    title: '税收档案编号'
                }, {
                    field: 'nsrsbh',
                    align: 'center',
                    title: '纳税人识别号'
                }, {
                    field: 'fddbrxm',
                    align: 'center',
                    title: '法人'
                }, {
                    field: 'fddbrsfzjhm',
                    align: 'center',
                    title: '法定代表人身份证号码'
                }, {
                    field: 'nsrztmc',
                    align: 'center',
                    title: '纳税人状态'
                }, {
                    field: 'hymc',
                    align: 'center',
                    title: '行业'
                }, {
                    field: 'fjmqybz',
                    align: 'center',
                    title: '非居民企业标志'
                }, {
                    field: 'gdslxmc',
                    align: 'center',
                    title: '国地税类型名称'
                }, {
                    field: 'kzztdjlxmc',
                    align: 'center',
                    title: '课征主体登记类型名称'
                }, {
                    field: 'scjydz',
                    align: 'center',
                    title: '生产经营地址'
                }, {
                    field: 'jyfw',
                    align: 'center',
                    title: '经营范围'
                }, {
                    field: 'xzqhmc',
                    align: 'center',
                    title: '生产经营地行政区划名称'
                }, {
                    field: 'zcdz',
                    align: 'center',
                    title: '注册地址'
                }, {
                    field: 'xzqhmc1',
                    align: 'center',
                    title: '注册地行政区划名称'
                }, {
                    field: 'djzclxmc',
                    align: 'center',
                    title: '登记注册类型'
                }, {
                    field: 'jdxzmc',
                    align: 'center',
                    title: '街道乡镇'
                }, {
                    field: 'dwlsgxmc',
                    align: 'center',
                    title: '单位隶属关系'
                }, {
                    field: 'gdghlxmc',
                    align: 'center',
                    title: '国地管户类型'
                }, {
                    field: 'swjgmc',
                    align: 'center',
                    title: '登记机关'
                }, {
                    field: 'djrq',
                    align: 'center',
                    title: '登记日期'
                }, {
                    field: 'zzjglxmc',
                    align: 'center',
                    title: '组织机构类型'
                }, {
                    field: 'kqccsztdjbz',
                    align: 'center',
                    title: '跨区财产税主体登记标志'
                }, {
                    field: 'swjgmc1',
                    align: 'center',
                    title: '主管分局'
                }, {
                    field: 'swjgmc2',
                    align: 'center',
                    title: '科所'
                }, {
                    field: 'swryxm',
                    align: 'center',
                    title: '税收管理员'
                }, {
                    field: 'swryxm1',
                    align: 'center',
                    title: '录入人'
                }, {
                    field: 'lrrq',
                    align: 'center',
                    title: '录入日期'
                }, {
                    field: 'swryxm2',
                    align: 'center',
                    title: '修改人'
                }, {
                    field: 'xgrq',
                    align: 'center',
                    title: '修改日期'
                }, {
                    field: 'zgswj_dm',
                    align: 'center',
                    title: '征管税务局代码'
                }
            ]
        });
    }


    //纳税人名称查询
    function searchlist() {
        //获取纳税人名称0
        var nsrmc = $("#getnsrmc").val();
        mytable(nsrmc);
    }

    var selectedRowIndex;
    $("#taskList_table").on('click-row.bs.table', function (e, row, $element) {
        selectedRowIndex = $element.data("index");
        xzdx = $element;
    });
    //提取登记序号
    function btn_edit() {
        //获取被选中的记录
        var allselecteddata = $('#taskList').bootstrapTable('getSelections');

        if (allselecteddata.length <= 0) {
            alert("请选择匹配源数据！");
        } else {
            extractiondjxh = allselecteddata[0].djxh;
            // xzdx.find("td:eq(4) a:eq(0)").val(extractiondjxh);
            $("#taskList_table").bootstrapTable("updateRow", {
                index: selectedRowIndex,
                row: {
                    djxh: extractiondjxh
                }
            });

        }
        xzdx.find(".editable").editable("toggleDisabled");

        $('#ppydiv').hide();
        $('#bxx').show();
    }


    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/zzfwzxpage.jsp";
    }

</script>

