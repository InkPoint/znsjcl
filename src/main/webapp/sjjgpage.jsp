<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>
<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>数据加工</title>
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
                <ul class="cloud-product-ul clearfix" style="margin: 0 auto; width:830px;">
                    <li data-index="1" class="active" style="display: none;">
                        <div class="normal-inner">
                            <div class="cloud-product-single-bottom clearfix">
                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-01"></div>
                                </div>
                                <h2 class="product-introduce-title">元件管理</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="yjglcp" value="元件管理"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="yjjscp" value="元件检索"/></p>
                                </div>
                                <p class="product-introduce-price">
                                    元件是定义数据处理结果最小归类单位，元件管理是管理元件添加、修改和删除的地方。通过添加元件增加元件的更多元件类别。
                                </p>
                            </div>
                        </div>


                        <div class="active-inner active-inner-01 clearfix">
                            <div class="active-inner-item">

                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-01"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title ">元件管理</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-large">

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="yjgl" value="元件管理"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="yjjs" value="元件检索"/></p>
                                    </p>
                                </div>
                                <p class="product-introduce-price">
                                    元件是定义数据处理结果最小归类单位，元件管理是管理元件添加、修改和删除的地方。通过添加元件增加元件的更多元件类别。
                                </p>
                            </div>
                        </div>
                    </li>
                    <li data-index="2" style="display: none;">
                        <div class="normal-inner">
                            <div class="cloud-product-single-bottom clearfix">
                                <div class="empty-space">
                                    <div class="bg-product-pic  server-header-02"></div>
                                </div>
                                <h2 class="product-introduce-title">元件需求管理</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="yjmxyfcp" value="元件模型研发"/></p>
                                </div>
                                <p class="product-introduce-price">
                                    对申请人员提出的元件模型需求进行研发。
                                </p>
                            </div>
                        </div>
                        <div class="active-inner active-inner-02 clearfix">
                            <div class="active-inner-item">

                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-02"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title">元件需求管理</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="yjmxyf" value="元件模型研发"/></p>
                                </div>
                                <p class="product-introduce-price">
                                    对申请人员提出的元件模型需求进行研发。
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
                                <h2 class="product-introduce-title">元件加工</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="jgmxglcp" value="加工模型管理"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="jgrwglcp" value="加工任务管理"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="sjyzcp" value="数据验证"/></p>
                                </div>
                                <p class="product-introduce-price">
                                    元件加工是将数据元件封装为加工模型通过任务定制化产生元件的过程。
                                </p>
                            </div>
                        </div>
                        <div class="active-inner active-inner-03 clearfix">
                            <div class="active-inner-item">

                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-03"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title ">元件加工</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="jgmxgl" value="加工模型管理"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="jgrwgl" value="加工任务管理"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="sjyz" value="数据验证"/></p>
                                </div>
                                <p class="product-introduce-price">
                                     元件加工是将数据元件封装为加工模型通过任务定制化产生元件的过程。
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
                                <h2 class="product-introduce-title">数据产品中心</h2>

                                <div class="product-introduce-list" style="height: 230px;">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="rwssfkcp" value="任务实施反馈"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="rwjdjkcp" value="任务进度监控"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="sjcpztcp" value="数据产品主题"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="sjcpcxcp" value="数据产品查询"/></p>
                                </div>
                                <p class="product-introduce-price">
                                   数据产品的实施生成和自定义数据主题的数据的查询。
                                </p>
                            </div>
                        </div>
                        <div class="active-inner  active-inner-04 clearfix">
                            <div class="active-inner-item">

                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-04"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title ">数据产品中心</h2>

                                <div class="product-introduce-list" style="height: 230px;">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="rwssfk" value="任务实施反馈"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="rwjdjk" value="任务进度监控"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="sjcpzt" value="数据产品主题"/></p>

                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus"
                                                                           id="sjcpcx" value="数据产品查询"/></p>
                                </div>
                                <p class="product-introduce-price">
                                    数据产品的实施生成和自定义数据主题的数据的查询。
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
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                            class="icon-remove"></i></button>
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
                    <button type="button" class="btn btn-small btn-primary" data-loading-text="Publishing...">保存
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
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
    $(document).ready(function () {
        var c = 1;
        $(".cloud-product-ul>li").mouseenter(function () {
            var e = $(this);
            c = e.data("index");
            var e = $(this);
            setTimeout(function () {
                if (c == e.data("index")) {
                    $(".cloud-product-ul>li").removeClass("active");
                    e.addClass("active")
                }
            }, 120)
        });

    });
</script>
</body>
</html>
<script>
    $(function () {
        //设置当前访问路径
        parent.initModelPath("数据加工");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo", {mkstr: '5'}, function (data) {
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
        $("#content .btnlist").click(function () {
            var urls = "";
            var curval = $(this).val();
            parent.addUrlsContent(curval);
//            数据来源管理
            if (curval == "元件管理") {
                urls = "sjjg/yjgl/initYjgl";
            } else if (curval == "元件检索") {
                urls = "sjjg/yjjs/initYjjs";
            } else if (curval == "元件模型研发") {
                urls = "sjjg/yjmxyf/initYjmxyf";
            } else if (curval == "加工模型管理") {
                urls = "sjjg/jgmxgl/initJgmxgl";
            } else if (curval == "加工任务管理") {
                urls = "sjjg/jgrwgl/initJgrwgl";
            } else if (curval == "任务实施反馈") {
                urls = "sjjg/rwssfk/initRwssfk";
            } else if (curval == "任务进度监控") {
                urls = "sjjg/rwjdjk/initRwjdjk";
            } else if (curval == "数据产品主题") {
                urls = "sjyj/sjcpzt/initsjcpztxz";
            } else if (curval == "数据产品查询") {
                urls = "sjjg/sjcpzx/initSjcpsy";
            } else if (curval == "数据验证") {
                urls = "sjjg/sjyz/initSjyz";
            }
            window.location.href = "${ctx}/" + urls;
        });
    });

</script>