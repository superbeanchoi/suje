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
<title>SUJE - 계좌 등록/수정</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/customerAccount.css" />

<!-- 자바스크립트 연결 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="./resources/js/customer/customerAccount.js"></script>
<script type="text/javascript">

$(function(){
    
<% if (request.getAttribute("complete") != null) { %>
	var complete = "<%= request.getAttribute("complete") %>";
	alert(complete);
<% } %>
	
    // 버튼 이벤트
    $('.accountInsert').addClass('selectMenu');
    
	var selectAccount="${vo.m_acc_bank}"
	    $('#bankAccount option').each(function() {
		    if ($(this).text() == selectAccount ) {
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
			<div class="subtitle">계좌 등록/수정</div>
			<div class="myPageLine"></div>
			
			<form id="submitForm" action="updateCAccount.do" method="post">

			<div class="mainInputFormTitle">
				<!-- 각 입력부분 제목 -->
				<div>
					<div>은행명</div>
					<div>계좌번호</div>
				</div>	
					<!-- 각 입력부분 -->
					<div>
						<!-- 은행사 선택부분 -->
						<div>
							<select id="bankAccount" name="m_acc_bank">
								<option value=" ">은행 선택</option>
								<option value="국민은행">국민은행</option>
								<option value="우리은행">우리은행</option>
								<option value="농협은행">농협은행</option>
								<option value="기업은행">기업은행</option>
								<option value="신한은행">신한은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
							</select>
						</div>

						<!-- 계좌번호 입력부분 -->
						<div>
							<input type="text" value="${vo.m_acc_num}" 	name="m_acc_num" placeholder="예시) 400402-01-786617"/>
						</div>
 					</div>
				</div>
					<input type="hidden" value="${id}" name="m_id"> 
								
				<div class="modifyBtn">
				<input type="submit" class ="submitBtn" name="submitBtn" value="등록/수정하기"/></input>
				</div>			
				<div class="myPageLine"></div>
			
			<c:if test="${vo.m_acc_code eq null }">
					<input type="hidden" value="0" name="m_acc_code">
			</c:if>
			<c:if test="${vo.m_acc_code ne null }">
					<input type="hidden" value="${vo.m_acc_code}" name="m_acc_code">
			</c:if>
			</form>			
		</div>		
	</div>
	
</body>
</html>
