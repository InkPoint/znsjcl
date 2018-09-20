<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>

<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>菜单选项</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/bootstrap.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/font-awesome.min.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/style.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/plugin.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/landing.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/select.css">

    <!-- echrts 3.0-->
    <script src="${ctx}/v20/new1/js/echarts.min.js"></script>
    <script src="${ctx}/v20/new1/js/jquery-3.0.0.js"></script>
    <!-- echrts 水球球-->

    <script src="${ctx}/v20/new1/js/echarts-liquidfill.min.js"></script>

    <!--[if lt IE 9]>
    <script src="${ctx}/v20/new1/js/ie/respond.min.js"></script>
    <script src="${ctx}/v20/new1/js/ie/html5.js"></script>
    <![endif]-->
</head>
<body>
<!-- select开始 -->
<section id="content" style="margin:auto;">
<div class="cloud-product-box">
    <div class="cloud-product-wrapper">
        <div class="cloud-product">
            <ul class="cloud-product-ul clearfix">
                <li data-index="1" style="display: none;" class="active">
                <div class="normal-inner">
                    <div class="cloud-product-single-bottom clearfix">
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-01"></div>
                        </div>
                        <h2 class="product-introduce-title">数据来源管理</h2>

                        <div class="product-introduce-list">
                            <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"  id="sjlyglcp"  value="数据来源管理"/></p>
                        </div>
                        <p class="product-introduce-price">
                            数据来源管理是对所有外来的数据和金三数据根据其来源进行分类管理。
                        </p>
                    </div>
                </div>


                <div class="active-inner active-inner-01 clearfix">
                    <div class="active-inner-item">
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-active-01"></div>
                        </div>
                        <h2 class="product-introduce-title active-product-introduce-title ">数据来源管理</h2>
                        <div class="product-introduce-list">
                            <p class="introduce-list-large">
                            <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus"   id="sjlygl"    value="数据来源管理"/></p>
                            </p>
                        </div>
                        <p class="product-introduce-price">
                            数据来源管理是对所有外来的数据和金三数据根据其来源进行分类管理。
                        </p>
                    </div>
                </div>
            </li>
                <li data-index="2" style="display: none;"   >
                <div class="normal-inner">
                    <div class="cloud-product-single-bottom clearfix">
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-02"></div>
                        </div>
                        <h2 class="product-introduce-title">数据级别管理</h2>

                        <div class="product-introduce-list">
                            <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjjbglcp"  value="数据级别管理"/></p>
                        </div>
                        <p class="product-introduce-price">
                            数据级别管理是对系统的所有业务数据进行归类划分等级。
                        </p>
                    </div>
                </div>


                <div class="active-inner active-inner-02 clearfix">
                    <div class="active-inner-item">
                        
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-active-02"></div>
                        </div>
                        <h2 class="product-introduce-title active-product-introduce-title ">数据级别管理</h2>
                        <div class="product-introduce-list">
                            <p class="introduce-list-large">
                            <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjjbgl"  value="数据级别管理"/></p>
                            </p>
                        </div>
                        <p class="product-introduce-price">
                            数据级别管理是对系统的所有业务数据进行归类划分等级。
                        </p>
                    </div>
                </div>
            </li>
                <li data-index="3" style="display: none;"   >
                    <div class="normal-inner">
                        <div class="cloud-product-single-bottom clearfix">
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-03"></div>
                            </div>
                            <h2 class="product-introduce-title">业务标签管理</h2>

                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ywbqglcp"  value="业务标签管理"/></p>
                            </div>
                            <p class="product-introduce-price">
                                业务标签管理是针对系统的业务数据表添加数据标识方便对系统涉及的业务数据进行快速检索而设立的功能。
                            </p>
                        </div>
                    </div>


                    <div class="active-inner active-inner-03 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-02"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">业务标签管理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-large">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="ywbqgl"   value="业务标签管理"/></p>
                                </p>
                            </div>
                            <p class="product-introduce-price">
                                业务标签管理是针对系统的业务数据表添加数据标识方便对系统涉及的业务数据进行快速检索而设立的功能。
                            </p>
                        </div>
                    </div>
                </li>
                <li data-index="4" style="display: none;"   >
                    <div class="normal-inner">
                        <div class="cloud-product-single-bottom clearfix">
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-04"></div>
                            </div>
                            <h2 class="product-introduce-title">批次管理</h2>

                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="pcglcp"    value="批次管理"/></p>
                            </div>
                            <p class="product-introduce-price">
                                批次是针对系统处理过程中相同类型的数据做处理，区分不同批次而设置的。
                            </p>
                        </div>
                    </div>


                    <div class="active-inner active-inner-04 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-04"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">批次管理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-large">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="pcgl"    value="批次管理"/></p>
                                </p>
                            </div>
                            <p class="product-introduce-price">
                                批次是针对系统处理过程中相同类型的数据做处理，区分不同批次而设置的。
                            </p>
                        </div>
                    </div>
                </li>
                <li data-index="5" style="display: none;"   >
                    <div class="normal-inner">
                        <div class="cloud-product-single-bottom clearfix">
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-05"></div>
                            </div>
                            <h2 class="product-introduce-title">分区管理</h2>

                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fqglcp"  value="分区管理"/></p>
                            </div>
                            <p class="product-introduce-price">
                                分区管理是将系统的业务数据划分为大概几个区域：如原始数据区域、数据加工区域、数据研究区域、数据处理区域。
                            </p>
                        </div>
                    </div>


                    <div class="active-inner active-inner-05 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-05"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">分区管理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-large">
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="fqgl"  value="分区管理"/></p>
                                </p>
                            </div>
                            <p class="product-introduce-price">
                                分区管理是将系统的业务数据划分为大概几个区域：如原始数据区域、数据加工区域、数据研究区域、数据处理区域。
                            </p>
                        </div>
                    </div>
                </li>
                <li data-index="6" style="display: none;"   >
                    <div class="normal-inner">
                        <div class="cloud-product-single-bottom clearfix">
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-05"></div>
                            </div>
                            <h2 class="product-introduce-title">数据对象管理</h2>

                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="sjdxglcp"  value="数据对象管理"/></p>
                            </div>
                            <p class="product-introduce-price">
                                数据对象管理是对所有系统创建的表进行管理方便管理系统的表结构，通过数据对象创建的表是唯一入口。
                            </p>
                        </div>
                    </div>


                    <div class="active-inner active-inner-05 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-05"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">数据对象管理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-large">
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="sjdxgl"  value="数据对象管理"/></p>
                                </p>
                            </div>
                            <p class="product-introduce-price">
                                数据对象管理是对所有系统创建的表进行管理方便管理系统的表结构，通过数据对象创建的表是唯一入口。
                            </p>
                        </div>
                    </div>
                </li>
                <li data-index="7"  style="display: none;"  >
                    <div class="normal-inner">
                        <div class="cloud-product-single-bottom clearfix">
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-05"></div>
                            </div>
                            <h2 class="product-introduce-title">数据对象监控</h2>

                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjdxjkcp"   value="数据对象监控"/></p>
                            </div>
                            <p class="product-introduce-price">
                                数据对象监控是监控没有通过系统入口（数据对象管理）建表的表信息，通过其他途径直接建表的数据对象进行监控。
                            </p>
                        </div>
                    </div>


                    <div class="active-inner active-inner-05 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-05"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">数据对象监控</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-large">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="sjdxjk"     value="数据对象监控"/></p>
                                </p>
                            </div>
                            <p class="product-introduce-price">
                                数据对象监控是监控没有通过系统入口（数据对象管理）建表的表信息，通过其他途径直接建表的数据对象进行监控。
                            </p>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>


