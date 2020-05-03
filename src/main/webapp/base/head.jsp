<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../base/taglibs.jsp"%>

<script
	src='<c:url value="/assets/global/plugins/pace/pace.min.js"></c:url>'
	type="text/javascript"></script>
<link
	href='<c:url value="/assets/global/plugins/pace/themes/pace-theme-flash.css"></c:url>'
	rel="stylesheet" type="text/css" />
	<link rel="shortcut icon" href='<c:url value="/scripts/images/book1.jpg"></c:url>' />
<!-- END PACE PLUGIN FILES -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css">
-->
<link
	href='<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"></c:url>'
	rel="stylesheet" type="text/css">
<link
	href='<c:url value="/assets/global/plugins/simple-line-icons/simple-line-icons.min.css"></c:url>'
	rel="stylesheet" type="text/css">
<link
	href='<c:url value="/assets/global/plugins/bootstrap/css/bootstrap.min.css"></c:url>'
	rel="stylesheet" type="text/css">
<link
	href='<c:url value="/assets/global/plugins/uniform/css/uniform.default.css"></c:url>'
	rel="stylesheet" type="text/css">
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link
	href='<c:url value="/assets/global/plugins/vendors/css/style.css"></c:url>'
	rel="stylesheet" type="text/css">
<link
	href='<c:url value="/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"></c:url>'
	rel="stylesheet" type="text/css">
<link
	href='<c:url value="/assets/global/plugins/bootstrap-datepicker/css/datepicker.css"></c:url>'
	rel="stylesheet" type="text/css">
<link
	href='<c:url value="/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"></c:url>'
	rel="stylesheet" type="text/css">
<link
	href='<c:url value="/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-weektimepicker.css"></c:url>'
	rel="stylesheet" type="text/css">
<!-- END PAGE LEVEL PLUGINS -->
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
<link
	href='<c:url value="/assets/global/plugins/jquery-multi-select/css/multi-select.css"></c:url>'
	rel="stylesheet" type="text/css" />
  <%-- <link rel="stylesheet" href='<c:url value="/amazeUI/assets/css/amazeui.min.css"></c:url>'/>
  <link rel="stylesheet" href='<c:url value="/amazeUI/assets/css/app.css"></c:url>'/>
 --%>

<!--[if lt IE 9]>
<script src='<c:url value="/assets/global/plugins/respond.min.js"></c:url>'></script>
<script src='<c:url value="/assets/global/plugins/excanvas.min.js"></c:url>'></script> 
<![endif]-->

<script>
	var appName = "${pageContext.request.contextPath}";
</script>
<script
	src='<c:url value="/assets/global/plugins/jquery.min.js"></c:url>'
	type="text/javascript"></script>

<script
	src='<c:url value="/assets/global/plugins/jquery-migrate.min.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/jquery-ui/jquery-ui.min.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/bootstrap/js/bootstrap.min.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/jquery.blockui.min.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/uniform/jquery.uniform.min.js"></c:url>'
	type="text/javascript"></script>
<!-- fileUpload -->
<script type="text/javascript"
	src='<c:url value="/scripts/fileUpload/jquery.ui.widget.js"></c:url>'></script>
<script type="text/javascript"
	src='<c:url value="/scripts/fileUpload/jquery.iframe-transport.js"></c:url>'></script>
<script type="text/javascript"
	src='<c:url value="/scripts/fileUpload/jquery.fileupload.js"></c:url>'></script>

<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script
	src='<c:url value="/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></c:url>'
	type='text/javascript'></script>
<script
	src='<c:url value="/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></c:url>'
	type='text/javascript'></script>
<script
	src='<c:url value="/assets/global/plugins/vendors/echart/echarts.js"></c:url>'
	type='text/javascript'></script>
	
<script
	src='<c:url value="/assets/admin/pages/scripts/index.js"></c:url>'
	type='text/javascript'></script>
<script
	src='<c:url value="/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></c:url>'
	type="text/javascript"></script>

<script type="text/javascript"
	src='<c:url value="/assets/global/plugins/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></c:url>'></script>
<script
	src='<c:url value="/assets/admin/pages/scripts/ui-blockui.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/admin/pages/scripts/ecommerce-products.js"></c:url>'
	type="text/javascript"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src='<c:url value="/assets/global/scripts/metronic.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/admin/layout2/scripts/layout.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/admin/pages/scripts/lanswitch.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/scripts/datatable.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/admin/pages/scripts/chart-helper.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/amcharts/amcharts/amcharts.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/global/plugins/amcharts/amcharts/serial.js"></c:url>'
	type="text/javascript"></script>

<script
	src='<c:url value="/assets/admin/pages/scripts/components-pickers.js"></c:url>'
	type="text/javascript"></script>

<script
	src='<c:url value="/assets/admin/pages/scripts/form-icheck.js"></c:url>'
	type="text/javascript"></script>
<script
	src='<c:url value="/assets/admin/pages/scripts/charts-amcharts.js"></c:url>'
	type="text/javascript"></script>
<script type="text/javascript"
	src='<c:url value="/scripts/jquery-validate/jquery.validate.min.js"></c:url>'></script>
<script type="text/javascript"
	src='<c:url value="/scripts/jquery-validate/additional-methods.min.js"></c:url>'></script>
<script type="text/javascript"
	src='<c:url value="/scripts/map.js"></c:url>'></script>

<!-- END PAGE LEVEL SCRIPTS -->
 <!-- color picker and css for pagetpl&coupon customize -->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/scripts/bootstrap-colorpicker/css/colorpicker.css"/>' />
<script type="text/javascript"
	src='<c:url value="/scripts/bootstrap-colorpicker/js/bootstrap-colorpicker.js"/>'></script>
<link href='<c:url value="/assets/admin/pages/css/profile.css"/>'
	rel="stylesheet" type="text/css" />
<%-- <script src='<c:url value="/amazeUI/assets/js/jquery.min.js"></c:url>'></script>
<script src='<c:url value="/amazeUI/assets/js/amazeui.min.js"></c:url>'></script>
 --%>
 <script>
	jQuery(document).ready(function() {
		Metronic.init(); // init metronic core components
		Layout.init(); // init current layout	
	});
</script>

