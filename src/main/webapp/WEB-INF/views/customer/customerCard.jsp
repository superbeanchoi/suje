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
<meta charset="UTF-8" />
<title>SUJE - 카드 등록/수정</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/customerCard.css" />

<!-- 자바스크립트 연결 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/js/customer/customerCard.js"></script>
<script type="text/javascript">

$(function(){
<% if (request.getAttribute("complete") != null) { %>
	var complete = "<%= request.getAttribute("complete") %>";
	alert(complete);
<% } %>
    // 버튼 이벤트
    $('.cardInsert').addClass('selectMenu');
    
	var selectcard="${vo.card_company}"
	    $('#cardselect option').each(function() {
		    if ($(this).text() == selectcard ) {
				$(this).prop('selected', true);
		    }
		});	
});

</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/headerHtml/memberHeader.jsp"></jsp:include>
	<div class="main">
	
		<!-- 좌측 서브 메뉴 버튼 -->
		<jsp:include page="/WEB-INF/views/customer/customerMenuBar.jsp"></jsp:include>
		
		<!-- 화면 메인 Content 부분 -->
		<div class="mainContentright">
			<!-- Content 제목 -->
			<div class="subtitle">카드 등록/수정</div>
			<div class="myPageLine"></div>
			
			<form id="submitForm" action="updateCard.do" method="post">
			
			<div class="mainInputFormTitle">
				<!-- 각 입력부분 제목 -->
				<div>
					<div>카드사</div>
					<div>카드 번호</div>
					<div>유효기간</div>
					<div>CVC</div>
					<div>비밀번호</div>
				</div>
				<!-- 각 입력부분 -->
				<div>
					<!-- 카드사 선택부분 -->
					<div>
						<select id="cardselect" name="card_company">
						<option value=" ">카드 선택</option>
							<option value="우리카드">우리카드</option>
							<option value="국민카드">국민카드</option>
							<option value="현대카드">현대카드</option>
							<option value="신한카드">신한카드</option>
							<option value="카카오카드">카카오카드</option>
						</select>
					</div>
					
					<!-- 카드번호 입력부분 -->
					<div>
						<input type="text" value="${vo.card_num}" name="card_num" 
						placeholder="예시) 1234-5678-9012-3456"/>
					</div>
					
					<!-- 유효기간 입력부분 -->
					<div>
						<input type="text" value="${vo.card_adate}" name="card_adate"
						placeholder="예시) 2024-04-01"/>
					</div>
					
					<!-- CVC 입력부분 -->
					<div>
						<input type="text" value="${vo.card_cvc}" name="card_cvc"
						placeholder="예시) 123"/>						
					</div>
					
					<!-- 비밀번호 입력부분 -->
					<div>
						<input type="text" value="${vo.card_pass}" name="card_pass"
						placeholder="예시) 12"/> ● ●
					</div>
				</div>
			</div>
			<input type="hidden" value="${id}" name="m_id"/>		
			
			<div class="modifyBtn">
				<input type="submit" class ="submitBtn" name="submitBtn" value="등록/수정하기"></input>	
			</div>
			<div class="myPageLine"></div>
			
			<c:if test="${vo.card_code eq null}">
					<input type="hidden" value="0" name="card_code">
			</c:if>
			<c:if test="${vo.card_code ne null}">
					<input type="hidden" value="${vo.card_code}" name="card_code">
			</c:if>
			</form>
		</div>			
	</div>
	
</body>
</html>