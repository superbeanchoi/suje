<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종 주문서</title>

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/Modal/orderInfoModal.css" />




</head>

<body>
<!-- Modal 출력 부분 -->
	<!-- Order join content 부분 -->
	<div class="customerOrderListModal">
		<div class="customerOrderListModalBody">
			<!-- 상단 제목 부분 -->
			<div class="customerOrderListTitle">
				<div><img width=62px height=20px src="./resources/img/sujeLogo.png"/></div>
									
				<div>최종 주문서 조회</div>
				<div>
					최종주문번호 <input type="text" readonly />
				</div>
			</div>

			<!-- MainContent 부분 -->
			<div class="OrderInfomodalMainContent">
				<!-- 메인 좌측 Content Title -->
				<div class="OrderInfoContentLefit">
					<div>상품 카테고리</div>
					<div>주문 수량</div>
					<div>주문 금액</div>
					<div>요구사항</div>
				</div>

				<!-- 메인 우측 Content -->
				<div class="OrderInfoContentRight">
					<!-- Content 첫번째 라인 -->
					<div>
						<div>
							<select class="cateFirst">

							</select>
						</div>

						<div>
							<select class="cateSecond">
	
							</select>
						</div>
					</div>
					<!-- Content 두번째 라인 -->
					<div>
						<div>
							<input id="countInput" type="text" readonly/>

						</div>
						<div>개</div>

						<div>주문 사이즈</div>
						<div>
							<input id="sizeInput" type="text" readonly/>
						</div>
					</div>
					<!-- Content 세번째 라인 -->
					<div>
						<div>
							<input id="price" type="text" readonly/>
						</div>
						<div>원</div>

						<div>배송형태</div>
						<div>
							<select disabled="disabled">
								<option id="delivery">배송</option>
								<option id="pickup">픽업</option>
							</select>
						</div>
					</div>
					<!-- Content 네번째 라인 -->
					<div>
						<input id="content" type="text" readonly/>
					</div>
				</div>
			</div>

			<div class="OrderInfoinsertbtn">
				<div>
					<input class="insertBtnRes" type="button" value="등록하기">
				</div>
				<div>
					<a href=""></a>
						<input class="viewCancel" type="button" value="취소">
				</div>
			</div>
		</div>
	</div>
	<!-- Order join content 부분 -->
</body>

</html>