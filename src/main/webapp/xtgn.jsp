<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>

<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>系统功能</title>
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
                <li data-index="1" class="active" style="display: none;">
                <div class="normal-inner">
                    <div class="cloud-product-single-bottom clearfix">
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-01"></div>
                        </div>
                        <h2 class="product-introduce-title">日志记录</h2>

                        <div class="product-introduce-list">
                            <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"  id="rzjlcp"  value="日志记录"/></p>
                        </div>
                        <p class="product-introduce-price">
                            工作人员使用此功能来记录日志。
                        </p>
                    </div>
                </div>


                <div class="active-inner active-inner-01 clearfix">
                    <div class="active-inner-item">
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-active-01"></div>
                        </div>
                        <h2 class="product-introduce-title active-product-introduce-title ">日志记录</h2>
                        <div class="product-introduce-list">
                            <p class="introduce-list-large">
                            <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus"   id="rzjl"    value="日志记录"/></p>
                            </p>
                        </div>
                        <p class="product-introduce-price">
                            工作日志是指针对自己的工作，每天记录工作的内容、所花费的时间以及在工作过程中遇到的问题，解决问题的思路和方法。
                        </p>
                    </div>
                </div>
            </li>
            <li data-index="2" style="display: none;">
                <div class="normal-inner">
                    <div class="cloud-product-single-bottom clearfix">
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-02"></div>
                        </div>
                        <h2 class="product-introduce-title">权限配置</h2>

                        <div class="product-introduce-list">
                            <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="qxpzcp"  value="权限配置"/></p>
                        </div>
                        <p class="product-introduce-price">
                            系统管理人员使用此功能配置权限。
                        </p>
                    </div>
                </div>


                <div class="active-inner active-inner-02 clearfix">
                    <div class="active-inner-item">
                        
                        <div class="empty-space">
                            <div class="bg-product-pic server-header-active-02"></div>
                        </div>
                        <h2 class="product-introduce-title active-product-introduce-title ">权限配置</h2>
                        <div class="product-introduce-list">
                            <p class="introduce-list-large">
                            <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="qxpz"  value="权限配置"/></p>
                            </p>
                        </div>
                        <p class="product-introduce-price">
                            系统管理人员使用此功能配置权限。
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
                    e.addClass("active");
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
        //设置当前访问路径
        parent.initModelPath("系统功能");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo",{mkstr:'8'},function(data){
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
         });

        //菜单项单击事件
        $("#content .btnlist").click(function(){
            var  urls="";
            var curval=$(this).val();
            parent.addUrlsContent(curval);
//            数据来源管理
            if(curval=="日志记录"){
                // 原工作日志路径
                // urls="zzfwzx/yhrz/initCkrz";
                urls="sjsplc/log/initViewLog";
            }else if(curval=="权限配置"){
                urls="main/permissionconfig/initqxkz";
            }
            window.location.href="${ctx}/"+urls;
        });
    });

</script>
