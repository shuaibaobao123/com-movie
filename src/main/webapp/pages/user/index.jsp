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
	<link rel="shortcut icon"	href='<c:url value="/scripts/images/favicon.ico"></c:url>' />
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
		<div id="main-content" class="col-2-3">
			<div class="wrap-content">
				<div class="movie">
					<div class="row type">
						<div class="title">
							<center><h2>最新上映</h2></center>
						</div>
					</div>
					<div class="row">
					<c:forEach items="${newMovieList}" var="movie" varStatus="index">
					<c:if  test="${index.count<=4 }">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src='<c:url value="/upload/img/${movie.img}"></c:url>'/> 
									  <div class="mask">  
										<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}" class="info" title="Full Image"><img src="${pageContext.request.contextPath}/pages/user/images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}"><h3>${movie.name}</h3></a>
									<span>【${movie.director}】<br>${movie.mainact1}|${movie.mainact2} </span>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
						</div>
						
						<div class="row">
					<c:forEach items="${newMovieList}" var="movie" varStatus="index">
					<c:if  test="${index.count>4&&index.count<=8 }">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src='<c:url value="/upload/img/${movie.img}"></c:url>'/> 
									  <div class="mask">  
										<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}" class="info" title="Full Image"><img src="${pageContext.request.contextPath}/pages/user/images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}"><h3>${movie.name}</h3></a>
									<span>【${movie.director}】<br>${movie.mainact1}|${movie.mainact2} </span>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
						</div>
				</div>
				<div class="serie">
					<div class="row type">
						<div class="title">
							<center><h2>历史热播</h2></center>
						</div>
					</div>
					<div class="row">
						<c:forEach items="${hotMovieList}" var="movie" varStatus="index">
						<c:if  test="${index.count<=4}">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src='<c:url value="/upload/img/${movie.img}"></c:url>'/> 
									  <div class="mask">  
										<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}" class="info" title="Full Image"><img src="${pageContext.request.contextPath}/pages/user/images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}"><h3>${movie.name}</h3></a>
									<span>【${movie.director}】<br>${movie.mainact1}|${movie.mainact2} </span>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
					</div>
					<div class="row">
						<c:forEach items="${hotMovieList}" var="movie" varStatus="index">
						<c:if  test="${index.count>4&&index.count<=8}">
						<div class="col-1-4">
							<div class="wrap-col">
								<div class="post">
									<div class="view effect">  
									  <img class="thumb" src='<c:url value="/upload/img/${movie.img}"></c:url>'/> 
									  <div class="mask">  
										<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}" class="info" title="Full Image"><img src="${pageContext.request.contextPath}/pages/user/images/play_button_64.png" /></a>  
									  </div>  
									</div>
									<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}"><h3>${movie.name}</h3></a>
									<span>【${movie.director}】<br>${movie.mainact1}|${movie.mainact2} </span>
								</div>
							</div>
						</div>
						</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
		<div id="sidebar" class="col-1-3">
			<div class="wrap-sidebar">
				<!---- Start Widget ---->   
				<div class="widget wid-post">
					<div class="wid-header">
						<h5>猜您喜欢</h5>
						<a href="${pageContext.request.contextPath}/user/toIndex"><label style="margin-left: 50%;color: white;padding-top: 10px;">换一批</label></a>
					</div>

					<div class="wid-content">
						<c:forEach items="${suggestList}" var="movie">
						<div class="post">
							<a href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}" title="${movie.rank}分">
							<img src='<c:url value="/upload/img/${movie.img}"></c:url>' style="width: 130px;height:185px;"/>
							 </a>
							<div class="wrapper">
							  <a  href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}" title="${movie.rank}分"><h6>${movie.name}</h6></a>
							  <p><fmt:formatDate value="${movie.startdate}"/>&nbsp;<i>上映</i> </p>
							  <br>
							  <div style="font-size: 18px;">
							  <c:if test="${movie.rank>=1}">
							  <i class="fa fa-star" style="color:red;" id="s1"></i>
							  </c:if>
							   <c:if test="${movie.rank>1&&movie.rank<2}">
							  <i class="fa fa-star-half" style="color:red;" id="s1"></i>
							  </c:if>
							  <c:if test="${movie.rank>=2}">
							  <i class="fa fa-star" style="color:red;" id="s1"></i>
							  </c:if>
							    <c:if test="${movie.rank>2&&movie.rank<3}">
							  <i class="fa fa-star-half" style="color:red;" id="s1"></i>
							  </c:if>
							  <c:if test="${movie.rank>=3}">
							  <i class="fa fa-star" style="color:red;" id="s1"></i>
							  </c:if>
							   <c:if test="${movie.rank>3&&movie.rank<4}">
							  <i class="fa fa-star-half" style="color:red;" id="s1"></i>
							  </c:if>
							    <c:if test="${movie.rank>=4}">
							  <i class="fa fa-star" style="color:red;" id="s1"></i>
							  </c:if>
							    <c:if test="${movie.rank>4&&movie.rank<5}">
							  <i class="fa fa-star-half" style="color:red;" id="s1"></i>
							  </c:if>
							     <c:if test="${movie.rank==5}">
							  <i class="fa fa-star" style="color:red;" id="s1"></i>
							  </c:if>
							 
							</div>
							</div>
						</div>
						 </c:forEach>
					</div>
				</div>
				</div>
				</div>
				
</section>

<!--////////////////////////////////////Footer---->

 <jsp:include page="foot.jsp"></jsp:include> 

</div>

</body></html>