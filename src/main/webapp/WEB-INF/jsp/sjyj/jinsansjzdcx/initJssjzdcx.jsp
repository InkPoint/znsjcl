<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>金三数据字典查询</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <style>
        .items{height:25px;}
    </style>
</head>
<body>
    <div class="page-body">
        <div class="row" >

            <div class="col-lg-2 col-sm-2 col-xs-2 col-md-2" style="text-align: center;height:800px;padding-top: 10px;">
                <div class="panel panel-default" style="width:100%;height:100%;">
                    <div class="panel-heading"><h3 class="panel-title">金三数据字典菜单</h3></div>
                    <div class="panel-body">
                        <div class="items"><a href="#" onclick="goes('djl')">登记类</a></div>
                        <div class="items"><a href="#" onclick="goes('fpl')">发票类</a></div>
                        <div class="items"><a href="#" onclick="goes('yhl')">优惠类</a></div>
                        <div class="items"><a href="#" onclick="goes('rdl')">认定类</a></div>
                        <div class="items"><a href="#" onclick="goes('zml')">证明类</a></div>
                        <div class="items"><a href="#" onclick="goes('sbl')">申报类</a></div>
                        <div class="items"><a href="#" onclick="goes('zsl')">征收类</a></div>
                        <div class="items"><a href="#" onclick="goes('pzl')">票证类</a></div>
                        <div class="items"><a href="#" onclick="goes('fzl')">法制类</a></div>
                        <div class="items"><a href="#" onclick="goes('jcl')">稽查类</a></div>
                        <div class="items"><a href="#" onclick="goes('pgl')">评估类</a></div>
                        <div class="items"><a href="#" onclick="goes('zhl')">综合类</a></div>
                        <div class="items"><a href="#" onclick="goes('gzl')">工作流</a></div>
                        <div class="items"><a href="#" onclick="goes('cxl')">查询类</a></div>
                        <div class="items"><a href="#" onclick="goes('qgcs')">全国参数</a></div>
                        <div class="items"><a href="#" onclick="goes('qgdm')">全国代码</a></div>
                        <div class="items" ><a href="#" onclick="goes('zdycs')">自定义参数</a></div>
                        <div class="items"><a href="#" onclick="goes('zdydm')">自定义代码</a></div>
                        <div class="items"><a href="#" onclick="goes('qxdm')">权限代码</a></div>
                        <div class="items"><a href="#" onclick="goes('qbsjzd')">全部数据字典</a></div>
                        <div class="items"><a href="#" onclick="goes('xzb')">新增表</a></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-10 col-sm-10 col-xs-10 col-md-10" style="text-align: center;height:1000px;">

                <div class="panel panel-body">
                    <iframe id="myframes"  frameborder="0" style="border:1; width:100%; height:4500px; overflow:show;"  class="iframe" marginheight="10"  scrolling="no"  src="../../jinsan/djl.html"></iframe>
                </div>
            </div>
        </div>
    </div>
</body>
<!--Basic Scripts-->
<script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>

</html>
<script>
    function gohistory(){
        window.location.href="${pageContext.request.contextPath}/sjyjpage.jsp";
    }
    //跳转到具体字典页面
    function goes(myurlname){
            if(myurlname=="qbsjzd"){
                $("#myframes").attr("src","${pageContext.request.contextPath}/sjyj/jinsansjzdcx/alltabs");
            }else{
                $("#myframes").attr("src","../../jinsan/"+myurlname+".html");
            }

    }
</script>

