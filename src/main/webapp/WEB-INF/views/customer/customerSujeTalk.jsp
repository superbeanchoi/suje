<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>SUJEk</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/customerSujeTalk.css" />

<!-- 자바스크립트 연결 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="./resources/js/customer/customerSujeTalk.js"></script>
<script type="text/javascript">

$(function(){
    
    $('.sujeTalk').addClass('selectMenu');
    
    var insertState = "${insertState}";
    
    if(insertState == "1"){
        alert("주문번호 ${orderCode} 결제가 완료 되었습니다.");
        location.href = "getPayList.do?id=${id}&orderPage=1&fleaPage=1&cancelPage=1&returnPage=1"
    }

})


</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/headerHtml/memberHeader.jsp"></jsp:include>
	<div class="main">
		<jsp:include page="/WEB-INF/views/customer/customerMenuBar.jsp"></jsp:include>

		<div class="mainContentright">
			<div class="subtitle">SUJE 톡톡</div>
			<div class="myPageLine"></div>
			<div class="mainTalkContent">

				<!-- 메인 Talk 부분 -->

				<!-- 스토어목록 -->
				<div class="TalkList">

					<!-- 타이틀 -->
					<div class="TalkListTitle">
						<div>스토어목록</div>
					</div>

					<!-- 메인 -->

					<div class="TalkListMain">
						<!-- 목록정보 -->
						<!-- 주문 요청 내역 상단 정보 -->
						<div>

							<c:forEach var="orderList" items="${orderListTotal}">
								<div class="eachstore">
									<div class="storeSimpleInfo">
										<c:if test="${orderList.s_spname eq null}">
											<img alt="" src="./resources/img/faviconLogoIcon.png">
										</c:if>
										<c:if test="${orderList.s_spname ne null}">
										 	<img alt="" src="./resources/img/DBServer/${ orderList.s_spname}">
										</c:if>
										<div>${orderList. s_name}</div>
									</div>
									<div>${orderList. o_date}</div>
									<input type="hidden" value="${ orderList. o_code}" readonly="readonly" />
								</div>
								<div class="listBar"></div>
							</c:forEach>

						</div>
						<!-- 목록정보 -->

						<div>
						<!-- 	◀ -->
							<c:forEach var="i" begin="0" end="${totalCountPage }" step="1">
								[<a href="customerSujeTalk.do?id=${id }&page=${i+1}">${i+1}</a>]
							</c:forEach>
						<!-- 	▶ -->
						</div>
					</div>
				</div>

				<!-- 주문요청 내역 -->
				<div class="activeTalk">

					<!-- 타이틀 -->
					<div class="activeTalkTitle">
						<div>
							<span>주문 요청 내역</span>
						</div>
						<div>
							<span>주문 요청 번호</span> 
							<span><input class="orderNum" type="text" readonly="readonly"/></span>
						</div>
					</div>

					<!-- 메인 -->
					<div class="activeTalkMain">
						<!-- 상단 사용자 정보 -->
						<div class="customerInfo">
							<div>
								<div>
									<img src="./resources/img/custmerLogo.png">
								</div>
								<div><!-- 상단 스토어명 입력 부분 --></div>
							</div>
							<div><!-- 상단 날짜 정보 입력 부분 --></div>
						</div>
						<!-- 상단 사용자 정보 -->

						<div class="listBarOrder"></div>

						<!-- 요청내용 -->
						<div class="orderMainContent">
							<div class="orderMainContentInner">
	
								<!-- 주문 상세 요청사항 출력 부분 -->

							</div>
						</div>
						<!-- 요청내용 -->

						<!-- 주문 요청사항 입력 -->
						<form id="etcUploadInsert" enctype="multipart/form-data">
						
							<!-- 이미지 불러오기 -->
							<div class="filebox">
								<label for="talkImgUpload"> 이미지 불러오기 </label> 
								<input type="file" accept=".jpg,.png,.gif" name="uploadImgFile" id="talkImgUpload" />
								<input type="text" readonly="readonly">
							</div>
							<!-- 이미지 불러오기 -->
							
							<!-- 요청사항 입력 -->
							<div>
								<textarea  class="etcContent" name="etc_content" ></textarea><!-- 요청내용 -->
								<!-- <button value="요청사항전송" onclick="">전송</button> -->
								<input type="submit" value="전송" />
							</div><!-- 요청사항 입력 -->
							
							<input type="hidden" class="orderNO" name="o_code" /><!-- 요청번호 -->
							<input type="hidden" value="77000" name="etc_type_code" /><!-- 요청자 유형번호 -->
							<input type="hidden" value=${id } name="m_id" /><!-- 사용자 아이디 -->
							
						</form><!-- 주문 요청사항 입력 -->
						
					</div>
				</div>

				<!-- 메인 Talk 부분 -->

			</div>
		</div>

	</div>
	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
	<!-- Modal -->
	<div class="modalWrap">
		<div class="orderCheckModal">
			<jsp:include page="./Modal/orderInfoModal.jsp"></jsp:include>
		</div>

		<div class="payResultModal">
			<jsp:include page="./Modal/payModal.jsp"></jsp:include>
		</div>
		
		<input type="hidden" class="idInfo" value="${id }"/>
	</div>
</body>
<script type="text/javascript">

$(function(){
    // 최종 주문서 조회 취소 이벤트
    $('.viewCancel').click(function(){
    	
    	//location.href = "customerSujeTalk.do?id=${id}&page=1";
		$(".orderCheckModal").slideUp(200);
		
		$(".payResultModal").slideUp(200);
		$(".modalWrap").fadeOut(200);
    	
    });
	// 이미지 파일명 불러오기
	$('#talkImgUpload').change(function(){
		$(".filebox input[type='text']").val($(this).val());
	});
	
	// 텍스트 area
	function resize(obj) {
    obj.style.height = '1px';
    obj.style.height = (12 + obj.scrollHeight) + 'px';
}
});

</script>
</html>