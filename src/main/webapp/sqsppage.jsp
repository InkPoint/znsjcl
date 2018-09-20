<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>

<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>申请审批</title>
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
<body style="margin:auto;width: 100%;">
<!-- select开始 -->
<section id="content"  >
        <div class="cloud-product-box">
            <div class="cloud-product-wrapper">
                    <div class="cloud-product" >
                            <ul class="cloud-product-ul clearfix" style="width:670px; margin: 0 auto;">
                                    <li data-index="1" style="display: none;" >
                                        <div class="normal-inner">
                                            <div class="cloud-product-single-bottom clearfix">
                                                <div class="empty-space">
                                                    <div class="bg-product-pic server-header-01"></div>
                                                </div>
                                                <h2 class="product-introduce-title">业务申请</h2>

                                                <div class="product-introduce-list">
                                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ywsqcp"   value="业务申请"/></p>
                                                </div>
                                                <p class="product-introduce-price">
                                                    申请功能是通过申请提出业务需求。例如数据导入申请、数据处理、加工等需求都需要通过申请功能提出，然后通过审批通过后方可进行数据处理相关业务。
                                                </p>
                                            </div>
                                        </div>


                                        <div class="active-inner active-inner-01 clearfix">
                                            <div class="active-inner-item">
                                                
                                                <div class="empty-space">
                                                    <div class="bg-product-pic server-header-active-01"></div>
                                                </div>
                                                <h2 class="product-introduce-title active-product-introduce-title ">业务申请</h2>
                                                <div class="product-introduce-list">
                                                    <p class="introduce-list-large">
                                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="ywsq"    value="业务申请"/></p>
                                                    </p>
                                                </div>
                                                <p class="product-introduce-price">
                                                    申请功能是通过申请提出业务需求。例如数据导入申请、数据处理、加工等需求都需要通过申请功能提出，然后通过审批通过后方可进行数据处理相关业务。
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
                                                <h2 class="product-introduce-title">业务审批</h2>

                                                <div class="product-introduce-list">
                                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ywspcp"   value="业务审批"/></p>
                                                </div>
                                                <p class="product-introduce-price">
                                                    审批功能是承接上个申请功能的，通过上级领导审批申请人员提出的需求，然后审核审批通过后，转到下一处理步骤。
                                                </p>
                                            </div>
                                        </div>


                                        <div class="active-inner active-inner-02 clearfix">
                                            <div class="active-inner-item">
                                                
                                                <div class="empty-space">
                                                    <div class="bg-product-pic server-header-active-02"></div>
                                                </div>
                                                <h2 class="product-introduce-title active-product-introduce-title ">业务审批</h2>
                                                <div class="product-introduce-list">
                                                    <p class="introduce-list-large">
                                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="ywsp"   value="业务审批"/></p>
                                                    </p>
                                                </div>
                                                <p class="product-introduce-price">
                                                    审批功能是承接上个申请功能的，通过上级领导审批申请人员提出的需求，然后审核审批通过后，转到下一处理步骤。
                                                </p>
                                            </div>
                                        </div>
                                    </li>

                                    <li data-index="3" style="display: none;">
                                    <div class="normal-inner">
                                        <div class="cloud-product-single-bottom clearfix">
                                            <div class="empty-space">
                                                <div class="bg-product-pic server-header-03"></div>
                                            </div>
                                            <h2 class="product-introduce-title">日志记录</h2>

                                            <div class="product-introduce-list">
                                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rzjlcp"   value="日志记录"/></p>
                                            </div>
                                            <p class="product-introduce-price">
                                                日志记录功能是为了方便系统使用人日常工作记录而设置的功能，该功能类似记事本。可以上传附件和保存文档原有的格式。及时记录工作日常。
                                            </p>
                                        </div>
                                    </div>


                                    <div class="active-inner active-inner-03 clearfix">
                                        <div class="active-inner-item">
                                            
                                            <div class="empty-space">
                                                <div class="bg-product-pic server-header-active-02"></div>
                                            </div>
                                            <h2 class="product-introduce-title active-product-introduce-title ">日志记录</h2>
                                            <div class="product-introduce-list">
                                                <p class="introduce-list-large">
                                                <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rzjl"   value="日志记录"/></p>
                                                </p>
                                            </div>
                                            <p class="product-introduce-price">
                                                日志记录功能是为了方便系统使用人日常工作记录而设置的功能，该功能类似记事本。可以上传附件和保存文档原有的格式。及时记录工作日常。
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
        parent.initModelPath("申请审批");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo",{mkstr:'2'},function(data){
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
            if(curval=="业务申请"){
                urls="sjsplc/sjdrsq/initSjsq";
            }else if(curval=="业务审批"){
                urls="sjsplc/sjdrsq/initSjsh";
            }else if(curval=="日志记录"){
                // 原工作日志路径
                // urls="sjsplc/log/initViewLog";
                urls="zzfwzx/yhrz/initCkrz";
            }
            window.location.href="${ctx}/"+urls;
        });
    });

</script>
