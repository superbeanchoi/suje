$(function() {

	//호버 시 버튼 Text 변경
    var originalText = $('.orderBtn').text();

    $('.orderBtn').hover(function() {
        $(this).text('+ 주문하기');
    }, function() {
        $(this).text(originalText);
    });
    
    //공지사항 영역 미리보기
    $('.noticontent').each(function() {
        var text = $(this).text();
        if (text.length > 55) {
            text = text.substring(0, 55) + '...';
            $(this).text(text);
        }
    });
    
});
