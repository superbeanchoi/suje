<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
    <div class="cover">
        
        <header class="header">
            <div class="logo"></div>
            <div class="user-info">
                <span class="username">사용자 이름</span>
                <a href="#" class="logout">로그아웃</a>
            </div>
        </header>

        
        <nav class="admin-menu">
            <ul>
                <li><a href="#" class="submenu">스토어 입점 관리</a></li>
                <li><a href="#" class="submenu">Q&A 관리</a></li>
                <li><a href="#" class="submenu">스토어 벌점 관리</a></li>
                <li><a href="#" class="submenu">통계</a></li>
            </ul>
        </nav>

        
        <main class="content">
            
            <div class="account-info">
                <h2>계정 정보</h2>
                <form action="#">
                    <label for="password">비밀번호</label>
                    <input type="password" id="password" name="password">

                    <label for="email">이메일</label>
                    <input type="email" id="email" name="email">

                    <label for="name">이름</label>
                    <input type="text" id="name" name="name">

                    <label for="phone">전화번호</label>
                    <input type="tel" id="phone" name="phone">

                  
                    <button type="submit" class="edit-button">수정하기</button>
                </form>
            </div>
        </main>
    </div>
</body>
</html>
