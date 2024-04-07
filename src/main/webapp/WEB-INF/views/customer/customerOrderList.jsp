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
	    
		var paycancelstate = "<%=request.getParameter("state")%>";
		if(paycancelstate == 1){
		    alert("결제취소 요청 처리가 되었습니다");
		    location.href = "getPayList.do?id=<%=request.getParameter("id")%>&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1";
		}
	});
</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/headerHtml/memberHeader.jsp"></jsp:include>
	<input type="hidden" class="customerID" value="${id }"/>
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
				<table class="List">
					<tr class="orderListTitle">
						<td>결제 번호</td>
						<td>주문번호</td><!-- 최종 주문 번호 -->
						<td>주문 일자</td>
						<td>결제 일자</td>
						<td>결제 금액</td>
						<td>구매확정</td>
						<td>구매확정일자</td>
						<td>상세주문정보</td>
						<td>결제취소</td>
						<td>반품요청</td>
					</tr>
					<c:if test="${ResultList.orderList ne null }">
						<c:forEach items="${ResultList.orderList}" var="vo">
							<tr>
								<td>${vo.p_code}</td>
								<td>${vo.fo_code}</td>
								<td>${vo.fo_date}</td>
								<td>${vo.p_date}</td>
								<td>${vo.p_sum}</td>
								
					 			<td>
					 				<c:if test="${vo.p_ck eq 'Y'}"><!-- 구매확정 -->
					 					확정
					 				</c:if>
					 				<c:if test="${vo.p_ck eq 'N'}"><!-- 구매 미확정 -->
					 					<input class="purchConfirm" type="button" value="확정">
					 				</c:if>
					 			</td>
					 			
								<td>${vo.p_ck_date}</td><!-- 구매확정일자 -->
								<td><input class="joinCheck" type="button" value="조회"></td><!-- 상세주문정보 -->
								
								
								<c:if test="${vo.p_ck eq 'Y'}"><!-- 구매 확정 일때 -->
									<td></td><!-- 구매 확정 일 때 결제취소 -->
									<td></td><!-- 구매 확정 일 때 반품요청 -->
								</c:if>
								
								<c:if test="${vo.p_ck eq 'N'}"><!-- 구매 미확정 일때 -->
								
									<td><!-- 구매 미확정 일 때 결제취소 -->
									
										<c:if test="${vo.can_code eq 0 }">
											<input class="payCancelBtn" type="button" value="요청">
										</c:if>
										<c:if test="${vo.can_code ne 0 }">
											<c:if test="${vo.can_state eq null }">
												요청중
											</c:if>
											<c:if test="${vo.can_state eq 'Y' }">
												승인
											</c:if>
											<c:if test="${vo.can_state eq 'N' }">
												거절
											</c:if>
										</c:if>
										
									</td>
									
									<td><!-- 구매 미 확정 일 때 반품요청 -->
									
										<c:if test="${vo.rt_code eq 0 }">
											<input class="returnCall" type="button" value="요청">
										</c:if>
										<c:if test="${vo.rt_code ne 0 }">
											<c:if test="${vo.rt_state eq null }">
												요청중
											</c:if>
											<c:if test="${vo.rt_state eq 'Y' }">
												승인
											</c:if>
											<c:if test="${vo.rt_state eq 'N' }">
												거절
											</c:if>
										</c:if>
										
									</td>
									
							</c:if>
	
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ResultList.orderList eq null }">
							주문 제작 결제건이 없습니다.
					</c:if>
				</table>
				
				<div class="pageing">				
							<c:forEach var="i" begin="1" end="${countResultMap.orderPurchCount }" step="1">
								[<a href="getPayList.do?id=${id }&orderPage=${i}&fleaPage=1&cancelPage=1&returnPage=1">${i}</a>]
							</c:forEach>				
				</div>
				
			</div>

			<!-- 플리마켓 결제 내역 부분 -->
			<div class="subtitle2">플리마켓 결제 내역</div>
			<div class="myPageLine"></div>
			<table class="List">
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
			<c:if test="${ResultList.fleaList ne null}">
				<c:forEach items="${ResultList.fleaList}" var="vo">
					<tr>
						<td>${vo.fp_code}</td>
						<td>${vo.s_name}</td>
						<td>${vo.cates_name}</td>
						<td>${vo.fp_count}</td>
						<td>${vo.fp_date}</td>
						<td>${vo.fp_sum}</td>
						
						<td>
							<c:if test="${vo.fp_ck eq 'Y'}">확정</c:if>
							<c:if test="${vo.fp_ck eq 'N'}"><input class="fleaPayConfirmBtn" type="button" value="확정"></c:if>
						</td>
						
						<td>${vo.fp_ckdate}</td>
						
						<td><!-- 결제취소 부분 -->
							<c:if test="${vo.fp_ck eq 'N'}">
								<c:if test="${vo.pc_code eq 0}">
									<input class="demand" type="button" value="요청">
								</c:if>
								<c:if test="${vo.pc_code ne 0}">
									<c:if test="${vo.pc_state eq null}">요청중</c:if>
									<c:if test="${vo.pc_state eq 'Y'}">승인완료</c:if>
									<c:if test="${vo.pc_state eq 'N'}">요청취소</c:if>
								</c:if>
							</c:if>
						</td><!-- 결제취소 부분 -->
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${ResultList.fleaList eq null}">
				플리마켓 결제 내역이 없습니다.
			</c:if>
			</table>
			
				<div class="pageing">				
							<c:forEach var="i" begin="1" end="${countResultMap.fleaPurchCount }" step="1">
								[<a href="getPayList.do?id=${id }&orderPage=1&fleaPage=${i}&cancelPage=1&returnPage=1">${i}</a>]
							</c:forEach>				
				</div>

			<!-- 결제 취소 부분 -->
			<div class="subtitle2">결제취소 내역</div>
			<div class="myPageLine"></div>
			<table class="List">
				<tr class="orderListTitle">
					<td>구분</td>
					<td>결제취소번호</td>
					<td>주문번호</td>
					<td>취소 일자</td>
					<td>취소 사유</td>
					<td>취소 상태</td>
				</tr>
				<c:if test="${ResultList.cancleList ne null}">
					<c:forEach items="${ResultList.cancleList}" var="vo">
					<tr>
						<td>${vo.title}</td>
						<td>${vo.code}</td>
						<td>${vo.order_code}</td>
						<td>${vo.rdate}</td>
						<td>${vo.why}</td>
						<td>
							<c:if test="${vo.can_state eq null}"> 승인대기 </c:if>
							<c:if test="${vo.can_state eq 'Y'}"> 승인 </c:if>
							<c:if test="${vo.can_state eq 'N'}"> 반려 </c:if>
						</td>
					</tr>
					</c:forEach>
				</c:if>
				<c:if test="${ResultList.cancleList eq null}">
					결제 취소 요청건이 없습니다.
				</c:if>
				
			</table>
			<div class="pageing">
					<c:forEach var="i" begin="1" end="${countResultMap.cancelCount }" step="1">
						[<a href="getPayList.do?id=${id }&orderPage=1&fleaPage=1&cancelPage=${i}&returnPage=1">${i}</a>]
					</c:forEach>	
			</div>

			<!-- 반품 요청 내역 -->
			<div class="subtitle2">반품 요청 내역</div>
			<div class="myPageLine"></div>
			<table class="List">
				<tr class="orderListTitle">
					<td>반품번호</td>
					<td>최종주문번호</td>
					<td>반품일자</td>
					<td>반품사유</td>
					<td>반품상태</td>
				</tr>
				<c:if test="${ResultList.returnList ne null}">
					<c:forEach items="${ResultList.returnList}" var="vo">
					<tr>
						<td>${vo.rt_code}</td>
						<td>${vo.fo_code}</td>
						<td>${vo.rt_date}</td>
						<td>${vo.rt_why}</td>
						<td>
							<c:if test="${vo.rt_state eq null}">승인대기</c:if>
							
							<c:if test="${vo.rt_state ne null}">		
							
								<c:if test="${vo.rt_state eq 'Y'}">승인</c:if>
								<c:if test="${vo.rt_state eq 'N'}">거절</c:if>
								
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="pageing">
				<c:forEach var="i" begin="1" end="${countResultMap.returnCount }" step="1">
					[<a href="getPayList.do?id=${id }&orderPage=1&fleaPage=1&cancelPage=1&returnPage=${i}">${i}</a>]
				</c:forEach>	
			</div>
		</div>
	</div>

	<!-- Modal 출력 부분 -->
	<div class="orderListWrap">
	
		<!-- 주문상세정보 보기 부분 -->
		<div class="orderInfoModal">
			<jsp:include page="Modal/orderInfoModal.jsp"></jsp:include>
		</div>
		
		<!-- 주문 제작 결제취소 부분 -->
		<div class="payCancelModalView">
			<jsp:include page="Modal/orderPayCancelModal.jsp"></jsp:include>
		</div>
		
		<!-- 플리마켓 결제취소 부분 -->
		<div class="fleaPayCancelModalView">
			<jsp:include page="Modal/fleaPayCancelModal.jsp"></jsp:include>
		</div>
		
		<!-- 반품요청 부분 -->
		<div class="returnModalView">
			<jsp:include page="Modal/returnModal.jsp"></jsp:include>
		</div>
		
	</div>
