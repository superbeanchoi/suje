$(function() {
	var selectedMainNaviText;
	var selectedSubNaviText;
	$('.mainNavi li').click(function() {
		$('.mainNavi').children('li').removeClass('selectedMainNavi');
		$(this).addClass('selectedMainNavi');
		
		// 선택된 메뉴 항목 가져오기
		selectedMainNaviText = $(this).children('a').text().trim();
		
		// 선택 항목으로 제목 텍스트 변경
        if(selectedMainNaviText === "전체") {
            $(".mainCategory").text(selectedMainNaviText);
            $(".categoryArea img, .categoryArea .mainCategory").hide();
        } else {
            $(".mainCategory").text(selectedMainNaviText);
            $(".categoryArea img, .categoryArea .mainCategory").show();
        }
    });

});
