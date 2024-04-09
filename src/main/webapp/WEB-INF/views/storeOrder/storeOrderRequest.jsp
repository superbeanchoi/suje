<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUJE</title>
<link rel="stylesheet"
   href="./resources/css/storeOrder/storeOrderRequest.css" />
</head>
<body>
   <%@ include file="../../views/headerHtml/storeHeader.jsp"%>
   <div class="storeContentsWrap">
      <div class="storeSubMenuBox">
         <a href="#" class="storeProfileBox"><img
            src="./resources/img/basicProfileIconBig.png" /></a>
         <textarea rows="2" disabled="disabled" class="storeNameBox">STORE NAME AREA</textarea>
         <ul class="storeCategoryArea">
            <li class="storeFirstCategoryArea"><a href="#"
               class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;스토어 관리</a>
               <ul class="storeSecondCategoryArea">
                  <li class="storeSecondCategoryBtn "><a href="#"> <span>스토어
                           페이지 관리</span>
                  </a></li>
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
                           공지 조회/수정</span>
                  </a></li>
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
                           공지 등록</span>
                  </a></li>
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
                           작품 조회/수정</span>
                  </a></li>
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
                           작품 등록</span>
                  </a></li>
               </ul></li>
            <li class="storeFirstCategoryArea"><a href="#"
               class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;플리마켓 관리</a>
               <ul class="storeSecondCategoryArea">
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>플리마켓
                           상품 조회/수정</span>
                  </a></li>
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>플리마켓
                           상품 등록</span>
                  </a></li>
               </ul></li>
            <li class="storeFirstCategoryArea"><a href="#"
               class="storeFirstCategoryBtn checkedStateFirstCategory">&nbsp;&nbsp;&nbsp;주문
                  관리</a>
               <ul class="storeSecondCategoryArea">
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>스토어
                           주문요청 관리</span>
                  </a></li>
                  <li class="storeSecondCategoryBtn checkedStateSecondCategory"><a
                     href="#"> <span>스토어 최종주문 조회</span>
                  </a></li>
                  <li class="storeSecondCategoryBtn"><a href="#"> <span>플리마켓
                           주문 조회</span>
                  </a></li>
               </ul></li>
            <li class="storeFirstCategoryArea"><a href="#"
               class="storeFirstCategoryBtn">&nbsp;&nbsp;&nbsp;정산 관리</a></li>
         </ul>
      </div>
      <!-- storeSubMenuBox -->
      <div class="storeContentsBox">
         <h1 class="title">스토어 주문요청 관리</h1>
         <hr class="hr">
         <div class="container">
            <div class="orderList">
               <h2>주문자 목록</h2>
               <ul id="orderList">
                  <li class="orderItem" data-id="1">주문자 1</li>
                  <li class="orderItem" data-id="2">주문자 2</li>
                  <!-- Add more order items as needed -->
               </ul>
            </div>

            <div class="chatBox">
               <h2>주문 요청 내역</h2>
               <div id="chatMessages"></div>
               <div class="chatMessage senderMessage">주문자 1: 여기는 주문 내용입니다.</div>
               <div class="chatMessage receiverMessage">점주: 주문 내용에 대한 답변입니다.</div>
               <input type="text" id="messageInput" placeholder="텍스트를 입력하세요">
               <button id="sendMessageBtn">전송</button>
            </div>
         </div>
      </div>

   </div>
   <!-- storeContentsBox -->
   </div>
   <!-- storeContentsWrap -->
   	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
	      <!-- Modal 출력 부분 -->

   		<!-- 배송정보 부분 -->
		<div>
			<jsp:include page="Modal/storeOrderRequestModal.jsp"></jsp:include>
		</div>
   
</body>
</html>