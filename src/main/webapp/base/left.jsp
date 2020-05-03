<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-sidebar-wrapper">
				<div class="page-sidebar navbar-collapse collapse">
					<!-- BEGIN SIDEBAR MENU -->
					<ul class="page-sidebar-menu page-sidebar-menu-hover-submenu " data-keep-expanded="false" data-auto-scroll="true" data-slide-speed="200">
						<li class="start active ">
							<a href="${pageContext.request.contextPath}/manager/toIndex">
								<i class="icon-home"></i>
								<span class="title">首页</span>
								<span class="selected"></span>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/mtype/mtypeList">
								<i class="fa fa-users"></i>
								<span class="title">类别管理</span>
								<span class="arrow"></span>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/country/list">
								<i class="fa fa-line-chart"></i>
								<span class="title">上映地区管理</span>
								<span class="arrow"></span>
							</a>
						</li>
						
					<li>
							<a href="${pageContext.request.contextPath}/movie/pageList">
								<i class="fa fa-user"></i>
								<span class="title">电影管理</span>
								<span class="arrow"></span>
							</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/manager/toedit">
								<i class="icon-lock"></i>
								<span class="title">密码修改</span>
								<span class="arrow"></span>
							</a>
						</li>
						
						<%-- <li>
							<a href="${pageContext.request.contextPath}/user/testSuggest">
								<i class="icon-lock"></i>
								<span class="title">测试智能推荐</span>
								<span class="arrow"></span>
							</a>
						</li> --%>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
</div>