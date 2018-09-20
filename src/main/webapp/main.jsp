<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>
<!--[if IE 8]>
<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<![endif]-->
<!--[if IE 9]>
<![endif]-->

<html>
<head>
    <meta charset="utf-8">
    <title>智能数据处理系统</title>
    <meta name="description" content="mobile first, app, web app, responsive, admin dashboard, flat, flat ui">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/bootstrap.min.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/font-awesome.min.css">
    <link href="${ctx}/v20/new1/css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/plugin.css">
    <link rel="stylesheet" href="${ctx}/v20/new1/css/landing.css">

    <!-- echrts 3.0-->
    <%--<script src="${ctx}/v20/new1/js/echarts.min.js"></script>--%>
    <%--<script src="${ctx}/v20/new1/js/jquery-3.0.0.js"></script>--%>
    <!-- echrts 水球球-->
    <script src="${ctx}/v20/js/echarts.min.js"></script>
    <script src="${ctx}/v20/js/echarts-liquidfill.min.js"></script>


</head>
<body>
<!-- 系统头部 -->
<header id="header" class="navbar">
    <ul class="nav navbar-nav navbar-avatar pull-right">
        <li >
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <font color="#1e90ff">当前机关：</font><span id="theUserOrgName" class="hidden-sm-only"></span> &nbsp;&nbsp;&nbsp;&nbsp;
                <span id="theUserName" class="hidden-sm-only"></span>
                <span class="thumb-small avatar inline"><img src="${ctx}/v20/new1/images/avatar.jpg" alt="Mika Sokeil"
                                                             class="img-circle"></span>
                <b class="caret hidden-sm-only"></b>
            </a>
            <ul class="dropdown-menu" style="margin-left: 50%;text-align: center;">
                <li><a href="${ctx}/initlogin">演示模式</a></li>
                <%--<li><a href="signin.html">岗位切换</a></li>--%>
                <li><a href="${ctx}/login">退出系统</a></li>
            </ul>
        </li>
    </ul>
    <a class="navbar-brand" href="#" style="padding-left: 10px;">智能处理</a>
    <button type="button" class="btn btn-link pull-left nav-toggle hidden-lg"
            data-toggle="class:slide-nav slide-nav-left" data-target="body">
        <i class="icon-reorder icon-xlarge text-default"></i>
    </button>
    <ul class="nav navbar-nav hidden-sm">
        <li>
            <div class="m-t m-b-small" id="panel-notifications">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                        class="icon-comment-alt icon-xlarge text-default"></i><b
                        class="badge badge-notes bg-danger count-n">2</b></a>
                <section class="dropdown-menu m-l-small m-t-mini">
                    <section class="panel panel-large arrow arrow-top">
                        <header class="panel-heading bg-white">
                            <span class="h5"><strong>您有 <span  class="count-n">2</span>条最新提示</strong></span>
                        </header>
                        <div class="list-group list-group-flush m-t-n">
                            <a href="#" class="media list-group-item">
                                <span class="pull-left thumb-small">
                                    <img src="${ctx}/v20/images/avatar.jpg" alt="John said" class="img-circle"></span>
                                <span class="media-body block m-b-none"> 消息一：刚处理得国税数据已处理添加完毕！<br>
                                   <small class="text-muted">2018/5/8 21:31:06</small>
                                </span>
                            </a>
                        </div>
                        <footer class="panel-footer text-small">
                            <a href="#">西安数据智能处理系统消息列表</a>
                        </footer>
                    </section>
                </section>
            </div>
        </li>
        <%--<li><div class="m-t-small"><a class="btn btn-small btn-info" data-toggle="modal" href="#modal"><i class="icon-plus"></i>弹出实例</a></div></li>--%>
        <li class="dropdown shift" data-toggle="shift:appendTo" data-target=".nav-primary .nav">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                    class="icon-cog icon-xlarge visible-sm visible-sm-inline"></i>个性设置 <b
                    class="caret hidden-sm-only"></b></a>
            <ul class="dropdown-menu">
                <li>
                    <a href="#" data-toggle="class:navbar-fixed" data-target='body'>系统顶部
                        <span class="text-active">取消</span>
                        <span class="text">固定</span>
                    </a>
                </li>
                <li class="visible-lg">
                    <a href="#" data-toggle="class:nav-vertical" data-target="#nav">菜单
                        <span class="text-active">缩小</span>
                        <span class="text">拉伸</span>
                    </a>
                </li>
                <li class="divider hidden-sm"></li>
                <li>
                    <a href="#" data-toggle="class:bg bg-black" data-target='.navbar'>顶部
                        <span class="text-active">清爽版</span>
                        <span class="text">税务蓝</span>
                    </a>
                </li>
                <li>
                    <a href="#" data-toggle="class:bg-light" data-target='#nav'>菜单
                        <span class="text-active">清爽版</span>
                        <span class="text">税务蓝</span>
                    </a>
                </li>
            </ul>
        </li>
        <li class="dropdown shift" data-toggle="shift:appendTo" data-target=".nav-primary .nav">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i
                    class="icon-cog icon-xlarge visible-sm visible-sm-inline"></i>常用功能 <b
                    class="caret hidden-sm-only"></b></a>
            <ul class="dropdown-menu" id="cygnlist">
                <li>
                    <a href="#" data-toggle="class:navbar-fixed" data-target='body'>
                        <span class="text-active">取消</span>
                    </a>
                </li>
            </ul>
        </li>
        <li id="curpath"   data-target=".nav-primary .nav">
            <div style="width: 490px;height: 45px;">
                <div style='height: 45px;width:80px;vertical-align: middle;text-align: right;padding-top: 16px;float:left;'>当前位置：</div>
                <div id="contentss" style='height: 45px;width:300px;vertical-align: middle;text-align: left;padding-top: 16px;'>系统首页</div>
            </div>

        </li>
    </ul>
