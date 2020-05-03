<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="en"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="en"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->
<head>

<!-- Basic Page Needs
  ================================================== -->
<meta charset="utf-8">
<title>zMovie</title>
<meta name="description"
	content="Free Responsive Html5 Css3 Templates | zerotheme.com">
<meta name="author" content="www.zerotheme.com">

<!-- Mobile Specific Metas
  ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
  ================================================== -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/pages/user/css/zerogrid.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/pages/user/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/pages/user/css/responsive.css">

<!--[if lt IE 8]>
       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/${pageContext.request.contextPath}/pages/user/${pageContext.request.contextPath}/pages/user/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
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


		<section id="container">
			<div class="wrap-container zerogrid">
				<div id="main-content" class="col-2-3">
					<div class="wrap-content">
						<article>
							<div class="art-header">
								<div class="col-1-3">
								<img alt="" style="width: 250px;height: 320px;margin-top: 10px;margin-left: 15px" src="${pageContext.request.contextPath}/upload/img/${movie.img}">
									<a href="#palyDiv" ><span id="topalyDiv"></span></a>
								</div>
								<div class="col-2-3">
									<div class="wrap-col" style="padding-left: 100px;">
										<ul>
											<li><p>
													影片: <a href="#">${movie.name } ${movie.id }</a>
												</p></li>
											<li><p>
													导演: <a href="#">${movie.director }</a>
												</p></li>
											<li><p>
													主演: <a href="#">${movie.mainact1 }|${movie.mainact2 }</a>
												</p></li>
											<li><p>
													上映时间: <a href="#"><fmt:formatDate
															value="${movie.startdate}" /></a>
												</p></li>
											<li><p>
													国家: <a href="#">${movie.countryname}</a>
												</p></li>
											<li><p>
													类型: <a href="#"> ${movie.typename}</a>
												</p></li>
											<li><p>
													会员: <a href="#"> <c:if test="${movie.ispay==1}">会员电影</c:if>
														<c:if test="${movie.ispay==0}">非会员电影</c:if>
													</a>
												</p></li>
											<li>
												<p>
													综合评分： <i class="fa fa-star-o" style="color: red" id="s1"></i>
													<i class="fa fa-star-o" style="color: red" id="s2"></i> <i
														class="fa fa-star-o" style="color: red" id="s3"></i> <i
														class="fa fa-star-o" style="color: red" id="s4"></i> <i
														class="fa fa-star-o" style="color: red" id="s5"></i> <label
														style="color: red;">(${movie.rank})</label>
												</p>
											</li>
											<li><a class="button bt1" href="javascrip:void(0);"
												onclick="clickPlay();">播放</a> <a id="collectionUrl" href="#"></a>
												<a class="button bt1" href="javascript:void(0);"
												onclick="checkLogin();">收藏</a> <a class="button bt1"
												href="javascript:void(0);" onclick="showPinjia();">吐槽</a></li>
										</ul>
									</div>
								</div>
								<div class="clear"></div>
							</div>
							<div class="art-content">
								<p style="font-family: 微软雅黑; font-size: 20px; color: orange;">
									影片简介： <br>
									<c:if test="${!empty imageList}">
										<p style="font-family: 微软雅黑;">${movie.introduce}</p>
									</c:if>
								</p>
								<div class="wrap-col" style="width: 100%" id="palyDiv">
								<input type="hidden" id="momo">
										<video width="100%" height="350px" id="myVideo"	controls="controls">
											<source
												src="${pageContext.request.contextPath}/upload/movie/${movie.moviesrc}"
												type="video/ogg">
											<source
												src="${pageContext.request.contextPath}/upload/movie/${movie.moviesrc}"
												type="video/mp4">
											<source
												src="${pageContext.request.contextPath}/upload/movie/${movie.moviesrc}"
												type="video/avi">
											Your browser does not support the video tag.
										</video>
									</div>
								
								<p style="font-family: 微软雅黑; font-size: 20px; color: orange;">
									精彩剧照：</p>
								<c:if test="${empty imageList}">
									<p style="font-family: 微软雅黑;">
										<label style="color: red;">暂无剧照详情！</label>
									</p>
								</c:if>
								
								<c:forEach var="movieImg" items="${imageList}" varStatus="index">
									<div style="margin-top: 20px; margin-left: 10%">
										<div class="row">
											<img style="width: 60%;" src='<c:url value="/upload/img/${movieImg.img}" ></c:url>' />
											<p style="font-family: 微软雅黑; width: 50%;margin-left: 5%">${movieImg.imgDesc}</p>
										</div>
										<div class="clear"></div>
									</div>
								</c:forEach>
							</div>
						</article>
						<div class="widget wid-related">
							<div class="wid-header">
								<h5>电影评论(${pinjiaCounts}条)</h5>
							</div>
							<div class="wid-content" style="background-color: #e9e9e9;">
								<c:forEach var="pingjia" items="${pinjiaList}" varStatus="index">
									<div class="row" style="margin: 20px 0;">
										<p>
											<h5 style="font-size: 18px; color: black;">${pingjia.uname}&nbsp;&nbsp;
											<label style="font-size: 12px; color: gray;"><i><fmt:formatDate
														value="${pingjia.pjdate}" /></i></label> <%--(<i class="fa fa-star"
												style="color: orangered;"></i> <i class="fa fa-star"
												style="color: orangered;"></i> <i class="fa fa-star"
												style="color: orangered;"></i>)--%>
										<c:if test="${pingjia.rank.intValue()==1}">(<i class="fa fa-star"
											style="color: orangered;"></i>)</c:if>
										<c:if test="${pingjia.rank.intValue()==2}">(<i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i>)</c:if>
										<c:if test="${pingjia.rank.intValue()==3}">(<i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i>)</c:if>
										<c:if test="${pingjia.rank.intValue()==4}">(<i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i>)</c:if>
										<c:if test="${pingjia.rank.intValue()==5}">(<i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i><i class="fa fa-star"
											style="color: orangered;"></i>)</c:if>
										<%--${pingjia.rank.intValue()}--%>
										</h5>
										</p>
										<p>
											<label style="font-size: 15px; color: black;">
												${pingjia.content} </label>
										</p>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div id="sidebar" class="col-1-3">
					<div class="wrap-sidebar">
						<div class="widget wid-post">
							<div class="wid-header">
								<h5>${movie.director}作品</h5>
							</div>
							<div class="wid-content">
								<c:if test="${empty suggestDirectMovie }">
					暂无！
					 </c:if>
								<c:forEach items="${suggestDirectMovie}" var="movie">
									<div class="post">
										<a
											href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}">
											<img src='<c:url value="/upload/img/${movie.img}"></c:url>'
											style="width: 130px; height: 185px;" />
										</a>
										<div class="wrapper">
											<a href="#"><h6>${movie.name}</h6></a>
											<p>
												<fmt:formatDate value="${movie.startdate}" />
												&nbsp;<i>上映</i>
											</p>
											<a href="#"><img
												src="${pageContext.request.contextPath}/pages/user/images/star.png" /></a>
										</div>
									</div>
								</c:forEach>
							</div>

							<!---- Start Widget ---->
							<div class="widget wid-last-updates">
								<div class="wid-header">
									<h5>${movie.mainact1}、${movie.mainact2} 作品</h5>
								</div>
								<div class="wid-content">
									<c:if test="${empty suggestActMovie }">
					暂无！
					 </c:if>
									<c:forEach items="${suggestActMovie}" var="movie">
										<div class="post">
											<a	href="${pageContext.request.contextPath}/movie/userfindById?id=${movie.id}">
												<img src='<c:url value="/upload/img/${movie.img}"></c:url>'
												style="width: 130px; height: 185px;" />
											</a>
											<div class="wrapper">
												<a href="#"><h6>${movie.name}</h6></a>
												<p>
													<fmt:formatDate value="${movie.startdate}" />
													&nbsp;<i>上映</i>
												</p>
												<a href="#"><img
													src="${pageContext.request.contextPath}/pages/user/images/star.png" /></a>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
		
		</section>

   <input type="hidden" id="collectionResult" value="${collectionResult}"> 
		<jsp:include page="foot.jsp"></jsp:include>
	</div>

	<script
		src="${pageContext.request.contextPath}/pages/user/js/jquery.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/pages/user/js/css3-mediaqueries.js"></script>
	<script type="text/javascript">
		var collectionResult = $("#collectionResult").val();
		if (collectionResult !="") {
			alert(collectionResult);
			$("#collectionResult").val("");
		}

		$("#myVideo")[0].addEventListener('play', function() {
			var isfirstPlay = $("#isfirstPlay").val();
			if (isfirstPlay == 1) {
				//此条件为第一次播放，播放量应该+1
				console.log("播放(仅仅第一次播放)！");
				$("#isfirstPlay").val("0");
				var movieId = ${movie.id};
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/movie/addCount",
					data : {id : movieId},
					dataType : "json",
					success : function(data) {
						console.log("播放量更改成功！");
					}
				})
			}
		});

		function clickPlay() {
			var loginName = $("#loginName").val() + "_";
			var isMember = $("#isMember").val();
			var isPay = ${movie.ispay};
			if (isPay == "1") {
				if (loginName == "_") {
					$("#loginError").html("会员电影需要登录观看");
					$("#myVideo").removeAttr("controls");
					$("#login-dialog").show().on("click", ".close",function() {
						$("#login-dialog").hide();
							});;
				} else {
					if (isMember == "0") {
						$("#memberError").html("您还不是会员请开通后观看(30/月)");
						$("#myVideo").removeAttr("controls");
						$("#member-dialog").show().on("click", ".close",
								function() {
							$("#member-dialog").hide();
								});
					} else {
						$("#topalyDiv").click();
						$("#myVideo")[0].play();
					}
				}
			} else {
				$("#topalyDiv").click();
				$("#myVideo")[0].play();
			}
		}

		function showPinjia() {
			$("#pinjia-dialog").show().on("click", ".close", function() {
				$("#pinjia-dialog").hide();
			});
		}

		function checkLogin() {
			var userId = $("#loginId").val() + "_";
			console.log(userId);
			if (userId == "_") {
				$("#loginError").html("收藏电影需要登录！");
				$("#login-dialog").show().on("click", ".close", function() {
					$("#login-dialog").hide();
				});
			} else {
				$("#collectionUrl").attr("href","${pageContext.request.contextPath}/user/addCollection?movieId=${movie.id}");
				window.location.href = "${pageContext.request.contextPath}/user/addCollection?movieId=${movie.id}";
			}
		}
		var loginName = $("#loginName").val() + "_";
		var isMember = $("#isMember").val();
		var isPay = ${movie.ispay};
		if (isPay == "1") {
			if (loginName == "_") {
				$("#loginError").html("会员电影请登录");
				$("#myVideo").removeAttr("controls");
			} else {
				if (isMember == "0") {
					$("#memberError").html("您还不是会员，请开通后观看");
					$("#myVideo").removeAttr("controls");
				}
			}
		}

		//显示评分
		var s = ${movie.rank};
		if (s >= 1) {
			$("#s1").attr("class", "fa fa-star");
		}
		if (s > 1 && s < 2) {
			$("#s2").attr("class", "fa fa-star-half-o");
		}
		if (s >= 2) {
			$("#s2").attr("class", "fa fa-star");
		}
		if (s > 2 && s < 3) {
			$("#s3").attr("class", "fa fa-star-half-o");
		}
		if (s >= 3) {
			$("#s3").attr("class", "fa fa-star");
		}
		if (s > 3 && s < 4) {
			$("#s4").attr("class", "fa fa-star-half-o");
		}
		if (s >= 4) {
			$("#s4").attr("class", "fa fa-star");
		}
		if (s > 4 && s < 5) {
			$("#s5").attr("class", "fa fa-star-half-o");
		}
		if (s == 5) {
			$("#s5").attr("class", "fa fa-star");
		}
	</script></body>
</html>