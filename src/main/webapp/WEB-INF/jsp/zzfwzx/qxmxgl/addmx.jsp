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
<div class="page-body">
    <div id="condition" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <span class="widget-caption">模型基本信息设置</span>

                </div>
                <!--小部件标题-->
                <div class="widget-body">
                    <form id="formss" >
                        <table class="table">
                            <tr >
                                <td style="vertical-align:middle;width: 3cm;">模型名称:</td>
                                <td ><input id="mxmc" type="text" class="form-control" placeholder="" style="width: 200px;"></td>
                                <td style="vertical-align:middle;width: 3cm;">描述:</td>
                                <td ><input id="mxms" type="text" class="form-control" placeholder="" style="width: 200px;"></td>

                            </tr>
                            <tr >
                                <td style="vertical-align:middle;width: 3cm;">备注:</td>
                                <td  colspan="3"><input id="bz" type="text" class="form-control" placeholder="" style="width: 200px;"/>
                                </td>
                            </tr>
                            <tr align="center">
                                <td colspan="6">
                                    <button type="button" class="btn btn-info" onclick="savezb();" style="width: 2cm;">保&nbsp;&nbsp;存</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="button" class="btn btn-info btn-block" onclick="queryzb();" style="width: 2cm;">返&nbsp;&nbsp;回</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>

            </div>

        </div>
    </div>
    <div id ="querys" class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header ">
                    <span class="widget-caption">模型对应规则设置</span>

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
                    <table class="table table-striped table-bordered table-hover" id="mytab"></table>
                </div>
            </div>
        </div>
    </div>

</div>


<div class="modal fade" id="adds" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    添加模型对应关系
                </h4>
            </div>
            <div class="modal-body">
                <div class="ibox-content" style="height:500px;;width:100%;">
                    <form id="editForm" method="post" class="form-horizontal">
                        <div class="col-md-12 " >
                            <div class="form-group">
                                <label for="xh" class="col-sm-4" style="text-align: right;">执行顺序：</label>
                                <input type="text"   class="col-sm-5" id="xh" class="form-control" name="xh" style="width:200px;">
                            </div>
                            <div class="form-group">
                                <label for="zbid"  class="col-sm-4" style="text-align: right;">规则：</label>
                                <select  id="zbid" class="col-sm-5" class="form-control" name="zbid"  style="width:200px;" > </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" onclick="closewidn()">关闭</button>
                <button type="button" class="btn btn-primary" onclick="savedate()">
                    提交
                </button>
            </div>

        </div>
    </div>

</div>

