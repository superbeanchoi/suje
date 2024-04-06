$(function() {
	var selectedMainNaviText;
	var selectedSubNaviText;
	$('.mainNavi').click(function() {
		$('.mainNavi').removeClass('selectedMainNavi');
		$(this).addClass('selectedMainNavi');
		
		// 선택된 메뉴 항목 가져오기
		selectedMainNaviText = $(this).children('a').text().trim();
		
		$('.subNaviWrap').slideUp();
		$(this).children('.subNaviWrap').slideDown();
		
		// 선택 항목으로 제목 텍스트 변경
		if(selectedMainNaviText === "전체") {
			$(".mainTitle").text(selectedMainNaviText);
		} 
    });

    $('.subNaviWrap a').click(function(e) {
		e.stopPropagation();
		
		$('.subNaviWrap a').removeClass('selectedSubNavi');
		$(this).addClass('selectedSubNavi');
		
		// 선택된 서브 메뉴 항목 가져오기
		selectedSubNaviText = $(this).text().trim();
		
		// 선택 항목으로 제목 텍스트 변경
		$(".mainTitle").text(selectedMainNaviText + "/" + selectedSubNaviText);
    });
});
