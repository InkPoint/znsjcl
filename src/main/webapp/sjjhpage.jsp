<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>

<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>数据交换</title>
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
                                <h2 class="product-introduce-title">自主导入</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="swwjsjdrcp"   value="上传文件数据导入"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="szyxxqycjcp" value="水资源信息取用采集"/></p>
                                </div>
                                <p class="product-introduce-price">
                                   工作人员自主的将数据导入系统中，以用来数据处理，支持的文件格式xls。
                                </p>
                            </div>
                        </div>


                        <div class="active-inner active-inner-01 clearfix">
                            <div class="active-inner-item">
                                
                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-01"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title ">自主导入</h2>
                                <div class="product-introduce-list">
                                    <p class="introduce-list-large">
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="swwjsjdr"     value="上传文件数据导入"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="szyxxqycj"      value="水资源信息取用采集"/></p>
                                    </p>
                                </div>
                                <p class="product-introduce-price">
                                    工作人员自主的将数据导入系统中，以用来数据处理，支持的文件格式xls。
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
                                <h2 class="product-introduce-title">系统导入</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="drrwdzcp"   value="导入任务定制"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="drrwjkcp"    value="导入任务监控"/></p>
                                </div>
                                <p class="product-introduce-price">
                                   系统导入是将数据导入系统化、程序化，方便用户数据导入，系统导入是系统表之间的数据导入。
                                </p>
                            </div>
                        </div>


                        <div class="active-inner active-inner-02 clearfix">
                            <div class="active-inner-item">
                                
                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-02"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title ">系统导入</h2>
                                <div class="product-introduce-list">
                                    <p class="introduce-list-large">
                                       <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="drrwdz"   value="导入任务定制"/></p>
                                       <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="drrwjk"   value="导入任务监控"/></p>
                                    </p>
                                </div>
                                <p class="product-introduce-price">
                                    系统导入是将数据导入系统化、程序化，方便用户数据导入，系统导入是系统表之间的数据导入。
                                </p>
                            </div>
                        </div>
                    </li>

                    <li data-index="3" style="display: none;" >
                        <div class="normal-inner">
                            <div class="cloud-product-single-bottom clearfix">
                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-03"></div>
                                </div>
                                <h2 class="product-introduce-title">协助导入</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rwssfkcp"    value="任务实施反馈"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rwjdjkcp"    value="任务进度监控"/></p>
                                </div>
                                <p class="product-introduce-price">
                                    协助导入是通过申请的方式由数据库管理人员导出数据后然后工作人员通过系统下载数据,从而获取数据。
                                </p>
                            </div>
                        </div>


                        <div class="active-inner active-inner-03 clearfix">
                            <div class="active-inner-item">
                                
                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-02"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title ">协助导入</h2>
                                <div class="product-introduce-list">
                                    <p class="introduce-list-large">
                                    <p class="introduce-list-small"><input type="button" class="btnlist" name="menus" id="rwssfk"  value="任务实施反馈"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="rwjdjk"  value="任务进度监控"/></p>
                                    </p>
                                </div>
                                <p class="product-introduce-price">
                                    协助导入是通过申请的方式由数据库管理人员导出数据后然后工作人员通过系统下载数据,从而获取数据。
                                </p>
                            </div>
                        </div>
                    </li>

                    <li data-index="4" style="display: none;">
                        <div class="normal-inner">
                            <div class="cloud-product-single-bottom clearfix">
                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-04"></div>
                                </div>
                                <h2 class="product-introduce-title" style="font-size: 20px;">数据交换状况查询统计</h2>

                                <div class="product-introduce-list">
                                    <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="drzktjcp"  value="导入状况统计"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="dczktjcp"  value="导出状况统计"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjyzcp"  value="数据验证"/></p>
                                </div>
                                <p class="product-introduce-price">
                                    导入状况查询统计是统计由自主、系统和协助导入的数据。
                                </p>
                            </div>
                        </div>


                        <div class="active-inner active-inner-04 clearfix">
                            <div class="active-inner-item">
                                
                                <div class="empty-space">
                                    <div class="bg-product-pic server-header-active-04"></div>
                                </div>
                                <h2 class="product-introduce-title active-product-introduce-title ">数据交换状况查询统计</h2>
                                <div class="product-introduce-list">
                                    <p class="introduce-list-large">
                                        <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="drzktj"  value="导入状况统计"/></p>
                                    <p class="introduce-list-small"><input type="button" class="btnlist"   name="menus" id="dczktj"  value="导出状况统计"/></p>
                                        <p class="introduce-list-small"><input type="button" class="btnlist"  name="menus" id="sjyz" value="数据验证"/></p>
                                    </p>
                                </div>
                                <p class="product-introduce-price">
                                    导入状况查询统计是统计由自主、系统和协助导入的数据。
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
        parent.initModelPath("数据交换");
        //权限控制
        $.post("${ctx}/main/mains/permissionInfo",{mkstr:'3'},function(data){
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
            if(curval=="上传文件数据导入"){
                urls="sjjh/sjwjsc/initsjwjsc";
            }else if(curval=="水资源信息取用采集"){
                urls="sjjh/xxcj/initXxcj";
            }else if(curval=="导入任务定制"){
                urls="sjjh/drrwdz/initDrrwdz";
            }else if(curval=="导入任务监控"){
                urls="sjjh/drrwjk/initDrrwjk";
            }else if(curval=="任务实施反馈"){
                urls="sjjh/rwssfk/initRwssfk";
            }else if(curval=="任务进度监控"){
                urls="sjjh/rwjdjk/initRwjdjk";
            }else if(curval=="导入状况统计"){
                urls="sjjh/drzktj/initDrzktj";
            }else if(curval=="数据验证"){
                urls="sjjh/sjyz/initSjyz";
            } else if(curval=="导出状况查询统计"){
                urls="zzfwzx/yhrz/initCkrz";
            }
            window.location.href="${ctx}/"+urls;
        });
    });

</script>