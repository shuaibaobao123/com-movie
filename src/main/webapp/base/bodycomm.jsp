<%@ page contentType="text/html;charset=utf-8"%>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="javascripts:void(-1);"> <img
				src="${pageContext.request.contextPath}/assets/admin/layout2/img/logo.png"
				alt="logo" class="logo-default" />
			</a>
			<div class="menu-toggler sidebar-toggler"></div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler"
			data-toggle="collapse" data-target=".navbar-collapse"></a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN PAGE ACTIONS -->
		<div class="page-actions page-actions-cn"></div>
		<!-- END PAGE ACTIONS -->
		<!-- BEGIN PAGE TOP -->
		<div class="page-top">
			<!-- BEGIN TOP NAVIGATION MENU -->
			<div class="top-menu" id="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown dropdown-user"><a href="javascript:;"
						class="dropdown-toggle" data-toggle="dropdown"
						data-hover="dropdown" data-close-others="true"> <img alt=""
							class="img-circle"
							src="${pageContext.request.contextPath}/assets/admin/layout2/img/avatar.png" />
							<span class="username username-hide-on-mobile">${ sessionScope.manager.name} </span> <i
							class="fa fa-angle-down"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li class="divider"></li>

							<li><a href="${pageContext.request.contextPath}/manager/toedit"> <i class="icon-lock"></i>
						密码修改
							</a></li>
							<li><a href="${pageContext.request.contextPath}/manager/logout" > <i class="icon-key"></i> 退出

							</a></li>
						</ul></li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->

<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
 var ss="${ sessionScope.manager}"
 	if(ss==null|| ss ==''){
 		window.location.href="${pageContext.request.contextPath}/manager/toLogin"; 
 	}
</script> 
