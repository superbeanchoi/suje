<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet"
	type="text/css">
<title>SUJE</title>
<link rel="stylesheet"
	href="./resources/css/storeOrder/storeOrderCheck.css" />

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script type="text/javascript" src="./resources/js/storeOrder/storeOrderCheckModal.js"></script>
<script type="text/javascript" src="./resources/js/storeOrder/deliveryModal.js"></script> -->
<script type="text/javascript" src="./resources/js/paging/paging.js"></script>
<script type="text/javascript">
	$(function() {
		// 서브 메뉴바 클래스명 추가 // CSS 적용
		$(".storeCategoryArea>li:nth-child(3)>a").addClass(
				"checkedStateFirstCategory");
		$(
				".storeCategoryArea>li:nth-child(3) .storeSecondCategoryArea li:nth-child(2)")
				.addClass("checkedStateSecondCategory");
	})
</script>
</head>
<body>
	<%@ include file="../../views/headerHtml/storeHeader.jsp"%>
	<div class="storeContentsWrap">
		<jsp:include page="../../views/storeAdmin/storeSubMenuBar.jsp"></jsp:include>
		<!-- storeSubMenuBox -->
		<div class="storeContentsBox">
			<h1 class="title">스토어 최종주문 조회</h1>
			<hr class="hr">
			<h2 class="title">주문 결제정보</h2>
			<div class="table-wrapper">
				<table border="1">
					<thead>
						<tr>
							<th>결제번호</th>
							<th>최종주문번호</th>
							<th>주문일자</th>
							<th>결제일자</th>
							<th>결제금액</th>
							<th>구매확정</th>
							<th>구매확정일자</th>
							<th>상세주문정보</th>
							<th>배송형태</th>
							<th>배송정보</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderCheckList}" var="orderCheck">
							<tr data-s_id="${orderCheck.s_id}">
								<td>${orderCheck.p_code}</td>
								<td>${orderCheck.fo_code}</td>
								<td><fmt:parseDate value="${orderCheck.o_date}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
										value="${parsedDate}" pattern="yyyy/MM/dd" /></td>
								<td><fmt:parseDate value="${orderCheck.p_date}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
										value="${parsedDate}" pattern="yyyy/MM/dd" /></td>
								<td>${orderCheck.p_sum}</td>
								<td>${orderCheck.p_ck}</td>
								<td><fmt:parseDate value="${orderCheck.p_ck_date}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
										value="${parsedDate}" pattern="yyyy/MM/dd" /></td>
								<td><button class="check">조회</button></td>
								<td>${orderCheck.deli_type}</td>
								<td><button class="check-delivery">조회</button></td>
							</tr>
						</c:forEach>
						<!-- 추가적인 공지사항 행을 필요한 만큼 추가할 수 있습니다 -->
					</tbody>
				</table>
				<div class="orderTablePaging pageing"></div>
			</div>
			<br /> <br />
			<hr class="hr">
			<h2 class="title">결제취소정보</h2>
			<div class="table-wrapper">
				<table>
					<thead>
						<tr>
							<th>결제취소번호</th>
							<th>최종주문번호</th>
							<th>취소일자</th>
							<th>취소사유</th>
							<th>최소승인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cancelList}" var="cancel">
							<tr data-s_id="${cancel.s_id}">
								<td>${cancel.can_code}</td>
								<td>${cancel.fo_code}</td>
								<td>${cancel.can_date}<fmt:parseDate
										value="${cancel.can_date}" pattern="yyyy-MM-dd HH:mm:ss"
										var="parsedDate" /> <fmt:formatDate value="${parsedDate}"
										pattern="yyyy/MM/dd" />
								</td>
								<td>${cancel.can_why}</td>
								<td>${cancel.can_state}
									<button class="approve-cancel-btn">확인</button>
								</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
				<div class="cancelTablePaging pageing"></div>
			</div>
			<hr class="hr">
			<h2 class="title">반품요청정보</h2>
			<div class="table-wrapper">
				<table>
					<thead>
						<tr>
							<th>반품요청번호</th>
							<th>최종주문번호</th>
							<th>반품일자</th>
							<th>반품사유</th>
							<th>반품승인</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${returnList}" var="returnOrder">
							<tr data-s_id="${returnOrder.s_id}">
								<td>${returnOrder.rt_code}</td>
								<td>${returnOrder.p_code}</td>
								<td>${returnOrder.rt_date}<fmt:parseDate
										value="${returnOrder.rt_date}" pattern="yyyy-MM-dd HH:mm:ss"
										var="parsedDate" /> <fmt:formatDate value="${parsedDate}"
										pattern="yyyy/MM/dd" />
								</td>
								<td>${returnOrder.rt_why}</td>
								<td>${returnOrder.rt_state}
									<button class="approve-cancel-btn">확인</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="returnTablePaging pageing"></div>
			</div>
		</div>
	</div>
	<!-- storeContentsBox -->
	<!-- storeContentsWrap -->
	<footer></footer>

	<div>
		<div class="storeMoreInfoModalWrap">
			<!-- 주문상세정보 보기 부분 -->
			<div class="storeOrderModal storeOrderMoreModal">
				<jsp:include page="Modal/storeOrderModal.jsp"></jsp:include>
			</div>
			<!-- 배송정보 부분 -->
			<div class="storeOrderModal storeDeliveryModal">
				<jsp:include page="Modal/deliveryModal.jsp"></jsp:include>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		// 모달이 열릴 때 실행되는 함수
		$(".check").on("click", function() {
			var fo_code = $(this).closest("tr").find("td:eq(1)").text(); // 해당 주문의 최종주문번호(fo_code)를 가져옵니다.

			$.ajax({
				url : "storefinalOrder.do",
				method : "get",
				data : {
					foCode : fo_code
				},
				dataType : "json",
				success : function(data) {
					// AJAX 요청이 성공적으로 완료되면 모달에 데이터를 채웁니다.
					fillModalWithData(data);
					/*   $(".storeOrderModal").modal("show"); // 모달을 엽니다. */

					$(".storeMoreInfoModalWrap").fadeIn(200);
					$(".storeOrderMoreModal").slideDown(200);

				},
				error : function() {
					alert("주문 세부 정보를 가져오는 중에 오류가 발생했습니다.");
				}
			});
		});
		$('.modalSubmitBtn').click(function() {
			$(".storeOrderModal").slideUp(200);
			$(".storeMoreInfoModalWrap").fadeOut(200);
		});
		// 모달에 데이터를 채우는 함수
		function fillModalWithData(data) {
			// 가져온 데이터를 각 필드에 채웁니다.
			// 최종 주문 번호
			$(".storeOrderModalTitle input").val(data.fo_code);

			//상품 카테고리 1
			$('.opSecond option').each(function() {
				if ($(this).text() == data.cates_name) {
					$(this).prop('selected', true);
				}
			});

			//상품 카테고리 2
			$('.opFirst option').each(function() {
				if ($(this).text() == data.catemm_name) {
					$(this).prop('selected', true);
				}
			});
			// 수량
			$('#orderCount').val(data.fo_num);

			// 주문 사이즈
			$('#orderSize').val(data.fo_size);

			//주문 금액
			$('#orderAmount').val(data.fo_sum);
			// 배송 형태에 따라 선택 상태를 변경합니다.
			if (data.deli_code == 7003) {
				$("#delivery").prop("selected", true);
			} else {
				$("#pickup").prop("selected", true);
			}
			$('#requirements').val(data.fo_etc);
		}
	});

	$(document)
			.ready(
					function() {
						// 모달이 열릴 때 실행되는 함수
						$(".check-delivery")
								.on(
										"click",
										function() {
											var fo_code = $(this).closest("tr")
													.find("td:eq(1)").text(); // 해당 주문의 최종주문번호(fo_code)를 가져옵니다.

											$
													.ajax({
														url : "storedelivery.do",
														method : "get",
														data : {
															foCode : fo_code
														},
														dataType : "json",
														success : function(data) {
															// AJAX 요청이 성공적으로 완료되면 모달에 데이터를 채웁니다.
															fillModalWithData(data);
															/* $(".deliveryModal").modal("show"); // 모달을 엽니다. */
															$(
																	".storeMoreInfoModalWrap")
																	.fadeIn(200);
															$(
																	".storeDeliveryModal")
																	.slideDown(
																			200);
														},
														error : function() {
															alert("주문 세부 정보를 가져오는 중에 오류가 발생했습니다.");
														}
													});
										});
						$('.deliverymodalSubmitBtn').click(function() {
							$(".storeOrderModal").slideUp(200);
							$(".storeMoreInfoModalWrap").fadeOut(200);
						});
						// 모달에 데이터를 채우는 함수
						function fillModalWithData(data) {
							// 가져온 데이터를 각 필드에 채웁니다.
							// 결제 번호
							$(".pCode").val(data.p_code);
							$(".foCode").val(data.fo_code);

							// 주문 번호
							$("#p_code").val(data.fo_code);

							// 수령인
							$('#d_name').val(data.d_name);

							// 수령인 번호
							$('#d_tel').val(data.d_tel);

							// 배송지
							$('#d_addr').val(data.d_addr);

							// 배송메모
							$('#d_memo').val(data.d_memo);

							// 주문상태
							$('#delibefore').val(data.d_state);

							// 발송 날짜
							var date = new Date(data.d_date);
							var formattedDate = formatDate(date);
							if (formattedDate != '1970/01/01') {
								$('#d_date').val(formattedDate);

							}
							if (data.d_state === "발송완료") {
								$("#deliafter").prop("disabled", true);
							}

						}

						// 발송처리
						$(".delcomBtn").on("click",function() {
											var pCode = $(".pCode").val();
											var foCode = $(".foCode").val();
											$
													.ajax({
														url : "deliverycomplete.do",
														method : "post",
														data : {
															pCode : pCode
														},
														dataType : "text",
														success : function(data) {
															$.ajax({
																		url : "storedelivery.do",
																		method : "get",
																		data : {
																			foCode : foCode
																		},
																		dataType : "json",
																		success : function(
																				data) {
																			// AJAX 요청이 성공적으로 완료되면 모달에 데이터를 채웁니다.
																			fillModalWithData(data);
																		},
																		error : function() {
																			alert("주문 세부 정보를 가져오는 중에 오류가 발생했습니다.");
																		}
																	});
															alert(data);
														},
														error : function(
																request,
																status, error) {
															alert("주문 정보를 업데이트하는 중에 오류가 발생했습니다."
																	+ request
																	+ "/"
																	+ status
																	+ "/"
																	+ error);
														}
													});
										});

						function formatDate(date) { //날짜 포맷 변경
							var year = date.getFullYear();
							var month = padZero(date.getMonth() + 1);
							var day = padZero(date.getDate());

							return year + "/" + month + "/" + day;
						}

						function padZero(num) { // 숫자를 두 자리로 만드는 함수
							return (num < 10 ? "0" : "") + num;
						}
					});
</script>
</html>