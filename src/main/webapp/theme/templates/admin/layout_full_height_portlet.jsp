<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='ctx' value="${pageContext.request.contextPath}"/>
<c:set var='principal' value='${sessionScope.aclSessionInfo}'/>
<html lang="en">
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
<meta charset="utf-8"/>
<title>采集管理控制台</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description"/>
<meta content="" name="author"/>
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="${ctx}/theme/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/theme/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/theme/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/theme/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/theme/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>

<link href="${ctx}/theme/assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="${ctx}/theme/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/theme/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link id="style_color" href="${ctx}/theme/assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/theme/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>

<script src="${ctx}/static/new/js/html5shiv.js"></script>
<script src="${ctx}/static/new/js/respond.min.js"></script>
<link rel="shortcut icon" href="favicon.ico"/>
</head>
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-fixed page-sidebar-closed-hide-logo">
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="#">
			<img src="${ctx}/theme/assets/admin/layout/img/logo.png" alt="logo" class="logo-default"/>
			</a>
			<%--<span>数据仓库</span>--%>
			<div class="menu-toggler sidebar-toggler">
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div class="top-menu">
			<ul class="nav navbar-nav pull-right">
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-user">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img alt="" class="img-circle" src="${ctx}/theme/assets/admin/layout/img/avatar3_small.jpg"/>
					<span class="username username-hide-on-mobile"> ${principal.userName} </span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-default">
						<li>
							<a href="#"> <!-- page_calendar.html -->
							<i class="icon-calendar"></i> 我的日历 </a>
						</li>
						<li>
							<a href="#"> <!-- page_todo.html -->
							<i class="icon-rocket"></i> 我的任务 <span class="badge badge-success">
							7 </span>
							</a>
						</li>
					</ul>
				</li>
				<!-- END USER LOGIN DROPDOWN -->
				<!-- BEGIN QUICK SIDEBAR TOGGLER -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-quick-sidebar-toggler">
					<a href="javascript:logout();" class="dropdown-toggle">
						<i class="icon-logout"></i>
						<span class="username username-hide-on-mobile">注销</span>
					</a>
				</li>
				<!-- END QUICK SIDEBAR TOGGLER -->
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
		<!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
		<div class="page-sidebar navbar-collapse collapse">
			<!-- BEGIN SIDEBAR MENU -->
			<!-- DOC: Apply "page-sidebar-menu-light" class right after "page-sidebar-menu" to enable light sidebar menu style(without borders) -->
			<!-- DOC: Apply "page-sidebar-menu-hover-submenu" class right after "page-sidebar-menu" to enable hoverable(hover vs accordion) sub menu mode -->
			<!-- DOC: Apply "page-sidebar-menu-closed" class right after "page-sidebar-menu" to collapse("page-sidebar-closed" class must be applied to the body element) the sidebar sub menu mode -->
			<!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
			<!-- DOC: Set data-keep-expand="true" to keep the submenues expanded -->
			<!-- DOC: Set data-auto-speed="200" to adjust the sub menu slide up/down speed -->
			<ul id="navMenuBar" class="page-sidebar-menu" data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">

			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">

			<!-- BEGIN PAGE HEADER-->
			<!--<h3 class="page-title">-->
			<!--Full Height Portlet <small>layout with full height portlet</small>-->
			<!--</h3>-->
			<%--<div class="page-bar">--%>
				<%--<ul class="page-breadcrumb">--%>
					<%--<li>--%>
						<%--<i class="fa fa-home"></i>--%>
						<%--<a href="index-2.html">Home</a>--%>
						<%--<i class="fa fa-angle-right"></i>--%>
					<%--</li>--%>
					<%--<li>--%>
						<%--<a href="#">Page Layouts</a>--%>
						<%--<i class="fa fa-angle-right"></i>--%>
					<%--</li>--%>
					<%--<li>--%>
						<%--<a href="#">Full Height Portlet</a>--%>
					<%--</li>--%>
				<%--</ul>--%>
				<!--<div class="page-toolbar">-->
					<!--<div class="btn-group pull-right">-->
						<!--<button type="button" class="btn btn-fit-height grey-salt dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">-->
						<!--Actions <i class="fa fa-angle-down"></i>-->
						<!--</button>-->
						<!--<ul class="dropdown-menu pull-right" role="menu">-->
							<!--<li>-->
								<!--<a href="#">Action</a>-->
							<!--</li>-->
							<!--<li>-->
								<!--<a href="#">Another action</a>-->
							<!--</li>-->
							<!--<li>-->
								<!--<a href="#">Something else here</a>-->
							<!--</li>-->
							<!--<li class="divider">-->
							<!--</li>-->
							<!--<li>-->
								<!--<a href="#">Separated link</a>-->
							<!--</li>-->
						<!--</ul>-->
					<!--</div>-->
				<!--</div>-->
			<%--</div>--%>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					<div class="portlet blue-hoki box full-height-content full-height-content-scrollable">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-calendar"></i><span id="title"></span>
							</div>
							<div class="tools">
								<a href="javascript:;" class="collapse">
								</a>
								<!--<a href="#portlet-config" data-toggle="modal" class="config">-->
								<!--</a>-->
								<a href="javascript:;" class="reload">
								</a>
								<a href="javascript:;" class="fullscreen">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="full-height-content-body">
								<iframe id="contentFrame" src="" style="width:100%; height:100%;border:0" >
								</iframe>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END PAGE CONTENT-->
	</div>
</div>
<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->

<!-- BEGIN FOOTER -->
<%--<div class="page-footer">--%>
<%--<div class="page-footer-inner">--%>
	 <%--2014 &copy; Metronic by keenthemes.--%>
<%--</div>--%>
<%--<div class="scroll-to-top">--%>
	<%--<i class="icon-arrow-up"></i>--%>
<%--</div>--%>
<%--</div>--%>
<!-- END FOOTER -->

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="${ctx}/theme/assets/global/plugins/respond.min.js"></script>
<script src="${ctx}/theme/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${ctx}/theme/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="${ctx}/theme/assets/global/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script src="${ctx}/theme/assets/global/scripts/metronic.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/admin/layout/scripts/layout.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/admin/layout/scripts/quick-sidebar.js" type="text/javascript"></script>
<script src="${ctx}/theme/assets/admin/layout/scripts/demo.js" type="text/javascript"></script>
<script>
      jQuery(document).ready(function() {
		  // init user menus
		  $.ajax({
			  url: '${ctx}/acl/user/menu',
			  type: 'get',
			  success: function(data){

				  $('#navMenuBar').html(data);
			  }
		  });
		  Metronic.init(); // init metronic core components
		  Layout.init(); // init current layout
		  QuickSidebar.init(); // init quick sidebar
		  Demo.init(); // init demo features
      });

	  function menuClick(title, url){
		  $('#title').text(title);
		  $('#contentFrame').attr('src', '${ctx}'+url);
	  }
	  function logout() {
		  $.post('${ctx}/logout', function (d) {
			  location.href = "${ctx}/login";
		  })
	  }
   </script>
<!-- END JAVASCRIPTS -->
</body>

<!-- END BODY -->
</html>