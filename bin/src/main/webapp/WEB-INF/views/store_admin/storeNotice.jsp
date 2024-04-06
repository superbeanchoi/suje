<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/subMenuStyles.css" rel="stylesheet"
	type="text/css">
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

.subtitle {
	font-size: 30px; /* 화면 너비에 대해 상대적인 크기 */
	margin-left: 2%; /* 왼쪽 여백을 화면 너비의 5%로 설정 */
	margin-top: 5%;
}

.hr {
	border-top: 5px solid #d9d9d9; /* 위쪽 테두리 설정 */
	margin-top: 20px; /* 위쪽 여백 설정 */
	margin-bottom: 20px; /* 아래쪽 여백 설정 */
}

.hr2 {
	border-top: 2px solid #ADEFD1; /* 위쪽 테두리 설정 */
	margin-top: 20px; /* 위쪽 여백 설정 */
	margin-bottom: 20px; /* 아래쪽 여백 설정 */
}

.notice-header {
	display: flex;
	justify-content: space-between;
	font-weight: bold;
	margin-bottom: 10px; /* 아래쪽 여백 조정 */
	margin-top: 50px; /* 위쪽 여백 조정 */
	padding: 0 20px; /* 헤더 좌우 padding 추가 */
}

.notice-header div {
	flex: 1; /* 각 열의 너비를 동일하게 설정 */
}

.notice-container {
	margin-top: 20px;
	margin-left: 20px;
}

.notice-item {

	align-items: center;
	margin-bottom: 20px;
}

.notice-item div {
	margin-right: 40px; /* 간격 조정을 위한 우측 여백 추가 */
	margin-left: 10px;
}

.notice-item a {
	color: #007bff;
	text-decoration: none;
}
.store_mainInfo {
   margin-top: 50px;

}

.store_subTitle {
   font-size: 20px;
   margin-right: 100px;
   margin-left: 20px;
   
}

.notiInfo_selectBox {
   font-size: 20px;
   width: 300px;
   height: 50px;
   border: 3px solid #ADEFD1;
   border-radius: 5px;
   text-align:center;
}


.notiInfo_content {
   border: 4px solid #ADEFD1;
   width: 1130px; 
   height: 200px;
   margin-top: 10px;
   margin-left: 20px;
   font-size: 20px;
   
}

.store_subCategory{
   margin-top: 50px;
}

.submitBtn {
   background-color: #ADEFD1;
   width: 300px;
   height: 50px;
   border-radius: 10px;
   margin-top: 30px;
   margin-left: 20px;
   
}
.store_mainTitle {
   font-size: 30px;
   margin-top: 50px;
   margin-left: 20px;
   
}


</style>
</head>
<body>
	<%@ include file="../../views/headerHtml/storeHeader.jsp"%>
	<div class="storeContentsWrap">
		<div class="storeSubMenuBox">
			<a href="#" class="storeProfileBox"><img
				src="./resources/img/basicProfileIconBig.png" /></a>
			<textarea rows="2" disabled="disabled" class="storeNameBox">STORE NAME AREA</textarea>
			<ul class="storeCategoryArea">
				<li class="storeFirstCategoryArea"><a href="#"
					class="storeFirstCategoryBtn checkedStateFirstCategory">&nbsp;&nbsp;&nbsp;스토어
						관리</a>
					<ul class="storeSecondCategoryArea">
						<li class="storeSecondCategoryBtn "><a href="#"> <span>스토어
									페이지 관리</span>
						</a></li>
						<li class="storeSecondCategoryBtn checkedStateSecondCategory"><a
							href="#"> <span>스토어 공지 조회/수정</span>
						</a></li>
						<li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
									공지 등록</span>
						</a></li>
						<li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
									작품 조회/수정</span>
						</a></li>
						<li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
									작품 등록</span>
						</a></li>
					</ul></li>
				<li class="storeFirstCategoryArea"><a href="#"
					class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;플리마켓 관리</a>
					<ul class="storeSecondCategoryArea">
						<li class="storeSecondCategoryBtn"><a href="#"> <span>플리마켓
									상품 조회/수정</span>
						</a></li>
						<li class="storeSecondCategoryBtn"><a href="#"> <span>플리마켓
									상품 등록</span>
						</a></li>
					</ul></li>
				<li class="storeFirstCategoryArea"><a href="#"
					class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;주문 관리</a>
					<ul class="storeSecondCategoryArea">
						<li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
									주문요청 관리</span>
						</a></li>
						<li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
									최종주문 조회</span>
						</a></li>
						<li class="storeSecondCategoryBtn"><a href="#"> <span>플리마켓
									주문 조회</span>
						</a></li>
					</ul></li>
				<li class="storeFirstCategoryArea"><a href="#"
					class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;정산 관리</a></li>
			</ul>
		</div>
		<!-- storeSubMenuBox -->
		<div class="storeContentsBox">

			<h1 class="title">스토어 공지 조회/수정</h1>
			<hr class="hr">

			<h3 class="subtitle">공지 조회</h3>
			<div class="notice-header">
				<hr class="hr2">
				<div>공지 유형</div>
				<div>공지 내용</div>
				<div>등록일자</div>
				<div>수정일자</div>
			</div>
			<hr class="hr2">
			<div class="notice-container">
				<div class="notice-item">
					<div>공지 유형 1</div>
					<div>공지 내용이 여기에 들어갑니다.</div>
					<div>2024-03-15</div>
					<div>2024-03-16</div>
				</div>
				<hr class="hr2">
				<div class="notice-item">
					<div>공지 유형 2</div>
					<div>공지 내용이 여기에 들어갑니다.</div>
					<div>2024-03-14</div>
					<div>2024-03-15</div>
				</div>
				<hr class="hr2">
			</div>

			<br /> <br />
			<hr class="hr">
 <h1 class="store_mainTitle">스토어 공지 수정</h1>
			<form class="store_mainInfo">
				<div class="store_subCategory">
					<label class="store_subTitle">공지 유형</label> 
					<select class="notiInfo_selectBox">
						<option value="choice">======= 선택 =======</option>
						<option value="1">공지사항</option>
						<option value="2">배송안내</option>
						<option value="3">주문안내</option>
					</select>
				</div>
				<div class="store_subCategory">
					<label class="store_subTitle">공지 작성 내용</label><br />
					<textarea class="notiInfo_content">내용을 작성하세요</textarea>
				</div>

				<button type="submit" class="submitBtn" name="submitBtn">등록하기</button>
			</form>
		</div>


	</div>
	<!-- storeContentsBox -->
	</div>
	<!-- storeContentsWrap -->
</body>
</html>