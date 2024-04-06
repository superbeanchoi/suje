
 // 최종 주문서 조회 함수
function finalOroderCheck(){
    
    $.ajax({
	
		type : "get",
		url : "getStoreFinalOrder.do",
		data : {foCode : $('.finalOrderCode').val()},
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		beforeSend : function(){
		    $(".modalWrap").fadeIn(200);
		    $(".storeOrderModal").slideDown(200); 
		},
		success : function(data){
		    
		    const itemInfo = data;
		    
		    // 최종 주문 번호
		    $(".storeOrderModalTitle input").val(data.fo_code);
		    
		    //상품 카테고리 1
		    $('.opSecond').each(function(){
				if($(this).text() == data.cates_name){
				    $(this).prop('selected', true);
				}
		    });
		    
		    //상품 카테고리 2
		    $('#opFirst').each(function(){
				if($(this).text() == data.catemm_name){
				    $(this).prop('selected', true);
				}
		    });
		    
		    // 수량
		    $('#orderCount').val(data.fo_num);
		    
		    // 주문 사이즈
		    $('#orderSize').val(data.fo_size);
		    
		    //주문 금액
		    $('#orderAmount').val(data.fo_sum);
		    
		    //배송형태
		    if(data.deli_code == 7003){
				$('#delivery').prop('selected', true);
		    }else{
				$('#pickup').prop('selected', true);
		    }
		    
		    //요구사항
		    $('#content').val(data.fo_etc);
		}	
    });
}