// JavaScript Document      
  function fileChange(target,objNameId) { 
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
     var size = fileSize / (1024*1000);     
     if(size>2){   
      alert("附件不能大于2M");
	  return;
     }
	 displayImg();
	$("input[name='"+objNameId+"']").val($(target).val());
  }
function displayImg() {
    var pic = document.getElementById("shlogo"),
		file = document.getElementById("fileupload");
    var ext = file.value.substring(file.value.lastIndexOf(".") + 1).toLowerCase();

    // gif在IE浏览器暂时无法显示
    if (ext != 'png' && ext != 'jpg' && ext != 'jpeg' && ext != 'bmp') {
        clearFile();
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
        checkPicSize(pic);
    } else {
        html5Reader(file, pic);
    }
}

function checkPicSize(src) {
	var pic = new Image();
	pic.src = src;
    if (pic.width != "56" || pic.height != "56") {
        clearFile();
        alert("图片尺寸必须是56像素x56像素！");
        return;
    }
	else{
		document.getElementById("shlogo1").src = src;
	}
}
function clearFile()
{
    document.getElementById("shlogo").src = "";
    document.getElementById("shlogo1").src = "";
    document.getElementById("fileupload").value = "";
}
function html5Reader(file, pic) {
    var file = file.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function (e) {
        pic.src = this.result;
        checkPicSize(pic.src);
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
		  $("#"+id+'Show').html(area.val());
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
		  $("#"+id+'Show').html(area.val());
	  }  
  });  

});  