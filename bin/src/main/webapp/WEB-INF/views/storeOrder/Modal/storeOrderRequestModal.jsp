<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet"
	href="./resources/css/storeOrder/Modal/storeOrderRequestModal.css" />
</head>
<body>
      <div class="storeOrderModal">
         <div class="storeOrderModalBody">
            <!-- 상단 제목 부분 -->
            <div class="storeOrderModalTitle">
               <div class="logoImg">
                  <img width="100px" height="20px" alt=""
                     src="./resources/img/sujeStoreLogo.png" />
               </div>
               <h3 class="modalTitle">최종 주문서 등록</h3>
               <label class="modalNo">주문번호</label> 
               <input class="modalNo_textbox" type="text"/>
            </div>

            <!-- 메인 Content -->
            <div class="modalMainContent">
               <!-- Content 첫번째 열 -->
               <div class = "first">
                  <label class="categoryLabel" for="Cartegory">상품 카테고리</label>
                  <select>
                     <option selected="selected">==중분류==</option>
                     <option>1</option>
                     <option>2</option>
                     <option>3</option>
                     <option>4</option>
                  </select>
                  <select>
                     <option selected="selected">==소분류==</option>
                     <option>1</option>
                     <option>2</option>
                     <option>3</option>
                     <option>4</option>
                  </select>
               </div>
               <!-- Content 두번째 열 -->
               <div class = "secound">
                  <label class="orderCountLabel" for="orderCount">주문 수량</label> 
                  <input type="text" class="modal_textbox"/>
                  <label class="orderSizeLabel" for="orderSize">주문 사이즈</label> 
                  <input type="text" class="modal_textbox"/>
               </div>
               <!-- Content 세번째 열 -->
               <div class = "third">
                  <label class="orderAmountLabel" for="orderAmount">주문 금액</label> 
                  <input type="text" class="modal_textbox"/>
                  <label class="deliveryLabel" for="delivery">배송 형태</label> 
                  <select>
                     <option selected="selected">==선택==</option>
                     <option>배송</option>
                     <option>방문</option>
                  </select>
               </div>
               <!-- Content 네번째 열 -->
               <div class = "fourth">
                  <label class="requirementsLabel" for="requirements">요구 사항</label>
                  <textarea></textarea>
               </div>
               <!-- 확인 버튼 -->
				<div class="modalBtnBox">
				<input type="submit" value="등록하기" class="modalInputBtn">
				<input type="submit" value="취소" class="modalCancelBtn">
				</div>
            </div> <!-- modalMainContent -->
         </div> <!-- storeOrderModalBody -->
      </div> <!-- storeOrderModal -->

</body>
</html>