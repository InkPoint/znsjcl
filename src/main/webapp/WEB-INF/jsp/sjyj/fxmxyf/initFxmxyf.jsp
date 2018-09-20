<%--
  Created by IntelliJ IDEA.
  User: CuiHeng
  Date: 2018/4/25
  Time: 14:51
  The modifier: PengWen Wang
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>分析模型研发</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${ctx}/assets/img/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/select2/select2.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/beyond.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrap-editable.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
</head>
<style>
    .widget-sider input {
        height: 33px;
        line-height: 33px;
        border: 1px solid #d7d7d7;
        text-indent: .4em;
        width: 100%
    }

    .widget-sider .popcontent {
        position: absolute;
        width: 100%;
        border: 1px solid #d7d7d7;
        background: #fff;
        z-index: 9;
        margin-top: -1px;
        display: none
    }

    .widget-sider ul {
        margin: 5px;
        zoom: 1
    }

    .widget-sider ul:after {
        display: block;
        clear: both;
        visibility: hidden;
        height: 0;
        overflow: hidden;
        content: "."
    }

    .widget-sider li {
        width: 25%;
        float: left;
        cursor: pointer
    }

    .widget-sider li::after {
        content: attr(data-num);
        width: 29px;
        height: 29px;
        border: 1px solid #d7d7d7;
        display: block;
        margin: 0 auto;
        margin-top: 5px;
        border-radius: 29px;
        line-height: 29px;
        text-align: center
    }

    .widget-sider li.active::after {
        background: #f60;
        border-color: #f60;
        color: #fff
    }

    .widget-sider .sider {
        margin: 20px 10px 20px 10px;
        height: 0;
        border-bottom: 1px solid #d7d7d7;
        position: relative
    }

    .widget-sider .sider .sider-btn {
        width: 15px;
        height: 15px;
        background: #f60;
        position: absolute;
        left: 0;
        top: -7px;
        overflow: hidden;
        font-size: 12px;
        color: #fff;
        line-height: 15px;
        border-radius: 15px;
        color: #fff;
        text-align: center;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        cursor: pointer
    }