</body>
</html>
<script>
    //获取服务器传递的模型id
    var curmxid="${param.mxid}";
    //查询条件
    var con_zbmc="${param.con_zbmc}";
    var con_gz="${param.con_gz}";
    //设置当前选中的行下标
    var clickindexs=0;
    var cureditrow={};
    var data1=[{id:1,text:'最高'},{id:2,text:'高'},{id:3,text:'一般'},{id:4,text:'低'}];
    $(function(){
        //初始化模型基本信息
        //初始化模型关系表信息表格
        query(curmxid);
        //初始化添加页面所有下拉列表信息
        initdropdownlist();
        //注册添加按钮单击事假
        $("#add_mota").click(function(){
            cureditrow={};
            $("#xh").val("");
            $("#zbid").val("").select2();
            $('#adds').modal('show');
        });
        //注册添加模态框修改单击事件
        $("#edit_mota").click(function(){
            $('#adds').modal('show');
            //获取选中行的数据
            var seldata=$('#mytab').bootstrapTable("getSelections");
            //保存当前行数据
            cureditrow=seldata;
            console.log("seldata:",seldata);
            //回填数据
            $("#xh").val(seldata[0].xh);
            $("#zbid").val(seldata[0].zbid).select2();
        });
    });

    //查询模型字段关联信息表
    function query(mxid){
        console.log("添加修改页面查询mxid:",mxid);
        $('#mytab').bootstrapTable({
            url:'${pageContext.request.contextPath}/zzfwzx/qxmxgl/mxzblist',
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
            uniqueId: 'mxzbid',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "mxid", //每一行的唯一标识，一般为主键列
            sidePagination:'server',
            onCheck:function(row,$element){
                clickindexs=$element.data("index");
            },
            queryParams:{'svo.mxid':mxid},
            columns: [
                {
                    field: '',
                    align:'center',
                    checkbox:true,
                    width:100,
                    title:'选择'

                },
                {
                    field: 'xh',
                    align: 'center',
                    title: '序号',
                    width:100

                }, {
                    field: 'zbmc',
                    align: 'center',
                    title: '指标名称' ,
                    width:100
                }
            ],
            onLoadSuccess:function(){

            }
        });
    }
    //添加和修改规则
    function savedate(){
        //获取输入值
        var xh= $("#xh").val();
        var zbid= $("#zbid").select2("data")[0].id;
        var zbmc= $("#zbid").select2("data")[0].text;

        var tabdata=  $('#mytab').bootstrapTable("getData");
        //组织数据
        var   onedata={};
        //插入表数据
        if(JSON.stringify(cureditrow)=="{}"||cureditrow==null||typeof(cureditrow)=="undefined"||cureditrow.length==0){
            onedata={zbid:zbid,zbmc:zbmc,xh:xh};
            $('#mytab').bootstrapTable("insertRow",{index:tabdata.length,row:onedata});
        }else{
            onedata={zbid:zbid,zbmc:zbmc,mxid:cureditrow[0].mxid,mxzbid:cureditrow[0].mxzbid,xh:xh};
            $('#mytab').bootstrapTable("updateRow",{index:clickindexs,row:onedata});
        }

        //隐藏弹出框
        $('#adds').modal('hide');
    }

    //关闭窗口
    function closewidn(){
        $('#adds').modal('hide');
    }
    //删除数据
    function btn_delete(){

        var seldata=$('#mytab').bootstrapTable("getSelections");
        console.log("seldata:",seldata[0]);
        //删除行
        $('#mytab').bootstrapTable('remove',{field:'xh',values:[seldata[0].xh]});
    }
    //初始化添加删除页面所有下拉组件
    function initdropdownlist(){
        $.ajax({
            contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
            url: "${pageContext.request.contextPath}/zzfwzx/qxmxgl/initadd",
            data: {'svo.mxid':curmxid},
            type:'post',
            dataType:'json',
            success: function(msg){
                console.log("msg:",msg);
                //初始化基本信息
                if(curmxid!=""&&typeof(curmxid)!="undefined"){
                    $("#mxmc").val(msg.basicinfo[0].mxmc);
                    $("#mxms").val(msg.basicinfo[0].mxms);
                    $("#bz").val(msg.basicinfo[0].bz);

                }

                //初始化所有表信息
                $("#zbid").select2({
                    data:msg.zblist,
                    Width:200,
                    placeholder:'请选择',
                    allowClear:true
                });



            }
        });
    }

    //保存模型
    function  savezb(){
        //获取模型基本信息
        var mxmc=$("#mxmc").val();
        var mxms=$("#mxms").val();
        var bz=$("#bz").val();

        if(mxmc==""||typeof(mxmc)=="undefined"){
            alert("模型名称不能为空！");
            return;
        }
        if(mxms==""||typeof(mxms)=="undefined"){
            alert("模型描述没有填写！");
            return;
        }

        var oprflage="0";
        console.log("最后curmxid:",curmxid);
        if(curmxid!=null&&curmxid!=""&&typeof(curmxid)!="undefined"){
            oprflage="1"
        }

        //获取模型规则关系列表信息
        var   tabdata=$('#mytab').bootstrapTable("getData");
        var   datastr={'svo.datastr':JSON.stringify(tabdata),'svo.mxmc':mxmc,'svo.mxms':mxms,'svo.bz':bz,'svo.mxid':curmxid,'svo.oprflag':oprflage};
        //提交url
        var myurl="${pageContext.request.contextPath}/zzfwzx/qxmxgl/savedata";
        //成功方法
        var myfunctions=function(msg){
            window.location.href="${pageContext.request.contextPath}/zzfwzx/qxmxgl/initQxmxgl?con_zbmc="+con_zbmc+"&con_gz="+con_gz;
        }
        if(tabdata!=null&&tabdata!=""&&tabdata.length>0){
            //请求保存数据
            $.myajax.common("post",
                    datastr ,
                    myurl,
                    myfunctions
            );
        }else{
            alert("模型规则关系数据没有添加，添加后再保存！");
        }
    }

    //返回按钮重新查询模型信息
    function queryzb(){
        window.location.href="${ctx}/zzfwzx/qxmxgl/initQxmxgl?con_zbmc="+con_zbmc+"&con_gz="+con_gz;

    }
</script>
