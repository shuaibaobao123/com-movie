<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
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
<link rel="shortcut icon"
	href='<c:url value="/scripts/images/favicon.ico"></c:url>' />
	
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
<link
	href='<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"></c:url>'
	rel="stylesheet" type="text/css">

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
		<header>
			<div class="top-bar">
				<div class="wrap-top zerogrid">
					<div class="row">
						<div class="col-1-2">
							<div class="wrap-col">
								<ul>
									<li class="mail"><p>${sessionScope.userNow.uname}</p></li>
									<li class="phone" ><p style="color:red;"> <c:if test="${sessionScope.userNow.ismember==1}"><b>【黄金会员】</b></c:if>
									<c:if test="${sessionScope.userNow.ismember==0}"><b><a onclick="openMemberFast();" style="color: red;">【开通会员】</a></b></c:if>
									</p></li>
								</ul>
							</div>
						</div>
						<div class="col-1-2">
							<div class="wrap-col f-right">
								<ul>
									<input id="loginId" type="hidden"
										value="${ sessionScope.userNow.id}">
									<input id="loginName" type="hidden"
										value="${ sessionScope.userNow.uname}">
									<input id="isMember" type="hidden"
										value="${ sessionScope.userNow.ismember}">
										<c:if test="${empty sessionScope.userNow.uname}">
									<li class="mail1"><p>
											<a href="javascript:void(0)" style="color: white;"
												id="loginBtn">登录</a>
										</p></li>
										<li class="phone1"><p>
											<a href="javascript:void(0)" style="color: white;"
												id="registBtn">注册</a>
										</p></li>
										</c:if>
									<c:if test="${!empty sessionScope.userNow.uname}">
									<li class="mail2"><p>
											<a href="javascript:void(0)" onclick="logout(${sessionScope.userNow.id});" style="color: white;"
												id="loginBtn">退出登录</a>
										</p></li>
										</c:if>
								</ul>
								<!--
                    	作者：baikun17@163.com
                    	时间：2016-10-31
                    	描述：
                    	<ul>
							<li><select>
								<option value="en" selected>English</option>
								<option value="fe">France</option>
								<option value="ge">Germany</option>
							</select></li>
							<li><p>Language</p></li>
						</ul>-->
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="wrap-header zerogrid">
				<div class="row">
					<div class="col-1-2">
						<div class="wrap-col">
							<div class="logo">
								<a href="${pageContext.request.contextPath}/user/toIndex"><img
									src="${pageContext.request.contextPath}/pages/user/images/logo.png" /></a>
							</div>
						</div>
					</div>
					<div class="col-1-2">
						<div class="wrap-col f-right">
							<form method="post"	action="${pageContext.request.contextPath}/movie/movieQuery"  id="search">
								<input name="searchParam" id="searchParam" type="text"  placeholder="关键字..." />
								<input type="submit" value="搜索" style="font-family: 微软雅黑;">
							</form>
						</div>
					</div>
				</div>
				<div class="row">
					<div id="menu">
						<nav>
							<div class="wrap-nav">
								<ul>
									<li class="active"><a
										href="${pageContext.request.contextPath}/user/toIndex">首页</a></li>
									<c:forEach items="${typeList}" var="mtype">
										<li><a
											href="${pageContext.request.contextPath}/movie/findByType?typeId=${mtype.id}">${mtype.typename}</a></li>
									</c:forEach>
								</ul>

							</div>
						</nav>
					</div>
				</div>
			</div>
		</header>
	</div>
