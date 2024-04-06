$(function() {

	//좋아요 버튼 클릭 이벤트
	$('.postEtc button').click(function() {
		var icon = $(this).find('img');
		var postLikeNum = $('.postLikeNum');
		//좋아요 처리
		if (icon.attr('src') === './resources/img/commLikeBeforeIcon.png') {
			icon.attr('src', './resources/img/commLikeAfterIcon.png');
		}
		//좋아요 취소
		else if (icon.attr('src') === './resources/img/commLikeAfterIcon.png') {
			icon.attr('src', './resources/img/commLikeBeforeIcon.png');
		}
	});

	//포스트 팝업 열기
	$(document).on('click', '.postSubmenu', function() {
		var postwriterArea = $(this).closest('.postwriterArea');
		var postDetailBtnContainer = postwriterArea.find('.postDetailBtn-container');
		postDetailBtnContainer.slideToggle(100);
	});
	//댓글 팝업 열기
	$(document).on('click', '.commentsubmenu', function() {
		var postComment = $(this).closest('.postComment');
		var commentDetailBtn = postComment.find('.commentDetailBtn');
		$('.commentDetailBtn').not(commentDetailBtn).slideUp(100);
		commentDetailBtn.slideToggle(100);
	});

});
