<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet"
	href="./resources/css/storeOrder/Modal/deliveryModal.css" />
</head>
<body>
     <div class="deliveryModal">
         <div class="deliveryModalBody">
            <!-- 상단 제목 부분 -->
            <div class="deliveryModalTitle">
               <div class="logoImg">
                  <img width="100px" height="20px" alt=""
                     src="./resources/img/sujeStoreLogo.png" />
               </div>
               <h3 class="deliverymodalTitle">배송정보 조회</h3>
               <label class="deliverymodalNo">주문번호</label>
               	<input class="textbox" id="p_code" type="text" readonly="readonly"/>
            </div>

            <!-- 메인 Content -->
            <div class="deliverymodalMainContent">
            
               <!-- Content 첫번째 열 -->
               <div class = "deliveryfirst">
                  <label class="recipientLabel" for="recipient">수령자 명</label> 
                  <input type="text" id="d_name"class="textboxMid" readonly="readonly"/>
                  
                  <label class="recipientTelLabel" for="recipientTel">수령자 전화번호</label> 
                  <input type="text" id="d_tel" class="textboxMid" readonly="readonly"/>
               </div>
               
               <!-- Content 두번째 열 -->
               <div class = "deliverysecound">
                  <label class="deliveryAddrLabel" for="deliveryAddr">배송 주소</label> 
                  <input type="text" id="d_addr" class="textboxLong" readonly="readonly"/>
               </div>
               
               <!-- Content 세번째 열 -->
               <div class = "deliverythird">
                  <label class="deliveryMemoLabel" for="deliveryMemo">배송 메모</label> 
                  <input type="text" id="d_memo" class="textboxLong" readonly="readonly"/>
               </div>
               
               <!-- Content 네번째 열 -->
               <div class = "deliveryfourth">
                  <label class="deliveryStateLabel" for="deliveryState">주문 상태</label> 
                  <input type="text" class="textboxShort" name="d_state" id="delibefore"/>
                  <input type="hidden" class="foCode"/>
                  <input type="hidden" class="pCode"/>
                  <input type="button" class="delcomBtn" id="deliafter" value="발송처리"/>
                  <label class="recipientLabel" for="recipient">발송 일자</label> 
                  <input type="text" class="textboxMid1" id="d_date" readonly="readonly"/>
               </div>
               
               <!-- 확인 버튼 -->
				<div class="deliverymodalBtnBox">
				<input type="submit" value="확인" class="deliverymodalSubmitBtn">
				</div>
            </div> <!-- modalMainContent -->
         </div> <!-- storeOrderModalBody -->
      </div> <!-- storeOrderModal -->

</body>
</html>