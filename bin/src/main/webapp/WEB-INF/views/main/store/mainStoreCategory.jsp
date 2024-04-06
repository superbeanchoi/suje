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
<link href="./resources/css/main/store/mainStoreCategoryStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="./resources/js/main/mainStoreCategorymainNaviJs.js"></script> -->
<script type="text/javascript">
$(function() {
	
<% String mCate = (String)request.getAttribute("mCate"); %>
<% String mmCate = (String)request.getAttribute("mmCate"); %>
<% String orderBy = (String)request.getAttribute("orderBy"); %>
	
	//카테고리 선택 초기화
	$('.mainNavi').removeClass('selectedMainNavi');
	$('.subNaviWrap a').removeClass('selectedSubNavi');
	
	//정렬 초기화
	var orderBy = '<%= orderBy %>';
	$('.mainFilter option').removeAttr('selected');
	$('.mainFilter option').eq(orderBy - 1).attr('selected', 'selected');

	//카테고리 선택상태 활성화
	if ($('.mainNavi>a').text().trim() === '<%= mCate %>') {
		$('.mainNavi:nth-child(1)').addClass('selectedMainNavi');
	}
	$('.mainNavi').each(function() {
		var mainNaviText = $(this).children('div').text().trim();
		if (mainNaviText === '<%= mCate %>') {
			$(this).addClass('selectedMainNavi');
			$('.subNaviWrap').slideUp();
			$(this).children('.subNaviWrap').slideDown();
		}
	});
	$('.subNaviWrap a').each(function() {
		var subNaviText = $(this).text().trim();
		if (subNaviText === '<%= mmCate %>') {
			$(this).addClass('selectedSubNavi');
		}
	});
	
	var selectedMainNaviText;
	var selectedSubNaviText;
	
	//메인 카테고리 클릭시 이벤트
	$('.mainNavi').click(function() {
		$('.mainNavi').removeClass('selectedMainNavi');
		$(this).addClass('selectedMainNavi');
		
		// 선택된 메뉴 항목 가져오기
		selectedMainNaviText = $(this).children('div').text().trim();
		
		$('.subNaviWrap').slideUp();
		$(this).children('.subNaviWrap').slideDown();
    });

/* 	//서브 카테고리 클릭시 이벤트
    $('.subNaviWrap a').click(function(e) {
		// 선택된 서브 메뉴 항목 가져오기
		selectedSubNaviText = $(this).text().trim();
		
    	var url = "viewStoreCategory.do?page=1&mCate="+selectedMainNaviText+"&mmCate="+selectedSubNaviText+"&orderBy=1";
    	location.href = url;
    }); */
	
	//정렬 선택박스 이벤트
	$('.mainFilter').change(function() {
		var selectedOption = $(this).val();
		if (selectedOption === "기본 정렬순") {
	    	var url = "viewStoreCategory.do?page=1&mCate=${mCate}&mmCate=${mmCate}&orderBy=1";
	    	location.href = url;
		} else if (selectedOption === "별점 높은순") {
	    	var url = "viewStoreCategory.do?page=1&mCate=${mCate}&mmCate=${mmCate}&orderBy=2";
	    	location.href = url;
		} else if (selectedOption === "후기 많은순") {
	    	var url = "viewStoreCategory.do?page=1&mCate=${mCate}&mmCate=${mmCate}&orderBy=3";
	    	location.href = url;
		}
	});
	
});
</script>
</head>
<body>
<%@ include file="../../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
<div class="subMenuArea">
	<ul class="mainNaviWrap">
		<li class="mainNavi"><a href="viewStoreCategory.do?page=1&mCate=전체&mmCate= &orderBy=1">전체</a></li>
		
		<c:forEach items="${cateMainList}" var="mainVO">
			<li class="mainNavi">
			<div>${mainVO.catem_name }<img src="././resources/img/mainSubMenuBtn.png"/></div>
				<ul class="subNaviWrap">
				
					<c:forEach items="${cateMidList}" var="midVO">
					
						<c:if test="${mainVO.catem_code eq midVO.catem_code}">
							<li>
								<a href="viewStoreCategory.do?page=1&mCate=${mainVO.catem_name }&mmCate=${midVO.catemm_name }&orderBy=1">
									&nbsp;&nbsp;${midVO.catemm_name }
								</a>
							</li>
						</c:if>
						
					</c:forEach>
					
				</ul>
			</li>
		</c:forEach>
		
	</ul>
</div> <!-- subMenuArea -->
<div class="mainContentsArea">
	<div class="mainTitleArea">
		<div class="mainTitle"><%= mCate %>/<%= mmCate %></div>
		<select class="mainFilter">
			<option>기본 정렬순</option>
			<option>별점 높은순</option>
			<option>후기 많은순</option>
		</select>
	</div>
	<div class="AreaLine"></div>
	
	<!-- total 콘텐츠가 존재할 시 호출 -->
	<c:if test="${pageTotalCount ne 0}">
		<div class="StoreArea">
			<c:forEach items="${storeCateList}" var="storeCate">
				<a href="viewStoreInfo.do?sId=${storeCate.s_id}&page=1" class="EachStoreLinkArea">
					<table class="EachStore">
						<tr>
							<td class="storeNameTd">${storeCate.s_name}</td>
							<td rowspan="3" class="storeImgTd"><img src="././resources/img/DBServer/${storeCate.s_spname}" class="storeImg"/></td>
						</tr>
						<tr>
							<td class="storeStarTd">
								<img src="././resources/img/mainReviewStarImg.png"/>
								<span>${storeCate.avgRvStar}</span>
								<img src="././resources/img/mainReviewCountImg.png"/>
								<span>${storeCate.countRvCode}</span>
							</td>
						</tr>
						<tr>
							<td class="storeInfoTd">${storeCate.s_text}</td>
						</tr>
					</table>
				</a>
			</c:forEach>
		</div>
	</c:if>
	
	<!-- total 콘텐츠가 존재하지 않을 시 호출 -->
	<c:if test="${pageTotalCount eq 0}">
		<div class="noneItemArea">스토어가 존재하지 않습니다.</div>
	</c:if>
	
	<!-- total 콘텐츠가 존재할 시 호출 -->
	<c:if test="${pageTotalCount ne 0}">
		<div class="pageingArea">
			<a href="#"><img src="././resources/img/pageLeftBtn.png"/></a>
			<c:forEach var="i" begin="1" end="${pageTotalCount}" step="1">
				<a href="viewStoreCategory.do?page=${i}&mCate=${mCate}&mmCate=${mmCate}&orderBy=${orderBy}">${i}</a>
			</c:forEach>
			<a href="#"><img src="././resources/img/pageRightBtn.png"/></a>
		</div>
	</c:if>
</div>
</div> <!-- contentsWrap -->
<footer></footer>
</body>
</html>