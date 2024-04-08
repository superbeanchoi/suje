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
<link href="./resources/css/main/Modal/reviewModal.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/main/mainRealTimeReviewModalJs.js"></script>
<title>SUJE</title>
</head>
<body>
<div class="finalOrderModalHead">
	<img src="././resources/img/sujeLogo.png" class="finalOrderModalLogo">
	<div class="modalMainTitle">최종 주문서 조회</div>
	<label class="finalOrderCodeTitle">최종주문번호</label>
	<input type="text" disabled="disabled" class="finalOrderCode">
</div>
<div class="modalContentsBox marginmodalContentsBox">
	<label class="modalContentsTitle">상품 카테고리</label> 
	<select class="modalCategory modalFirstCategory" disabled="disabled">
	</select>
	<select class="modalCategory modalSecondCategory" disabled="disabled">
	</select>

</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">주문 수량</label>
	<input type="text" disabled="disabled" class="modalContentsInfo foNum"><div class="orderCount">개</div>
	<label class="modalContentsTitle marginModalContentsTitle">주문 사이즈</label> 
	<input type="text" disabled="disabled" class="modalContentsInfo foSize">
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">주문 금액</label> 
	<input type="text" disabled="disabled" class="modalContentsInfo foSum"><div class="orderCount">원</div>
	<label class="modalContentsTitle marginModalContentsTitle">배송 형태</label>
	<select class="modalContentsInfo deliSelect" disabled="disabled">
		<option>픽업</option>
		<option>배송</option>
	</select>
</div>
<div class="modalContentsBigBox">
	<label class="modalContentsTitle">요구사항</label> 
	<textarea disabled="disabled" class="modalContentsLongInfo foEtc"></textarea>
</div>
<button class="modalCloseBtn">확인</button>
</body>
</html>