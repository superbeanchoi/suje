<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/store/storeInfoStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b7b792b159f35aa7d22b2aef2ebf14&libraries=services"></script>
<script>
$(function() {
	
<% String customerId = (String)session.getAttribute("mainId"); %>
	
	var mapContainer = document.getElementById('mapArea'), // 지도를 표시할 div 
	    mapOption = { 
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 3 // 지도의 확대 레벨
	    };
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${ storeInfo.s_addr }', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;font-size:15px;">${ storeInfo.s_name }</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});
	
	//후기 추천 버튼 클릭 이벤트
	$('.thumbsUpBtn').click(function() {
		
		var icon = $(this).find('img');
		var rvId = $(this).closest(".eachReview").find(".reviewWriterTd").text();
		var rvCode = $(this).closest(".eachReview").find(".rvCode").text();
		var rvLike = $(this).siblings();
		
		if("<%= customerId %>" == "null" ) {
			alert("로그인 후 이용 가능합니다.");
			location.href="mainLogin.do";
		} else if("<%= customerId %>" == rvId) {
			alert("본인의 후기는 추천할 수 없습니다.");
		} else {
			$.ajax({
				url : "reviewLike.do",
				type : "post",
				data: { rv_code : rvCode },
				success : function(){
					icon.attr('src', './resources/img/mainReviewThumbsUpAfterImg.png');
					icon.animate({ 
						width: '+=20%',
						height: '+=20%'
					}, 'fast', function() {
						icon.attr('src', './resources/img/mainReviewThumbsUpImg.png');
						icon.animate({ 
							width: '-=20%',
							height: '-=20%'
						}, 'fast');
					});
					$.ajax({
						url : "reviewLikeView.do",
						type : "post",
						data: { rv_code : rvCode },
						dataType : "json",
						success : function(result){
							rvLike.text(result);
							setTimeout(function() {alert("게시물에 공감하였습니다.");}, 500);
						},
						error: function(request, status, error) {
							alert("통신 에러가 발생했습니다22 : "+request+"/"+status+"/"+error);
						}
					});
				},
				error: function(request, status, error) {
					alert("통신 에러가 발생했습니다11 : "+request+"/"+status+"/"+error);
				}
			});
		}
		
	});
	
	
});
</script>
</head>
<body>
<%@ include file="../../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
	<div class="storeCategory">
		<div class="allCategory"><a href="viewStoreCategory.do?page=1&mCate=전체&mmCate= &orderBy=1">전체</a></div>
		<img src="././resources/img/mainSubMenuBtn.png">
		<div class="category"><a href="viewStoreCategory.do?page=1&mCate=${ storeInfo.catem_name }&mmCate= &orderBy=1">${ storeInfo.catem_name }</a></div>
	</div> <!-- storeCategory -->
	<div class="storeTitle">스토어 후기</div>
	<div class="titleLine"></div>
	<div class="reviewArea">
	<!-- total 콘텐츠가 존재할 시 호출 -->
	<c:if test="${pageTotalCount ne 0}">
		<c:forEach items="${storeReviewList}" var="review">
			<table class="eachReview">
				<tr style="display:none;"><td class="rvCode">${ review.rv_code }</td></tr>
				<tr>
					<td colspan="2" class="reviewImgTd">
						<c:if test="${ review.rvp_spname ne null }">
							<div class="reviewImgArea"><img src="././resources/img/DBServer/${ review.rvp_spname }"></div>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="reviewContentsTd">${ review.rv_content }</td>
				</tr>
				<tr>
					<td colspan="2" class="reviewWriterTd">${ review.m_id }</td>
				</tr>
				<tr class="reviewScoreTr">
					<td>
						<span>${ review.rv_star }</span>
						<img src="././resources/img/mainReviewStarImg.png"/>
					</td>
					<td>
						<button class="thumbsUpBtn"><img src="././resources/img/mainReviewThumbsUpImg.png"/></button>
						<span>${ review.rv_like }</span>
					</td>
				</tr>
			</table>
		</c:forEach>
	</c:if>
	<!-- total 콘텐츠가 존재하지 않을 시 호출 -->
	<c:if test="${pageTotalCount eq 0}">
		<div class="noneItemArea">후기가 존재하지 않습니다.</div>
	</c:if>
	</div> <!-- reviewArea -->
	
	<!-- total 콘텐츠가 존재할 시 호출 -->
	<c:if test="${pageTotalCount ne 0}">
		<div class="pageingArea">
			<a href="#"><img src="././resources/img/pageLeftBtn.png"/></a>
			<c:forEach var="i" begin="1" end="${pageTotalCount}" step="1">
				<a href="viewStoreInfo.do?sId=${storeInfo.s_id}&page=${i}">${i}</a>
			</c:forEach>
			<a href="#"><img src="././resources/img/pageRightBtn.png"/></a>
		</div>
	</c:if>
	
	<div class="storeTitle">스토어 정보</div>
	<div class="titleLine"></div>
	<div class="storeInfoWrap">
		<div class="mapArea" id="mapArea"></div>
		<div class="storeInfoArea">
			<div class="storeTotalScoreArea">
				<img src="././resources/img/mainReviewStarImg.png"/>
				<span>${ storeInfo.avgRvStar }</span>
				<img src="././resources/img/mainReviewCountImg.png"/>
				<span>${ storeInfo.countRvCode }</span>
			</div>
			<div class="storeName">${ storeInfo.s_name }</div>
			<a href="viewStoreEach.do?sId=${storeInfo.s_id}" class="storePageBtn">스토어 페이지 보러가기</a>
			<div class="storeInfo">${ storeInfo.s_text }</div>
			<div class="storeDetailInfoTitle">주소</div>
			<div class="storeDetailInfo">${ storeInfo.s_addr }</div>
			<div class="storeDetailInfoTitle">전화번호</div>
			<div class="storeDetailInfo">${ storeInfo.s_tel }</div>
		</div>
	</div>
</div> <!-- contentsWrap -->
<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
</body>
</html>