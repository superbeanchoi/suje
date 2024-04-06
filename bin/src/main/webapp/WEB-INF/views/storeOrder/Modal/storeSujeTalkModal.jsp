<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종 주문서</title>

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/storeOrder/Modal/storeOrderInfoModal.css" />

</head>

<body>
<!-- Modal 출력 부분 -->
	<!-- Order join content 부분 -->
	<form class="formTagClass" method="post">
	<div class="customerOrderListModal">
		<div class="customerOrderListModalBody">
			<!-- 상단 제목 부분 -->
			<div class="customerOrderListTitle">
				<div><img width="100px" height="20px" alt="" src="./resources/img/sujeStoreLogo.png" /></div>
				<div class="modalTitle">최종 주문서 조회</div>
				<div>최종주문번호 <input class="modalNo_textbox" type="text" name="o_code"/></div>
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
							<select class="cateFirst" disabled="disabled">
									<!-- 중분류 카테고리 설정 -->
							</select>
						</div>

						<div>
							<select class="cateSecond" name="cates_code"><!-- 소 카테고리 -->
									<!-- 소분류 카테고리 설정 -->
							</select>
						</div>
						
						<div>
							<input class="updateBtn" type="button" value="카테고리수정"/>
						</div>
					</div>
					<!-- Content 두번째 라인 -->
					<div>
						<div>
							<input id="countInput" type="text" name="fo_num"/><!-- 주문 수량 -->
						</div>
						<div>개</div>

						<div>주문 사이즈</div>
						<div>
							<input id="sizeInput" type="text" name="fo_size"/><!-- 주문 사이즈 -->
						</div>
					</div>
					<!-- Content 세번째 라인 -->
					<div>
						<div>
							<input id="price" type="text" name="fo_sum" value="0"/><!-- 주문 금액 -->
						</div>
						<div>원</div>

						<div>배송형태</div>
						<div>
							<select class="deli" name="deli_code"><!-- 배송형태 -->
								<option value="7003" id="delivery">배송</option>
								<option value="7001" id="pickup">픽업</option>
							</select>
						</div>
					</div>
					<!-- Content 네번째 라인 -->
					<div>
						<input id="content" type="text" name="fo_etc"/><!-- 요구사항 -->
					</div>
				</div>
			</div>

			<div class="OrderInfoinsertbtn">
				<div>
					<input class="insertBtnRes" type="submit" value="등록하기">
				</div>
				<div>
					<a href=""></a>
						<input class="viewCancel" type="button" value="취소">
				</div>
			</div>
			<input class="storeID" type="hidden" name="storeID"/>
		</div>
	</div>
	</form>
	<!-- Order join content 부분 -->
</body>
</html>