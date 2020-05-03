// JavaScript Document
var weekData1 = '';
var weekData2 = '';
var weekData3 = '';
var weekData4 = '';
var weekData5 = '';
var weekPageNum = 1; 
$(function(){				
	$('#yearPicker').datetimepicker({
		format: 'yyyy',
		language:  'zh_CN',	        	        	 
		autoclose: 1,
		startView: 4,
		maxView: 1,
		viewSelect:'decade',
		forceParse: 0,
		pickerPosition: 'bottom-left'			
	});
	$('#monthPicker').datetimepicker({
		format: 'yyyy-mm',
		language:  'zh_CN',	        	        	 
		autoclose: 1,
		startView: 3,
		maxView: 1,
		viewSelect:'year',
		forceParse: 0,
		pickerPosition: 'bottom-left'			
	});
	
	$('#weekPicker').hide();
	$('.weekshow').click(function(){
		initWeekPicker();
		var left = $('#weekInput').offset().left+$('#weekInput').width()-260;
		var top = $('#weekInput').offset().top +34;
		$("#weekPicker").css("left",left+"px").css("top",top+"px");	
		$('#weekPicker').show();
	});
	initWeekPicker();
	$('#prevBtn').click(prevPage);
	$('#nextBtn').click(nextPage);		
	document.documentElement.onclick=function(e){
	 e=window.event?window.event:e;
	 var e_tar=e.srcElement?e.srcElement:e.target;
	 //alert(e_tar.type);
	 if(e_tar.className.indexOf('weekpickerclass')>-1){
		 return;
	 }else{	
		 var test=document.getElementById("weekPicker");
		$(test).hide();	
	 }
	};		
});
function prevPage(){
	weekPageNum = weekPageNum -1 ;
	curWeekdate = getCurPageData(weekPageNum);		
	if(weekPageNum == 1){
	//去掉向左箭头
	$("#prevBtn").css('visibility','hidden'); 
	}
	if(weekPageNum <5){
	$("#nextBtn").css('visibility','visible'); 	
	}
	$('#weekBody').html(curWeekdate);
	
	$("#weekBody td").click(function(){
			$("#weekInput").val($(this).text());
			$('#weekPicker').hide();
	});		
}		
function nextPage(){
	weekPageNum = weekPageNum +1 ;
	curWeekdate = getCurPageData(weekPageNum);
	if(weekPageNum == 5){
	//去掉向右箭头
	$("#nextBtn").css('visibility','hidden'); 
	}
	if(weekPageNum>1){
	$("#prevBtn").css('visibility','visible'); 	
}		
$('#weekBody').html(curWeekdate);		
	$("#weekBody td").click(function(){
	$("#weekInput").val($(this).text());
	$('#weekPicker').hide();
});
}		
function getCurPageData(page){
	if(page == 1){
		return weekData1;
	}else if(page == 2){
	return weekData2;
	}else if(page == 3){
	return weekData3;
	}else if(page == 4){
	return weekData4;
	}else if(page == 5){
	return weekData5;
	}
	return weekData1;
}
function initWeekPicker(){				
	var curyear = $('#yearInput').val();
	var curDate = new Date();
	var curweek;
	if(curyear == curDate.getFullYear()){
		curweek = weekOfYear(curyear,(curDate.getMonth()+1),curDate.getDate());
	}else{
		curweek = 1;
	}
	getWeekPicker(curyear);
	var curWeekdate;
	if(curweek <=12){
	curWeekdate = weekData1;
	weekPageNum = 1;
	}else if(curweek <=24 && curweek > 12){
	curWeekdate = weekData2;
	weekPageNum = 2;
	}else if(curweek <=36 && curweek > 24){
	curWeekdate = weekData3;
	weekPageNum = 3;
	}else if(curweek <=48 && curweek > 36){
	curWeekdate = weekData4;
	weekPageNum = 4;
	}else if(curweek <=53 && curweek > 48){
	curWeekdate = weekData5;
	weekPageNum = 5;
	}		
	if(weekPageNum == 5){
		$("#nextBtn").css('visibility','hidden'); 
	}else{
		$("#nextBtn").css('visibility','visible');
	}
	if(weekPageNum > 1){
		$("#prevBtn").css('visibility','visible'); 	
	}else{
		$("#prevBtn").css('visibility','hidden');
	}			
	$('#weekBody').html(curWeekdate);					
	$('#weekBody td').click(function(){
		$("#weekInput").val($(this).text());
		$('#weekPicker').hide();
	});				
}
function   dateFromWeek(year,   week,   day){	  
	var   date1   =   new   Date(year,   0,   1);   
	var   dayMS   =   24*60*60*1000;   
	var   firstDay   =   (7-date1.getDay())*dayMS;   
	var   weekMS   =   (week-2)*7*dayMS;   
	var   result   =   date1.getTime()+firstDay+weekMS+day*dayMS;   
	date1.setTime(result);  
	var monthR = parseInt(date1.getMonth());
	monthR+=1;
	var dayR = parseInt(date1.getDate());
	if(monthR<10){
	 monthR = '0'+monthR;
	}
	if(dayR<10){
	 dayR = '0'+dayR;
	}
	return   monthR+'-'+dayR;   
	}
