$(function() {

	var orderNum;
	
	// 모달창 오픈/클로즈
	$('.eachReviewPayNumTd button').click(function() {
		//선택 주문 정보 삽입
		orderNum = $(this).text();
        $('.finalOrderCode').val(orderNum);
        
		$(".finalOrderModalWrap").fadeIn(200);
		$(".finalOrderModal").slideDown(200);
	});
	$('.modalCloseBtn').click(function() {
		$(".finalOrderModal").slideUp(200);
		$(".finalOrderModalWrap").fadeOut(200);
	});
});