</body>
<script type="text/javascript">


	$(function() {
	    
		// 버튼 이벤트 등록
		$(".purchConfirm").click(purchConfirmEvent); // 구매확정 버튼 이벤트 등록
		$(".payCancelBtn").click(payCancelBtnEvent); // 결제취소 버튼 이벤트 등록
		$(".returnCall").click(returnCallBtnEvent); // 결제취소 버튼 이벤트 등록
		$('.demand').click(demandBtnEvent); // 플리마켓 결제취소 버튼 이벤트 등록
		$('.fleaPayConfirmBtn').click(fleaPayConfirmBtnEvent); // 플리마켓 구매확정 버튼 이벤트 등록
		
		// Modal 취소 이벤트 등록
		$(".viewCancel").click(viewCancelEvent);
		
	});
	
	// 구매확정 이벤트
	function purchConfirmEvent(){
	    
	    console.log('구매확정 이벤트 호출');
	    var customerID = $(".customerID").val();	    // 아이디값
	    var payNO = $(this).parent().siblings().eq(0).text();  // 결제번호
	    var cancelState = $(this).parent().siblings().eq(8).text(); 
	    var returnState = $(this).parent().siblings().eq(9).text(); 
	    
	    if(cancelState != null || returnState !=null){
			alert("결제취소 또는 반품요청 상태가\n'요청중' 또는 '승인' 일 경우\n구매 확정이 불가능 합니다.");
	    }else if(cancelState == null || returnState ==null || cancelState.trim() == '거절' || returnState.trim() == '거절'){
		    if(confirm("구매 확정 하시겠습니까?\n구매 확정 이후 취소,반품요청이 불가능 합니다!")){
			    location.href = "purchConfirm.do?id=" + customerID + "&payNO=" + payNO;
		    }else{
				location.href = "getPayList.do?id=" + customerID + "&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1";
		    }
	    }
	}
	
	// 결제취소 버튼 이벤트
	function payCancelBtnEvent(){
	    
	    console.log('결제취소 이벤트 호출');
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var payNO = $(this).parent().siblings().eq(0).text();  // 결제번호
	    
		$(".orderListWrap").fadeIn(200);
		$(".payCancelModalView").slideDown(200);
	    
	    $(".payCancelNo").val(payNO);
	}
	
	
	// 반품요청 버튼 이벤트
	function returnCallBtnEvent(){
	    
	    console.log('반품요청 이벤트 호출');
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var returnNo = $(this).parent().siblings().eq(0).text();  // 결제번호
	    
		$(".orderListWrap").fadeIn(200);
		$(".returnModalView").slideDown(200);
		
	    $(".orderPayNo").val(returnNo);
		
	}
	
	// 플리마켓 결제취소 버튼 이벤트
	function demandBtnEvent(){
	    
	    console.log("플리마켓 결제취소 이벤트 호출");
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var returnNo = $(this).parent().siblings().eq(0).text();  // 결제번호
	    
		$(".orderListWrap").fadeIn(200);
		$(".fleaPayCancelModalView").slideDown(200);
	    
		$(".fleaPayNO").val(returnNo);
	}
	
	// 플리마켓 구매확정 이벤트
	function fleaPayConfirmBtnEvent(){
	    
	    console.log("플리마켓 구매확정 이벤트 호출");
	    
	    resetTagFild(); // 필드 초기화 함수 호출
	    
	    var customerID = $(".customerID").val();	    // 아이디값
	    var returnNo = $(this).parent().siblings().eq(0).text();  // 결제번호
	    var cancelState = $(this).parent().siblings().eq(7).text();  // 취소상태
	    
		if(cancelState.trim() == '요청중' || cancelState.trim() == '승인'){
		    alert("결제 취소 상태가\n'요청중' 또는 '승인' 일 때\n구매 확정 처리가 불가능 합니다.");
		}else{
		    if(confirm("구매 확정 하시겠습니까?\n구매 확정 이후 취소가 불가능 합니다!")){
		        location.href = "updateFleaConfirm.do?id=" + customerID + "&payNO=" + returnNo;
		    }
		}
	}
	
	
	// Modal 필드 초기화 함수
	function resetTagFild(){
	    $(".payCancelNo").val("");
	    $(".orderPayNo").val("");
	    
	}
	
	// Modal 취소 이벤트
	function viewCancelEvent() {
		$(".orderInfoModal").slideUp(200);
		$(".returnModalView").slideUp(200);
		$(".payCancelModalView").slideUp(200);
		$(".orderListWrap").fadeOut(200);

	} 
    
</script>
</html>
