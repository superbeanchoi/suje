<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>SUJE - 마이페이지</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/customerMyPage.css" />

<!-- 자바스크립트 연결 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/js/customer/customerMyPage.js"></script>
<script type="text/javascript">
$(function(){
<% if (request.getAttribute("complete") != null) { %>
	var complete = "<%= request.getAttribute("complete") %>";
	alert(complete);
<% } %>
    $('.mypagebtn').addClass('selectMenu');
    var date = new Date("${vo.m_birth}");
	var formattedDate = formatDate(date);
	$("input[name='m_birth']").val(formattedDate);
	
	function formatDate(date) {  //날짜 포맷 변경
		var year = date.getFullYear();
		var month = padZero(date.getMonth() + 1);
		var day = padZero(date.getDate());
		
		return year + "/" + month + "/" + day;
	}
	
	function padZero(num) {  // 숫자를 두 자리로 만드는 함수
	    return (num < 10 ? "0" : "") + num;
	}
});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/headerHtml/memberHeader.jsp"></jsp:include>
	<div class="main contentsWrap">
		<jsp:include page="/WEB-INF/views/customer/customerMenuBar.jsp"></jsp:include>
		
		<div class="mainContentright">
		
			<div class="subtitle">마이페이지</div>
			<div class="myPageLine"></div>
			
			<form action="mypageModify.do" method="post">
			<div class="mainInputFormTitle">
				<div>
					<div>아이디</div>
					<div>비밀번호</div>
					<div>이름</div>
					<div>전화번호</div>
					<div>이메일</div>
					<div>생년월일</div>
					<div>성별</div>
				</div>
				<div>
					<div>
						<input type="text" value="${vo.m_id }" disabled/>
					</div>
					<div>
						<input type="password" name="m_pass"/>
					</div>
					<div>
						<input type="text" value="${vo.m_name }" disabled/>
					</div>
					<div>
						<input type="text" value="${vo.m_tel }" name="m_tel"/>
					</div>
					<div>
						<input type="text" value="${vo.m_email }" name="m_email"/>
					</div>
					<div>
						<input type="text" name="m_birth"/>
					</div>
					<div class="customSex">
						<div>
							 <input type="radio" name="m_sex" value="남자" ${vo.m_sex} checked/>
						</div>
						<div>남자</div>
						<div>
							 <input type="radio" name="m_sex" value="여자" ${vo.m_sex} checked/>
						</div>
						<div>여자</div>
					</div>
				</div>
			</div>
			<div class="modifyBtn">
			<input type="submit" value="수정하기" />
			<input type="hidden" value="${vo.m_id}" name="m_id"/>
			</div>
			<div class="myPageLine"></div>
			</form>
		</div>
		
	</div>
	<footer>
	</footer>
</body>
</html>
