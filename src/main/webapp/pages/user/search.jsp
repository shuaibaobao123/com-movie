<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

    <!-- Basic Page Needs
  ================================================== -->
	<meta charset="utf-8">
	<title>zMovie</title>
	<meta name="description" content="Free Responsive Html5 Css3 Templates | zerotheme.com">
	<meta name="author" content="www.zerotheme.com">
	
    <!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <!-- CSS
  ================================================== -->
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/user/css/zerogrid.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/user/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/pages/user/css/responsive.css">
	
	<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/${pageContext.request.contextPath}/pages/user/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
        </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
		<script src="js/html5.js"></script>
		<script src="js/css3-mediaqueries.js"></script>
	<![endif]-->
    
</head>
<body>
<div class="wrap-body">

<!--////////////////////////////////////Header-->
<jsp:include page="top.jsp"></jsp:include>


<!--////////////////////////////////////Container-->
		<section id="container">
			<div class="wrap-container zerogrid">
				<div id="main-content" class="col-3-3">
					<div class="wrap-content">
						<div class="movie">
							<div class="title">
								<center>
								 <c:if test="${empty pageBean.rows}">
								 <h2 style="font-size: 18px;">暂无相关影片,敬请期待！</h2>
								 </c:if>
								  <c:if test="${!empty pageBean.rows}">
									<h2>相关影片</h2>
								 </c:if>
								
								</center>
							</div>
							<div class="row" style="width: 80%; padding: 0 10%;">
									<c:forEach var="movie" items="${pageBean.rows }">
								<div class="col-1-4">
									<div class="wrap-col">
										<div class="post">
											<div class="view effect">
												<img class="thumb" src='<c:url value="/upload/img/${movie.img}"></c:url>' />
												<div class="mask">
													<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}" class="info" title="Full Image"><img src="${pageContext.request.contextPath}/pages/user/images/play_button_64.png" /></a>  
												</div>
											</div>
											<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}"><h3>${movie.name}</h3></a>
									<span>【${movie.director}】<br>${movie.mainact1}|${movie.mainact2} </span>
										</div>
									</div>
								</div>
								</c:forEach>
								<c:if test="${!empty pageBean.rows}">
								<center>
								<jsp:include page="page.jsp"></jsp:include> 
							</center>
								 </c:if>
							</div>
							 
							
 <jsp:include page="foot.jsp"></jsp:include> 
</div>

</body></html>