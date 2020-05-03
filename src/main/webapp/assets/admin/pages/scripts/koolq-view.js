// JavaScript Document      
$(function () {
  $(".limitLength").keyup(function () {  
	  var area = $(this);   
	  var max = parseInt(area.attr("maxlength"), 10);
	  if (max > 0) {
		  if (area.val().length > max) { 
			  area.val(area.val().substr(0, max)); 
		  }
		  var id = $(this).attr("id");
		  $("#"+id+'Info').html(area.val().length+'/'+max);
		  $('.discount').html(area.val());
	  }
  });  
  $(".limitLength").blur(function () {  
	  var area = $(this);  
	  var max = parseInt(area.attr("maxlength"), 10);
	  if (max > 0) {  
		  if (area.val().length > max) {
			  area.val(area.val().substr(0, max));
		  }
		  var id = $(this).attr("id")+'Info';
		  $("#"+id).html(area.val().length+'/'+max);
		  $('.discount').html(area.val());
	  }  
  }); 
  $(".icheck-colors li").click(function () {
		$('.kqeheader').css('background-color',$(this).css('background-color'));
  }); 

});  