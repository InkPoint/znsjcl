<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>
<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>数据处理</title>
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
                                <div class="bg-product-pic server-header-01"></div>       -
                            </div>
                            <h2 class="product-introduce-title">清洗模型管理</h2>

                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="qxgzglcp"  value="清洗规则管理"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="qxzbglcp"  value="清洗指标管理"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="qxmxglcp"  value="清洗模型管理"/></p>
                            </div>
                            <p class="product-introduce-price">
                                对清洗规则、清洗指标、清洗模型进行创建。为自定义任务处理提供支撑。
                            </p>
                        </div>
                    </div>


                    <div class="active-inner active-inner-01 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-01"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">清洗模型管理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-large">
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="qxgzgl"  value="清洗规则管理"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="qxzbgl" value="清洗指标管理"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"    name="menus" id="qxmxgl" value="清洗模型管理"/></p>
                                </p>
                            </div>
                            <p class="product-introduce-price">
                                对清洗规则、清洗指标、清洗模型进行创建。为自定义任务处理提供支撑。
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
                            <h2 class="product-introduce-title">匹配模型管理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ppgzglcp"   value="匹配规则管理"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ppmxglcp"  value="匹配模型管理"/></p>
                            </div>
                            <p class="product-introduce-price">
                                对匹配规则、匹配模型的创建。为自定义任务处理提供支撑。
                            </p>
                        </div>
                    </div>
                    <div class="active-inner active-inner-02 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-02"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title">匹配模型管理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ppgzgl"   value="匹配规则管理"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ppmxgl"   value="匹配模型管理"/></p>
                            </div>
                            <p class="product-introduce-price">
                                对匹配规则、匹配模型的创建。为自定义任务处理提供支撑。
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
                            <h2 class="product-introduce-title">系统处理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="dzxtdsclrwcp"   value="定制系统定时处理任务"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="xtrwyxjkcp"  value="系统任务运行监控"/></p>
                            </div>
                            <p class="product-introduce-price">
                                创建和执行定时处理系统任务，主要针对周期性处理需求而设定。
                            </p>
                        </div>
                    </div>
                    <div class="active-inner active-inner-03 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-03"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">系统处理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="dzxtdsclrw"  value="定制系统定时处理任务"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="xtrwyxjk"    value="系统任务运行监控"/></p>
                            </div>
                            <p class="product-introduce-price">
                                创建和执行定时处理系统任务，主要针对周期性处理需求而设定。
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
                            <h2 class="product-introduce-title">自主处理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="zdyclrwcp"  value="自定义处理任务"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="clrwyxjkcp"  value="处理任务运行监控"/></p>
                            </div>
                            <p class="product-introduce-price">
                                用户根据业务需要自主的处理数据（清洗和匹配）。
                            </p>
                        </div>
                    </div>
                    <div class="active-inner  active-inner-04 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-04"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">自主处理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="zdyclrw"    value="自定义处理任务"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="clrwyxjk"   value="处理任务运行监控"/></p>
                            </div>
                            <p class="product-introduce-price">
                                用户根据业务需要自主的处理数据（清洗和匹配）。
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
                            <h2 class="product-introduce-title">协助处理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="rwssfkcp"  value="任务实施反馈"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="rwyxjkcp"  value="任务运行监控"/></p>
                            </div>
                            <p class="product-introduce-price">
                                对用户提出的处理申请进行实施。
                            </p>
                        </div>
                    </div>
                    <div class="active-inner active-inner-05 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-05"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">协助处理</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rwssfk"  value="任务实施反馈"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rwyxjk"  value="任务运行监控"/></p>
                            </div>
                            <p class="product-introduce-price">
                                对用户提出的处理申请进行实施。
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
                            <h2 class="product-introduce-title">人工匹配</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rgppgzltjcp"  value="人工匹配工作量统计"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="rgppgzfpcp"    value="人工匹配工作分配"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="rgppcp"   value="人工匹配"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="sdhccp"   value="实地核查"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="cyhccp"   value="抽样核查"/></p>
                            </div>
                            <p class="product-introduce-price">
                                数据匹配后产生的没有匹配上的数据再次进行人工匹配。
                            </p>
                        </div>
                    </div>
                    <div class="active-inner active-inner-05 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-01"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">人工匹配</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rgppgzltj"  value="人工匹配工作量统计"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rgppgzfp"  value="人工匹配工作分配"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rgpp"  value="人工匹配"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sdhc"  value="实地核查"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="cyhc"  value="抽样核查"/></p>
                            </div>
                            <p class="product-introduce-price">
                                数据匹配后产生的没有匹配上的数据再次进行人工匹配。
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
                            <h2 class="product-introduce-title">处理状况查询</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="clmxcxcp"    value="处理明细查询"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="qxclzktjcp"    value="清洗处理状况统计"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="ppclzktjcp"    value="智能匹配处理状况统计"/></p>
                            </div>
                            <p class="product-introduce-price">
                               对数据处理结果（清洗和匹配）数据进行统计和明细查询。
                            </p>
                        </div>
                    </div>
                    <div class="active-inner active-inner-05 clearfix">
                        <div class="active-inner-item">
                            
                            <div class="empty-space">
                                <div class="bg-product-pic server-header-active-02"></div>
                            </div>
                            <h2 class="product-introduce-title active-product-introduce-title ">处理状况查询</h2>
                            <div class="product-introduce-list">
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="clmxcx" value="处理明细查询"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="qxclzktj"  value="清洗处理状况统计"/></p>
                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ppclzktj"  value="智能匹配处理状况统计"/></p>
                            </div>
                            <p class="product-introduce-price">
                                对数据处理结果（清洗和匹配）数据进行统计和明细查询。
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
        parent.initModelPath("数据处理");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo",{mkstr:'4'},function(data){
            $(".cloud-product-ul li").each(function(index1,datas1){
                //获取所有input的id
                var $li=$(this);
//                console.log("data:",JSON.stringify(data));
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
//                        console.log("menuids:",menuids);
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
            if(curval=="清洗规则管理"){
                urls="sjcl/qxgz/initgzgl";
            }else if(curval=="清洗指标管理"){
                urls="sjcl/qxzb/initzb";
            }else if(curval=="清洗模型管理"){
                urls="sjcl/qxmx/initmx";
            }else if(curval=="匹配规则管理"){
                urls="sjcl/glppgzgl/initgzgl";
            }else if(curval=="匹配模型管理"){
                urls="sjcl/glppmx/initmx";
            }else if(curval=="定制系统定时处理任务"){
                urls="sjcl/dzxtdsclrw/initDzxtdsclrw";
            }else if(curval=="系统任务运行监控"){
                urls="sjcl/xtrwyxjk/initXtrwyxjk";
            }else if(curval=="自定义处理任务"){
                urls="sjcl/zdyclrw/initZdyclrw";
            }else if(curval=="自定义处理任务"){
                urls="sjcl/zdyclrw/initZdyclrw";
            }else if(curval=="处理任务运行监控"){
                urls="sjcl/clrwyxjk/initClrwyxjk";
            }else if(curval=="任务实施反馈"){
                urls="sjcl/rwyxfk/initRwyxfk";
            }else if(curval=="任务运行监控"){
                urls="sjcl/rwyxjk/initRwyxjk";    //
            }else if(curval=="人工匹配工作分配"){
                urls="sjcl/gzfp/initgzfp";
            }else if(curval=="人工匹配"){
                urls="sjcl/rgppcl/initRgppcl";
            }else if(curval=="实地核查"){
                urls="sjcl/rgppcl/initSdhc";
            }else if(curval=="抽样核查"){
                urls="sjcl/rgppcl/initCyhc";
            }else if(curval=="处理明细查询"){
                urls="sjcl/clmxcx/initClmxcx";
            }else if(curval=="清洗处理状况统计"){
                urls="sjcl/qxclzktj/initQxclzktj";
            }else if(curval=="智能匹配处理状况统计"){
                urls="sjcl/glppclzktj/initGlppclzktj";
            }else if(curval=="人工匹配工作量统计"){
                urls="sjcl/rgpprwtj/initRgpprwtj";
            }
            window.location.href="${ctx}/"+urls;
        });
    });

</script>