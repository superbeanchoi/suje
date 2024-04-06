<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/storeEach/storeEachPageStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/storeEach/storeEachPageJs.js"></script>
<script type="text/javascript">
$(function() {
<% 
String memberId = (String)session.getAttribute("mainId");
%>

<% if (request.getAttribute("orderSendSuccess") != null) { %>
	var orderSendSuccess = "<%= request.getAttribute("orderSendSuccess") %>";
	var memberId = "<%= memberId %>"; // memberId 변수 정의
	var confirmation = confirm(orderSendSuccess);
	if (confirmation) {
		var url = "customerSujeTalk.do?id=" + memberId + "&page=1";
		location.href = url;
	} else {}
<% } %>

	
	//공지사항 모달창 오픈/클로즈
	$('.storeEachNoti').click(function() {
		var notiCode = $(this).find(".notiCode").text();
		$.ajax({
			url : "eachNoticeView.do",
			type : "post",
			data: { noti_code : notiCode },
			dataType : "json",
			success : function(notice){
				var date = new Date(notice.notir_date);
				var formattedDate = formatDate(date);
				
				$('.firstInfoContent div:nth-child(2) input').val(notice.notit_name);
				$('.firstInfoContent div:nth-child(4) input').val(formattedDate);
				$('.secondInfoContent div textarea').val(notice.noti_content);
				$(".customerinfoListModal").fadeIn(200);
				$(".customeinfoListModalBody").slideDown(200);
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다11 : "+request+"/"+status+"/"+error);
			}
		});
	});
	$('.insertInfobtn input').click(function() {
		$(".customeinfoListModalBody").slideUp(200);
		$(".customerinfoListModal").fadeOut(200);
	});
	
	//스토어 피드 모달창 오픈/클로즈
	$('.storeEachFeed').click(function() {
		var gCode = $(this).find("input").val();
		$.ajax({
			url : "eachStoreGoods.do",
			type : "post",
			data: { g_code : gCode },
			dataType : "json",
			success : function(goods){
				var date = new Date(goods.g_date);
				var formattedDate = formatDate(date);
				
				$('.firstFeedContent div:nth-child(2) select').val(goods.catem_name).prop("selected", true);			
				$('.firstFeedContent div:nth-child(3) select').val(goods.catemm_name).prop("selected", true);			
				$('.firstFeedContent div:nth-child(4) select').val(goods.cates_name).prop("selected", true);		
				$('.secondContent div:nth-child(2) input').val(formattedDate);		
				$('.thirdContent textarea').val(goods.g_content);		
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다11 : "+request+"/"+status+"/"+error);
			}
		});
		
		$.ajax({
			url : "eachStoreGoodsImg.do",
			type : "post",
			data: { g_code : gCode },
			dataType : "json",
			success : function(goods){
				$('.itemImage').empty();
				//이미지 추가
				$.each(goods, function(index, goodsImg) {
					var imgSrc = "./resources/img/DBServer/" + goodsImg.g_img;
					$('.itemImage').append('<div><img src="' + imgSrc + '"></div>');
				});
				
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다22 : "+request+"/"+status+"/"+error);
			}
		});
		
		$(".customerFeedListModal").fadeIn(200);
		$(".customeFeedListModalBody").slideDown(200);
	});
	$('.insertFeedbtn input').click(function() {
		$(".customeFeedListModalBody").slideUp(200);
		$(".customerFeedListModal").fadeOut(200);
	});
	
	//주문요청하기
	$('.orderBtn').click(function() {
		if("<%= memberId %>" == "null" ) {
			alert("로그인 후 이용 가능합니다.");
			location.href="mainLogin.do";
		} else if("<%= memberId %>" == "${storeInfoDetail.s_id}" ) {
			alert("스토어 계정으로는 주문요청이 불가합니다.");
		} else {
			//결제일자 삽입하기
		    $('.ContentRight>div:nth-child(2) input').val(getCurrentDate());
			
			$(".customerOrderListModal").fadeIn(200);
			$(".customerOrderListModalBody").slideDown(200);
		}
	});
	
	$('.viewCancel').click(function() {
		$(".customerOrderListModalBody").slideUp(200);
		$(".customerOrderListModal").fadeOut(200);
	});
	
	//글자수 제한
	$('textarea[name="o_content"]').on('input', function() {
		var text = $(this).val();
		var maxLength = 150;
		if (text.length > maxLength) {
			alert("콘텐츠의 글자 수는 150자를 초과할 수 없습니다.");
			$(this).val(text.substring(0, maxLength));
		}
	});
	
	
    function getCurrentDate() {  //현재날짜 가져오기
		var date = new Date();
		var year = date.getFullYear();
		var month = (date.getMonth() + 1 < 10 ? '0' : '') + (date.getMonth() + 1);
		var day = (date.getDate() < 10 ? '0' : '') + date.getDate();
		return year + '/' + month + '/' + day;
	}
    
	function formatDate(date) {  //날짜 포맷 변경
		var year = date.getFullYear();
		var month = padZero(date.getMonth() + 1);
		var day = padZero(date.getDate());
		var hours = padZero(date.getHours());
		var minutes = padZero(date.getMinutes());
		
		return year + "/" + month + "/" + day + " " + hours + ":" + minutes;
	}
	
	function padZero(num) {  // 숫자를 두 자리로 만드는 함수
	    return (num < 10 ? "0" : "") + num;
	}
});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="../headerHtml/memberHeader.jsp" %>
<div class="storeInfoArea">
<!-- 백그라운드 이미지가 존재하지 않을 시 호출 -->
<c:if test="${storeInfoDetail.s_back_spname eq null}">
	<img src="././resources/img/exImg.png" class="coverImg">
