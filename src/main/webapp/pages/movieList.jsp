<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../base/base.jsp"></jsp:include>
		<body class="page-container-bg-solid page-sidebar-closed-hide-logo page-header-fixed ">
			<!-- -修改密码，用户信息 -->
		<jsp:include page="../base/bodycomm.jsp"></jsp:include>
		<jsp:include page="../base/alert_modal.jsp"></jsp:include>
		<jsp:include page="../base/head.jsp"></jsp:include>
	
		<!-- END HEADER -->
		<div class="clearfix"></div>
		<!-- BEGIN CONTAINER -->
		<div class="page-container">
			<jsp:include page="../base/left.jsp"></jsp:include>
			<div class="page-content-wrapper">
				<div class="page-content" style="min-height:645px">
					<!-- BEGIN PAGE HEADER-->
					<h3 class="page-title">影片管理</h3>
					<div class="page-bar">
						<ul class="page-breadcrumb">
							<li class="active">
								<i class="fa fa-home"></i>
								<a href="index.html">首页</a>
								<i class="fa fa-angle-right"></i>
							</li>

							<li>
								<a href="#">影片管理</a>
							</li>
						</ul>
					</div>
					<!-- END PAGE HEADER-->
					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="col-md-12">
							<form class="form-horizontal form-row-seperated" action="#">
								<div class="portlet light">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-search font-green-sharp"></i>
											<span class="caption-subject font-green-sharp bold">查询列表</span>
										</div>
										<div class="actions form-inline">
											<a href="${pageContext.request.contextPath}/movie/showAdd" class="btn btn-circle btn-primary margin-left5" onclick="javascript:;">
												<i class="fa fa-plus"></i>
												<span class="hidden-480">新片上映</span>
											</a>
										</div>
									</div>
									<div class="portlet-body">
									<div class="table-responsive">
										<form action='${pageContext.request.contextPath}/movie/pageList'
											method="post">
											<table class="table table-bordered table_sxcondition">
												<tbody>
													<tr>
														<th width="13.33%">电影名称(模糊):</th>
														<td width="20%"><input type="text"
															class="form-control input-large" name="name" id="name"
															value="${bookParams.name }"></td>
														<th width="13.33%">导演(模糊):</th>
														<td width="20%"><input type="text"
															class="form-control input-large" name="author"
															id="author" value="${bookParams.author }"></td>
														<th>主演 (模糊):</th>
														<td><input type="text"
															class="form-control input-large" name="publish"
															id="publish" value="${bookParams.publish }"></td>
													</tr>
													<tr>
														<th>影片类型 :</th>
														<td><select class="form-control input-large"
															data-placeholder="全部" id="type" name="type"
															onchange="typeChange()">
																<option value="">显示所有</option>
																<c:forEach var="type" items="${typeList}">
																	<option value="${type.id}"
																		<c:if test="">selected</c:if>>${type.typename}</option>
																</c:forEach>
														</select></td>
														<th>上映地区 :</th>
														<td><select class="form-control input-large"
															data-placeholder="全部" id="subtype" name="subtype">
																<option value="">显示所有</option>
																<c:forEach var="country" items="${countryList}">
																	<option value="${country.id}"
																		<c:if test="">selected</c:if>>${country.countryname}</option>
																</c:forEach>
														</select></td>
														<td colspan="2" style="text-align: center;">&nbsp;</td>
													</tr>
													<tr>
														<td colspan="6" style="text-align: center;">
															<button type="reset" class="btn default">
																<i class="fa fa-reply"></i> 重置
															</button>
															<button type="submit" class="btn btn-primary">
																<i class="fa fa-search"></i> 查询
															</button>
														</td>
													</tr>
												</tbody>
											</table>
										</form>
									</div>
									<div class="table-container">

										<div id="datatable_products_wrapper"
											class="dataTables_wrapper dataTables_extended_wrapper no-footer">
											<div class="table-scrollable">
												<table
													class="table table-striped table-bordered table-hover dataTable no-footer"
													id="datatable_products"
													aria-describedby="datatable_products_info" role="grid">
													<thead>
														<tr role="row" class="heading">
															<th width="12%" class="sorting_disabled" rowspan="1"
																colspan="1">电影名称</th>
															<th width="8%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">上映地区</th>
															<th width="12%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">导演+主演</th>
															<th width="5%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">类型</th>
															<th width="5%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">会员电影</th>
															<th width="15%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">上映时间</th>
															<th width="5%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">播放量</th>
															<th width="10%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">评分</th>
															<th width="20%" class="sorting" tabindex="0"
																aria-controls="datatable_products" rowspan="1"
																colspan="1">操作</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="movie" items="${pageBean.rows }">
															<tr role="row" class="filter">
																<td>${movie.name}</td>
																<td>
																<c:forEach var="country" items="${countryList}">
																		<c:if test="${movie.countryid==country.id }">
																${country.countryname}
																</c:if>
																	</c:forEach>
																</td>
																<td>${movie.director}|${movie.mainact1}|${movie.mainact2}</td>
																<td>
																<c:forEach var="type" items="${typeList}">
																		<c:if test="${movie.typeid==type.id }">
																${type.typename}
																</c:if>
																	</c:forEach>
																</td>
																<td>
																<c:if test="${movie.ispay==0}">
																<label style="color: green;">否</label>
																</c:if>
																<c:if test="${movie.ispay==1}">
															<label style="color: red;">是</label>
																</c:if>
																</td>
																<td><fmt:formatDate value="${movie.startdate}"/></td>
																<td>${movie.count}</td>
																<td>${movie.rank}</td>
																<td><a
																	class="btn btn-circle btn-icon-only btn-default tooltips"
																	href='<c:url value="/movie/findById?id=${movie.id }"></c:url>'
																	data-toggle="tooltip" data-placement="bottom"
																	data-html="true" data-original-title="电影详情"> <i
																		class="fa fa-info"></i>
																</a> <a
																	class="btn btn-circle btn-icon-only btn-default tooltips"
																	href='<c:url value="/movie/showEdit?id=${movie.id}"></c:url>' data-toggle="tooltip"
																	data-placement="bottom" data-html="true"
																	data-original-title="编辑">
																		 <span
																		class="glyphicon glyphicon-pencil"></span>
																</a> <a
																	class="btn btn-circle btn-icon-only btn-default tooltips"
																	href='<c:url value="/movie/delete?id=${movie.id}"></c:url>'
																	data-toggle="tooltip" data-placement="bottom"
																	data-html="true" data-original-title="电影下架"> <i	class="icon-trash"></i>
																</a></td>
															</tr>
														</c:forEach>
														<%@ include file="../base/page.jsp"%>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
									
								</div>
							</form>
						</div>
					</div>
					<!-- END PAGE CONTENT-->
				</div>
			</div>
			<!-- END CONTAINER -->

	<!-- 尾部公共部分 -->
 <jsp:include page="../base/foot.jsp"></jsp:include> 
	
	