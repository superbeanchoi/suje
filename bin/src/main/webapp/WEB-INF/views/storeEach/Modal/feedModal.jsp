<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUJE</title>
<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/storeEach/Modal/feedModal.css" />

<!-- 자바스크립트 연결 -->
<!-- 자바 라이브러리 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="./resources/js/storeEach/Modal/feedModal.js"></script>
<script src="./resources/js/storeEach/storeEachPageJs.js"></script>
</head>

<body>
<!-- 상단 제목 부분 -->
<div class="customerFeedListTitle">
	<div>
		<img width=62px height=20px src="./resources/img/sujeLogo.png" />
	</div>
</div>
<div class="totalFeedBody">
	<!-- 메인 좌측 Content -->
	<div class="ContentLeft">
		<!--div를 두개 감싼이유는 img들을 좌우배치하고 배치된 사진중 한장만 보이게 하기 위해서-->
		<div class="itemImageArea">
			<!--배치된 img들을 하나의 img만 보이게 가리기 위한 태그-->
			<div class="itemImage">
				<!--img들을 좌우배치할 태그-->
					<div><img src="./resources/img/exImg.jpg"></div>
					<div><img src="./resources/img/exImg.jpg"></div>
					<div><img src="./resources/img/exImg.jpg"></div>
			</div>
		</div>
		<button class="back">❮</button>
		<button class="next">❯</button>
	</div>
	<!-- 메인 우측 Content (사진 슬라이드 부분)-->
	<div class="ContentFeedRight">
		<!-- Content 첫번째 라인 -->
		<div class="firstFeedContent">
			<div>작품 카테고리</div>
			<div>
				<select disabled="disabled">
					<option>디저트</option>
					<option>전통간식</option>
					<option>반려동물식품</option>
					<option>의류</option>
					<option>주얼리</option>
					<option>수공예품</option>
					<option>잡화</option>
					<option>홈리빙</option>
				</select>
			</div>
			<div>
				<select disabled="disabled">
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
					<option>인테리어</option>
					<option>문구</option>
					<option>기념일</option>
					<option>일러스트</option>
					<option>가구</option>
					<option>패브릭</option>
					<option>방향제</option>
				</select>
			</div>
			<div>
				<select disabled="disabled">
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
					<option>전통약과</option>
					<option>이벤트떡</option>
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
					<option>티셔츠</option>
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
					<option>의자</option>ㄴ
					<option>쇼파</option>
					<option>쿠션</option>
					<option>방석</option>
					<option>베개</option>
					<option>캔들</option>
					<option>석고형</option>
					<option>디퓨져</option>
				</select>
			</div>
		</div>
		<!-- Content 두번째 라인 -->
		<div class="secondContent">
			<div>작품 등록일자</div>
			<div>
				<input type="text" disabled="disabled"/>
			</div>
		</div>
		<!-- Content 세번째 라인 -->
		<div class="thirdContent">
			<div>
				<textarea disabled="disabled"></textarea>
			</div>
		</div>
	</div>
</div>
	<!-- 버튼 -->
	<div class="insertFeedbtn">
		<div>
			<input type="button" value="확인">
		</div>
	</div>
</body>
</html>