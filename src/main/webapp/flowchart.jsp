<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="principal" value="${sessionScope.aclSessionInfo}"/>
<script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>系统流程图展示</title>

    <!-- Bootstrap core CSS -->
    <link href="${ctx}/v20/css/bootstrap.min.css" rel="stylesheet">
    <link href="${ctx}/v20/css/bootstrap-reset.css" rel="stylesheet">
    <!--字体 css-->
    <link href="${ctx}/v20/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="${ctx}/v20/css/style.css" rel="stylesheet">
    <style>
	    ::-webkit-scrollbar {
		  width: 7px;
		  height: 7px;
		  cursor: pointer
		}

		::-webkit-scrollbar-track {
		  background-color: #ddd;
		  border-radius: 10px
		}

		::-webkit-scrollbar-thumb {
		  border-radius: 10px;
		  background-color: #00e8ff
		}
		.fade-out-right {
		  animation: fade-out-right 2s ease infinite;
		}
		@keyframes fade-out-right {
		  0% {
			opacity: 1;
			transform: translateX(0);
		  }
		  100% {
			opacity: 0;
			transform: translateX(20px);
		  }
		}
		@-webkit-keyframes myfirst
		{
		0%   { left:0px; top:300px;}
		}
    	body{ overflow-y:hidden; background-color:transparent;}
		.index{ width:1400px; height:750px;  margin:0 auto; position:relative;}
		.lctindex{ width:1400px; height:750px; background:url(${ctx}/v20/img/lcbj.png) no-repeat; font-size:18px; color:#fff;}


		.tx01{ width:228px; height:180px;  position:absolute; left:40px; top:22px; text-align:center; cursor:pointer;}
		.tx02{ width:200px; height:180px;  position:absolute; left:460px; top:22px; text-align:center; cursor:pointer;}
		.tx03{ width:200px; height:180px;  position:absolute; left:810px; top:22px; text-align:center; cursor:pointer;}
		.tx04{ width:220px; height:180px;  position:absolute; left:1145px; top:22px; text-align:center; cursor:pointer;}

		.tx05{ width:220px; height:177px;  position:absolute; left:40px; top:282px; background:#081327; z-index:99999; text-align:center; cursor:pointer;}
		.tx06{ width:220px; height:175px;  position:absolute; left:435px; top:286px;background:#081327; z-index:99999; text-align:center; cursor:pointer;}
		.tx07{ width:220px; height:175px;  position:absolute; left:790px; top:286px;background:#081327; z-index:99999; text-align:center; cursor:pointer;}
		.tx08{ width:220px; height:175px;  position:absolute; left:1140px; top:286px;background:#081327; z-index:99999; text-align:center; cursor:pointer;}

		.tx09{ width:220px; height:190px;  position:absolute; left:45px; top:525px; text-align:center; cursor:pointer;}
		.tx10{ width:220px; height:190px;  position:absolute; left:435px; top:525px; text-align:center; cursor:pointer;}
		.tx11{ width:220px; height:190px;  position:absolute; left:790px; top:525px; text-align:center; cursor:pointer;}
		.tx12{ width:220px; height:190px;  position:absolute; left:1130px; top:525px; text-align:center; cursor:pointer;}

		.pimg{ padding-top:10px;}
    	.x01{ background:red; width:100px; height:40px;  position:absolute; left:300px; top:93px; background:url(${ctx}/v20/img/x01.png);}
		.x02{ background:red; width:100px; height:40px;  position:absolute; left:680px; top:93px; background:url(${ctx}/v20/img/x01.png);}
		.x03{ background:red; width:100px; height:40px;  position:absolute; left:1000px; top:93px; background:url(${ctx}/v20/img/x01.png);}

		.yd01{ width:34px; height:31px; background:url(${ctx}/v20/img/yd.png); position:absolute; top:190px; left:137px;}
		.yd02{ width:34px; height:31px; background:url(${ctx}/v20/img/yd.png); position:absolute; top:190px; left:537px;}
		.yd03{ width:34px; height:31px; background:url(${ctx}/v20/img/yd.png); position:absolute; top:190px; left:890px;}
		.yd04{ width:34px; height:31px; background:url(${ctx}/v20/img/yd.png); position:absolute; top:190px; left:1230px;}
		.img01{ width:80px; height:80px;  position:absolute; left:840px; top:310px; z-index:99999999; }
		.img02{ width:15px; height:50px; position:absolute; left:567px; top:89px; z-index:99999999;}
		.img03{ width:15px; height:50px; position:absolute; left:916px; top:89px; z-index:99999999;}
		@-webkit-keyframes rotation{
		from {-webkit-transform: rotate(0deg);}
		to {-webkit-transform: rotate(360deg);}
		}

		.Rotation{
		-webkit-transform: rotate(360deg);
		animation: rotation 7s linear infinite;
		-moz-animation: rotation 7s linear infinite;
		-webkit-animation: rotation 7s linear infinite;
		-o-animation: rotation 7s linear infinite;
		}
		.fade-out-down {
		  animation: fade-out-down 3s ease infinite;
		}
		@keyframes fade-out-down {
		  0% {
			opacity: 1;
			transform: translateY(0);
		  }
		  100% {
			opacity: 1;
			transform: translateY(323px);
		  }
		}
		.flash {
		  animation: flash 800ms ease infinite alternate;
		}
		@keyframes flash {
			from { opacity: 1; }
			to { opacity: 0; }
		}
		.flash2 {
		  animation: flash 300ms ease infinite alternate;
		}
		@keyframes flash2 {
			from { opacity: 1; }
			to { opacity: 0; }
		}
    </style>
  </head>

  <body style="background:transparent;">
     <div class="index">
     	<div class="lctindex">
        	<div class="tx01">
            	<p class="pimg"><img src="${ctx}/v20/img/ico01.png" width="145" height="123"></p>
                <p>原始数据区域</p>
            </div>
            <div class="tx02">
            	<p class="pimg"><img src="${ctx}/v20/img/ico02.png" width="145" height="123"></p>
                <p>数据处理区域【粗加工】</p>
            </div>
            <div class="tx03">
            	<p class="pimg"><img src="${ctx}/v20/img/ico03.png" width="145" height="123"></p>
                <p>数据处理区域【细加工】</p>
            </div>
            <div class="tx04">
            	<p class="pimg"><img src="${ctx}/v20/img/ico04.png" width="145" height="123"></p>
                <p>数据研究</p>
            </div>
            <div class="tx05">
            	<p class="pimg"><img src="${ctx}/v20/img/ico05.png" width="145" height="123"></p>
                <p>数据导入</p>
            </div>
            <div class="tx06">
            	<p class="pimg"><img src="${ctx}/v20/img/ico06.png" width="145" height="123"></p>
                <p>数据清洗、匹配</p>
            </div>
            <div class="tx07">
            	<p class="pimg"><img src="${ctx}/v20/img/ico07.png" width="145" height="123"></p>
                <p>数据元件加工</p>
            </div>
            <div class="tx08">
            	<p class="pimg"><img src="${ctx}/v20/img/ico08.png" width="145" height="123"></p>
                <p>数据产品、分析</p>
            </div>
            <div class="tx09">
            	<p class="pimg"><img src="${ctx}/v20/img/ico09.png" width="145" height="107"></p>
                <p>依据来源划分<br>依据业务标签划分</p>
            </div>
            <div class="tx10">
            	<p class="pimg"><img src="${ctx}/v20/img/ico10.png" width="145" height="107"></p>
                <p>依据来源划分<br>依据业务标签划分匹配情况</p>
            </div>
            <div class="tx11">
            	<p class="pimg"><img src="${ctx}/v20/img/ico11.png" width="145" height="123"></p>
                <p>数据元件</p>
            </div>
            <div class="tx12">
            	<p class="pimg"><img src="${ctx}/v20/img/ico12.png" width="145" height="107"></p>
                <p>数据分析结果<br>数据产品结果</p>
            </div>
            <div class="x01 fade-out-right"></div>
            <div class="x02 fade-out-right"></div>
            <div class="x03 fade-out-right"></div>


            <div class="yd01 fade-out-down"></div>
            <div class="yd02 fade-out-down"></div>
            <div class="yd03 fade-out-down"></div>
            <div class="yd04 fade-out-down"></div>

            <div class="img01 rotation"><img class="Rotation" src="${ctx}/v20/img/img01.png"></div>
            <div class="img02"><img class="flash" src="${ctx}/v20/img/img02.png" width="15" height="50"></div>
            <div class="img03"><img class="flash2" src="${ctx}/v20/img/img03.png" width="15" height="50"></div>
        </div>

     </div>


    <!-- js放置在文档的结尾，这样页面加载速度更快。 -->
    <script src="${ctx}/v20/js/jquery.js"></script>
    <script src="${ctx}/v20/js/bootstrap.min.js"></script>
    <!--滚动条-->
    <script src="${ctx}/v20/js/jquery.nicescroll.js" type="text/javascript"></script>
  </body>
</html>