</c:if>
<!-- 백그라운드 이미지가 존재할 시 호출 -->
<c:if test="${storeInfoDetail.s_back_spname ne null}">
	<img src="././resources/img/DBServer/${storeInfoDetail.s_back_spname}" class="coverImg">
</c:if>
	<div class="coverImgShadow"></div>
<!-- 프로필 이미지가 존재하지 않을 시 호출 -->
<c:if test="${storeInfoDetail.s_spname eq null}">
	<div class="storeProfileImg"><img src="././resources/img/basicProfileIconBig.png"></div>
</c:if>
<!-- 프로필 이미지가 존재할 시 호출 -->
<c:if test="${storeInfoDetail.s_spname ne null}">
	<div class="storeProfileImg"><img src="././resources/img/DBServer/${storeInfoDetail.s_spname}"></div>
</c:if>
	<div class="storeName">${storeInfoDetail.s_name}</div>
	<div class="storeText">${storeInfoDetail.s_text}</div>
</div>
<div class="contentsWrap">
	<div class="storeNotiArea">
		<c:forEach items="${storeNotiList}" var="storeNoti">
			<a class="storeEachNoti">
				<div class="notiCode" style="display:none">${storeNoti.noti_code}</div>
				<div class="notiType">${storeNoti.notit_name}</div>
				<div class="noticontent">${storeNoti.noti_content}</div>
				<img src="././resources/img/pageRightBtn.png"/>
			</a>
		</c:forEach>
	</div>
	<div class="mainTitle">스토어 피드</div>
	<div class="mainLine"></div>
	<div class="storeFeedArea">
		<!-- total 피드가 존재하지 않을 시 호출 -->
		<c:if test="${empty storeGoodsList}">
			<div class="noneItemArea">콘텐츠가 존재하지 않습니다.</div>
		</c:if>
		<!-- total 피드가 존재할 시 호출 -->
		<c:forEach items="${storeGoodsList}" var="storeGoods">
			<a class="storeEachFeed">
				<input type="hidden" value="${storeGoods.g_code}"/>
				<img src="././resources/img/DBServer/${storeGoods.g_spname}"/>
			</a>
		</c:forEach>
	</div>
	<div class="mainLine"></div>
	<button class="orderBtn">+</button>	
</div> <!-- contentsWrap -->
<footer></footer>

<!-- 모달 -->

<!-- 주문하기 모달 -->
<div class="customerOrderListModal">
	<div class="customerOrderListModalBody">
		<%@ include file="./Modal/orderModal.jsp" %>
	</div>
</div>

<!-- 스토어 피드 모달 -->
<div class="customerFeedListModal">
	<div class="customeFeedListModalBody">
		<%@ include file="./Modal/feedModal.jsp" %>
	</div>
</div>

<!-- 공지사항 모달 -->
<div class="customerinfoListModal">
	<div class="customeinfoListModalBody">
		<%@ include file="./Modal/infoModal.jsp" %>
	</div>
</div>

</body>
</html>