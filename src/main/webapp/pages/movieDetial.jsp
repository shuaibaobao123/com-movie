<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../base/base.jsp"></jsp:include>
</head>
<style>
.lineheight34 {
font-size: 15px;
}
</style>
<body>
	<!-- BEGIN BODY -->
	<div
		class="page-container-bg-solid page-sidebar-closed-hide-logo page-header-fixed ">
		<!-- BEGIN TOP -->
		<jsp:include page="../base/bodycomm.jsp"></jsp:include>
		<div class="page-container">
			<!-- BEGIN SIDEBAR -->
			<jsp:include page="../base/left.jsp"></jsp:include>
			<!-- END SIDEBAR -->
			<!-- 下面是正文部分 -->
			<!-- BEGIN CONTENT -->
			<div class="page-content-wrapper">
				<div class="page-content" style="min-height: 801px">
					<!-- BEGIN PAGE HEADER-->
					<h3 class="page-title">
						电影管理
						<!-- 现 金 券 管 理-->
					</h3>
					<div class="page-bar">
						<ul class="page-breadcrumb">
							<li><i class="fa fa-home"></i> <a href="#"> 首页< </a> <i
								class="fa fa-angle-right"></i></li>
							<li><a href="javascript:void(0);">电影管理</a> <i
								class="fa fa-angle-right"></i></li>
							<li class="active"><a href="javascript:void(0);">电影详情 </a></li>

						</ul>
					</div>
					<!-- END PAGE HEADER-->

					<!-- BEGIN PAGE CONTENT-->
					<div class="row">
						<div class="col-md-12">
							<div class="portlet light">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-stumbleupon-circle font-green-sharp"></i> <span
											class="caption-subject font-green-sharp bold">电影详情 <!-- 现 金 券 详 情--></span>
									</div>
									<div class="actions btn-set">
										<a class="btn btn-default btn-circle"
											href="javascript:void(0);"
											onclick="javascript:history.go(-1)"><i
											class="fa fa-angle-left"></i> 返回<!-- 返 回--></a>
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-responsive">
										<table class="table table-bordered table_sxcondition">
											<tbody>

												<tr>
													<th width="25%">电影名称：</th>
													<td width="75%" class="lineheight34" style="font-size: 20px;/*font-stretch: narrower;*/">《${movie.name }》</td>
												</tr>


												<tr>
													<th width="25%">导演：</th>
													<td width="75%" class="lineheight34">${movie.director }</td>
												</tr>

												<tr>
													<th width="25%">主演：</th>
													<td width="75%" class="lineheight34" style="color:blue;">${movie.mainact1 }、${movie.mainact2 }</td>
												</tr>
												<tr>
													<th width="25%">是否会员电影：</th>
													<td width="75%" class="lineheight34">
													<c:if test="${movie.ispay==0}">否</c:if>
													<c:if test="${movie.ispay==1}">是</c:if>
													</td>
												</tr>
												<tr>
													<th width="25%">上映时间：</th>
													<td width="75%" class="lineheight34"style="color:red;/*font-stretch: wider;*/">${movie.startdate.toLocaleString().substring(0,8) }</td>
												</tr>
												<tr>
													<th width="25%">电影类别<!-- 客 服 电 话-->：
													</th>
													<td width="75%" class="lineheight34">
													${movie.typename}
														</td>
												</tr>
												<tr>
													<th width="25%">上映地区<!-- 客 服 电 话-->：
													</th>
													<td width="75%" class="lineheight34">
														${movie.countryname}
													</td>
												</tr>
												<tr>
													<th width="25%">综合评分 <!-- 客 服 电 话-->：
													</th>
													<td width="75%" class="lineheight34">${movie.rank }&nbsp;分</td>
												</tr>
												<tr>
													<th width="25%">播放量<!-- 客 服 电 话-->：
													</th>
													<td width="75%" class="lineheight34">${movie.count }&nbsp;次</td>
												</tr>

												<tr>
													<th width="25%">电影简介：</th>
													<td width="75%" class="lineheight34" style="padding-right:200px;color:grey;">${movie.introduce }
													</td>
												</tr>
												<tr>
													<th width="25%">封面图片：</th>
													<td width="75%" class="lineheight34"><img
														id="mall_img" src="${pageContext.request.contextPath}/upload/img/${movie.img}"
														style="border: 6px solid pink; width: 200px; height: 250px;">
													</td>
												</tr>
												<tr>
													<th width="25%">剧照<!-- 商 家 相 册-->：
													</th>
													<td><c:if test="${empty imageList}"><label style="color:red;">暂无剧照详情！</label></c:if></td>
												</tr>
												<c:forEach var="movieImg" items="${imageList}"
													varStatus="index">
													<tr>
														<th></th>
															<td class="lineheight34">
													<img id="mall_img"
														src='<c:url value="/upload/img/${movieImg.img}"></c:url>'
														style="border: 5px solid #eee; width: 170px; height: 180px;">
														</td>
														</tr>
														<tr>
														<th></th>
															<td class="lineheight34" style="color: blue;">
													<B>剧照${index.count}简介：</B><label style="color: gray;">${movieImg.imgDesc}</label>	
														</td>
														
													</tr>
												</c:forEach>
										

												<tr>
													<th></th>
													<td>
														&nbsp;&nbsp;<button type="button" class="btn default"
															onclick="javascript:history.go(-1)">
															<i class="fa fa-angle-left"></i> 返回
															<!-- 返 回-->
														</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- END PAGE CONTENT-->
				</div>
			</div>
			<!-- END PAGE CONTENT-->
			<!-- 正文部分结束 -->


		</div>
		<jsp:include page="../base/foot.jsp"></jsp:include>
	</div>
<script type="text/javascript">
//$(".lineheight34").attr("style","margin-left:20px;");
</script>

</body>
</html>