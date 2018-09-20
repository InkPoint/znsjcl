<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>

<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>数据研究</title>
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
<section id="content">
<div class="cloud-product-box">
<div class="cloud-product-wrapper">
<div class="cloud-product">
<ul class="cloud-product-ul clearfix">
<li data-index="1" class="active" style="display: none;">
    <div class="normal-inner">
        <div class="cloud-product-single-bottom clearfix">
            <div class="empty-space">
                <div class="bg-product-pic server-header-01"></div>
            </div>
            <h2 class="product-introduce-title">数据状况分析</h2>

            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjzyzkcxcp"   value="数据资源状况查询"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="jssjzdcxcp"   value="金三数据字典查询"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="sjzyzkbgcp"   value="数据资源状况报告"/></p>
            </div>
            <p class="product-introduce-price">
                对系统来的外部数据资源,及金三数据数据字典、数据资源状况报告进行查询。
            </p>
        </div>
    </div>


    <div class="active-inner active-inner-01 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-01"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">数据状况分析</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-large">
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="sjzyzkcx"   value="数据资源状况查询"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="jssjzdcx"   value="金三数据字典查询"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="sjzyzkbg"   value="数据资源状况报告"/></p>
                </p>
            </div>
            <p class="product-introduce-price">
                对系统来的外部数据资源,及金三数据数据字典、数据资源状况报告进行查询。
            </p>
        </div>
    </div>
</li>
<li data-index="3" style="display: none;">
    <div class="normal-inner">
        <div class="cloud-product-single-bottom clearfix">
            <div class="empty-space">
                <div class="bg-product-pic  server-header-03"></div>
            </div>
            <h2 class="product-introduce-title">分析模型管理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="fxmxyfcp"  value="分析模型研发"/></p>
            </div>
            <p class="product-introduce-price">
               对申请人员提出的分析模型进行研发。
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-03 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-03"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">分析模型管理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxmxyf"    value="分析模型研发"/></p>
            </div>
            <p class="product-introduce-price">
                对申请人员提出的分析模型进行研发。
            </p>
        </div>
    </div>
</li>
<li data-index="4" style="display: none;">
    <div class="normal-inner">
        <div class="cloud-product-single-bottom clearfix">
            <div class="empty-space">
                <div class="bg-product-pic  server-header-04"></div>
            </div>
            <h2 class="product-introduce-title">分析任务管理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxrwdzcp"    value="分析任务定制"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxrwjkcp"   value="分析任务监控"/></p>
            </div>
            <p class="product-introduce-price">
                分析任务定制是定制数据分析需要处理的任务，通过执行定制任务产生分析结果。
            </p>
        </div>
    </div>
    <div class="active-inner  active-inner-04 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-04"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">分析任务管理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="fxrwdz"  value="分析任务定制"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="fxrwjk"  value="分析任务监控"/></p>
            </div>
            <p class="product-introduce-price">
                分析任务定制是定制数据分析需要处理的任务，通过执行定制任务产生分析结果。
            </p>
        </div>
    </div>
</li>
<li data-index="5" style="display: none;">
    <div class="normal-inner">
        <div class="cloud-product-single-bottom clearfix">
            <div class="empty-space">
                <div class="bg-product-pic server-header-05"></div>
            </div>
            <h2 class="product-introduce-title">分析结果反馈</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="fxjgfkcp"    value="分析结果反馈"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="sjyzcp"    value="数据验证"/></p>
            </div>
            <p class="product-introduce-price">
                实施人员实时动态的将数据结果反馈给用户，通过分析结果反馈用户可以了解数据分析进度。
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-05 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-05"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">分析结果反馈</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxjgfk"    value="分析结果反馈"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjyz"  value="数据验证"/></p>
            </div>
            <p class="product-introduce-price">
                实施人员实时动态的将数据结果反馈给用户，通过分析结果反馈用户可以了解数据分析进度。
            </p>
        </div>
    </div>
