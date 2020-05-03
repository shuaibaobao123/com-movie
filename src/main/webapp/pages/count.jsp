<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="../base/base.jsp"></jsp:include>

<body	class="page-container-bg-solid page-sidebar-closed-hide-logo page-header-fixed ">
	<!-- BEGIN TOP -->
	<jsp:include page="../base/bodycomm.jsp"></jsp:include>
	<div class="page-container">
		<!-- BEGIN SIDEBAR -->
		<jsp:include page="../base/left.jsp"></jsp:include>
		<!-- END SIDEBAR -->
		<!-- 下面是正文部分 -->
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content" style="min-height: 645px">
				<!-- BEGIN PAGE HEADER-->
				<h3 class="page-title">影片统计</h3>
				<div class="page-bar">
					<ul class="page-breadcrumb">
						<li class="active"><i class="fa fa-home"></i> <a
							href="index.html">首页</a> <i class="fa fa-angle-right"></i></li>

						<li><a href="#">影片统计</a></li>
					</ul>
				</div>
				<!-- END PAGE HEADER-->
				<!-- BEGIN 消费成功金额...总入账金额汇总 -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"
							style="padding-left: 0">
							<div class="dashboard-stat blue-soft" href="javascript:;">
								<div class="visual">
									<i class="fa fa-rmb"></i>
								</div>
								<div class="details">
									<div class="number">${monthNum}
										<span class="desc">位</span>
									</div>
									<div class="desc">本月开通会员</div>
								</div>
								<a class="more" href="#">查看更多<i
									class="m-icon-swapright m-icon-white"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="dashboard-stat red-soft" href="javascript:;">
								<div class="visual">
									<i class="fa fa-trophy"></i>
								</div>
								<div class="details">
									<div class="number">${monthMoney }<span class="desc">元</span>
									</div>
									<div class="desc">本月会员金额</div>
								</div>
								<a class="more" href="#">查看更多<i
									class="m-icon-swapright m-icon-white"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
							<div class="dashboard-stat green-soft" href="javascript:;">
								<div class="visual">
									<i class="fa fa-shopping-cart"></i>
								</div>
								<div class="details">
									<div class="number">${allNum}<span class="desc">位</span>
									</div>
									<div class="desc">累计开通会员</div>
								</div>
								<a class="more" href="#">查看更多<i
									class="m-icon-swapright m-icon-white"></i></a>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12"
							style="padding-right: 0">
							<div class="dashboard-stat purple-soft" href="javascript:;">
								<div class="visual">
									<i class="fa fa-database"></i>
								</div>
								<div class="details">
									<div class="number">${allMoney}<span class="desc">元</span>
									</div>
									<div class="desc">累计会员金额</div>
								</div>
								<a class="more" href="#">查看更多<i class="m-icon-swapright m-icon-white"></i></a>
							</div>
						</div>
					</div>
				</div>
				<!-- END 消费成功金额...总入账金额汇总 -->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light ">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-pie-chart font-green-sharp"></i> <span
										class="caption-subject font-green-sharp bold uppercase">热播排行统计(Top
										15)</span>
								</div>
							</div>
							<div class="portlet-body">
								<div id="chart_5" class="chart" style="height: 305px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light ">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-pie-chart font-green-sharp"></i> <span
										class="caption-subject font-green-sharp bold uppercase">好评排行统计(Top
										15)</span>
								</div>
							</div>
							<div class="portlet-body">
								<div id="chart_6" class="chart" style="height: 305px;"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light ">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-pie-chart font-green-sharp"></i> <span
										class="caption-subject font-green-sharp bold uppercase">会员列表</span>
								</div>
							</div>
								<div class="portlet-body">
										<div class="table-container">
											<div id="datatable_products_wrapper" class="dataTables_wrapper dataTables_extended_wrapper no-footer">
												<div class="table-scrollable">
													<table class="table table-striped table-bordered table-hover dataTable no-footer" id="datatable_products" aria-describedby="datatable_products_info" role="grid">
														<thead>
															<tr role="row" class="heading">
																<th width="25%" class="sorting_disabled" rowspan="1" colspan="1">会员编号</th>
																<th width="25%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1">会员名称</th>
																<th width="25%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1">购买会员时间</th>
															<th width="25%" class="sorting" tabindex="0" aria-controls="datatable_products" rowspan="1" colspan="1">会员类型</th>
															
															</tr>
														</thead>
														<tbody>
														<c:forEach items="${pageBean.rows}" var="item">
														<%-- <c:if test=${item.ismember=='1' }></c:if>	 --%>
														<c:if test="${item.ismember==1}">
															<tr role="row" class="filter">
																<td>${item.id}</td>
																<td>${item.uname}</td>
																<td><fmt:formatDate type="both" value="${item.endtime}"/> </td>
																<td style="color: blue;">
																	黄金会员（30元/月）
																</td>
															</tr>
														</c:if>
															</c:forEach>
															<jsp:include page="../base/page.jsp"></jsp:include>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
						</div>
					</div>
				</div>
				
				
				<div class="clearfix"></div>
				
			</div>
		</div>
		
		<!-- END CONTENT -->
	</div>
	<!-- END CONTAINER -->

	<!-- 正文部分结束 -->
	</div>
	<jsp:include page="../base/head.jsp"></jsp:include>
	<!-- BEGIN JAVASCRIPTS -->

	<script>

