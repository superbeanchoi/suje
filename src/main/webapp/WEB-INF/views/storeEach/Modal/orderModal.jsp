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
<link rel="stylesheet" href="./resources/css/storeEach/Modal/orderModal.css" />

<!-- 자바스크립트 연결 -->
<!-- 자바 라이브러리 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/storeEach/storeEachPageJs.js"></script>
</head>

<body>
<% 
String orderId = (String)session.getAttribute("mainId");
%>
<!-- 상단 제목 부분 -->
<div class="customerOrderListTitle">
	<div><img width=62px height=20px src="./resources/img/sujeLogo.png"/></div>
	<div>주문요청서 작성</div>
</div>
<form action="orderSend.do" method="post">
	<input type="hidden" readonly="readonly" name="s_id" value="${storeInfoDetail.s_id}"/>
	<!-- MainContent 부분 -->
	<div class="modalMainContent">
		<!-- 메인 좌측 Content Title -->
		<div class="ContentLefit">
			<div>주문요청 아이디</div>
			<div>주문요청일자</div>
			<div>주문요청사항</div>
		</div>
		<!-- 메인 우측 Content -->
		<div class="ContentRight">
			<!-- Content 첫번째 라인 -->
			<div>
				<div><input type="text" readonly="readonly" name="m_id" value="<%= orderId %>"/></div>	
				<div>주문요청스토어</div>
				<div><input type="text" readonly="readonly" value="${storeInfoDetail.s_name}"/></div>					
			</div>
			<!-- Content 두번째 라인 -->
				<div><input type="text" readonly="readonly"/></div>
			<!-- Content 세번째 라인 -->
				<div><textarea name="o_content"></textarea></div>			
		</div>
	</div>
	<div class="insertbtn">
		<div>
			<input type="submit" value="요청하기">
		</div>
		<div>
			<input class="viewCancel" type="button" value="취소">
		</div>
	</div>
</form>
</body>
</html>