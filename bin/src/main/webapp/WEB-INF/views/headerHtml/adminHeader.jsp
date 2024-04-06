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
%>
</head>
<body>
<header>
<div class="adminHeader">
    <div class="firstHeaderNavi">
        <div class="adminHeaderLogo"><a href="adminMain.do"><img src="./resources/img/sujeAdminLogo.png"/></a></div>
        
        <!-- 세션에 계정정보가 존재할 시 계정 영역(afterLogin) 호출 -->
        <c:if test="${mainId ne null}">
            <div class="afterLoginArea">
                <input type="text" disabled="disabled" value="${mainId}" class="headerId"/>
                <span>님</span>
                <a href="admininfo.do?id=${mainId}" class="headerMypageBtn"><img src="./resources/img/basicProfileIcon.png"/></a>

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
