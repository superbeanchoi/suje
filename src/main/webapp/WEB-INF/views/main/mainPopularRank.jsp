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
<link href="./resources/css/main/mainPopularRankStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	
	//선택박스 초기화
	var cate = '<%= (String)request.getAttribute("cate") %>';
	$('.categoryFilter option').removeAttr('selected');
	$('.categoryFilter option').eq(cate).attr('selected', 'selected');
	
	//선택박스 이벤트
	$('.categoryFilter').change(function() {
		var selectedOption = $(this).val();
	    	var url = "popularRank.do?cate="+selectedOption;
	    	location.href = url;
	});
	//굿즈 테이블 불러오기
	$('.eachRankTable').each(function() {
		var eachRankTable = $(this);
		var sId = eachRankTable.children('.sId').val();
		$.ajax({
			url : "popularRankGoodsImg.do",
			type : "post",
			data: { s_id : sId },
			dataType : "json",
			success : function(goods){
				eachRankTable.find('.eachRankStorePortfolioTr').empty();
				if (goods.length > 0) {
					//이미지 추가
					$.each(goods, function(index, goodsImg) {
						var imgSrc = "././resources/img/DBServer/" + goodsImg.g_spname;
						eachRankTable.find('.eachRankStorePortfolioTr').append('<td><div><img src="' + imgSrc + '"></div></td>');
					});
				} else {
					eachRankTable.find('.eachRankStorePortfolioTr').append('<td><div style="height: 120px; background-color: #fff;"></div></td>');
				}
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
			}
		});
	});
	
});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
	<div class="contentsTitleArea">
		<div class="contentsTitle">인기 랭킹</div>
		<select class="categoryFilter">
			<option value="0">전체</option>
			<option value="1">디저트</option>
			<option value="2">전통간식</option>
			<option value="3">반려동물식품</option>
			<option value="4">의류</option>
			<option value="5">주얼리</option>
			<option value="6">수공예품</option>
			<option value="7">잡화</option>
			<option value="8">홈리빙</option>
		</select>
	</div>
	<div class="contentsLine"></div>
	<div class="contentsRankArea">
		<!-- 랭킹 정보가 존재하지 않을시 호출 -->
		<c:if test="${empty popularRankList}">
			<div class="noneItemArea">스토어가 존재하지 않습니다.</div>
		</c:if>
		<c:forEach items="${popularRankList}" var="rank">
			<table class="eachRankTable">
				<input class="sId" type="hidden" value="${rank.s_id}"/>
				<tr>
					<td rowspan="2" class="eachRankNumTd"><div>${rank.rnum}</div></td>
					<td colspan="2" class="eachRankStoreProfileTd">
						<!-- 프로필 정보가 존재할시 호출 -->
						<c:if test="${rank.s_spname ne null}">
							<img src="././resources/img/DBServer/${rank.s_spname}"/>
						</c:if>
						<!-- 프로필 정보가 존재하지 않을시 호출 -->
						<c:if test="${rank.s_spname eq null}">
							<img src="././resources/img/basicProfileIcon.png"/>
						</c:if>
						<div class="eachStoreInfoArea">
							<div class="eachStoreCate">${rank.catem_name}</div>
							<div class="eachStoreName">${rank.s_name}</div>
						</div>
					</td>
					<td colspan="2" class="eachRankStoreBtnTd"><a href="viewStoreEach.do?sId=${rank.s_id}">스토어 바로가기</a></td>
				</tr>
				<tr class="eachRankStorePortfolioTr">
				</tr>
			</table>
		</c:forEach>
<%-- 		<!-- total 콘텐츠가 존재할 시 호출 -->
		<c:if test="${pageTotalCount ne 0}">
		</c:if>
 --%>
	</div>
	<div class="contentsLine"></div>
	<a href="mainPopularRank.do" class="moreStoreBtn">스토어 더보기</a>
</div> <!-- contentsWrap -->
<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
</body> 
</html>