</body>
<div class="js-dialog hide" id="login-dialog">
		<div class="dialog-mask"></div>
		<div class="dialog-content">
			<div class="dialog-header">
				<img
					src="${pageContext.request.contextPath}/pages/user/images/logo.png"
					class="dialog_logo"> <a href="javascript:void(0)"
					class="close"></a>
			</div>
			<div class="dialog-body">
				<div class="errormsg" id="loginError">帐号和密码不匹配，请重新输入</div>
				<form id="loginForm">
				<table class="table-form">
					<tr>
						<th class="label">帐号:</th>
						<td>
							<div class="text-form">
								<input type="text" id="uname" name="uname" class="in-text" placeholder="请输入密码">
							</div>
						</td>
					</tr>
					<tr>
						<th class="label">密码:</th>
						<td><input type="password"  id="upassword" name="upassword" class="in-text"
							placeholder="请输入密码"></td>
					</tr>
					<tr>
						<th></th>
						<td>
							<div class="loginAuto">
								<label for="login-checkbox"> <input type="checkbox"
									class="in-checkbox" id="login-checkbox"> <span
									class="checkbox">记住我</span>
								</label>
							</div>
							<div class="fr color_gray">
								<a href="#" class="logAutoRightCon">忘记密码 </a><i
									class="RegNowLine"></i><a href="javascript:void(0);" onclick="toRegeist();" class="logAutoRightCon">立即注册
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<th></th>
						<td><a href="javascript:void(0);" onclick="login();" class="form-btn">登录</a></td>
					</tr>
				</table>
				</form>

			</div>
		</div>
	</div>
	
	<div class="js-dialog hide" id="pinjia-dialog">
		<div class="dialog-mask"></div>
		<div class="dialog-content">
			<div class="dialog-header">
				<img
					src="${pageContext.request.contextPath}/pages/user/images/logo.png"
					class="dialog_logo"> <a href="javascript:void(0)"
					class="close"></a>
			</div>
			<div class="dialog-body">
				<div class="errormsg" id="rankError">请填写您对影片的评价</div>
				<form id="rankForm">
				<table class="table-form">
					<tr>
						<th class="label">评分:</th>
						<td>
							<div style="padding-top: 15px;font-size: 25px;color: white;">
						<!-- 	style="color: white;" -->
							<a href="javascript:void(0);" onclick="rank(1);"><i class="fa fa-star" style="color:wheat ;" id="first"></i></a>
							<a href="javascript:void(0);" onclick="rank(2);"><i class="fa fa-star"  style="color: wheat;"id="second"></i></a>
							<a href="javascript:void(0);" onclick="rank(3);"><i class="fa fa-star"  style="color: wheat;" id="third"></i></a>
							<a href="javascript:void(0);" onclick="rank(4);"><i class="fa fa-star"  style="color: wheat;" id="forth"></i></a>
							<a href="javascript:void(0);" onclick="rank(5);"><i class="fa fa-star" style="color: wheat;" id="fifth"></i></a>
							<input type="hidden" id="rank" name="rank" class="in-text" value="5">
							</div>
						</td>
					</tr>
					<tr>
						<th class="label">评论:</th>
						<td>
						<textarea rows="10" cols="10" id="content" name="content"></textarea>
					 	<input type="hidden"  id="movieid" name="movieid" class="in-text"	value="${movie.id }">
					 	<input type="hidden"  id="uname" name="uname" class="in-text"	
					 	<c:if test="${empty sessionScope.userNow.uname}">	value="匿名用户"	</c:if>
					 	<c:if test="${!empty sessionScope.userNow.uname}">	value="${sessionScope.userNow.uname}"	</c:if>>
					 	</td>
					</tr>
					<tr>
						<th></th>
						<td><a href="javascript:void(0);" onclick="subRank();" class="form-btn">提交评价</a></td>
					</tr>
				</table>
				</form>

			</div>
		</div>
	</div>
	
	<div class="js-dialog hide" id="member-dialog">
		<div class="dialog-mask"></div>
		<div class="dialog-content">
			<div class="dialog-header">
				<img
					src="${pageContext.request.contextPath}/pages/user/images/logo.png"
					class="dialog_logo"> <a href="javascript:void(0)"
					class="close"></a>
			</div>
			<div class="dialog-body">
				<div class="errormsg">
					<h5>
						<label id="memberError">您还不是会员请开通后观看(30/月)</label>
					</h5>
				</div>
				<table class="table-form">
					<tr>
						<th></th>
						<td><a href="javascript:void(0);" onclick="openMember();"; class="form-btn">确认开通</a></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<div class="js-dialog hide" id="regist-dialog">
		<div class="dialog-mask"></div>
		<div class="dialog-content">
			<div class="dialog-header">
				<img
					src="${pageContext.request.contextPath}/pages/user/images/logo.png"
					class="dialog_logo"> <a href="javascript:void(0)"
					class="close"></a>
			</div>
			<div class="dialog-body">
				<div class="errormsg" id="regeistError">此帐号已经存在，请直接登录或者找回密码</div>
				<form action="" method="post" id="regeist">
				<table class="table-form">
					<tr>
						<th class="label">用户名:</th>
						<td>
							<div class="text-form">
								<input type="text" id="uname" name="uname" class="in-text" placeholder="请输入用户名">
							</div>

						</td>
					</tr>
					<tr>
						<th class="label">密码:</th>
						<td><input type="password" id="upassword" name="upassword" class="in-text"
							placeholder="请输入密码"></td>
					</tr>
					<tr>
						<th class="label">确认密码:</th>
						<td><input type="password" class="in-text error"
							placeholder="请再次输入密码"></td>
					</tr>
					<tr>
					<td colspan="2" align="center">
						<div class="title" style="margin: 10px 0;">
							<center><h2>我喜欢的电影组合</h2></center>
						</div>
					</td>
				 <tr>
					<th class="label">组合一:</th>
					<td>
						<select id="zuhetype1" name="zuhetype1">
					<option value="" selected>类型</option>
					<c:forEach var="mtype" items="${typeList}" varStatus="index">
					<option value="${mtype.id}">${mtype.typename}</option>
					</c:forEach>
							</select>
							<select id="zuhecountyr1" name="zuhecountyr1">
								<option value="" selected>国家</option>
					<c:forEach var="country" items="${sessionScope.countryList}" varStatus="index">
					<option value="${country.id}">${country.countryname}</option>
					</c:forEach>
					</select>
					</td>
				</tr>
				
				<tr>
					<th class="label">组合二:</th>
					<td>
					<select id="zuhetype2" name="zuhetype2">
					<option value="" selected>类型</option>
					<c:forEach var="mtype" items="${typeList}" varStatus="index">
					<option value="${mtype.id}">${mtype.typename}</option>
					</c:forEach>
							</select>
							<select id="zuhecountyr2" name="zuhecountyr2">
								<option value="" selected>国家</option>
					<c:forEach var="country" items="${sessionScope.countryList}" varStatus="index">
					<option value="${country.id}">${country.countryname}</option>
					</c:forEach>
							</select>
					</td>
				</tr>
					<tr>
						<th></th>
						<td>
							<div class="fr color_gray">
								<a href="#" class="logAutoRightCon">忘记密码 </a> <i
									class="RegNowLine"></i><a href="javascrip:void(0);" onclick="toLogin()" class="logAutoRightCon">立即登录
								</a>
							</div>
						</td>
					</tr>
					<tr>
						<th></th>
						<td><a href="javascript:void(0);" onclick="regeist();" class="form-btn">注册</a></td>
					</tr>
				</table>
				</form>
			</div>
			<input id="isfirstPlay" type="hidden" value="1">
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/pages/user/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/pages/user/js/css3-mediaqueries.js"></script>
<script type="text/javascript">
	 function regeist() {
		 $.ajax({
             type: "post",
             url: "${pageContext.request.contextPath}/user/regeist",
             data: $("#regeist").serialize(),
             dataType: "json",
             success: function(data){
            	var result=data.result;
            	var resultMsg=data.resultMsg;
            	 $("#regeistError").html(resultMsg);
             },
              error: function(data){
            	 alert("请求失败");
            	 console.log(data);
             } 
		 })

	} 
	 function openMember(){
		 var id=$("#loginId").val();
		 $.ajax({
	            type: "post",
	            url: "${pageContext.request.contextPath}/user/openMember",
	            data: {id:id},
	            dataType: "json",
	            success: function(data){
	            	 var result=data.result;
	            	 var resultMsg=data.resultMsg;
	            	 if(result=="success"){
	            		alert(resultMsg);
	            		window.location.reload();
	            	 }else{
	            		 $("#memberError").html(resultMsg);
	            	 }
	            },
	            error: function(){
	           	 alert("请求失败！");
	            }
			 })
	 }
	 
	 function openMemberFast(){
		 $("#member-dialog").show();
	 }
	 function login() {
		 $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/login",
            data: $("#loginForm").serialize(),
            dataType: "json",
            success: function(data){
            	 var result=data.loginResult;
            	 var resultMsg=data.loginResultMsg;
            	 if(result=="success"){
            		alert(resultMsg); 
            		 window.location.reload();
            	 }else{
            		 $("#loginError").html("【登录错误】"+resultMsg);
            	 }
            },
            error: function(){
           	 alert("请求失败！");
            }
		 })
	} 
	
	 function logout() {
		 $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/user/logout",
            dataType: "json",
            success: function(data){
             alert("安全退出登录！");
             window.location.reload();
            },
            error: function(){
           	 alert("请求失败！");
            }
		 })
	} 
	 
	function toLogin(){
		$("#regist-dialog").hide();
		$("#login-dialog").show();
	}
	
	function toRegeist(){
		$("#login-dialog").hide();
		$("#regist-dialog").show();
	}
	
	$("#loginBtn").on("click", function() {
		var loginDialog = $("#login-dialog");
		loginDialog.show().on("click", ".close", function() {
			loginDialog.hide();
		})
	})
	$("#registBtn").on("click", function() {
		var registerDialog = $("#regist-dialog");
		registerDialog.show().on("click", ".close", function() {
			registerDialog.hide();
		})
	})
	
	function rank(star){
		if(star==1){
			$("#first").attr("style","color:red;");
			$("#second").attr("style","color:wheat;");
			$("#third").attr("style","color:wheat;");
			$("#forth").attr("style","color:wheat;");
			$("#fifth").attr("style","color:wheat;");
			$("#rank").val("1");
		}else if(star==2){
			$("#first").attr("style","color:red;");
			$("#second").attr("style","color:red;");
			$("#third").attr("style","color:wheat;");
			$("#forth").attr("style","color:wheat;");
			$("#fifth").attr("style","color:wheat;");
			$("#rank").val("2");
			
		}else if(star==3){
			$("#first").attr("style","color:red;");
			$("#second").attr("style","color:red;");
			$("#third").attr("style","color:red;");
			$("#forth").attr("style","color:wheat;");
			$("#fifth").attr("style","color:wheat;");
			$("#rank").val("3");
			
		}else if(star==4){
			$("#first").attr("style","color:red;");
			$("#second").attr("style","color:red;");
			$("#third").attr("style","color:red;");
			$("#forth").attr("style","color:red;");
			$("#fifth").attr("style","color:wheat;");
			$("#rank").val("4");
			
		}else if(star==5){
			$("#first").attr("style","color:red;");
			$("#second").attr("style","color:red;");
			$("#third").attr("style","color:red;");
			$("#forth").attr("style","color:red;");
			$("#fifth").attr("style","color:red;");
			$("#rank").val("5");
		}
	}
	
	function subRank(){
		 $.ajax({
	            type: "post",
	            data: $("#rankForm").serialize(),
	            url: "${pageContext.request.contextPath}/movie/rank",
	            dataType: "json",
	            success: function(data){
	            	$("#rankError").html(data.rankResultMsg+"【即将自动刷新本页面】");
	            	setTimeout(function(){
	            		 window.location.reload();
	            		},1000);
	            },
	            error: function(){
	           	 alert("请求失败！");
	            }
			 })
	}

</script>

