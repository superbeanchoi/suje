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
<title>SUJE</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/customerReview.css" />

<!-- 데이터피커 CSS 연결 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 자바스크립트 연결 -->
<!-- 자바 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- JS 연결 -->
<script type="text/javascript"	src="./resources/js/customer/customerReview.js"></script>
<script type="text/javascript">

$(function(){
<% if (request.getAttribute("complete") != null) { %>
	var complete = "<%= request.getAttribute("complete") %>";
	alert(complete);
<% } %>
    
    $('.reviews').addClass('selectMenu');
    
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
			<!-- 주문제작 결제 내역 부분 -->
			<div class="subtitle">후기작성</div>
			<div class="myPageLine"></div>

			<div class="mainInputFormTitle">
				<!-- 주문제작 결제 내역 테이터 테이블 -->
				<table class="List">
					<tr class="orderListTitle">
						<td>결제 번호</td>
						<td>최종주문번호</td>
						<td>주문 일자</td>
						<td>결제 일자</td>
						<td>결제 금액</td>
						<td>구매확정</td>
						<td>구매확정일자</td>
						<td>후기작성</td>
						<td>후기작성일자</td>
					</tr>
					
					<c:forEach items="${mapValue}" var="vo">
						<tr>
							<td>${vo.p_code }</td>
							<td>${vo.fo_code }</td>
							<td>
								<fmt:parseDate value="${vo.o_date }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
							</td>
							<td>
								<fmt:parseDate value="${vo.p_date }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
							</td>
							<td>${vo.p_sum }</td>
							<td>${vo.p_ck }</td>
							<td>
								<fmt:parseDate value="${vo.p_ck_date }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
							</td>
							<td>
							<c:if test="${vo.p_ck eq 'Y'}">
								<c:if test="${vo.rv_code eq 0}">
									<input class="regit" type="button" value="작성">
								</c:if>
								<c:if test="${vo.rv_code ne 0}">
									작성완료
								</c:if>
							</c:if>
							<c:if test="${vo.p_ck eq 'N'}">
								구매미확정
							</c:if>
							</td>
							<td>
							<c:if test="${vo.rv_code eq 0}">
								
							</c:if>
							<c:if test="${vo.rv_code ne 0}">
								<fmt:parseDate value="${vo.rv_date }" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</table>
				<div class="pageing">
				<c:forEach var="i" begin="1" end="${totalCountRow }" step="1">
					[<a href="customerReview.do?id=${id}&page=${i}">${i }</a>]
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
	<!-- Modal 출력 부분 -->
	<div class="modalWrap">
		<div class="reviewModalView">
			<jsp:include page="Modal/review.jsp"></jsp:include>
		</div>
	</div>
</body>

<script type="text/javascript">

/* 후기 작성하기 */
$(function() {
    
    // 최종 주문서 조회 취소 이벤트
    $('.viewCancel').click(function(){
		
		$(".reviewModalView").slideUp(200);
		$(".modalWrap").fadeOut(200);
    	
    });
    
    // 버튼 이벤트 등록
    $(".regit").click(reviewRegitBtnEvent);
    
    // 이미지 파일명 텍스트박스 입력 이벤트
	$('#reviewImg').change(function(){
		$(".fileName").val($(this).val());
	});
});

function reviewRegitBtnEvent(){
    $(".modalWrap").fadeIn(200);
    $(".reviewModalView").slideDown(200);
    
    let orderReturn = $(this).parent().parent().children().eq(0).text(); // 결제번호
    $(".orderPayNO").val(orderReturn);
    console.log(orderReturn);
}

</script>


</html>
