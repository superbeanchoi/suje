<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUJE</title>
<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/main/fleaMarket/Modal/buyModal.css" />

<!-- 자바스크립트 연결 -->
<!-- 자바 라이브러리 -->
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
<!-- <script src="./resources/js/main/mainFleaMarketModalJs.js"></script> -->
</head>
<body>
<!-- 상단 제목 부분 -->
<div class="customerOrderListTitle">
	<div><img width=62px height=20px src="./resources/img/sujeLogo.png"/></div>
	<div>구매하기</div>
</div>
<form action="fleaItemBuy.do" method="post">
	<div class="subtitle">주문정보</div>
	<hr />
	<!-- MainContent 부분(1) -->
	<div class="modalMainContent">
		<!-- 메인 좌측 Content Title -->
		<div class="ContentLefit">
			<div>스토어명</div>
			<div>상품 정보</div>
			<div>구매 수량</div>
		</div>
		<!-- 메인 우측 Content -->
		<div class="ContentRight">
			<!-- Content 1번째 라인 -->
			<div><input type="text" readonly="readonly"/><!-- 스토어명 --></div>
			<!-- Content 2번째 라인 -->
			<div><input type="text" readonly="readonly"/><!-- 상품정보 --></div>
			<!-- Content 3번째 라인 -->
			<div>
				<div><input type="text" readonly="readonly" name="fp_count"/><!-- 구매수량 --></div><div>개</div>
			</div>
		</div>
	</div>
	
	<div class="subtitle">결제정보</div>
	<hr/>
	<!-- MainContent 부분(2) -->
	<div class="modalMainContent2">
		<!-- 메인 좌측 Content Title -->
		<div class="ContentLefit2">
			<div>결제 방식</div>
			<div>결제 금액</div>
		</div>
		<!-- 메인 우측 Content -->
		<div class="ContentRight2">
			<!-- Content 1번째 라인 -->
			<div>
				<select name="pt_code">
					<option selected="selected" value="1">카드</option>
					<option value="2">계좌이체</option>
				</select>
				<div><input type="text" readonly="readonly"/><!-- 결제 은행 --></div>
				<div><input type="text" readonly="readonly"/><!-- 결제 정보 --></div>
			</div>
	
			<!-- Content 2번째 라인 -->
			<div>
				<div><input type="text" readonly="readonly" name="fp_sum"/><!-- 결제 금액 --></div><div>원</div>
				<div>결제일자</div>
				<div><input type="text" readonly="readonly"/><!-- 결제 일자 --></div>
			</div>
		</div>
	</div>
	
	<div class="subtitle">배송정보</div>
	<hr/>
	<!-- MainContent 부분(3) -->
	<div class="modalMainContent3">
		<!-- 메인 좌측 Content Title -->
		<div class="ContentLefit3">
			<div>수령자명</div>
			<div>전화번호</div>
			<div>배송 주소</div>
			<div>배송 메모</div>
		</div>
		<!-- 메인 우측 Content -->
		<div class="ContentRight3">
			<!-- Content 1번째 라인 -->				
			<div><input name="fd_name" type="text" /><!-- 수령자명 --></div>				
			<!-- Content 2번째 라인 -->
			<div><input name="fd_tel" type="text" /><!-- 전화번호 --></div>			
			<!-- Content 3번째 라인 -->
			<div><input id="addr" name="fd_addr" type="text" readonly="readonly"/><!-- 배송주소 --></div>
			<!-- Content 4번째 라인 -->
			<div><input name="fd_memo" type="text" /><!-- 배송메모 --></div>
		</div>
	</div>
	<input name="f_code" class="fCode" type="text" value="${fleaDetail.f_code}" readonly="readonly" style="display:none;">
	<input name="f_num" class="fNum" type="text" value="${fleaDetail.f_num}" readonly="readonly" style="display:none;">
	<input name="m_id" class="mainId" type="text" value="${mainId}" readonly="readonly" style="display:none;">
	<!-- 버튼-->
	<div class="insertbtn">
		<div><input type="submit" value="결제하기"></div>
		<div><input class="viewCancel" type="button" value="취소"></div>
	</div>
</form>
</body>
</html>