//定义颜色数组
var color=new Array()
color[0]="#f89135"
color[1]="#f8585b"
color[2]="#ffdc89"
color[3]="#66cc66" 
color[4]="#3faba4"
color[5]="#4fc1e9"
	color[6]="#f89135"
		color[7]="#f8585b"
		color[8]="#ffdc89"
		color[9]="#66cc66" 
		color[10]="#3faba4"
		color[11]="#4fc1e9"
			color[12]="#f89135"
				color[13]="#f8585b"
				color[14]="#ffdc89"
				color[15]="#66cc66" 
				color[16]="#3faba4"
				color[17]="#4fc1e9"
	 var source = {
        "monthlyInvestAmount": 
        	[
        	 <c:forEach var="movie" items="${countList}"  varStatus="status">
        	 <c:if test="${status.count==1}">
        	 { "name": "${movie.name}", "value":${movie.count}}
        	 </c:if>
        	 <c:if test="${status.count!=1}">
        	 ,  { "name": "${movie.name}", "value":${movie.count}}
        	 </c:if>
        	 </c:forEach>
        	]     
, "projectGuaranteeType": [{ "name": "微信钱包", "value": 2441542444.42 }
, { "name": "百度钱包", "value": 1869759550.23 }
, { "name": "支付宝", "value": 1254167809.15 }
, { "name": "快钱支付", "value": 386814943.76 }
, { "name": "测试专用", "value": 368533874.81 }
, { "name": "其它", "value": 217463300.00}]
, "dataProvider": [
                   <c:forEach var="movie" items="${countList}"  varStatus="status">
	               	 <c:if test="${status.count==1}">
	               	 {"payment": "${movie.name}","sum": ${movie.count},"color":color[${status.count}]}
	               	 </c:if>
	               	 <c:if test="${status.count!=1}">
	               	 ,	 {"payment": "${movie.name}","sum": ${movie.count},"color":color[${status.count}]}
	               	 </c:if>
	               	 </c:forEach>
]
, "dataProvider1": [
                   <c:forEach var="movie" items="${rankList}"  varStatus="status">
	               	 <c:if test="${status.count==1}">
	               	 {"payment": "${movie.name}","sum": ${movie.rank},"color":color[${status.count}+1]}
	               	 </c:if>
	               	 <c:if test="${status.count!=1}">
	               	 ,	 {"payment": "${movie.name}","sum": ${movie.rank},"color":color[${status.count}+1]}
	               	 </c:if>
	               	 </c:forEach>
]

,"platformMargin":
	[{ "name": "01", "value": 0.00 }
	 , { "name": "02", "value": 0.00 }
	 , { "name": "03", "value": 0.00 }
	 , { "name": "04", "value": 0.00 }
	 , { "name": "05", "value": 0.00}				
	 , { "name": "06", "value": 0.00 }
	 , { "name": "07", "value": 0.00 }
	 , { "name": "08", "value": 0.00 }						
	 , { "name": "09", "value": 0.00 }
	 , { "name": "10", "value": 0.00 }       				
	 , { "name": "11", "value": 0.00  }
	 , { "name": "12", "value": 0.00  }
	 , { "name": "13", "value": 0.00 }
	 , { "name": "14", "value": 0.00 }
	 , { "name": "15", "value": 0.00}  
	 , { "name": "16", "value": 0.00 }
	 , { "name": "17", "value": 0.00 }
	 , { "name": "18", "value": 0.00 }
	 , { "name": "19", "value": 0.00 }
	 , { "name": "20", "value": 0.00}  
	 , { "name": "21", "value": 0.00 }
	 , { "name": "22", "value": 0.00 }
	 , { "name": "23", "value": 0.00 }
	 , { "name": "24", "value": 0.00 }
	 , { "name": "25", "value": 0.00 }
	 , { "name": "26", "value": 0.00 }
	 , { "name": "27", "value": 0.00 }
	 , { "name": "28", "value": 0.00}  
	 , { "name": "29", "value": 0.00 }
	 , { "name": "30", "value": 0.00  }
	 , { "name": "31", "value": 0.00 }] 
     };
	  jQuery(document).ready(function() {
	        //Metronic.init(); // init metronic core components
			//Layout.init(); // init current layout
			//Index.initDrawPlatformMarginChart();
			//Index.initDrawSummaryChart();
			//Index.initDrawPieCharts();						  		
			ChartsAmcharts.init();	
	    });
    </script>

</body>

</html>