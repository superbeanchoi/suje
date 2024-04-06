$(function() {
	$('.adminCategoryArea li:first-child a').addClass('checkedStateFirstCategory');

	var storeId;
	var adminId = "<%= adminId %>";

	// 모달창 오픈/클로즈
	$('.storeMoreInfoBtn').click(function() {
		//선택 스토어 정보 삽입
		storeId = $(this).closest('.newStoreTableRow').find('td:first').text();
        
		sandPage(storeId);
	});
	$('.modalCloseBtn').click(function() {
		$(".storeMoreInfoModal").slideUp(200);
		$(".storeMoreInfoModalWrap").fadeOut(200);
	});
	
	function sandPage(storeId) {
		$.ajax({
			url : "storeAvailInfo.do",
			type : "post",
			data: { s_id : storeId, ma_id : adminId },
			dataType : "json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(storeInfo){
				$('input[name=storeId]').val(storeInfo.s_id);
				$('input[name=s_id]').val(storeInfo.s_id);
				$('input[name=ma_id]').val(storeInfo.ma_id);
				$('.storeCategory').val(storeInfo.catem_name);
				$('input[name=storeName]').val(storeInfo.s_name);
				$('input[name=businessNumber]').val(storeInfo.s_bnum);
				$('input[name=email]').val(storeInfo.s_email);
				$('input[name=phoneNumber]').val(storeInfo.s_tel);
				$('input[name=address]').val(storeInfo.s_addr);
				$('.bankCategory').val(storeInfo.s_bank);
				$('input[name=accountNumber]').val(storeInfo.s_acc);
				
				$(".storeMoreInfoModalWrap").fadeIn(200);
				$(".storeMoreInfoModal").slideDown(200);
			},
			error: function(err) {
				alert("통신 에러가 발생했습니다 : "+err);
			}
		});
    }
});