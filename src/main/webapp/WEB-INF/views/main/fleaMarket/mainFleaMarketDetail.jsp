<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/fleaMarket/mainFleaMarketDetailStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/main/mainFleaMarketDetailJs.js"></script>
<!-- <script src="./resources/js/main/mainFleaMarketModalJs.js"></script> -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	var storeName;
	var itemInfo;
	var finalCount;
	var finalPrice;
	var mainId;
	
	// 플리마켓 구매하기 모달창 오픈/클로즈
	$('.buyBtn').click(function() {
		if($('.mainId').val() === "") {
			alert("로그인 후 이용 가능한 서비스입니다.");
			location.href = "mainLogin.do";
		} else {
			payInfoFirst();
		}
	});
	$('.viewCancel').click(function() {
		$(".customerOrderListModalBody").slideUp(200);
		$(".customerOrderListModal").fadeOut(200);
	});
	
	//결제 방식 선택
	$('select[name="pt_code"]').change(function() {
		var selectedOption = $(this).val();
		payInfoSecond(selectedOption);
	});
	
	//카드&계좌 정보 호출1
	function payInfoFirst() {
		mainId = $('.mainId').val();  //구매자 ID
		$.ajax({
			url : "payInfo.do",
			type : "post",
			data: { m_id : mainId },
			dataType : "json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(payInfo){
				if(payInfo.card_num === null) {
					alert("결제 정보를 우선 등록하여 주세요.");
					location.href = "customerCard.do?id="+mainId;
				} else if (payInfo.m_acc_num === null) {
					alert("결제 정보를 우선 등록하여 주세요.");
					location.href = "customerAccount.do.do?id="+mainId;
				}
				modalOpen(payInfo);
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
			}
		});
	}
	//카드&계좌 정보 호출2
	function payInfoSecond(selectedOption) {
		mainId = $('.mainId').val();  //구매자 ID
		$.ajax({
			url : "payInfo.do",
			type : "post",
			data: { m_id : mainId },
			dataType : "json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(payInfo){
				var cardBank = payInfo.card_company;
				var cardNum = payInfo.card_num;
				var accBank = payInfo.m_acc_bank;
				var accNum = payInfo.m_acc_num;
				if(selectedOption == "1") {
					$('.ContentRight2>div>div:nth-child(2) input').val(cardBank);  //은행명
					$('.ContentRight2>div>div:nth-child(3) input').val(cardNum);  //은행번호
				} else if (selectedOption == "2") {
					$('.ContentRight2>div>div:nth-child(2) input').val(accBank);  //은행명
					$('.ContentRight2>div>div:nth-child(3) input').val(accNum);  //은행번호
				}
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
			}
		});
	}
	
	// 구매 정보 모달 삽입
	function modalOpen(payInfo) {
		var cardBank = payInfo.card_company;
		var cardNum = payInfo.card_num;
		var accBank = payInfo.m_acc_bank;
		var accNum = payInfo.m_acc_num;
		
		storeName = $('.itemStore').text();
		$('.ContentRight>div:nth-child(1) input').val(storeName);  //스토어명
		itemInfo = $('.itemName').text();
		$('.ContentRight>div:nth-child(2) input').val(itemInfo);  //상품 정보
		finalCount = $('.itemCount').text();
		$('.ContentRight>div:nth-child(3)>div:nth-child(1) input').val(finalCount);  //구매 수량
		finalPrice = $('.finalPrice span:first-child').text();
		$('.ContentRight2>div:nth-child(2)>div:first-child input').val(finalPrice);  //결제 금액
		$('.ContentRight2 input[type="text"]').last().val(getCurrentDate());  //결제 일자
		mainId = $('.mainId').val();  //구매자 ID
		
		//구매자 기본 정보 삽입
		$.ajax({
			url : "fleaBuyingMemberInfo.do",
			type : "post",
			data: { m_id : mainId },
			dataType : "json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(memberInfo){
				//$('.ContentRight2>div>div:nth-child(2) input').val(cardBank);  //은행명
				//$('.ContentRight2>div>div:nth-child(3) input').val(cardNum);  //은행번호
				$('.ContentRight3>div:nth-child(1) input').val(memberInfo.m_name);  //수령자명
				$('.ContentRight3>div:nth-child(2) input').val(memberInfo.m_tel);  //전화번호
				$(".customerOrderListModal").fadeIn(200);
				$(".customerOrderListModalBody").slideDown(200);
			},
			error: function(err) {
				alert("통신 에러가 발생했습니다 : "+err);
			}
		});
	}
	
	//결제일자 삽입하기
    function getCurrentDate() {  //현재날짜 가져오기
		var date = new Date();
		var year = date.getFullYear();
		var month = (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1);
		var day = (date.getDate() < 10 ? '0' : '') + date.getDate();
		return year + '/' + month + '/' + day;
	}
	
	//주소정보 불러오기
	$("input[name='fd_addr']").click(function(){
		sample4_execDaumPostcode();
	});
	function sample4_execDaumPostcode() {
	    new daum.Postcode({        
	        oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				    extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
				   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraRoadAddr !== ''){
				    extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("addr").value = roadAddr;
				
				var guideTextBox = document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if(data.autoRoadAddress) {
				    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				    guideTextBox.style.display = 'block';
				}
	        }
	    }).open();
	    new daum.Postcode({
			onclose: function(state) {
			//state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 
				//상세 설명은 아래 목록에서 확인
				if(state === 'FORCE_CLOSE'){
				//사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 
				//실행될 코드를 작성하는 부분
				} else if(state === 'COMPLETE_CLOSE'){
				//사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 
				//실행될 코드를 작성하는 부분
				//oncomplete 콜백 함수가 실행 완료된 후에 실행
				}
			}
		});
	}
});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="../../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
	<div class="itemImageArea">
		<ul class="itemImage">
			<li><img src="././resources/img/DBServer/${fleaDetail.f_spname}"/></li>
			<c:forEach items="${fleaDetailSubImg}" var="MainFleaMarketVO">
				<li><img src="././resources/img/DBServer/${MainFleaMarketVO.fs_spname}"/></li>
			</c:forEach>
		</ul>
	</div> <!-- itemImageArea -->
	<button class="imgLeftMove"><img src="././resources/img/moveIcon.png"/></button>
	<button class="imgRightMove"><img src="././resources/img/moveIcon.png"/></button>
	<div class="itemInfoArea">
		<div class="itemCategory">
			<div class="allCategory">전체</div>
			<img src="././resources/img/mainSubMenuBtn.png">
			<div class="category">${fleaDetail.catem_name}</div>
			<img src="././resources/img/mainSubMenuBtn.png">
			<div class="category">${fleaDetail.catemm_name}</div>
		</div>
		<div class="itemStore">${fleaDetail.s_name}</div>
		<div class="itemName">${fleaDetail.f_content}</div>
		<div class="itemPrice">
			<span>${fleaDetail.f_sum}</span>
			<span>원</span>
		</div>
		<div class="itemCountArea">
			<div class="itemCountBox">
				<button class="CountMinus">-</button>
				<div class="itemCount">1</div>
				<button class="CountPlus">+</button>
			</div>
			<div class="finalPrice">
				<span><!-- itemPrice 값이 자동으로 들어오도록 JS 설정됨 --></span>
				<span>원</span>
			</div>
		</div>
		<input class="itemNum" type="text" value="${fleaDetail.f_num}" readonly="readonly" style="display:none;">
		<button class="buyBtn">구매하기</button>
	</div> <!-- itemInfoArea -->
</div> <!-- contentsWrap -->
<footer></footer>

<!-- 모달 -->
<div class="customerOrderListModal">
	<div class="customerOrderListModalBody">
		<%@ include file="./Modal/buyModal.jsp" %>
	</div> <!-- customerOrderListModalBody -->
</div> <!-- customerOrderListModal -->
</body>
</html>