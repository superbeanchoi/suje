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
	<select class="modalCategory" disabled="disabled">
		<option value="dessert">디저트</option>
		<option value="snack">전통간식</option>
		<option value="petFood">반려동물식품</option>
		<option value="clothing">의류</option>
		<option value="jewelry">주얼리</option>
		<option value="handicraft">수공예품</option>
		<option value="accessory">잡화</option>
		<option value="homeLiving">홈리빙</option>
	</select>
	<select class="modalCategory" disabled="disabled">
		<option>베이커리</option>
		<option>케이크</option>
		<option>마카롱</option>
		<option>타르트</option>
		<option>쿠키</option>
		<option>약과</option>
		<option>떡</option>
		<option>양갱</option>
		<option>애견간식</option>
		<option>애견케이크</option>
		<option>여성</option>
		<option>남성</option>
		<option>남녀공용</option>
		<option>키즈</option>
		<option>반지</option>
		<option>목걸이</option>
		<option>팔찌</option>
		<option>생활소품</option>
		<option>인테리어</option>
		<option>문구</option>
		<option>기념일</option>
		<option>일러스트</option>
		<option>가구</option>
		<option>패브릭</option>
		<option>방향제</option>
	</select>
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">주문 수량</label>
	<input type="text" disabled="disabled" class="modalContentsInfo"><div class="orderCount">개</div>
	<label class="modalContentsTitle marginModalContentsTitle">주문 사이즈</label> 
	<input type="text" disabled="disabled" class="modalContentsInfo">
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">주문 금액</label> 
	<input type="text" disabled="disabled" class="modalContentsInfo"><div class="orderCount">원</div>
	<label class="modalContentsTitle marginModalContentsTitle">배송 형태</label>
	<select class="modalContentsInfo" disabled="disabled">
		<option>픽업</option>
		<option>배송</option>
	</select>
</div>
<div class="modalContentsBigBox">
	<label class="modalContentsTitle">요구사항</label> 
	<textarea disabled="disabled" class="modalContentsLongInfo"></textarea>
</div>
<button class="modalCloseBtn">확인</button>
</body>
</html>