// JavaScript Document      
  function fileChange(target,objName,objSize,maxWidth,maxHeight) { 
    var fileSize = 0;          
	var isIE = /msie/i.test(navigator.userAgent) && !window.opera;   
    if (isIE && !target.files) {      
      var filePath = target.value;      
      var fileSystem = new ActiveXObject("Scripting.FileSystemObject");         
      var file = fileSystem.GetFile(filePath);      
      fileSize = file.Size;     
    } else {     
		fileSize = target.files[0].size;      
     }    
     var size = fileSize / (1000);     
     if(size>objSize){
	  clearFile(objName);
      alert("附件不能大于"+objSize+"KB");	  
	  return;
     }
	 displayImg(objName,maxWidth,maxHeight);
	$("input[name='input"+objName+"']").val($(target).val());
  }
function displayImg(objName,maxWidth,maxHeight) {
    var pic = document.getElementById("img"+objName),
		file = document.getElementById("file"+objName);
    var ext = file.value.substring(file.value.lastIndexOf(".") + 1).toLowerCase();

    // gif在IE浏览器暂时无法显示
    if (ext != 'png' && ext != 'jpg' && ext != 'jpeg' && ext != 'bmp') {
        clearFile(objName);
        alert("图片的格式必须为jpg、jpeg、bmp、png格式！");		
        return;
    }
    var isIE = navigator.userAgent.match(/MSIE/) != null,
		isIE6 = navigator.userAgent.match(/MSIE 6.0/) != null;
    if (isIE) {
        file.select();
        var reallocalpath = document.selection.createRange().text;
        // IE6浏览器设置img的src为本地路径可以直接显示图片
        if (isIE6) {
            pic.src = reallocalpath;
        } else {
            // 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
            pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\"" + reallocalpath + "\")";
            // 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
            pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';
        }
        checkPicSize(pic,objName,maxWidth,maxHeight);
    } else {
        html5Reader(file, pic,objName,maxWidth,maxHeight);
    }
}

function checkPicSize(src,objName,maxWidth,maxHeight) {
	var pic = new Image();
	pic.src = src;	
    if (pic.width != maxWidth || pic.height != maxHeight) {
        clearFile(objName);
        alert("图片尺寸必须是"+maxWidth+"像素X"+maxHeight+"像素！");
        return;
    }
}
function clearFile(objName)
{
    document.getElementById("file"+objName).value = "";
	$("input[name='input"+objName+"']").val('');
	if(objName=='BtnImg')
	{
		$('.img'+objName).css('background-image','url('+this.result+')');
	}
	else
	{
		document.getElementById("img"+objName).src = "";
	}
}
function html5Reader(file, pic,objName,maxWidth,maxHeight) {
    var file = file.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
		if(objName=='BtnImg')
		{
			$('.img'+objName).css('background-image','url('+this.result+')');
			$('.img'+objName).css('background-size','199px 54px');
			$("input[name='btnstyle']").attr("checked","false");
		}
		else
		{
			pic.src = this.result;
		}
        checkPicSize(this.result,objName,maxWidth,maxHeight);
    }
}

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
		  $("[name="+id+"Show]").html(area.val());
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
		  $("[name="+id+"Show]").html(area.val());
	  }  
  });  

  $("#backColor").blur(function () {
		$('.lotteryemulator').css('background-color',$(this).val());
  }); 
  $("input[name='btnstyle']").click(function () {
		if($(this).parent().parent().next().attr("src")!=undefined)
		{
			$('.imgBtnImg').css('text-indent','0');
			$('.imgBtnImg').css('text-align','center');
			$('.imgBtnImg').css('color','#fff');
			if($(this).val()=="button1")
			{				
				$('.imgBtnImg').css('text-indent','70px');				
				$('.imgBtnImg').css('text-align','left');
				$('.imgBtnImg').css('color','#ffe57e');
			}				
			$('.imgBtnImg').css('background-image','url('+$(this).parent().parent().next().attr("src")+')');
			$('.imgBtnImg').css('background-size','199px 54px');
			$('#fileBtnImg').val('');
			$("input[name='inputBtnImg']").val('');
		}
  }); 
});  