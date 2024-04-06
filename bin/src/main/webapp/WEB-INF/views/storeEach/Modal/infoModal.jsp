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
<link rel="stylesheet" href="./resources/css/storeEach/Modal/infoModal.css" />

<!-- 자바스크립트 연결 -->
<!-- 자바 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="./resources/js/storeEach/storeEachPageJs.js"></script>
</head>

<body>
<!-- 상단 제목 부분 -->
<div class="customerInfoListTitle">
	<div><img width=62px height=20px src="./resources/img/sujeLogo.png"/></div>
</div>

<!-- MainContent 부분 -->
<!-- Content 첫번째 라인 -->
<div class="firstInfoContent">
	<div>공지 유형</div>
	<div><input type="text" disabled="disabled"/></div>	
	<div>공지 등록일자</div>
	<div><input type="text" disabled="disabled"/></div>		
</div>			

<!-- Content 두번째 라인 -->
<div class="secondInfoContent">
	<div><textarea disabled="disabled"></textarea></div>		
</div>		

<!-- 버튼 -->
<div class="insertInfobtn">
	<div><input type="button" value="확인"></div>
</div>
</body>
</html>