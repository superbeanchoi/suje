<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/menuForm/headerStyle.css" rel="stylesheet" type="text/css">
<title>SUJE</title>
<% 
String mainId = (String)session.getAttribute("mainId");
String accountProfileImg = (String)session.getAttribute("accountProfileImg");
%>
</head>
<body>
<header>
<div class="storeHeader">
	<div class="firstHeaderNavi">
		<div class="storeHeaderLogo"><a href="storeProfile.do?id=<%=mainId%>"><img src="./resources/img/sujeStoreLogo.png"/></a></div>
		<a href="viewStoreEach.do?sId=<%=mainId %>" class="storeHeaderCommunityPageBtn" target="_blank">스토어페이지</a>
		<a href="viewFleaMarket.do" class="storeHeaderFleaMarketPageBtn" target="_blank">플리마켓</a>
		
		<!-- 세션에 계정정보가 존재할 시 계정 영역(afterLogin) 호출 -->
		<c:if test="${mainId ne null}">
			<div class="afterLoginArea">
				<input type="text" disabled="disabled" value="${mainId}" class="headerId"/>
				<span>님</span>
				<!-- 프로필 정보가 존재할시 호출 -->
				<c:if test="${not empty accountProfileImg}">
					<a href="storeAccountInfo.do?id=<%=mainId %>" class="headerMypageBtn"><img src="./resources/img/DBServer/<%= accountProfileImg %>"/></a>
				</c:if>
				<!-- 프로필 정보가 존재하지 않을시 호출 -->
				<c:if test="${empty accountProfileImg}">
					<a href="storeAccountInfo.do?id=<%=mainId %>" class="headerMypageBtn"><img src="./resources/img/basicProfileIcon.png"/></a>
				</c:if>
				<a href="mainLogout.do" class="headerLogoutBtn">로그아웃</a>
			</div>
		</c:if>
		
	</div>
	<div class="firstHeaderLine"></div>
</div>
</header>
<div class="etcheaderWrap"></div>
</body>
</html>