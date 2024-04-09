/*
 * 
 */
$(function() {
	    
		// 버튼 이벤트 등록
		$(".purchConfirm").click(purchConfirmEvent); // 구매확정 버튼 이벤트 등록
		$(".payCancelBtn").click(payCancelBtnEvent); // 결제취소 버튼 이벤트 등록
		$(".returnCall").click(returnCallBtnEvent); // 결제취소 버튼 이벤트 등록
		$('.demand').click(demandBtnEvent); // 플리마켓 결제취소 버튼 이벤트 등록
		$('.fleaPayConfirmBtn').click(fleaPayConfirmBtnEvent); // 플리마켓 구매확정 버튼 이벤트 등록
		$('.joinCheck').click(finalOrderInfoClickEvent); // 주문제작 결제 내역 상세주문정보 조회 버튼 이벤트 등록
		// Modal 취소 이벤트 등록
		$(".viewCancel").click(viewCancelEvent);
		
	});
	
	// 주문제작 결제 내역 상세주문정보 조회 버튼 이벤트 등록
	function finalOrderInfoClickEvent(){

		
		 // 카테고리 정보 초기화
		    $(".cateFirst option").remove();
		    $(".cateSecond option").remove();

		    $.ajax({

		        type: "get",
		        url: "finalOrderInfo.do",
		        data: { foCode: $(this).parent().siblings().eq(1).text()},
		        dataType: "json",
		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		        beforeSend: function () {
		            $(".orderListWrap").fadeIn(200);
		            $(".orderInfoModal").slideDown(200);
		        },
		        success: function (data) {

		            const itemInfo = data;

		            // 최종 주문 번호
		            $(".customerOrderListTitle input").val(data.fo_code);

		            // 카테고리 정보 입력 명령어
		            $(".cateFirst").append("<option value=" + data.catemm_code + " >" + data.catemm_name + "</option>");
		            $(".cateSecond").append("<option value=" + data.cates_code + ">" + data.cates_name + "</option>");
		            $(".cateFirst").attr("disabled", "disabled");
		            $(".cateSecond").attr("disabled", "disabled");

		            // 수량
		            $('#countInput').val(data.fo_num);

		            // 주문 사이즈
		            $('#sizeInput').val(data.fo_size);

		            //주문 금액
		            $('#price').val(data.fo_sum);

		            //배송형태
		            if (data.deli_code == 7003) {
		                $('#delivery').prop('selected', true);
		            } else {
		                $('#pickup').prop('selected', true);
		            }

		            //요구사항
		            $('#content').val(data.fo_etc);

		            // 결제 완료 여부에 따른 버튼 생성 로직
		                $('.payComple').remove();
		                $('.insertBtnRes').remove();
		            	$('.viewCancel').val("확인");
		        }
		    });
	    
	}
	
	// 구매확정 이벤트
	function purchConfirmEvent(){
	    
	    console.log('구매확정 이벤트 호출');
	    var customerID = $(".customerID").val();	    // 아이디값
	    var payNO = $(this).parent().siblings().eq(0).text();  // 결제번호
	    var cancelState = $(this).parent().siblings().eq(7).text(); 
	    var returnState = $(this).parent().siblings().eq(8).text(); 
	    
	    console.log(cancelState);
	    console.log(returnState);
	    
	    if(cancelState.trim() == '승인'||cancelState.trim() == '요청중' || returnState.trim() =='요청중'||returnState.trim() =='승인' ){
			alert("결제취소 또는 반품요청 상태가\n'요청중' 또는 '승인' 일 경우\n구매 확정이 불가능 합니다.");
	    }else{
		    if(confirm("구매 확정 하시겠습니까?\n구매 확정 이후 취소,반품요청이 불가능 합니다!")){
			    location.href = "purchConfirm.do?id=" + customerID + "&payNO=" + payNO;
		    }else{
				location.href = "getPayList.do?id=" + customerID + "&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1";
		    }
	    }
	}
	
	// 결제취소 버튼 이벤트
	function payCancelBtnEvent(){
	    
	    console.log('결제취소 이벤트 호출');
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var payNO = $(this).parent().siblings().eq(0).text();  // 결제번호
	    
		$(".orderListWrap").fadeIn(200);
		$(".payCancelModalView").slideDown(200);
	    
	    $(".payCancelNo").val(payNO);
	}
	
	
	// 반품요청 버튼 이벤트
	function returnCallBtnEvent(){
	    
	    console.log('반품요청 이벤트 호출');
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var returnNo = $(this).parent().siblings().eq(0).text();  // 결제번호
	    
		$(".orderListWrap").fadeIn(200);
		$(".returnModalView").slideDown(200);
		
	    $(".orderPayNo").val(returnNo);
		
	}
	
	// 플리마켓 결제취소 버튼 이벤트
	function demandBtnEvent(){
	    
	    console.log("플리마켓 결제취소 이벤트 호출");
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var returnNo = $(this).parent().siblings().eq(0).text();  // 결제번호
	    
		$(".orderListWrap").fadeIn(200);
		$(".fleaPayCancelModalView").slideDown(200);
	    
		$(".fleaPayNO").val(returnNo);
	}
	
	// 플리마켓 구매확정 이벤트
	function fleaPayConfirmBtnEvent(){
	    
	    console.log("플리마켓 구매확정 이벤트 호출");
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var customerID = $(".customerID").val();	    // 아이디값
	    var returnNo = $(this).parent().siblings().eq(0).text();  // 결제번호
	    var cancelState = $(this).parent().siblings().eq(7).text();  // 취소상태
	    
		if(cancelState.trim() == '요청중' || cancelState.trim() == '승인'){
		    alert("결제 취소 상태가\n'요청중' 또는 '승인' 일 때\n구매 확정 처리가 불가능 합니다.");
		}else{
		    if(confirm("구매 확정 하시겠습니까?\n구매 확정 이후 취소가 불가능 합니다!")){
		        location.href = "updateFleaConfirm.do?id=" + customerID + "&payNO=" + returnNo;
		    }
		}
	}
	
	
	// Modal 필드 초기화 함수
	function resetTagFild(){
	    $(".payCancelNo").val("");
	    $(".orderPayNo").val("");
	    
	}
	
	// Modal 취소 이벤트
	function viewCancelEvent() {
		$(".orderInfoModal").slideUp(200);
		$(".returnModalView").slideUp(200);
		$(".payCancelModalView").slideUp(200);
		$(".orderListWrap").fadeOut(200);

	} 

	
