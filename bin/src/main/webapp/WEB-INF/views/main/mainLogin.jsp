<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/mainLoginStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	// 멤버 회원 로그인
	$('.memberLoginBtn').click(function(event) {
		event.preventDefault();
		$('.loginIdInput').attr('name', 'm_id').val(${m_id});
		$('.loginPwInput').attr('name', 'm_pass').val(${m_pass});
		$('.loginArea').attr('action', 'mainMemberLogin.do');
		$('.loginArea').off('submit').submit();
	});
	// 스토어 회원 로그인
	$('.storeLoginBtn').click(function(event) {
 		event.preventDefault();
		$('.loginIdInput').attr('name', 's_id').val(${s_id});
		$('.loginPwInput').attr('name', 's_pass').val(${s_pass});
		$('.loginArea').attr('action', 'mainStoreLogin.do');
		$('.loginArea').off('submit').submit();
	});
	// 관리자 회원 로그인
	$('.adminLoginBtn').click(function(event) {
		event.preventDefault();
		$('.loginIdInput').attr('name', 'ma_id').val(${ma_id});
		$('.loginPwInput').attr('name', 'ma_pass').val(${ma_pass});
		$('.loginArea').attr('action', 'mainAdminLogin.do');
		$('.loginArea').off('submit').submit();
	});

<% if (request.getAttribute("errorMessage") != null) { %>
	var errorMessage = "<%= request.getAttribute("errorMessage") %>";
	alert(errorMessage);
<% } %>
<% if (request.getAttribute("newMemberComple") != null) { %> 
var newMemberComple = "<%= request.getAttribute("newMemberComple") %>"; 
alert(newMemberComple);
<% } %>

});
</script>

<title>SUJE</title>
</head>
<body>
<%@ include file="../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
	<form method="post" class="loginArea">
		<div class="loginTitle">로그인</div>
		<label class="loginInfoTitle">아이디</label>
		<input type="text" required="required" autofocus="autofocus" placeholder="SUJE123" class="loginInfoInput loginIdInput"/>
		<label class="loginInfoTitle">비밀번호</label>
		<input type="password" required="required" placeholder="비밀번호를 입력해주세요" class="loginInfoInput loginPwInput"/>
		<input type="button" value="개인 회원 로그인" class="memberLoginBtn" />
		<input type="button" value="스토어 회원 로그인" class="storeLoginBtn" />
		<input type="button" value="관리자 회원 로그인" class="adminLoginBtn" />
	</form>
</div> <!-- contentsWrap -->
<footer></footer>
</body>
</html>