<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>bootstrap基本信息查询</title>
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
                                </tr>
                                <tr align="center">
                                    <td colspan="2">
                                        <button type="button" class="btn btn-info">执行查询</button> &nbsp;&nbsp;&nbsp;&nbsp;
                                        <button type="button" class="btn btn-info" onclick="savedb()">将数据保存到后台</button> &nbsp;&nbsp;&nbsp;&nbsp;
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
                        <div class="widget-header ">
                            <span class="widget-caption">查询结果</span>
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
                                        <button type="button" class="btn btn-info btn-block" onclick="showmains()">返回
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!------------------------>
                    </div>
                </div>

            </div>
        </div>

<div id="test1">
     <p>lsjflsfjls</p>
     <h1>sfsfsfsf</h1>
    <ol><li>While building a content editor for?MindMup?we found plenty of good HTML5 WYSWYG editors online, but most were duplicating functionality that already exists in jQuery and Bootstrap, implementing things that were meanwhile added to HTML5 and supported in major browsers, or doing too much magic such as inserting IFrames with backup text-areas. Most of this was to work around quirks in older browsers and caused focus problems on touch devices ? ? ？ (which was an issue for us) . Too much magic caused problems with bootstrap modals ? ? ？ (a must for us) .&nbsp;</li><li>Most editors also build their own toolbars, which embed additional CSS and images and always turn out to be much worse than standard Bootstrap buttons.</li></ol>
</div>
<div  >
    <h2>返回的clob和blob数据</h2>
    <div id="showinfo">
    </div>
</div>
<div>
     <input type="button" onclick="savehtml()"  value="保存html数据到后台"/>
</div>
</body>
</html>
<script>
    var  curopr="";
    var  curselectindex=-1;
    var curRow=[];

    $(function(){
        $('#mytab').bootstrapTable({
            url:'${pageContext.request.contextPath}/demos/basicQuery/list',
            search: true, //是否启用搜素
            showRefresh: true, //刷新按钮
            showPaginationSwitch: true,
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
            uniqueId: 'RN',
//            idField:'TAXREGCODE',
            clickToSelect: true, //是否启用点击选中行
            uniqueIS: "ppmxmc", //每一行的唯一标识，一般为主键列
            showToggle: "true", //切换视图
            showColumns: 'true', //是否显示内容列下拉框
            sidePagination:'server',
            onClickRow:function(row,$element){
                curRow=row;
//                console.log("row:",row);
            },
            columns: [
             {
                 field: '',
                 field: '',
                 align:'center',
                 checkbox:true,
                 width:'5%'  ,
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
                field: 'checkattribute',
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
//

    });


    //添加方法
    function btn_add(){
        console.log("aaa:",$('#mytab').bootstrapTable("getData"));
          curopr="添加";
        $.each($('#mytab tr'),function(index,value){
                   console.log("value:",$(value).find("td:eq(2) a").text());
                  if(index==3){
//                      console.log("indexs:",$(this).parent().html());
                      $(this).css("background-color","red");
                  }else{
                      $(this).css("background-color","");
                  }
        });
//          $("#editForm").find("input").val("");
//          $("#add").show().siblings().hide();
    }

    //修改数据方法
    function btn_edit(){
        curopr="修改";
        //获取选择的数据
        $("#editForm").find("input").val("");
        var allselecteddata= $("#mytab").bootstrapTable("getSelections");
        curselectindex=   allselecteddata[0].RN-1;
        console.log("options:",allselecteddata[0].RN);
        $("#edit_nsrmc").val(allselecteddata[0].taxpayername);
        $("#edit_gldm").val(allselecteddata[0].taxregcode);
        $("#edit_cjsj").val(allselecteddata[0].checkattribute);
        $("#edit_fr").val(allselecteddata[0].jurpname);
        $("#add").show().siblings().hide();
    }

    //添加修改页面保存方法
    function addsaves(){
         if(curopr=="添加"){
             $("#mytab").bootstrapTable("insertRow",
                     {index:0,
                         row:{taxpayername:$("#edit_nsrmc").val(),
                             taxregcode:$("#edit_gldm").val(),
                             checkattribute:$("#edit_cjsj").val(),
                             jurpname:$("#edit_fr").val()}
                     });

         }else if(curopr=="修改"){
             $("#mytab").bootstrapTable("updateRow",
                     {index:curselectindex,
                         row:{taxpayername:$("#edit_nsrmc").val(),
                             taxregcode:$("#edit_gldm").val(),
                             checkattribute:$("#edit_cjsj").val(),
                             jurpname:$("#edit_fr").val()}
                     });

         }
         $("#add").hide().siblings().show();

    }


    //删除
    function btn_delete(){
        //获取选中行
        var ids= $.map($("#mytab").bootstrapTable("getSelections"),function(row){return row.RN;});
        console.log("ids:",ids);
        if(ids.length!=1){
            alert("请选择一行删除!");
            return;
        }
        $('#mytab').bootstrapTable('remove',{field:'RN',values:ids});

    }

    //添加页面返回
    function showmains(){
        $("#add").hide().siblings().show();
    }

    //删除方法
    window.operateEvents={
         'click.remove':function(e,value,row,index){
             $("#mytab").bootstrapTable('remove',{
                 field:'RN',
                 values:[row['RN']]
             });
         }
    }


    //将表格数据和表单数据全部发送到后台
    function savedb(){
        //获取表格所有数据
        var tabdatas=$("#mytab").bootstrapTable("getData");
        //提交参数
        var parmssss= {nsrxxlist:JSON.stringify(tabdatas),nsrmc:'张合理光'};
        //提交url
        var myurl="${pageContext.request.contextPath}/demos/basicQuery/savedata";
        //成功方法
        var myfunctions=function(msg){
            alert( "Data Saved: " + msg );
        }

        console.log("parmssss:",JSON.stringify(parmssss));
        //提交数据
        $.myajax.common("post",
                parmssss ,
                myurl,
                myfunctions
        );

    }


   function  savehtml(){
       $.ajax({
           url: '${pageContext.request.contextPath}/demos/basicQuery/saveHtml',
           type: 'post',
           datatype:'html',
           data: {"jj": $("#test1").html()},
           success: function (data) {
               console.log(data);
               $("#showinfo").html(data[0].data2);
           }
       });
   }

</script>
