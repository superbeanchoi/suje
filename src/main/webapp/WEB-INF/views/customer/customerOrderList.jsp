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
<title>SUJE - 주문 내역 조회</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet"
	href="./resources/css/customer/customerOrderList.css" />

<!-- 자바스크립트 연결 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="./resources/js/customer/customerOrderList.js"></script>
<script type="text/javascript">

$(function(){
    
    $('.orderListMenubar').addClass('selectMenu');
    
    
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
			<!-- 주문제작 결제 내역 부분 -->
			<div class="subtitle">주문제작 결제 내역</div>
			<div class="myPageLine"></div>

			<div class="mainInputFormTitle">
				<!-- 주문제작 결제 내역 테이터 테이블 -->
				<table class="List orderList">
					<tr class="orderListTitle">
						<td>결제 번호</td>
						<td>최종주문번호</td>
						<td>주문 일자</td>
						<td>결제 일자</td>
						<td>결제 금액</td>
						<td>구매확정</td>
						<td>구매확정일자</td>
						<td>상세주문정보</td>
						<td>결제취소</td>
						<td>반품요청</td>
					</tr>
					
					<c:forEach items="${mapValue.orderList}" var="vo">
						<tr>
							<td>${vo.p_code}</td>
							<td>${vo.fo_code}</td>
							<td>${vo.fo_date}</td>
							<td>${vo.p_date}</td>
							<td>${vo.p_sum}</td>
				 			<td><input class="joinCheck" type="button" value="확정"></td> 									
							<td>${vo.p_ck_date}</td>
							<td><input class="joinCheck" type="button" value="조회"></td>
							<td><input class="payBackCall" type="button" value="요청"></td>
							<td><input class="returnCall" type="button" value="요청"></td>
						</tr>
					</c:forEach>
					
				</table>
				
				<div class="pageing">				
							<c:forEach var="i" begin="0" end="${totalCountPage }" step="1">
								[<a href="getPayList.do?id=${id }&orderPage=${i+1}&fleaPage=1">${i+1}</a>]
							</c:forEach>				
				</div>
				
			</div>

			<!-- 플리마켓 결제 내역 부분 -->
			<div class="subtitle2">플리마켓 결제 내역</div>
			<div class="myPageLine"></div>
			<table class="List fleaList">
				<!-- 플리마켓 결제 내역 테이터 테이블 -->
				<tr class="orderListTitle">
					<td>결제 번호</td>
					<td>스토어명</td>
					<td>상품 정보</td>
					<td>결제수량</td>
					<td>결제일자</td>
					<td>결제금액</td>
					<td>구매확정</td>
					<td>구매확정일자</td>
					<td>결제취소</td>
				</tr>

			<c:forEach items="${mapValue.fleaList}" var="vo">
				<tr>
					<td>${vo.fp_code}</td>
					<td>${vo.s_name}</td>
					<td>${vo.cates_name}</td>
					<td>${vo.fp_count}</td>
					<td>${vo.fp_date}</td>
					<td>${vo.fp_sum}</td>
					<td>${vo.fp_ck}</td>
					<td >${vo.fp_ckdate}</td>
					<td>
						<input class="payCancelBtn" type="button" value="요청">
					</td>
				</tr>
			</c:forEach>
			
			</table>
			
				<div class="pageing">				
							<c:forEach var="i" begin="0" end="${totalCountPage }" step="1">
								[<a href="getPayList.do?id=${id }&orderPage=1&fleaPage=${i+1}">${i+1}</a>]
							</c:forEach>				
				</div>

			<!-- 결제 취소 부분 -->
			<div class="subtitle2">결제취소 내역</div>
			<div class="myPageLine"></div>
			<table class="List payCancel">
				<tr class="orderListTitle">
					<td>결제취소번호</td>
					<td>최종주문번호</td>
					<td>취소 일자</td>
					<td>취소 사유</td>
				</tr>
				<tr>
					<td>123456789</td>
					<td>123456789</td>
					<td>2024/03/01</td>
					<td>재결제를 위해 결제 취소</td>
				</tr>

			</table>
			<div class="pageing">< 1 2 3 ></div>

			<!-- 반품 요청 내역 -->
			<div class="subtitle2">반품 요청 내역</div>
			<div class="myPageLine"></div>
			<table class="List returnList">
				<tr class="orderListTitle">
					<td>반품번호</td>
					<td>최종주문번호</td>
					<td>반품일자</td>
					<td>반품사유</td>
				</tr>
				<tr>
					<td>123456789</td>
					<td>123456789</td>
					<td>2024/03/01</td>
					<td>주문한 디자인과 실물 디자인이 너무 다름</td>
				</tr>

			</table>
			<div class="pageing">< 1 2 3 ></div>
		</div>
	</div>

	<!-- Modal 출력 부분 -->
	<div class="orderListWrap">
	
		<!-- 주문제작결제내역 주문상세정보 보기 부분 -->
		<div class="orderInfoModal">
			<jsp:include page="Modal/orderInfoModal.jsp"></jsp:include>
		</div>
	
		<!-- 주문제작결제내역 결제취소 부분 -->
		<div class="payCancelModalView">
			<jsp:include page="Modal/orderPayCancelModal.jsp"></jsp:include>
		</div>
		
		<div class="returnModalView">
			<jsp:include page="Modal/returnModal.jsp"></jsp:include>
		</div>
 		
		<!-- 플리마켓결제내역 결제취소 부분 -->
		<div class="fleaPayCancelModalView">
			<jsp:include page="Modal/fleaPayCancelModal.jsp"></jsp:include>
		</div> 
		
	</div>
</body>
<script type="text/javascript">


	$(function() {
		
		// 취소 버튼 이벤트
		$(".viewCancel").click(function() {
			$(".orderInfoModal").slideUp(200);
			$(".returnModalView").slideUp(200);
			$(".payCancelModalView").slideUp(200);
			$(".orderListWrap").fadeOut(200);
		});
	
		// 플리마켓 결제취소 버튼 이벤트
		$(".payCancelBtn").click(function() {
			$(".orderListWrap").fadeIn(200);
			$(".fleaPayCancelModalView").slideDown(200);
			let fleaResultVal = $(this).parent().parent().children().eq(0).text();
			$(".payNO").val(fleaResultVal);

		});
		
		// 주문제작결제내역 반품 요청 버튼 이벤트
		$(".returnCall").click(function(){
			$(".orderListWrap").fadeIn(200);
			$(".returnModalView").slideDown(200);
			let orderReturn = $(this).parent().parent().children().eq(0).text();
			$(".orderPayNo").val(orderReturn);
			
		});
		
		$(".payBackCall").click(function(){
			$(".orderListWrap").fadeIn(200);
			$(".payCancelModalView").slideDown(200);
			let cancelNO = $(this).parent().parent().children().eq(0).text();
			$(".orderPayCancelNO1").val(cancelNO);
			
		});

	});

	function setAjex() {
		sandPage();
		return false;
	}

	function sandPage() {

		$.ajax({
			url : "modaltest.do",
			type : "get",
			dataType : "json",
			contentType : 'application/json; charset=utf-8',
			beforeSend : function() {
				$(".orderListWrap").fadeIn(200);
				$(".orderInfoModal").slideDown(200);
			},
			success : function(data) {

				var dataList = data;
				$('#testinput').val(dataList[0]);
				$('#sizeInput').val(dataList[1]);

			}
		});
	}

	function payback() {
		$.ajax({
			url : "insert.do",
			type : "get",
			dataType : "json",
			contentType : 'application/json; charset=utf-8',
			beforeSend : function() {
				$(".orderListWrap").fadeIn(200);
				$(".orderInfoModal").slideDown(200);
			},
		});
	}
</script>
</html>
