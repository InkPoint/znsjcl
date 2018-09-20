<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>

<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>自助服务中心</title>
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
<li data-index="1" style="display: none;">
    <div class="normal-inner">
        <div class="cloud-product-single-bottom clearfix">
            <div class="empty-space">
                <div class="bg-product-pic  server-header-02"></div>
            </div>
            <h2 class="product-introduce-title">数据导入</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="wjsccp"  value="文件上传"/></p>
            </div>
            <p class="product-introduce-price">
                用户自主上传文件并导入数据
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-02 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-02"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title">数据导入</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="wjsc"   value="文件上传"/></p>
            </div>
            <p class="product-introduce-price">
                用户自主上传文件并导入数据
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
            <h2 class="product-introduce-title">数据处理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="qxmxdzcp"   value="清洗模型定制"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="ppmxdzcp"   value="匹配模型定制"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="zdyrwclcp"    value="自定义任务处理"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="clrwyxjkcp"   value="处理任务运行监控"/></p>
            </div>
            <p class="product-introduce-price">
                自定义清洗模型定制和匹配模型定制，并且创建自定义任务运行数据处理逻辑。
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-02 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-02"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title">数据处理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="qxmxdz"  value="清洗模型定制"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="ppmxdz"   value="匹配模型定制"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="zdyrwcl"  value="自定义任务处理"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="clrwyxjk"   value="处理任务运行监控"/></p>
            </div>
            <p class="product-introduce-price">
                自定义清洗模型定制和匹配模型定制，并且创建自定义任务运行数据处理逻辑。
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
            <h2 class="product-introduce-title">人工匹配</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus"  id="rgppcp"     value="人工匹配"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus"  id="sdhccp"    value="实地核查"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus"  id="cyhccp"    value="抽样核查"/></p>
            </div>
            <p class="product-introduce-price">
                人工处理已经处理过的但是没有匹配上的数据
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-03 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-03"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">人工匹配</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="rgpp"   value="人工匹配"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="sdhc"  value="实地核查"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="cyhc" value="抽样核查"/></p>
            </div>
            <p class="product-introduce-price">
                人工处理已经处理过的但是没有匹配上的数据
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
            <h2 class="product-introduce-title">定义分析模型</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjyjmljscp"  value="数据元件目录检索"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjmxjscp" value="数据模型检索"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="zdyfxmxcp"  value="自定义分析模型"/></p>
            </div>
            <p class="product-introduce-price">
                对已有得清洗规则进行添加、查询，同时也可以自定义创建规则。
            </p>
        </div>
    </div>
    <div class="active-inner  active-inner-04 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-04"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">定义分析模型</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="sjyjmljs"   value="数据元件目录检索"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="sjmxjs"   value="数据模型检索"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="zdyfxmx"  value="自定义分析模型"/></p>
            </div>
            <p class="product-introduce-price">
                对已有得清洗规则进行添加、查询，同时也可以自定义创建规则。
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
            <h2 class="product-introduce-title">分析任务管理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="dzfxrwcp"  value="定制分析任务"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="rwyxjkcp" value="任务运行监控"/></p>
            </div>
            <p class="product-introduce-price">
                对已有得清洗规则进行添加、查询，同时也可以自定义创建规则。
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-05 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-05"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">分析任务管理</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="dzfxrw"   value="定制分析任务"/></p>
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="rwyxjk"   value="任务运行监控"/></p>
            </div>
            <p class="product-introduce-price">
                对已有得清洗规则进行添加、查询，同时也可以自定义创建规则。
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
            <h2 class="product-introduce-title">分析结果应用</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="fxjgcxdccp"   value="分析结果查询导出"/></p>
            </div>
            <p class="product-introduce-price">
                对已有得清洗规则进行添加、查询，同时也可以自定义创建规则。
            </p>
        </div>
    </div>
    <div class="active-inner active-inner-05 clearfix">
        <div class="active-inner-item">
            
            <div class="empty-space">
                <div class="bg-product-pic server-header-active-01"></div>
            </div>
            <h2 class="product-introduce-title active-product-introduce-title ">分析结果应用</h2>
            <div class="product-introduce-list">
                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="fxjgcxdc" value="分析结果查询导出"/></p>
            </div>
            <p class="product-introduce-price">
                对已有得清洗规则进行添加、查询，同时也可以自定义创建规则。
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
        parent.initModelPath("自助服务中心");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo",{mkstr:'7'},function(data){
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
            if(curval=="文件上传"){
                urls="zzfwzx/wjsc/initwjsc";
            }else if(curval=="清洗模型定制"){
                urls="zzfwzx/qxmxgl/initQxmxgl";
            }else if(curval=="匹配模型定制"){
                urls="zzfwzx/glppmx/initGlppmx";
            }else if(curval=="自定义任务处理"){
                urls="zzfwzx/zdyrwcl/initZdyrwcl";
            }else if(curval=="处理任务运行监控"){
                urls="zzfwzx/clrwyxjk/initClrwyxjk";
            }else if(curval=="人工匹配"){
                urls="zzfwzx/rgppcl/initRgppcl";
            }else if(curval=="实地核查"){
                urls="zzfwzx/rgppcl/initSdhc";
            }else if(curval=="抽样核查"){
                urls="zzfwzx/rgppcl/initCyhc";
            }else if(curval=="数据元件目录检索"){
                urls="zzfwzx/yjjs/initYjjs";
            }else if(curval=="数据模型检索"){
                urls="zzfwzx/sjmxjs/initSjmxjs";
            }else if(curval=="自定义分析模型"){
                urls="zzfwzx/fxrwdz/initFxrwdz";
            }else if(curval=="定制分析任务"){
                urls="zzfwzx/fxrwdz/initFxrwdz";
            }else if(curval=="任务运行监控"){
                urls="zzfwzx/fxrwjk/initFxrwjk";
            }else if(curval=="分析结果查询导出"){
                urls="zzfwzx/fxjgdc/initFxjgdc";
            }
            window.location.href="${ctx}/"+urls;
        });
    });

</script>