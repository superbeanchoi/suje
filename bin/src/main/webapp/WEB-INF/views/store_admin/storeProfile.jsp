<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/subMenuStyles.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUJE</title>
<style type="text/css">
.title {
	font-size: 30px; /* 화면 너비에 대해 상대적인 크기 */
	margin-left: 1.5%; /* 왼쪽 여백을 화면 너비의 5%로 설정 */
	margin-top: 1.5%;
}
hr {
    border-top: 5px solid #d9d9d9; /* 위쪽 테두리 설정 */
    margin-top: 20px; /* 위쪽 여백 설정 */
    margin-bottom: 20px; /* 아래쪽 여백 설정 */
}

.form-container {
	margin-left: 1%; /* 왼쪽 여백을 화면 너비의 5%로 설정 */
	width: 90%; /* 폼의 너비를 화면 너비의 90%로 설정 */
}

.form-container label {
	width: 150px; /* 라벨의 고정 너비 */
	display: inline-block; /* 라벨과 텍스트 박스를 옆으로 정렬하기 위해 */
}

.text-box {
	border: 5px solid #adefd1;
	background-color: white;
	border-radius: 10px;
	padding: 10px 10px;
	font-size: 20px; /* 화면 너비에 대해 상대적인 크기 */
	margin-bottom: 50px; /* 하단 여백을 화면 너비의 1%로 설정 */
	margin-left: 150px;
	width: 25%; /* 폼의 너비를 화면 너비의 90%로 설정 */
	height: 50px;
}

.text-box2 {
	border: 5px solid #adefd1;
	background-color: white;
	border-radius: 10px;
	padding: 10px 10px;
	font-size: 1.5vw; /* 화면 너비에 대해 상대적인 크기 */
	margin-bottom: 50px; /* 하단 여백을 화면 너비의 1%로 설정 */
	margin-left: 150px;
	width: 600px; /* 폼의 너비를 화면 너비의 90%로 설정 */
	height: 50px;
}

.image-container {
	margin-left: 1%;
	margin-bottom: 100px;
}

.image-container img, .image-container button {
	margin-left: 150px; /* 이미지와 버튼 사이의 간격 설정 */
}

.image-container button {
    background-color: #adefd1; /* 배경색 변경 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 반경 변경 */
    padding: 10px 20px; /* 내부 여백 설정 */
    color: black; /* 텍스트 색상 설정 */
    cursor: pointer; /* 커서 모양 변경 */
}

.button-container button {
    background-color: #adefd1; /* 배경색 변경 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 반경 변경 */
    padding: 10px 20px; /* 내부 여백 설정 */
    color: black; /* 텍스트 색상 설정 */
    cursor: pointer; /* 커서 모양 변경 */
    width: 300px;
    height: 50px;
}

.button-container button:hover {
    background-color: #7cb8a5; /* 호버 상태 배경색 변경 */
}

</style>
</head>
<body>
<%@ include file="../../views/headerHtml/storeHeader.jsp" %>
<div class="storeContentsWrap">
<div class="storeSubMenuBox">
	<a href="#" class="storeProfileBox"><img src="./resources/img/basicProfileIconBig.png"/></a>
	<textarea rows="2" disabled="disabled" class="storeNameBox" >STORE NAME AREA</textarea>
	<ul class="storeCategoryArea">
		<li class="storeFirstCategoryArea">
			<a href="#" class="storeFirstCategoryBtn checkedStateFirstCategory">&nbsp;&nbsp;&nbsp;스토어 관리</a>
			<ul class="storeSecondCategoryArea">
				<li class="storeSecondCategoryBtn checkedStateSecondCategory"><a href="#">
					<span>스토어 페이지 관리</span>
				</a></li>
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>스토어 공지 조회/수정</span>
				</a></li>
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>스토어 공지 등록</span>
				</a></li>
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>스토어 작품 조회/수정</span>
				</a></li>
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>스토어 작품 등록</span>
				</a></li>
			</ul>
		</li>
		<li class="storeFirstCategoryArea">
			<a href="#" class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;플리마켓 관리</a>
			<ul class="storeSecondCategoryArea">
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>플리마켓 상품 조회/수정</span>
				</a></li>
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>플리마켓 상품 등록</span>
				</a></li>
			</ul>
		</li>
		<li class="storeFirstCategoryArea">
			<a href="#" class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;주문 관리</a>
			<ul class="storeSecondCategoryArea">
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>스토어 주문요청 관리</span>
				</a></li>
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>스토어 최종주문 조회</span>
				</a></li>
				<li class="storeSecondCategoryBtn"><a href="#">
					<span>플리마켓 주문 조회</span>
				</a></li>
			</ul>
		</li>
		<li class="storeFirstCategoryArea">
			<a href="#" class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;정산 관리</a>
		</li>
	</ul>
		</div>
		<!-- storeSubMenuBox -->
		<div class="storeContentsBox">

			<h1 class="title">스토어 페이지 관리</h1>
			<hr>

			<form class="form-container">
				<label for="storeName">스토어명</label> <input type="text"
					id="storeName" name="storeName" class="text-box">
			</form>

			<form class="form-container">
				<label for="storeCategory">스토어 카테고리</label> 
				<select name="storeCategory" class="text-box">
					<option value="option1">카테고리 1</option>
					<option value="option2">카테고리 2</option>
					<option value="option3">카테고리 3</option>
					<!-- 필요한 만큼 옵션을 추가할 수 있습니다. -->
				</select>
			</form>

			<div class="image-container">
				<label for="storeProfile">스토어 프로필 이미지</label> <img
					id="profilePreview" src="#" alt="프로필 이미지 미리보기">
				<button onclick="document.getElementById('storeProfile').click()">불러오기</button>
			</div>

			<div class="image-container">
				<label for="storeBackimg">스토어 배경 이미지</label> <img
					id="backimgPreview" src="#" alt="배경 이미지 미리보기">
				<button onclick="document.getElementById('storeBackimg').click()">불러오기</button>
			</div>

			<form class="form-container">
				<label for="storeDescription">스토어 소개문구</label> <input type="text"
					name="storeDescription" class="text-box2"> <span
					style="color: gray; font-size: 12px;">(100자 이하)</span>
				 <div class="button-container">
				<button>수정하기</button>
				</div>
			</form>
		</div>
		<!-- storeContentsBox -->
	</div>
	<!-- storeContentsWrap -->
</body>
</html>