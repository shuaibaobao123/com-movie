/*
             * $.get()或$.post()方法来解析xml文件
             *  * url：指定要解析的xml文件的路径
             *  * callback：回调函数，function(xml){}
             *      * xml：解析xml文件返回的内容
             */
//$.get("../assets/regeist/js/area.xml", function (xml) {
//    var selectedProStr="",selectedCityStr = "", selectedareaStr = "";
//    var selectedProCode = "",selectedCityCode = "", selectedAreaStr = "";
//    var docXml = $(xml);
// 
//    var $provinceElements = docXml.find("province");
//    var $proEle = $("body"); //a链接的div
//    var $divEle = $("#provinceList");
//    var city_obj = $("#cityList");
//    var dist_obj = $("#distList");
//
//    var proHtml = "";
//       
////    $provinceElements.each(function (index, domEle) {
////        var provinceValue = $(domEle).attr("name"); //获得省的值
////        var proCode = $(domEle).attr("code");
////        proHtml += '<a href="#&city"><section data-procode="'+proCode+'" data-proStr='+provinceValue+'  class="address merchant_info_detail"><label>'+provinceValue+'</label><span></span></section></a>';
////    });
////    $divEle.html(proHtml);
////    $divEle.on("click", "section", function () {
////        selectedProStr = $(this).data("prostr"),selectedProCode = $(this).data("procode");
////        var $cityElements =  docXml.find("province[code="+selectedProCode+"]").find("city"),
////            cityHtml = "";
////        $cityElements.each(function (index, domEle){
////            var $cityValue = $(domEle).attr("name");
////            var cityCode = $(domEle).attr("code");
////            cityHtml += '<a href="#&dist"><section data-citycode='+cityCode+' data-citystr='+$cityValue+' class="address merchant_info_detail"><label>'+$cityValue+'</label><span></span></section></a>';
////           
////        });
////        city_obj.html(cityHtml);
////    });
// 
// 
//    city_obj.on('click',"section", function () {
//        selectedCityStr = $(this).data("citystr"),selectedCityCode = $(this).data("citycode");
//        var $cityElements =  docXml.find("province[code="+selectedProCode+"]").find("city[code="+selectedCityCode+"]").find("county"),
//            distHtml = "";
//        $cityElements.each(function (index, domEle){
//            var distValue = $(domEle).attr("name");
//            var distCode = $(domEle).attr("code");
//            distHtml += '<a href="#&homePage"><section data-distcode='+distCode+' data-diststr='+distValue+' class="address merchant_info_detail"><label>'+distValue+'</label><span></span></section></a>';
//        });
//       dist_obj.html(distHtml)
//    });
//    
//  dist_obj.on('click',"section", function () {
//     selectedareaStr = $(this).data("diststr");
//     $("body").find("#addressShow").val(selectedProStr+" "+selectedCityStr+" "+selectedareaStr);
//  });
// 
//});
 
 