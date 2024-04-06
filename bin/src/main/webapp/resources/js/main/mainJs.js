$(function() {

	//자동 슬라이드
	var sliderWidth = $('.mainSlide ul li').outerWidth(); // 포카 너비
	var sliderLength = $('.mainSlide ul li').length; // 전체 포카 개수
	var slideArea = sliderWidth * sliderLength; // 슬라이드 영역 너비
	var sliderTime = 3000; // 슬라이드 시간

	// 슬라이드 영역 지정
	$('.mainSlide ul').css('width', slideArea);

	// 슬라이드 애니메이션 이벤트 함수
	function animateSlide() {
		$('.mainSlide ul').animate({ marginLeft: -sliderWidth }, 1000, function() {
			// 첫번째 슬라이드를 제거하고 마지막 슬라이드를 오른쪽에 추가
			$(this).css({ marginLeft: 0 }).find('li:last').after($(this).find('li:first'));
		});
	}

	// 슬라이드 시간 설정
	var slideTime = setInterval(animateSlide, sliderTime);

	// 마우스 호버 시 슬라이드 중지, 마우스 아웃시 슬라이드 실행 
	$('.mainSlide ul').hover(function() {
		clearInterval(slideTime);
	}, function() {
		slideTime = setInterval(animateSlide, sliderTime);
	});

});