<%--
  Created by IntelliJ IDEA.
  User: CuiHeng
  Date: 2018/1/31
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>元件模型研发</title>
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
    <!--bootstrapt 编辑-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-editable.css"/>

    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>
</head>

<style>
    @charset "utf-8";
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
                            <td style="vertical-align:middle; width: 2cm">申请标题:</td>
                            <td style="width: 22cm;">
                                <input id="rwmc" type="text" class="form-control" style="width: 180px;">
                            </td>
                        </tr>
                        <tr align="center">
                            <td colspan="12">
                                <button onclick="searchlist()" type="button" class="btn btn-info">执行查询</button>
                                <button onclick="window.location.href='${pageContext.request.contextPath}/main/homepage/sjjgpage'" type="button" class="btn btn-info " style="width: 2cm">返回</button>
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

                    <table id="taskList_table" class="table table-striped table-bordered table-hover" style="white-space: nowrap" data-height="550"></table>

                    <!-------------------------------------------------------------------------------------------->
                    <!--编辑任务模态框-->
                    <div class="modal fade" id="wcjdModel" style="height: 300px" tabindex="-1" role="dialog"
                         aria-label="myModalLabel">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title">
                                        完成进度编辑
                                    </h4>
                                </div>
                                <div class="widget-body" style="width: 100%;height: 60%;">
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
<!--Basic Scripts-->
<%--bootstrap-editable Script--%>
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

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable-revision/bootstrap-editable.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-editable/bootstrap-table-editable.js"></script>
</html>
<script type="text/javascript">



    var cc;
    var rwid1;
    //初始化
    $(function () {
        //初始化表格
        inittabs();
        //初始化
        insert_rwssxj_tb();
        //完成进度
        $("#wcjd").sider({
            min: 0,
            max: 100,
            quick: []
        });

        //(数据元件)下拉菜单
        $.ajax({
            url: "${pageContext.request.contextPath}/sjjh/rwssfk/selectBmc",
            dataType: 'json',
            success: function (datas1) {
                $("#bzwmc").select2({
                    data: datas1,
                    placeholder: '请选择',
                    allowClear: true
                });
            }
        });


    });


    //添加
    function btn_add() {
        var bwmc = $("#bzwmc").select2("data");
        //获取表名称中文
        var bzwm = bwmc[0].id;
        //获取表名称英文
        var bywm = bwmc[0].text;
        //获取表数据量
        var bz = $("#bsjl").val();

        //提交参数
        var sub = {
            'svo.rwid': rwid1,
            'svo.bzwm': bzwm,
            'svo.bywm': bywm,
            'svo.bz': bz
        };

        //提交url
        var myurl = "${pageContext.request.contextPath}/sjjh/rwssfk/insertSsxj";
//        //成功方法
        var myfunctions = function () {
            //刷新当前页面
            window.location.reload();
        };
        $.myajax.common("post",
                sub,
                myurl,
                myfunctions
        );

    }
    ;

    //删除事件
    function btn_delete() {
        //获取被选中的记录
        var rows = $('#rwssxj_table').bootstrapTable('getSelections');
        if (rows.length == 0) {
            alert("请选择要删除的记录！");
            return;
        }
        var sqids = rows[0].sqid;
        var msg = "您真的确定要删除么？";
        if (confirm(msg) == true) {
            $.ajax({
                url: "${pageContext.request.contextPath}/sjjh/rwssfk/deleteRwssxj",
                type: "post",
                data: {
                    'svo.sqid': sqids
                }, success: function () {
                    //刷新当前页面
                    window.location.reload();
                }
            });
        }
        ;


    }


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
        var n, r, m = $(this), k = m.children("input"), g = m.children(".popcontent"), p = g.children(".sider"), c = g.children("ul"), l = p.children(".sider-btn"), f, u = (a.max - a.min) / a.step, t;
        m.click(function (a) {
            a.stopPropagation()
        });
        k.focus(function (b) {
            g.show();
            b = "";
            var h = 40 < c.width() / a.quick.length ? parseInt(c.width() / a.quick.length) / c.width() * 100 : 100 / parseInt(c.width() / 40);
            for (i in a.quick)b += "<li data-num='" + a.quick[i] + "' style='width:" + h + "%'></li>";
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
        //先销毁表格
        $('#taskList_table').bootstrapTable('destroy');
        $('#taskList_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjg/yjmxyf/list",
            pagination: true, //是否分页
            singleSelect: true,
            buttonsAlign: 'right', //按钮对齐方式
            pageSize: 8, //每页的记录行数
            pageList: [10, 20, 30, 50], //可供选择的每页行数
            onlyInfoPagination: false,
            toolbar: '#toolbar',
            queryParams: {
                'svo.rwmc': rwmcs
            },
            paginationLoop: true,
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "mxmcs", //每一行的唯一标识，一般为主键列
            sidePagination: 'server',
            columns: [{
                field: 'select',
                checkbox: true,
                align: 'center',
                valign: 'middle'
            },
                {
                    field: 'rwmc',
                    align: 'center',
                    title: '申请标题'
                }, {
                    field: 'rwsm',
                    align: 'center',
                    title: '申请描述'
                }, {
                    field: 'cjsj',
                    align: 'center',
                    title: '申请时间'
                }, {
                    field: 'jzrq',
                    align: 'center',
                    title: '截止日期'
                }, {
                    field: 'name',
                    align: 'center',
                    title: '申请人'  ,
                    formatter: function (value, row, index) {
                        var res = parseInt(row.wcjd);
                        return ["<div name='mydiv1' >"+value+"</div>"];
                    }
                },{
                    field: 'bz',
                    align: 'center',
                    title: '备注'
                },
//                {
//                    field: 'shzt',
//                    align: 'center',
//                    title: '审核状态 ',
//                    formatter: function (value, row, index) {
//                        if (value == 0) {
//                            return '未审核'
//                        } else if (value == 1) {
//                            return '审核通过'
//                        } else {
//                            return '审核不通过'
//                        }
//
//                    }
//                },
                {
                    field: 'wcjd',
                    align: 'center',
                    title: '完成进度（%）',
                    formatter: function (value, row, index) {
                        var res = parseInt(row.wcjd);
                        return ["<div onclick='wcjdbj(" + value + " ," + row.rwid + ")' class='progress progress-striped active'><div  class='progress-bar progress-bar-info' role='progressbar' aria-valuenow='50' aria-valuemin='0' aria-valuemax='100'style='width:" + res.toFixed(2) + "% '>" + res.toFixed(0) + "%" + "</div></div>"];
                    }

                } ,
                {
                    field: 'yjmc',
                    align: 'center',
                    title: '元件名称',
                    formatter: function (value, row, index) {
                        var res = parseInt(row.wcjd);
                        return "213456";
                    },
                    editable: {
                        mode: 'popup',
                        type: 'select',
                        title: '元件选择',
                        source: function (value, row, index) {
                            console.log("value----->",value);
                            var result = [];
                            $.ajax({
                                url: "${ctx}/sjjg/yjmxyf/yjlistdata",
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
            onEditableSave:function(field,row,oldValue,$el){
                $.ajax({
                    type:"post",
                    url:"${ctx}/sjjg/yjmxyf/saveYjdata",
                    data:{yjid:row.yjmc,sqid:row.rwid},
                    dataType:"json",
                    success:function(data,status){

                    }
                });
            }   ,
            onLoadSuccess:function(){
                //注册选中事件
                //$("#taskList_table div[name='mydiv1']").html();
//                $("#taskList_table div[name='mydiv1']").selected;
            }
        });
    }

    //查询
    function searchlist() {
        //获取模型名称
        var rwmc = $("#rwmc").val();
        inittabs(rwmc);
    }

    //文件下载
    function filedowload1() {
        //获取当前行数据
        var alldate = $("#taskList_table").bootstrapTable("getSelections");
        //获取文件名称
        var savepath = alldate[0].savepath;
        window.location.href = "${pageContext.request.contextPath}/sjcl/rwyxfk/dowload?savepath=" + savepath;
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
            url: '${pageContext.request.contextPath}/sjjh/rwssfk/updateLable?rwid=' + cc + '&sliding=' + sliding,
            type: 'post',
            success: function (json) {
                $("#taskList_table").bootstrapTable('refresh');
            }
        });
    }

</script>

<script>
    function insert_rwssxj_tb(rwid) {
        //先销毁表格
        $('#rwssxj_table').bootstrapTable('destroy');
        $('#rwssxj_table').bootstrapTable({
            url: "${pageContext.request.contextPath}/sjjh/rwssfk/selectRwssxj_model",
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

