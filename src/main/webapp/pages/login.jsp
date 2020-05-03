<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
<title>Movie Manager</title>
<link rel="shortcut icon"
	href='<c:url value="/scripts/images/favicon.ico"></c:url>' />

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN PACE PLUGIN FILES -->
<script type="text/javascript"
	src='<c:url value="/assets/global/plugins/pace/pace.min.js"></c:url>'></script>


<link
	href='<c:url value="/assets/global/plugins/pace/themes/pace-theme-flash.css"></c:url>'
	rel="stylesheet" type="text/css" />
<!-- END PACE PLUGIN FILES -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/> -->
<link
	href='<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"></c:url>'
	rel="stylesheet" type="text/css" />
<link
	href='<c:url value="/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"></c:url>'
	rel="stylesheet" type="text/css" />
<link
	href='<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.min.css"></c:url>'
	rel="stylesheet" type="text/css" />
<link
	href='<c:url value="/assets/global/plugins/uniform/css/uniform.default.css"></c:url>'
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link href='<c:url value="/assets/admin/pages/css/login.css"></c:url>'
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href='<c:url value="/assets/global/css/components.css"></c:url>'
	id="style_components" rel="stylesheet" type="text/css" />
<link href='<c:url value="/assets/global/css/plugins.css"></c:url>'
	rel="stylesheet" type="text/css" />
<link
	href='<c:url value="/assets/admin/layout2/css/layout.css"></c:url>'
	rel="stylesheet" type="text/css" />
<link id="style_color"
	href='<c:url value="/assets/admin/layout2/css/themes/grey.css"></c:url>'
	rel="stylesheet" type="text/css" />
<link
	href='<c:url value="/assets/admin/layout2/css/custom.css"></c:url>'
	rel="stylesheet" type="text/css" />
<!-- END THEME STYLES -->
<link rel="shortcut icon" href='<c:url value="/scripts/images/book1.jpg"></c:url>' />
<!-- <script language="javaScript">
	window.location = "<c:url value="/main/index.do"/>" ;
</script> -->
</head>

<body class="login thisIsLoginPageTag">

	<div align="center" id="feel">
		<div align="center" class="alert alert-warning alert-dismissable"
			style="position: absolute; margin-top: 10px; width: 80%; margin-left: 10%">
			<button type="button" class="close" data-dismiss="alert"
				aria-hidden="true">&times;</button>
			为了给您更好的用户体验，推荐您使用Chrome或Firefox浏览器。
		</div>
	</div>
	<div class="menu-toggler sidebar-toggler"></div>
	<div class="logo">
		<a href="index.html"><img
			src='<c:url value="/assets/admin/layout2/img/logo2.png"></c:url>'
			alt="IBooK|商家服务平台 " /> </a>
	</div>
	<div class="content">

		<!-- BEGIN LOGIN FORM -->
		<form name="loginForm" class="login-form" id="loginForm"	action="${pageContext.request.contextPath}/manager/login.html" method="post">
			<h3 class="form-title hide">登录客户服务平台</h3>
			<!-- 登录客户服务平台 -->
				<!-- 错误信息 -->
		  <c:choose>
			  <c:when test="${error != null}">
			 	<c:if test="${error =='1' }">
				  	<div class="alert alert-danger "> 
					<div  class="login-alert">用户名或密码错误</div>
					</div>
				</c:if>
				<c:if test="${error==2 }">
					<div class="alert alert-danger ">
					<div class="login-alert">验证码错误</div>
				</div>
				</c:if>
				<c:if test="${error =='3' }">
				  	<div class="alert alert-danger "> 
					<div  class="login-alert">登录信息已过期，请重新登陆！</div>
					</div>
				</c:if>
			   </c:when>
			   <c:otherwise>
					<div class="alert alert-danger " id="error-info" style="display:none">
						<div class="alert-none"></div>
					</div>
			   </c:otherwise>
		 	</c:choose> 
		
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">登录名</label>
				<!-- 用户名 -->
				<input class="form-control form-control-solid placeholder-no-fix"
					type="text" autocomplete="on" placeholder="    登录名"
					name="name" id="name" />
			</div>
			<input type="hidden" id="j_username" name="j_username" value="" />
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<!-- 密码 -->
				<input class="form-control form-control-solid placeholder-no-fix"
					type="password" autocomplete="off" placeholder="    密码"
					name="password" id="password" />
			</div>
			<div class="form-group clearfix">
			</div>
			<div class="form-actions" style="margin-top: 30px;">
				<button id="submitButton" type="button"
					class="btn btn-primary uppercase" onclick="return onSubmit()">登录</button>
				<label class="rememberme check"> <input type="checkbox"		name="remember" id="remember" checked="true" />记住用户名
				</label>

			</div>
		</form>
		<!-- END LOGIN FORM -->

	</div>
	<div class="copyright">
		Copyright <sup>&copy;</sup> BS_2020 | movie | YSJ研发
	</div>
	<!-- END LOGIN -->
	<!-- BEGIN CORE PLUGINS -->
	<!--[if lt IE 9]>
<script src='<c:url value="/assets/global/plugins/respond.min.js"></c:url>'></script>
<script src='<c:url value="/assets/global/plugins/excanvas.min.js"></c:url>'></script> 
<![endif]-->
	<script
		src='<c:url value="/assets/global/plugins/jquery.min.js"></c:url>'
		type="text/javascript"></script>
	<script
		src='<c:url value="/assets/global/plugins/jquery-migrate.min.js"></c:url>'
		type="text/javascript"></script>
	<script
		src='<c:url value="/assets/global/plugins/bootstrap/js/bootstrap.min.js"></c:url>'
		type="text/javascript"></script>
	<script
		src='<c:url value="/assets/global/plugins/jquery.blockui.min.js"></c:url>'
		type="text/javascript"></script>
	<script
		src='<c:url value="/assets/global/plugins/uniform/jquery.uniform.min.js"></c:url>'
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src='<c:url value="/assets/global/plugins/jquery-validation/js/jquery.validate.min.js"></c:url>'
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script
		src='<c:url value="/assets/global/scripts/metronic.js"></c:url>'
		type="text/javascript"></script>
	<script
		src='<c:url value="/assets/admin/pages/scripts/login.js"></c:url>'
		type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script type="text/javascript">
		function onSubmit() {
			if ($.trim(document.getElementById("name").value) == "") {
				$('.alert-none').addClass("login-alert");
				$('.login-alert').text("用户名不能为空");
				//document.getElementById("j_username") = "";
				$("#error-info").show();
				return false;
			}
			if ($.trim(document.getElementById("password").value) == "") {
				$('.alert-none').addClass("login-alert");
				$('.login-alert').text("密码不能为空");
				//document.getElementById("password") = "";
				$("#error-info").show();
				return false;
			}
			//TODO: 增加客户号用户名验证
			$("#loginForm").submit();
			return true;
		}
	</script>
	<script type="text/javascript">
		var explorer = window.navigator.userAgent;

		if (explorer.indexOf("Chrome") >= 0) {
			$("#feel").hide();
		}
		function refreshCaptcha() {
			$('#captchaImg').hide().attr('src','<c:url value="/commons/jcaptcha.jpg"/>?' + Math.floor(Math.random()*100)).fadeIn();
		}	
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>