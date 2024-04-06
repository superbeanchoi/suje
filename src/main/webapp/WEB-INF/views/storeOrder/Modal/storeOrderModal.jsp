<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet"
	href="./resources/css/storeOrder/Modal/storeOrderModal.css" />
</head>
<body>
	<!-- Modal 출력 부분 -->
	<!-- <div class="storeOrderModal"> -->
		<div class="storeOrderModalBody">
			<!-- 상단 제목 부분 -->
			<div class="storeOrderModalTitle">
				<div class="logoImg">
					<img width="100px" height="20px" alt=""
						src="./resources/img/sujeStoreLogo.png" />
				</div>
				<h3 class="modalTitle">최종 주문서 조회</h3>
				<label class="modalNo">최종주문번호</label> <input class="modalNo_textbox"
					type="text" />
			</div>

			<!-- 메인 Content -->
			<div class="modalMainContent">
				<!-- Content 첫번째 열 -->
				<div class="first">
					<label class="categoryLabel" for="Cartegory">상품 카테고리</label> 
					<select class="opFirst" disabled>
						<option>베이커리</option>
						<option>케이크</option>
						<option>마카롱</option>
						<option>타르트</option>
						<option>쿠키</option>
						<option>약과</option>
						<option>떡</option>
						<option>양갱</option>
						<option>애견간식</option>
						<option>애견쿠키</option>
						<option>애견케이크</option>
						<option>여성</option>
						<option>남성</option>
						<option>남녀공용</option>
						<option>키즈</option>
						<option>반지</option>
						<option>목걸이</option>
						<option>팔찌</option>
						<option>생활소품</option>
						<option>주방공예</option>
						<option>인테리어</option>
						<option>문구</option>
						<option>기념일</option>
						<option>일러스트</option>
						<option>가구</option>
						<option>패브릭</option>
						<option>방향제</option>
					</select>
					<select class="opSecond" disabled>
						<option>롤케이크</option>
						<option>버터크림빵</option>
						<option>마늘빵</option>
						<option>슈크림빵</option>
						<option>프레지에</option>
						<option>생크림케이크</option>
						<option>쉬폰케이크</option>
						<option>치즈케이크</option>
						<option>티라미수</option>
						<option>일반마카롱</option>
						<option>뚱카롱</option>
						<option>타르틀레트</option>
						<option>에그타르트</option>
						<option>초코칩 쿠키</option>
						<option>버터쿠키</option>
						<option>치즈쿠키</option>
						<option>땅콩쿠키</option>
						<option>바닐라쿠키</option>
						<option>황치즈쿠키</option>
						<option>조청</option>
						<option>꿀</option>
						<option >전통약과</option>
						<option >이벤트떡</option>
						<option>떡케이크</option>
						<option>팥</option>
						<option>말차</option>
						<option>밤</option>
						<option>고구마</option>
						<option>강아지 껌</option>
						<option>육포</option>
						<option>고구마치킨</option>
						<option>두부쿠키</option>
						<option>황태쿠키</option>
						<option>당근쿠키</option>
						<option>두부케이크</option>
						<option>참치케이크</option>
						<option>비프케이크</option>
						<option>티셔츠</option>
						<option>맞춤정장</option>
						<option>맨투맨</option>
						<option>커플룩</option>
						<option>신발</option>
						<option>커플링</option>
						<option>각인반지</option>
						<option>커플목걸이</option>
						<option>커플팔찌</option>
						<option>머그컵</option>
						<option>열쇠고리</option>
						<option>연필꽂이</option>
						<option>주병</option>
						<option>그릇</option>
						<option>수저</option>
						<option>화병</option>
						<option>오브제</option>
						<option>러그</option>
						<option>커스텀앨범</option>
						<option>커스텀스티커</option>
						<option>커스텀다이어리</option>
						<option>커스텀풍선</option>
						<option>커스텀박스</option>
						<option>커스텀카드</option>
						<option>커스텀폰케이스</option>
						<option>커스텀텀블러</option>
						<option>커스텀시계</option>
						<option>침대</option>
						<option>의자</option>
						<option>쇼파</option>
						<option>쿠션</option>
						<option>방석</option>
					</select>
				</div>
				<!-- Content 두번째 열 -->
				<div class="secound">
					<label class="orderCountLabel" for="orderCount">주문 수량</label>
					<input type="text" id="orderCount"class="modal_textbox" readonly="readonly" /> 
					<label class="orderSizeLabel" for="orderSize">주문 사이즈</label>
					<input type="text"id="orderSize" class="modal_textbox" readonly="readonly"/>
				</div>
				<!-- Content 세번째 열 -->
				<div class="third">
					<label class="orderAmountLabel" for="orderAmount">주문 금액</label>
					<input type="text" class="modal_textbox" id="orderAmount" readonly="readonly"/>
					<label class="deliveryLabel" for="delivery">배송형태</label>
					<select disabled>
						<option id="delivery">배송</option>
						<option id="pickup">픽업</option>
					</select>
				</div>
				<!-- Content 네번째 열 -->
				<div class="fourth">
					<label class="requirementsLabel" for="requirements">요구 사항</label>
					<textarea id="requirements" name="requirements" readonly="readonly"></textarea>
				</div>
				<!-- 확인 버튼 -->
				<div class="modalBtnBox">
					<input type="submit" value="확인" class="modalSubmitBtn">
				</div>
			</div>
			<!-- modalMainContent -->
		</div>
		<!-- storeOrderModalBody -->
	<!-- </div> -->
	<!-- storeOrderModal -->
</body>
</html>