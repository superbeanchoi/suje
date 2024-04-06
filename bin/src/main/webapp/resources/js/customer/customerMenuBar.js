/*
 * 
 */

$(function(){

  $(".subTitle").hover(function(){
    $(this).css({
    	"background-color" : "#00203F",
    	"border": "2px solid #00203F",
		"border-radius" : "10px"
    	});
    $(this).children('a').css("color" , "white");
  },function(){
        $(this).css({
    	"background-color" : "",
    	"border": "",
		"border-radius" : ""
    	});
    $(this).children('a').css("color" , "");
  });
  
});