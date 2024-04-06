<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 관리</title>

</head>
<body>
<h1>Q&A 관리</h1>
<section>
    <main class="QnA내역">
        <p>Q&A내역</p>
        <table>
            <thead>
                <tr>
                    <th>게시물 번호</th>
                    <th>제목</th>
                    <th>작성일자</th>
                    <th>답변 일자</th>
                    <th>답변 관리자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>12341234</td>
                    <td>추가 스토어 입점 요청드립니다!</td>
                    <td>2024/03/13</td>
                    <td>2024/03/13</td>
                    <td>bean</td>
                </tr>
               
            </tbody>
        </table>
    </main>
</section>
<fieldset class="QnA답변 등록">
    <legend>Q&A 답변 등록</legend>
    <p>Q&A게시물번호<span>12341234</span></p>
    <p>Q&A제목<span>추가 스토어 입점 요청드립니다!</span></p>
    <p>Q&A내용<span>안녕하세요 원하는 스토어가 입접하지 않아서요,피규어 관련하여 입점 고려 부탁드립니다!</span></p>
    <p>답변<span>안녕하세요.주문제작 전문몰 suje입니다. 해당 요청건은 내부 검토 후 긍정적으로 검토하겠습니다.감사합니다.</span></p>
</fieldset>
<button type="submit">등록하기</button>
</body>
</html>
