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
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
    rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/admincss/admininfo.css" rel="stylesheet" type="text/css">
<title>SUJE</title>
<script>
$(document).ready(function() {
    $("#updateBtn").click(function() {
        alert("수정이 완료되었습니다.");
    });
});
</script>
</head>
<body>
    <%@ include file="../../views/headerHtml/adminHeader.jsp"%>

    <div class="adminContentsWrap">
        <%@ include file="../../views/headerHtml/adminSubMenuForm.jsp"%>

        <div class="adminContentsBox">
            <div class="account-title">계정 정보</div>
            <hr>

            <div class="account-form">
                <form action="updateAdmin.do?id=${adminId}" method="post">

                    <div class="form-group">
                        <label class="form-title" for="username">아이디</label> <input
                            type="text" id="username" name="MA_ID" value="${adminInfo.MA_ID}"
                            readonly="readonly">
                    </div>

                    <div class="form-group">
                        <label class="form-title" for="password">비밀번호</label> <input
                            type="password" id="password" name="MA_PASS"
                            value="${adminInfo.MA_PASS}" autocomplete="on">
                    </div>
                    <div class="form-group">
                        <label class="form-title" for="name">이름</label> <input type="text"
                            id="name" name="MA_NAME" value="${adminInfo.MA_NAME}">
                    </div>
                    <div class="form-group">
                        <label class="form-title" for="email">이메일</label> <input
                            type="email" id="email" name="MA_EMAIL"
                            value="${adminInfo.MA_EMAIL}">
                    </div>
                    <div class="form-group">
                        <label class="form-title" for="phone">전화번호</label> <input
                            type="tel" id="phone" name="MA_TEL" value="${adminInfo.MA_TEL}">
                    </div>

                    <button id="updateBtn" type="submit">수정하기</button>
                </form>
            </div>
            <!-- account-form -->
        </div>
        <!-- adminContentsBox -->
    </div>
    <!-- adminContentsWrap -->

    <footer></footer>
</body>
</html>
