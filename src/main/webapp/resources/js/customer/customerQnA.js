// Modal QnA 작성하기 부분
$(function(){		
	$(".regit").click(function(){
		$(".qnaqInsertModal").css("display","block");		
	});
});

// Modal QnA 답변조회 부분
$(function(){		
	$(".answer").click(function(){
		$(".qnaaInsertModal").css("display","block");		
	});	
});



$(function() {
	
	/* QnA 작성하기 */
	$(".regit").click(regit);
	 
	 /* QnA 답변 불러오기 */
	$(".answer").click(answer);
	
	/*  모달 창 닫기 */
	 $('.viewCancel').click(function(){		 
		$(".qnaqModal").slideUp(200);
		$(".qnaaModal").slideUp(200);
		$(".modalWrap").fadeOut(200);	 
	 });
});

function regit() {
	$(".modalWrap").fadeIn(200);
	$(".qnaqModal").slideDown(200);  
}

function answer() {
	var resultAnserNo = $(this).parent().parent().children().eq(0).text();
	$.ajax({
		url : "customerQnAAModal.do", 
		type : "get",
		data : {resultAnserNo:resultAnserNo},
		dataType : "json",
		contentType : 'application/json; charset=UTF-8',
        beforeSend : function(){
            $(".modalWrap").fadeIn(200);
			$(".qnaaModal").slideDown(200);          
          },
          success : function(data) { 
				console.log(data.qna_code);
				$(".contentNO").val(data.qna_code);
				$(".contentTitle").val(data.qna_title);
				
			    var date = new Date(data.qna_adate);
				var formattedDate = formatDate(date);
				$(".contentDate").val(formattedDate);
				
				$(".content").val(data.qna_reply);
            }		
	});
}

function formatDate(date) {  //날짜 포맷 변경
	var year = date.getFullYear();
	var month = padZero(date.getMonth() + 1);
	var day = padZero(date.getDate());
	
	return year + "/" + month + "/" + day;
}

function padZero(num) {  // 숫자를 두 자리로 만드는 함수
    return (num < 10 ? "0" : "") + num;
}