</li>
<li data-index="6" style="display: none;">
    <div class="normal-inner">
        <div class="cloud-product-single-bottom clearfix">
            <div class="empty-space">
                <div class="bg-product-pic server-header-01"></div>
            </div>
            <h2 class="product-introduce-title">自助分析</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxmxjscp"   value="数据模型检索"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="zdyfxmxcp"  value="自定义分析模型"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="bdcsjcxcp"  value="不动产数据查询"/></p>
            </div>
            <p class="product-introduce-price">
                用户将数据元件通过逻辑运算自定义出来的模型。通过自定义模型用户可以自由的组合元件产生自己想要的结果。
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-05 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-01"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">自助分析</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxmxjs"   value="数据模型检索"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="zdyfxmx"   value="自定义分析模型"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="bdcsjcx"   value="不动产数据查询"/></p>
            </div>
            <p class="product-introduce-price">
                用户将数据元件通过逻辑运算自定义出来的模型。通过自定义模型用户可以自由的组合元件产生自己想要的结果。
            </p>
        </div>
    </div>
</li>
<li data-index="7" style="display: none;">
    <div class="normal-inner">
        <div class="cloud-product-single-bottom clearfix">
            <div class="empty-space">
                <div class="bg-product-pic server-header-02"></div>
            </div>
            <h2 class="product-introduce-title">分析结果应用</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxjgdccp"   value="分析结果导出"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxbgyfcp"  value="分析报告"/></p>
            </div>
            <p class="product-introduce-price">
                将系统已经分析好的结果按条件查询并导出。
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-05 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-02"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">分析结果应用</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxjgdc" value="分析结果导出"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxbgyf"  value="分析报告"/></p>
            </div>
            <p class="product-introduce-price">
                将系统已经分析好的结果按条件查询并导出。
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
</script>
</body>
</html>

<script>
    $(function(){
        //设置当前访问路径
        parent.initModelPath("数据研究");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo",{mkstr:'6'},function(data){
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
                    } else{
                        $("#"+menuids+",#"+menuids+"cp").hide();
                    }
                });
                //设置li可现性
                if(idflages=="1"){
                    $li.show();
                }
            });
        });

        //菜单项单击事件
        $("#content .btnlist").click(function(){
            var  urls="";
            var curval=$(this).val();
            parent.addUrlsContent(curval);
//            数据来源管理
            if(curval=="数据资源状况查询"){
                urls="sjyj/sjzyzkcx/initSjzyzkcx";
            }else if(curval=="金三数据字典查询"){
                urls="sjyj/jinsansjzdcx/initJssjzdcx";
            }else if(curval=="分析模型研发"){
                urls="sjyj/fxmxyf/initFxmxyf";
            }else if(curval=="数据模型检索"){
                urls="sjyj/sjmxjs/initSjmxjs";
            }else if(curval=="自定义分析模型"){
                urls="common/maintain.jsp";
            }else if(curval=="分析任务定制"){
                urls="sjyj/fxrwdz/initFxrwdz";
            }else if(curval=="分析任务监控"){
                urls="sjyj/fxrwjk/initFxrwjk";
            }else if(curval=="分析结果导出"){
                urls="sjyj/fxjgdc/initFxjgdc";
            }else if(curval=="分析报告"){
                urls="sjyj/fxbgyf/initfxbgyf";
            }else if(curval=="分析结果反馈"){
                urls="sjyj/fxjgfk/initFxjgfk";
            }else if(curval=="数据资源状况报告"){
                urls="sjyj/sjzyzkbg/initSjzyzkbg";
            }else if(curval=="数据验证"){
                urls="sjyj/sjyz/initSjyz";
            } else if(curval=="不动产数据查询"){
                urls="sjyj/bdccx/initBdccx";
            }


            window.location.href="${ctx}/"+urls;
        });
    });

</script>