</style>
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
                            <td style="vertical-align:middle; width: 2cm">需求命题:</td>
                            <td style="width: 22cm;">
                                <input id="rwmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
                                <button onclick="window.location.href='${ctx}/main/homepage/sjyjpage'" type="button"
                                        class="btn btn-info " style="width: 2cm">返回
                                </button>
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
                    <table id="taskList_table" class="table table-striped table-bordered table-hover"
                           style="white-space: nowrap" data-height="630"></table>
                    <div class="modal fade" id="wcjdModel" style="height: 300px" tabindex="-1" role="dialog"
                         aria-label="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        完成进度
                                    </h4>
                                </div>
                                <div class="modal-body">
                                    <form id="editForm1" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-5 control-label">完成进度:</label>

                                            <div class="col-sm-2" style="width: 210px;">
                                                <div class="case">
                                                    <div style="width:210px;" class="widget-sider" id='wcjd'></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div style="text-align: center">
                                            <button type="button" class="btn btn-primary" onclick="xgbc()"
                                                    data-dismiss="modal">保存
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${ctx}/assets/assets/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/assets/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-table-zh-CN.js"></script>
<script src="${ctx}/assets/js/newselect2/select2.min.js"></script>
<script src="${ctx}/assets/js/bootstrap-datetimepicker.js"></script>
<script src="${ctx}/static/js/jquery.ts.js"></script>
<script src="${ctx}/assets/js/util.js"></script>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
<script src="${ctx}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>
<script src="${ctx}/assets/js/bootstrap-editable-revision/bootstrap-editable.js"></script>
<script src="${ctx}/assets/js/bootstrap-editable/bootstrap-table-editable.js"></script>
</html>
<script type="text/javascript">
    $(function () {
        inittabs();
        //初始化
        insert_rwssxj_tb();
        //完成进度
        $("#wcjd").sider({
            min: 0,
            max: 100,
            quick: []
        });

        //(分析模型)下拉菜单
        $.ajax({
            url: "${ctx}/sjjh/rwssfk/selectBmc",
            dataType: 'json',
            success: function (results) {
                $("#bzwmc").select2({
                    data: results,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });

        $(document).keydown(function (event) {
            //返回获得的焦点元素
            var myfocus = document.activeElement;
            if (!document.getElementById("rwmc").contains(myfocus)) return;
            if (event.keyCode == 13) {
                searchlist();
                $("#rwmc").focus();
                return false;
            }
        });
    });

    $.fn.sider = function (q) {
        function d(b, c, d) {
            if (b) {
                var h = f / (a.max - a.min), e = b * h, e = e > f ? f : 0 > e ? 0 : e;
                d ? e -= h * a.min : b += a.min;
                b = b > a.max ? a.max : b < a.min ? a.min : b;
                k.val(b);
                l.css({left: e})
            }
            c && g.hide();
            a.callback && q.callback(m, b, c)
        }

        var a = {
            step: 1,
            min: 0,
            max: 100,
            quick: [0, 5, 10, 15, 30, 40, 60, 80],
            name: "size",
            value: "",
            callback: !1
        };
        $.extend(a, q);
        $(this).html('<input id="sliding" readonly type="text" name="' + a.name + '" value="' + a.value + '" class="form-control"><div class="popcontent"><ul></ul><div class="sider"><div class="sider-btn"></div></div></div>');
        var n, r, m = $(this), k = m.children("input"), g = m.children(".popcontent"), p = g.children(".sider"),
            c = g.children("ul"), l = p.children(".sider-btn"), f, u = (a.max - a.min) / a.step, t;
        m.click(function (a) {
            a.stopPropagation()
        });
        k.focus(function (b) {
            g.show();
            b = "";
            var h = 40 < c.width() / a.quick.length ? parseInt(c.width() / a.quick.length) / c.width() * 100 : 100 / parseInt(c.width() / 40);
            for (i in a.quick) b += "<li data-num='" + a.quick[i] + "' style='width:" + h + "%'></li>";
            c.html($(b));
            f = p.width() - l.width();
            t = f / u;
            c.children(".active").removeClass("active");
            c.children("li[data-num='" + k.val() + "']").addClass("active");
            d(k.val(), !1, !0)
        });
        c.on("click", "li", function () {
            d($(this).attr("data-num"), !0)
        });
        l.on("mousedown", function (a) {
            n = !0;
            var b = l.offset(), c = p.offset();
            r = parseInt(b.left) + (a.pageX - parseInt(b.left)) + (c.left - b.left)
        });
        $(document).mousemove(function (b) {
            n && d(parseInt((b.pageX - r) / t) * a.step)
        });
        $(document).on("mouseup", function () {
            n && d(void 0, !0);
            n = !1
        });
        $(document).click(function () {
            g.hide()
        })
    };

    function inittabs(rwmcs) {
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${ctx}/sjyj/fxmxyf/selectAll",
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 8, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            queryParams: {
                'svo.rwmc': rwmcs
            },
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'xqmt',
                    align: 'left',
                    halign: 'center',
                    title: '分析模型需求命题'
                }, {
                    field: 'xqsm',
                    align: 'left',
                    halign: 'center',
                    title: '需求说明'
                }, {
                    field: 'xqwd',
                    align: 'left',
                    halign: 'center',
                    title: '需求文档'
                }, {
                    field: 'sqr',
                    align: 'center',
                    title: '申请人'
                },
                {
                    field: 'sqsj',
                    align: 'center',
                    title: '申请时间'
                },
                {
                    field: 'shzt',
                    align: 'center',
                    title: '审核状态 '
                },
                {
                    field: 'wcjd',
                    align: 'center',
                    title: '完成进度（%）',
                    formatter: function (value, row, index) {
                        var res = parseInt(row.wcjd);
                        return ["<div onclick='wcjdbj(" + value + " ," + row.rwid + ")' class='progress progress-striped active'><div  class='progress-bar progress-bar-info' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100'style='width:" + res.toFixed(2) + "% '>" + res.toFixed(0) + "%" + "</div></div>"];
                    }

                },
                {
                    field: 'yjmc',
                    align: 'center',
                    title: '分析模型',
                    editable: {
                        mode: 'popup',
                        type: 'select',
                        title: '模型选择',
                        source: function (value, row, index) {
                            var result = [];
                            $.ajax({
                                url: "${ctx}/sjyj/fxmxyf/yjlistdata",
                                async: false,
                                type: "post",
                                success: function (data, status) {
                                    $.each(data, function (key, value) {
                                        result.push({value: value.id, text: value.text});
                                    });
                                }
                            });
                            return result;
                        }
                    }
                }
            ],
            onEditableSave: function (field, row, oldValue, $el) {
                $.post("${ctx}/sjyj/fxmxyf/selectTheModel", {'svo.sqid': row.rwid, 'svo.mxid': row.yjmc}, function (results) {
                    console.log("输出结果集=",results);
                });
            }
        });
    }

    //查询
    function searchlist() {
        //获取模型名称
        var rwmc = $("#rwmc").val();
        inittabs(rwmc);
    }

    var cc;

    //完成进度编辑
    function wcjdbj(wcjd, rwid) {
        cc = rwid;
        var i = wcjd;
        $("#sliding").val(i);
        $('#wcjdModel').modal('show');

    }

    //修改保存
    function xgbc() {
        //获取完成进度
        var sliding = $("#sliding").val();
        $.ajax({
            url: '${ctx}/sjjh/rwssfk/updateLable?rwid=' + cc + '&sliding=' + sliding,
            type: 'post',
            success: function (json) {
                $("#taskList_table").bootstrapTable('refresh');
            }
        });
    }

    function insert_rwssxj_tb(rwid) {
        //先销毁表格
        $('#rwssxj_table').bootstrapTable('destroy');
        $('#rwssxj_table').bootstrapTable({
            url: "${ctx}/sjjh/rwssfk/selectRwssxj_model",
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            toolbar: '#toolbars',
            pageSize: 10, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            queryParams: function (params) {
                return {
                    'svo.rwid': rwid,
                    offset: (params.offset / params.limit) + 1,
                    limit: params.limit
                }
            },
            onlyInfoPagination: false,
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                width: 40,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'bywm',
                    align: 'center',
                    title: '表名称(中文)'
                }, {
                    field: 'bzwm',
                    align: 'center',
                    title: '表名称（英文）'
                }, {
                    field: 'bz',
                    align: 'center',
                    title: '表数据量'
                }
            ]
        });
    }
</script>