function getWeekPicker(year){
	weekData1 = '';
	weekData2 = '';
	weekData3 = '';
	weekData4 = '';
	weekData5 = '';			
  for(var i=1;i<=12;i++){	
	  var tdStr = '';
	  if ('zh_CN' == 'zh_CN') {
		  tdStr = '<td class="day week weekpickerclass">'+'第'+i+'周 '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }else{
		  tdStr = '<td class="day week weekpickerclass">'+'W'+i+' '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }
	  if(i%2 == 0){
	  weekData1 += tdStr+'</tr>';
	  }else{
	  weekData1 += '<tr>'+tdStr;
	  }
  }			
  for(var i=13;i<=24;i++){
	  var tdStr = '';
	  if ('zh_CN' == 'zh_CN') {
		  tdStr = '<td class="day week weekpickerclass">'+'第'+i+'周 '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }else{
		  tdStr = '<td class="day week weekpickerclass">'+'W'+i+' '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }
	  if(i%2 == 0){
	  weekData2 += tdStr+'</tr>';
	  }else{
	  weekData2 += '<tr>'+tdStr;
	  }	
  }			
  for(var i=25;i<=36;i++){
	  var tdStr = '';
	  if ('zh_CN' == 'zh_CN') {
		  tdStr = '<td class="day week weekpickerclass">'+'第'+i+'周 '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }else{
		  tdStr = '<td class="day week weekpickerclass">'+'W'+i+' '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }
	  if(i%2 == 0){
	  weekData3 += tdStr+'</tr>';
	  }else{
	  weekData3 += '<tr>'+tdStr;
	  }	
  }			
  for(var i=37;i<=48;i++){
	  var tdStr = '';
	  if ('zh_CN' == 'zh_CN') {
		  tdStr = '<td class="day week weekpickerclass">'+'第'+i+'周 '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }else{
		  tdStr = '<td class="day week weekpickerclass">'+'W'+i+' '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }
	  if(i%2 == 0){
	  weekData4 += tdStr+'</tr>';
	  }else{
	  weekData4 += '<tr>'+tdStr;
	  }		
  }			
  for(var i=49;i<=53;i++){
	  var tdStr = '';
	  if ('zh_CN' == 'zh_CN') {
		  tdStr = '<td class="day week weekpickerclass">'+'第'+i+'周 '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }else{
		  tdStr = '<td class="day week weekpickerclass">'+'W'+i+' '+dateFromWeek(year,i,1)+' ~ '+dateFromWeek(year,i,7)+'</td>';
	  }
	  if(i%2 == 0){
		  weekData5 += tdStr+'</tr>';
	  }else{
		  weekData5 += '<tr>'+tdStr;
	  }
		}
	}
function   weekOfYear(year,   month,   day){	  
	var   date1   =   new   Date(year,   0,   1);   
	var   date2   =   new   Date(year,   month-1,   day,   1);   
	var   dayMS   =   24*60*60*1000;   
	var   firstDay   =   (7-date1.getDay())*dayMS;   
	var   weekMS   =   7*dayMS;   
	date1   =   date1.getTime();   
	date2   =   date2.getTime();   
	return   Math.ceil((date2-date1-firstDay)/weekMS)+1;   
} 	         	       
