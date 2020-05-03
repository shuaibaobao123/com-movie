<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<%-- <script src="${pageContext.request.contextPath}/scripts/jquery-1.10.2.min.js" type="text/javascript"></script> --%>
<link
	href='<c:url value="/assets/global/plugins/font-awesome/css/font-awesome.min.css"></c:url>'
	rel="stylesheet" type="text/css">
	
<form action='' method="post" id="pageTurnForm">
<style>
 .btn{
  background-color: #3e4347;
  color: white;
 }
</style>
<input type="hidden" id="currentPage" name="currentPage">
	<tr>
		<td colspan="11">
			<div class="fr" style="margin-bottom:10px;">
				<button type="button" id="sub" class="btn btn-default" style="float:right;">
					跳转
					<!-- 跳转 -->
				</button>

				<input type="text" id="jump"
					class="form-control input-mini input-inline  " maxlenght="5"
					style=" float:right;text-align:center; margin: 0px 6px 0px 6px;width: 35px;height: 35px;border-radius:3px;border:1px solid #000;">

				<div class="btn-group" style="float:right">
					<button type="button" id="prevousPage"  class="btn btn-default">
						&nbsp;<i class="fa fa-angle-double-left"></i>
					</button>

					<button type="button" class="btn btn-default" disabled="disabled"
						onclick="jumpToPage();">第 ${pageBean.currentPage} /
						${pageBean.totalPage} 页</button>
					<button type="button" id="nextPage"  class="btn btn-default"> &nbsp;<i class="fa  fa-angle-double-right"></i>
								</button>
				</div>

				</div>
			</td>
	</tr>
</form>
<script type="text/javascript">
	var totalPage="${pageBean.totalPage}";
	var agentid="${agentId}";
	$("#sub").click(function(){
		var jump=$("#jump").val();
		if(jump==""||jump>totalPage||jump<1||isNaN(jump)){
			return ;
		}else{
			location.href="?currentPage="+jump+"&agentId="+agentid;
			/* $("#pageTurnForm").submit(); */
		}
	});
	
	$("#nextPage").click(function(){
		var currentPage="${pageBean.currentPage}";
		if(currentPage>=totalPage){
			return ;
		}
		var jump=parseInt(currentPage)+1;
	    location.href="?currentPage="+jump+"&agentId="+agentid;
	});
	
	$("#prevousPage").click(function(){
		var currentPage="${pageBean.currentPage}";
		if(currentPage<=1){
			return ;
		}
		var jump=parseInt(currentPage)-1;
	    location.href="?currentPage="+jump+"&agentId="+agentid;
	});
	
	/*处理回车事件*/
	jQuery(document).ready(function() {
		$("#jump").keydown(function(event){
			if(event.keyCode == 13){
			    $("#sub").click();
			    return false;
			}else{
				
			}
		});
	});
</script>