</section>
<!-- .modal -->
<div id="modal" class="modal fade">
    <form class="m-b-none">
        <div class="modal-dialog pos-abt" style="margin-top:-235px; top:50%">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="icon-remove"></i></button>
                    <h4 class="modal-title" id="myModalLabel">弹出标题</h4>
                </div>
                <div class="modal-body">
                    <div class="block">
                        <label class="control-label">标题</label>
                        <input type="text" class="form-control" placeholder="Post title">
                    </div>
                    <div class="block">
                        <label class="control-label">内容</label>
                        <textarea class="form-control" placeholder="Content" rows="5"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-small btn-default" data-dismiss="modal">取消</button>
                    <button type="button" class="btn btn-small btn-primary" data-loading-text="Publishing...">保存</button>
                </div>
            </div><!-- /.modal-content -->
        </div>
    </form>
</div>
<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->
<script src="${ctx}/v20/new1/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ctx}/v20/new1/js/bootstrap.js"></script>
<!-- app -->
<script src="${ctx}/v20/new1/js/app.js"></script>
<script src="${ctx}/v20/new1/js/app.plugin.js"></script>
<script src="${ctx}/v20/new1/js/app.data.js"></script>
<!--  select css3菜单选项-->
<script type="text/javascript" src="${ctx}/v20/new1/js/jquery.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        var c=1;
        $(".cloud-product-ul>li").mouseenter(function(){
            var e=$(this);
            c=e.data("index");
            var e=$(this);
            setTimeout(function(){
                if(c==e.data("index")){
                    $(".cloud-product-ul>li").removeClass("active");
                    e.addClass("active")
                }
            },120)
        });

    });


