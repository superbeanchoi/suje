<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css"> 
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css"> 
<link rel="stylesheet" href="./resources/css/storeOrder/fleaOrderCheck.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script type="text/javascript" src="./resources/js/storeOrder/deliveryModal.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script> -->
<script type="text/javascript" src="./resources/js/paging/paging.js"></script>
<script type="text/javascript">

$(function() {
	// 서브 메뉴바 클래스명 추가 // CSS 적용
	$(".storeCategoryArea>li:nth-child(3)>a").addClass("checkedStateFirstCategory");	
	$(".storeCategoryArea>li:nth-child(3) .storeSecondCategoryArea li:nth-child(3)").addClass("checkedStateSecondCategory");
})


//공지사항 영역 미리보기
	   $(function() {
	    $('.fleaContent').each(function() {
	        var text = $(this).text();
	        if (text.length > 40) {
	            text = text.substring(0, 20) + '...';
	            $(this).text(text);
	        }
	    });
	  });
	  


</script>
<title>SUJE</title>
</head>
<body>
   <%@ include file="../../views/headerHtml/storeHeader.jsp"%>
   <div class="storeContentsWrap">
   <jsp:include page="../../views/storeAdmin/storeSubMenuBar.jsp"></jsp:include>
      <!-- storeSubMenuBox -->
      <div class="storeContentsBox">
         <h1 class="title">플리마켓 주문 조회</h1>
         <hr class="hr">
         <div class="table-wrapper">
            <table>
               <thead>
                  <tr>
                     <th>주문번호</th>
                     <th>상품 내용</th>
                     <th>주문 수량</th>
                     <th>결제금액</th>
                     <th>주문일자</th>
                     <th>구매확정일자</th>
                     <th>구매확정일자</th>
                     <th>배송정보</th>
                  </tr>
               </thead>
               <tbody>
				<c:forEach items="${FleaOrderCheckList}" var="fleaorderCheck" >
					<tr data-s_id="${fleaorderCheck.s_id}">
                     <td>${fleaorderCheck.fp_code}</td>
                     <td class="fleaContent">${fleaorderCheck.f_content}</td>
                     <td>${fleaorderCheck.fp_count}</td>
                     <td>${fleaorderCheck.fp_sum}</td>
                     <td>
                     	<fmt:parseDate value="${fleaorderCheck.fp_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
                     </td>
                     <td>${fleaorderCheck.fp_ck}</td>
                     <td>
                    	<fmt:parseDate value="${fleaorderCheck.fp_ckdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
                     </td>
                     <td><button class="check-delivery">조회</button></td>
                  </tr>
                 </c:forEach>
                  <!-- 추가적인 공지사항 행을 필요한 만큼 추가할 수 있습니다 -->
               </tbody>
            </table>
            <div class="fleaTablePaging pageing"></div>
         </div>
      </div>
   </div>
   <!-- storeContentsBox -->
   <!-- storeContentsWrap -->
   	<footer></footer>
	<div class="fleaMoreInfoModalWrap">
		<!-- 배송정보 부분 -->
		<div class="fleaDeliveryModal">
			<jsp:include page="Modal/fleadeliveryModal.jsp"></jsp:include>
		</div>
	</div>
   
</body>
<script type="text/javascript">
$(document).ready(function() {
    // 모달이 열릴 때 실행되는 함수
    $(".check-delivery").on("click", function() {
        var fp_code = $(this).closest("tr").find("td:eq(0)").text(); // 해당 주문의 최종주문번호(fp_code)를 가져옵니다.

        $.ajax({
            url: "fleadelivery.do",
            method: "get",
            data: { fpCode: fp_code },
            dataType: "json",
            success: function(data) {
                // AJAX 요청이 성공적으로 완료되면 모달에 데이터를 채웁니다.
                fillModalWithData(data);
				$(".fleaMoreInfoModalWrap").fadeIn(200);
				$(".fleaDeliveryModal").slideDown(200);
            },
            error: function() {
                alert("주문 세부 정보를 가져오는 중에 오류가 발생했습니다.");
            }
        });
    });
	$('.deliverymodalSubmitBtn').click(function() {
		$(".fleaDeliveryModal").slideUp(200);
		$(".fleaMoreInfoModalWrap").fadeOut(200);
	});
        // 모달에 데이터를 채우는 함수
        function fillModalWithData(data) {
            // 가져온 데이터를 각 필드에 채웁니다.
		    // 결제 번호
		    $(".pCode").val(data.fp_code);
            
		    // 주문 번호
		    $("#p_code").val(data.fp_code);
		    
		    // 수령인
		    $('#d_name').val(data.fd_name);
		    
		    // 수령인 번호
		    $('#d_tel').val(data.fd_tel);
		    
		    // 배송지
		    $('#d_addr').val(data.fd_addr);
		    
		    // 배송메모
		    $('#d_memo').val(data.fd_memo);
		    
		    // 주문상태
		    $('#delibefore').val(data.fd_state);

		    // 발송 날짜
		    var date = new Date(data.fd_date);
			var formattedDate = formatDate(date);
			if(formattedDate != '1970/01/01') {
			    $('#d_date').val(formattedDate);
				
			}
			if (data.fd_state === "발송완료") {
			    $("#deliafter").prop("disabled", true);
			}
		    
        }
        
     // 발송처리
        $(".delcomBtn").on("click", function() {
            var fpCode = $(".pCode").val();
            $.ajax({
                url: "fleadeliverycomplete.do",
                method: "post",
                data: { fpCode : fpCode },
                dataType: "text",
                success: function(data) {
                	$.ajax({
                        url: "fleadelivery.do",
                        method: "get",
                        data: { fpCode: fpCode },
                        dataType: "json",
                        success: function(data) {
                            // AJAX 요청이 성공적으로 완료되면 모달에 데이터를 채웁니다.
                            fillModalWithData(data);
                        },
                        error: function() {
                            alert("주문 세부 정보를 가져오는 중에 오류가 발생했습니다.");
                        }
                    });
                    alert(data);
                },
                error: function(request, status, error) {
                    alert("주문 정보를 업데이트하는 중에 오류가 발생했습니다."+request+"/"+status+"/"+error);
                }
            });
        });
        
    	function formatDate(date) {  //날짜 포맷 변경
    		var year = date.getFullYear();
    		var month = padZero(date.getMonth() + 1);
    		var day = padZero(date.getDate());
    		
    		return year + "/" + month + "/" + day;
    	}
    	
    	function padZero(num) {  // 숫자를 두 자리로 만드는 함수
    	    return (num < 10 ? "0" : "") + num;
    	}
    });
</script>
</html>