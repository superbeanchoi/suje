$(function() {

	/* 이미지 슬라이드 */

	var sliderWidth = $('.itemImage li').outerWidth(); // 이미지 너비
	var sliderLength = $('.itemImage li').length; // 전체 이미지 개수
	var slideArea = sliderWidth * sliderLength; // 슬라이드 영역 너비
	$('.itemImage').css('width', slideArea);  // 슬라이드 영역 지정

	// 버튼 클릭시 슬라이드 이벤트 실행
	$('.imgLeftMove').click(function() {
		slideLeft();
	});
	$('.imgRightMove').click(function() {
		slideRight();
	});
	
	// 슬라이드 이벤트 함수
	function slideLeft() {
		// 마지막 슬라이드를 복제하여 첫번째에 추가
		var lastSlide = $('.itemImage li:last');
		var clonedSlide = lastSlide.clone();
		clonedSlide.prependTo('.itemImage');

		// 슬라이드 영역을 오른쪽으로 이동시키고 애니메이션 적용
		$('.itemImage').css({ marginLeft: -sliderWidth });
		$('.itemImage').animate({ marginLeft: 0 }, 500, function() {
			// 애니메이션이 완료된 후에 마지막 슬라이드를 삭제
			$('.itemImage li:last').remove();
		});
	}
	function slideRight() {
		// 첫 번째 슬라이드를 복제하여 마지막에 추가
		var firstSlide = $('.itemImage li:first');
		var clonedSlide = firstSlide.clone();
		clonedSlide.appendTo('.itemImage');

		// 슬라이드 영역을 왼쪽으로 이동시키고 애니메이션 적용
		$('.itemImage').animate({ marginLeft: -sliderWidth }, 500, function() {
			// 애니메이션이 완료된 후에 첫 번째 슬라이드를 삭제
			$('.itemImage li:first').remove();
			$(this).css({ marginLeft: 0 });
		});
	}
	
	/* 아이템 카운트 변경 */
	
	var itemCount = 1;
	var itemNum = parseInt($('.itemNum').val());  //아이템 수량 가져오기
	var itemPrice = parseInt($('.itemPrice span:first-child').text()); // itemPrice 초깃값 가져오기
    $('.itemPrice span:first-child').text(itemPrice.toLocaleString()); // 초기 itemPrice 설정
    $('.finalPrice span:first-child').text(itemPrice.toLocaleString()); // 초기 finalPrice 설정
	
	
	// CountMinus 버튼 클릭 시
	$('.CountMinus').click(function() {
	    // itemCount가 1보다 큰 경우에만 감소하도록 설정
	    if (itemCount > 1) {
	        itemCount--; // itemCount 1 감소
	        updateItemCount(); // itemCount 업데이트
	    }
	});
    // CountPlus 버튼 클릭 시
    $('.CountPlus').click(function() {
		if (itemCount < itemNum) {
	        itemCount++; // itemCount 1 증가
	        updateItemCount(); // itemCount 업데이트
		} else {
		    // 초과할 경우 alert 창 표시
		    alert("최대 구매 가능한 수량은 " + itemNum + " 개 입니다.");
		}
    });
    
	// itemCount 업데이트 함수
	function updateItemCount() {
	    $('.itemCount').text(itemCount); // itemCount 업데이트
	
	    // 변경된 itemCount에 따라 finalPrice 업데이트
	    var finalPrice = itemPrice * itemCount; // itemCount와 itemPrice를 곱한 값
	    $('.finalPrice span:first-child').text(finalPrice.toLocaleString()); // 콤마 추가하여 finalPrice 업데이트
	}

});