</header>
<!-- / header -->
<!-- nav -->
<nav id="nav" class="nav-primary visible-lg nav-vertical">
    <ul class="nav" data-spy="affix" data-offset-top="50">
        <li class="active"><a href="${ctx}/initlogin"><i class="icon-calendar"></i>系统首页</a></li>
        <li id="menu1" style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('sjzdpage','数据字典')"><i class="icon-book"></i>数据字典</a></li>
        <li id="menu2" style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('sqsppage','申请审批')"><i class="icon-edit"></i>申请审批</a></li>
        <li id="menu3"  style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('sjjhpage','数据交换')"><i class="icon-retweet "></i>数据交换</a></li>
        <li id="menu4"  style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('sjclpage','数据处理')"><i class="icon-signal "></i>数据处理</a></li>
        <li id="menu5"  style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('sjjgpage','数据加工')"><i class="icon-cog"></i>数据加工</a></li>
        <li id="menu6"  style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('sjyjpage','数据研究')"><i class="icon-beaker"></i>数据研究</a></li>
        <li id="menu7"  style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('zzfwzxpage','自助服务中心')"><i class="icon-star"></i>自助服务中心</a></li>
        <li id="menu8"  style="display: none;"><a href="javascript:void(0);" onclick="herfsrcs('xtgn','系统功能')"><i class="icon-star"></i>系统功能</a></li>
    </ul>
</nav>
<!-- / nav -->

<div style="padding-left: 100px;">
    <iframe id="mainifrme" frameborder="0" src="mainpage.jsp" height="890px" width="100%"></iframe>
</div>

<!-- .modal -->

<!-- / .modal -->
<!-- footer -->
<footer id="footer">
    <div class="text-center padder clearfix">
        <p>
            <small>&copy; 2018 西安市税务局 智能数据处理系统 版权所有</small>
        </p>
    </div>
</footer>
<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->
<script src="${ctx}/v20/new1/js/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="${ctx}/v20/new1/js/bootstrap.js"></script>
<!-- app -->
<script src="${ctx}/v20/new1/js/app.js"></script>
<script src="${ctx}/v20/new1/js/app.plugin.js"></script>
<script src="${ctx}/v20/new1/js/app.data.js"></script>
</body>
</html>
<script>
    $(function () {
        $.post("${ctx}/main/homepage/currentUserName", null, function (data) {
            $("#theUserOrgName").text(data.orgname);
            $("#theUserName").text(data.username);
        });

        //系统主菜单设置
        $.post("${ctx}/main/mains/querymodels", null, function (data) {
            var menusidstr="";
            for(var i=0;i<data.length;i++){
                if(i==0){
                    menusidstr=  "#menu"+data[i].MAINMENUID;
                }else{
                    menusidstr=menusidstr+",#menu"+data[i].MAINMENUID;
                }
            }
            $(menusidstr).show();
        });

        $.ajax({
            async: false,
            cache: false,
            type: 'post',
            datatType: "json",
            url: "${pageContext.request.contextPath}/main/mains/selectCygn",
            success : function(data){
                //初始化常用功能列表
                for(var i=0;i<data.length;i++){
                    var menus='<li><a href="#" onclick="mycommonmenu(\'${ctx}/' + data[i].URL + '\')" data-toggle="class:navbar-fixed" data-target="body">'+data[i].MODELNAME+'</a></li>';

                    $("#cygnlist").append(menus);
                }
            }

        });







    });

    //通用功能跳转页面
    function mycommonmenu(url){
        $("#mainifrme").attr("src", url);
    }

    setInterval(getinfolist(),1000);

    function herfsrcs(urls,gnname) {
        console.log("gnname:",gnname);
        $("#mainifrme").attr("src", urls + ".jsp");
    }

    function addNotification($notes){
        var $el = $('#panel-notifications'), $n = $('.count-n:first', $el), $item = $('.list-group-item:first', $el).clone(), $v = parseInt($n.text());
        $('.count-n', $el).fadeOut().fadeIn().text($v+1);
        $item.attr('href', $notes.link);
        $item.find('.pull-left').html($notes.icon);
        $item.find('.media-body').html($notes.title);
        $item.hide().prependTo($el.find('.list-group')).slideDown().css('display','block');
    }

    function getinfolist(){
        //弹出框
        $.post("${ctx}/main/mains/infolist","",function(data){

            if(data.infolist!="0"){
                var $noteMail = {
                    icon: '<i class="icon-envelope-alt icon-2x text-default"></i>',
                    title: "您在"+data.infolist[0].ZXSJ+"点，执行的任务："+data.infolist[0].RWMC+" 已经运行完成 ",
                    link: '#'
                }
                window.setTimeout(function(){addNotification($noteMail)}, 500);
            }
        });


    }

    //主菜单初始化访问路径
    function initModelPath(pathname){
        $("#contentss").html(pathname);
    }

    //    给当前地址添加子页面功能内容
    function addUrlsContent(chilecontent){
          $("#contentss").append("/"+chilecontent);
    }
</script>


