/**
 * 
 */
 // 소분류 카테고리 출력 비동기처리
 $(function(){
 	
	$(".goodsInfo_selectBox_Secound").change(function(){
	
		let cateMidCode = $(this).val();
		
		$.ajax({
		    type : "post",
			url : "cateSubCode.do",
			data : {
			    cateMidCode : cateMidCode
			},
			dataType : "json",
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			beforeSend : function(){
				$(".goodsInfo_selectBox_Third").empty();
			},
			success : function(data){
			    
			    for(var i = 0; i<data.length; i++){
					$(".goodsInfo_selectBox_Third").append(
						"<option value=" + data[i].cates_code +">" + data[i].cates_name  + "</option>"
					);
			    }
			},
			error: function(request, status, error) {
		               alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
		   }
		});
	});
 });