//    $(function(){
//        $(".btnlist").click(function(){
//            alert(this.value);
//        });
//
//    });


</script>
</body>
</html>
<script>
    $(function(){
        parent.initModelPath("数据字典");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo",{mkstr:'1'},function(data){
               $(".cloud-product-ul li").each(function(index1,datas1){
                       //获取所有input的id
                      var $li=$(this);
                      var idlist="";      //li里面的id字符串
                      var idflages="0";
                      $li.find("input").each(function(index2,datas2){
                              idlist=idlist+","+$(this).attr("id");
                              //和data里面的数据比对
                              var menuids=$(this).attr("id");
                              if(menuids.indexOf("cp")>0){
                                  menuids= menuids.substr(0,menuids.indexOf("cp"));
                              }
                              if(JSON.stringify(data).indexOf(menuids)>0){
                                  $("#"+menuids).show();
                                  $("#"+menuids+"cp").show();
                                  idflages="1";
                              }else{
                                  $("#"+menuids+",#"+menuids+"cp").hide();
                              }

                      });
                      //设置li可现性
                      if(idflages=="1"){
                          $li.show();
                      }


               });
//               console.log("权限数据：",JSON.stringify(data));
               //将没有权限的隐藏
//               $("input[name='menus']").each(function(index,datas){
//                   var menuids=$(datas).attr("id");
//                   if(menuids.indexOf("cp")>0){
//                       menuids= menuids.substr(0,menuids.indexOf("cp"));
////                       console.log("menuids:",menuids);
//                   }
//                   if(JSON.stringify(data).indexOf(menuids)<0){
//                        $("#"+menuids).hide();
//                        $("#"+menuids+"cp").hide();
//                   }
//               });
         });

        //菜单项单击事件
        $("#content .btnlist").click(function(){
            var  urls="";
            var curval=$(this).val();
            parent.addUrlsContent(curval);
//            数据来源管理
            if(curval=="数据来源管理"){
                urls="sjzd/sjlygl/initSjlygl";
            }else if(curval=="数据级别管理"){
                urls="sjzd/sjjbgl/initSjjbgl";
            }else if(curval=="业务标签管理"){
                urls="sjzd/ywbqgl/initYwbqgl";
            }else if(curval=="批次管理"){
                urls="sjzd/sjpcgl/initSjpcgl";
            }else if(curval=="分区管理"){
                urls="sjzd/sjfqgl/initSjfqgl";
            }else if(curval=="数据对象管理"){
                urls="sjzd/sjdxgl/initSjdxgl";
            }else if(curval=="数据对象监控"){
                urls="sjzd/sjdxjk/initSjdxjk";
            }
            window.location.href="${ctx}/"+urls;
        });
    });

</script>
