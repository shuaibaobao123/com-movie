<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">


function showAlertModel(title,content, confirmAction){
	$("#alert-modal-content").empty();
	$("#alertModalLabel").text(title);
	$("#alert-modal-content").text(content);
	if(confirmAction !=null && confirmAction!=""){
		$("#alert-modal-comfirm").on("click", function(e){
			console.log(confirmAction);
			e.preventDefault();
			/* $.ajax({  
				type: "POST",  
				url:confirmAction,  
				data:$('#createUserForm').serialize(),  
				async: true,  
				error: function(request) {  
					alert("Connection error");  
				},  
				success: function(data) {  
					 $("#pageContent").html(data);

				}  
			}); */
			window.location.href= confirmAction;
		});

		$("#alert-model-cancel").show();

		$("#alert-modal-comfirm").removeAttr("data-dismiss");	
	}else{
		
		$("#alert-model-cancel").hide();
		$("#alert-modal-comfirm").attr("data-dismiss","modal");
		$("#alert-modal-comfirm").removeAttr("href");
	}
	$("#alertModal").modal('toggle');
}




function showInfo(content, returnUrl){
	$("#alert-modal-content").empty();
	$("#alertModalLabel").text("信息");
	$("#alert-modal-content").text(content);
	$("#alert-model-cancel").hide();
	if(returnUrl != null && returnUrl !=""){
		window.location.href = returnUrl;
		$("#alert-modal-comfirm").attr("data-dismiss","modal");
		$("#alert-modal-comfirm").attr("href", returnUrl);
	}else{
		$("#alert-modal-comfirm").attr("data-dismiss","modal");
		$("#alert-modal-comfirm").removeAttr("href");
	}
	 $("#alertModal").modal('toggle'); 
}

</script>

<div class="modal fade" id="alertModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		  
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="alertModalLabel"></h4>
			</div>
			
			<div class="modal-body">
				<p id="alert-modal-content"></p>
			</div>
			<div class="modal-footer">
				<a href="javascript:void(0);" id= "alert-model-cancel" class="btn btn-default" data-dismiss="modal">取消</a>
				<a href="javascript:void(0);" id="alert-modal-comfirm" class="btn btn-primary">确定</a>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->