<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUJE</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/customerQnA.css" />

<!-- 자바스크립트 연결 -->
<!-- 자바 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- JS 연결 -->
<script type="text/javascript" src="./resources/js/customer/customerQnA.js"></script>
<script type="text/javascript">

$(function(){
    
    $('.qna').addClass('selectMenu');
    
    
});


</script>
</head>
<body>

	<!-- 상단메뉴바 호출 -->
	<jsp:include page="/WEB-INF/views/headerHtml/memberHeader.jsp"></jsp:include>

	<div class="main">

		<!-- 좌측 서브 메뉴 버튼 호출 -->
		<jsp:include page="/WEB-INF/views/customer/customerMenuBar.jsp"></jsp:include>

		<!-- 화면 메인 Content 부분 -->
		<div class="mainContentright">
			<!-- Q&A 작성 내역 부분 -->
			<div>
			<div class="subtitle">Q&A 작성</div>
			<div><input class="regit" type="button" value="작성하기"></div>
			</div>
			<div class="myPageLine"></div>

			<div class="mainInputFormTitle">
				<!-- Q&A 데이터 테이블 -->
				<table class="List">
					<tr class="QnAListTitle">
						<td>Q&A 게시물번호</td>
						<td>제목</td>
						<td>작성일자</td>
						<td>답변일자</td>
						<td>답변 조회</td>
					</tr>
					
					<c:forEach items="${qnaListTotal}" var="vo">
					<tr>
						<td>${vo.qna_code }</td>
						<td>${vo.qna_title }</td>
						<td>
							<fmt:parseDate value="${vo.qna_qdate }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
						</td>
						<td>
							<fmt:parseDate value="${vo.qna_adate }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
						</td>
						<td>
				<c:choose>
					<c:when test="${empty vo.qna_adate }" > </c:when> 
					<c:otherwise><input class="answer" type="button" value="조회"></c:otherwise> 
				</c:choose>
						</td>
						
					</tr>
					</c:forEach>

				</table>

				<div class="paging">
							
							<c:forEach var="i" begin="0" end="${totalCountPage }" step="1">
								[<a href="getQnAList.do?id=${id }&page=${i+1}">${i+1}</a>]
							</c:forEach>
							
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>

	<!-- Modal 출력 부분 -->	
<!-- Modal QnA 작성하기 부분 -->
<div class="modalWrap">
	<div class="qnaqModal">
		<jsp:include page="/WEB-INF/views/customer/Modal/qnaqModal.jsp"></jsp:include>
	</div>
			
	<!-- Modal QnA 답변조회 부분 -->
	<div class="qnaaModal">
		<jsp:include page="/WEB-INF/views/customer/Modal/qnaaModal.jsp"></jsp:include>
	</div>  	
</div>
</body>

</html>