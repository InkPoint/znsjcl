<%--
  Created by IntelliJ IDEA.
  User: liduo
  Date: 2018/1/2
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>数据产品-选择主题</title>
    <meta name="description" content="simple and responsive tables"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png" type="image/x-icon">
    <!--Basic Styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/public/static/css/plugins/bootstrap-table/bootstrap-table.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css"/>
    <!--Beyond styles-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/beyond.min.css"/>
    <%--Select2--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/select2/select2.min.css"/>
    <script src="${pageContext.request.contextPath}/assets/js/skins.min.js"></script>
    <!--跳转页操作区域背景-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/static/css/style.min.css"/>
    <%--表单验证样式--%>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/assets/css/bootstrapValidator/bootstrapValidator.css"/>

    <!--Basic Scripts-->
    <script src="${pageContext.request.contextPath}/public/static/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/static/js/plugins/bootstrap-table/bootstrap-table-zh-CN.min.js"></script>
    <%--Select2--%>
    <script src="${pageContext.request.contextPath}/assets/js/newselect2/select2.min.js"></script>
    <%--页面提交数据--%>
    <script src="${pageContext.request.contextPath}/static/js/jquery.ts.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
    <%--表单验证插件--%>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrapValidator/bootstrapValidator.js"></script>


</head>
<body>
<div class="page-body">
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12">
            <div class="widget">
                <div class="widget-header bg-blue">
                    <div class="col-sm-10 widget-caption" style="text-align: left">
                        <span>数据产品处室入口</span>
                    </div>
                    <%--<div class="col-sm-1 widget-caption" style="vertical-align: middle">--%>
                        <%--<span>搜索</span>--%>
                    <%--</div>--%>
                    <%--<div class="col-sm-1 widget-caption">--%>
                        <%--<span>我的产品</span>--%>
                    <%--</div>--%>
                </div>
                <!--小部件标题-->
                <div class="widget-body">
                    <table class="table" id="mytable" style="height: 580px">
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>

</body>
</html>
<script>
   // 数据产品主题的循环放置
    $(function(){
        $.ajax({
            type:'post',
            dataType:'json',
            url:'${pageContext.request.contextPath}/sjjg/sjcpzx/cpztlist',
            success:function(data){
                $.each(data,function(i,obj){
                    $("#mytable").append('<div class="col-sm-2" style="border-spacing: 15px; margin-bottom: 15px; height: 200px;">' +
                                            '<div class="panel-info" style="border: solid 1px #87cefa; height: auto">' +
                                            '<div class="panel-heading" style="text-align: center">【'+obj.ztmc+'】</div>' +
                                            '<div class="panel-body"><p>简要说明:'+obj.ztms+'</p></div>' +
                                            '<div class="panel-footer" style="text-align: center;"><a href="javascript:void(0);" onclick="enterSjcp(\''+obj.ztid+'\')">进入</a></div>' +
                    <%--'<div class="panel-footer" style="text-align: center;"><a href="${pageContext.request.contextPath}/sjjg/sjcpzx/initSjcpzx?ztid=\''+obj.ztid+'\'">进入</a></div>' +--%>
                                            '</div></div>');
                });
            }
        });
    });

   function enterSjcp(ztid){
       var csid = ztid;
       console.log("处室ID："+csid);
       $.ajax({
           type:'post',
           dataType:'json',
           url:'${pageContext.request.contextPath}/sjjg/sjcpzx/csidcx',
           data: {'svo.ztid': csid},
           success:function(data){
//               console.log("是否有该处室数据："+data);
               if(data=="是"){
                   window.location.href = "${pageContext.request.contextPath}/sjjg/sjcpzx/initSjcpzx?ztid='"+csid+"'";
               }else{
                   alert("本处室暂无产品！");
               }
           }
       });
   }
</script>
