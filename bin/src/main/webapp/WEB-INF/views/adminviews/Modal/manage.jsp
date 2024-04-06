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
<link href="./resources/css/admincss/Modal/manage.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>SUJE</title>
</head>
<body>
<div class="storeMoreInfoModalHead">
	<img src="././resources/img/sujeAdminLogo.png" class="storeMoreInfoModalLogo">
	<div class="modalMainTitle">입점 여부 등록</div>
	<label class="modalStoreIdTitle">스토어 아이디</label>
	<input type="text" name="storeId" disabled="disabled" class="modalStoreIdInfo">
</div>
<h2 class="modalSubTitle">스토어 정보</h2>
<hr class="adminLine">
<div class="modalContentsBox">
	<label class="modalContentsTitle">스토어 카테고리</label> 
	<select class="modalCategory storeCategory" disabled="disabled">
		<option value="디저트">디저트</option>
		<option value="전통간식">전통간식</option>
		<option value="반려동물식품">반려동물식품</option>
		<option value="의류">의류</option>
		<option value="주얼리">주얼리</option>
		<option value="수공예품">수공예품</option>
		<option value="잡화">잡화</option>
		<option value="홈리빙">홈리빙</option>
	</select>
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">스토어명</label>
	<input type="text" name="storeName" disabled="disabled" class="modalContentsInfo">
	<label class="modalContentsTitle marginModalContentsTitle">사업자등록번호</label> 
	<input type="text" name="businessNumber" disabled="disabled" class="modalContentsInfo">
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">이메일</label> 
	<input type="email" name="email" disabled="disabled" class="modalContentsInfo">
	<label class="modalContentsTitle marginModalContentsTitle">전화번호</label>
	<input type="tel" name="phoneNumber" disabled="disabled" class="modalContentsInfo">
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">주소</label>
	<input type="text" name="address" disabled="disabled" class="modalContentsInfoLong">
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">은행명</label>
	<select class="modalCategory bankCategory" disabled="disabled">
		<option value="국민은행">국민은행</option>
		<option value="기업은행">기업은행</option>
		<option value="농협은행">농협은행</option>
		<option value="신한은행">신한은행</option>
		<option value="우리은행">우리은행</option>
		<option value="카카오뱅크">카카오뱅크</option>
		<option value="하나은행">하나은행</option>
	</select>
</div>
<div class="modalContentsBox">
	<label class="modalContentsTitle">계좌번호</label> 
	<input name="accountNumber" class="modalContentsInfo">
</div>
<h2 class="modalSubTitle">입점 여부 등록</h2>
<hr class="adminLine">
<form action="storeAvailInsert.do" method="post">
	<div class="modalContentsBox">
		<input type="hidden" name="ma_id"/>
		<input type="hidden" name="s_id"/>
		<label for="approvalStatus" class="modalContentsTitle">입점여부</label>
		<select id="approvalStatus" name="sa_ck" class="modalApprovalStatusInfo">
			<option selected="selected">====== 선택 ======</option>
			<option value="승인">승인</option>
			<option value="대기">대기</option>
			<option value="보류">보류</option>
			<option value="반려">반려</option>
		</select>
	</div>
	<div class="modalContentsBox">
		<label for="reason" class="modalContentsTitle">사유</label>
		<input type="text" id="reason" name="sa_content" class="modalReasonInfo">
	</div>
	<div class="modalBtnBox">
		<input type="submit" value="승인하기" class="modalSubmitBtn">
		<input type="button" value="취소" class="modalCloseBtn">
	</div>
</form>
</body>
</html>