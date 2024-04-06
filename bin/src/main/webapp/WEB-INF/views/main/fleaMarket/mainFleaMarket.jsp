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
<link href="./resources/css/main/fleaMarket/mainFleaMarketStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="./resources/js/main/mainFleaMarketmainNaviJs.js"></script> -->
<script type="text/javascript">
$(function() {
	
<% if (request.getAttribute("buyComplete") != null) { %>
	var buyComplete = "<%= request.getAttribute("buyComplete") %>";
	alert(buyComplete);
<% } %>
	
<% String mCate = (String)request.getAttribute("mCate"); %>
<% String mmCate = (String)request.getAttribute("mmCate"); %>
<% String orderBy = (String)request.getAttribute("orderBy"); %>
	
	//카테고리 선택 초기화
	$('.mainNavi').removeClass('selectedMainNavi');
	$('.subNaviWrap a').removeClass('selectedSubNavi');
	
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
	
	//정렬 초기화
	var orderBy = '<%= orderBy %>';
	$('.mainFilter option').removeAttr('selected');
	$('.mainFilter option').eq(orderBy - 1).attr('selected', 'selected');

	// 가격 포맷 변경
	$('.itemPriceTr span').each(function() {
		var dbPrice = $(this).text();
		var formattedPrice = dbPrice.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$(this).text(formattedPrice);
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

	//서브 카테고리 클릭시 이벤트
    $('.subNaviWrap a').click(function(e) {
		// 선택된 서브 메뉴 항목 가져오기
		selectedSubNaviText = $(this).text().trim();
		
    	var url = "fleaMarketMain.do?page=1&mCate="+selectedMainNaviText+"&mmCate="+selectedSubNaviText+"&orderBy=1";
    	location.href = url;
    });
	
	//정렬 선택박스 이벤트
	$('.mainFilter').change(function() {
		var selectedOption = $(this).val();
		if (selectedOption === "최신순") {
	    	var url = "fleaMarketMain.do?page=1&mCate=${mCate}&mmCate=${mmCate}&orderBy=1";
	    	location.href = url;
		} else if (selectedOption === "가격 높은순") {
	    	var url = "fleaMarketMain.do?page=1&mCate=${mCate}&mmCate=${mmCate}&orderBy=2";
	    	location.href = url;
		} else if (selectedOption === "가격 낮은순") {
	    	var url = "fleaMarketMain.do?page=1&mCate=${mCate}&mmCate=${mmCate}&orderBy=3";
	    	location.href = url;
		}
	});
    
});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="../../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
<div class="subMenuArea">
	<ul class="mainNaviWrap">
		<li class="mainNavi"><a href="viewFleaMarket.do">전체</a></li>
		<li class="mainNavi"><div>디저트<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;베이커리</a></li>
				<li><a href="#">&nbsp;&nbsp;케이크</a></li>
				<li><a href="#">&nbsp;&nbsp;마카롱</a></li>
				<li><a href="#">&nbsp;&nbsp;타르트</a></li>
				<li><a href="#">&nbsp;&nbsp;쿠키</a></li>
			</ul>
		</li>
		<li class="mainNavi"><div>전통간식<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;약과</a></li>
				<li><a href="#">&nbsp;&nbsp;떡</a></li>
				<li><a href="#">&nbsp;&nbsp;양갱</a></li>
			</ul>
		</li>
		<li class="mainNavi"><div>반려동물식품<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;애견간식</a></li>
				<li><a href="#">&nbsp;&nbsp;애견쿠키</a></li>
				<li><a href="#">&nbsp;&nbsp;애견케이크</a></li>
			</ul>
		</li>
		<li class="mainNavi"><div>의류<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;여성</a></li>
				<li><a href="#">&nbsp;&nbsp;남성</a></li>
				<li><a href="#">&nbsp;&nbsp;남녀공용</a></li>
				<li><a href="#">&nbsp;&nbsp;키즈</a></li>
			</ul>
		</li>
		<li class="mainNavi"><div>주얼리<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;반지</a></li>
				<li><a href="#">&nbsp;&nbsp;목걸이</a></li>
				<li><a href="#">&nbsp;&nbsp;팔찌</a></li>
			</ul>
		</li>
		<li class="mainNavi"><div>수공예품<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;생활소품</a></li>
				<li><a href="#">&nbsp;&nbsp;주방공예</a></li>
				<li><a href="#">&nbsp;&nbsp;인테리어</a></li>
			</ul>
		</li>
		<li class="mainNavi"><div>잡화<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;문구</a></li>
				<li><a href="#">&nbsp;&nbsp;기념품</a></li>
				<li><a href="#">&nbsp;&nbsp;일러스트</a></li>
			</ul>
		</li>
		<li class="mainNavi"><div>홈리빙<img src="././resources/img/mainSubMenuBtn.png"/></div>
			<ul class="subNaviWrap">
				<li><a href="#">&nbsp;&nbsp;가구</a></li>
				<li><a href="#">&nbsp;&nbsp;패브릭</a></li>
			</ul>
		</li>
	</ul>
</div> <!-- subMenuArea -->
<div class="mainContentsArea">
	<div class="mainTitleArea">
		<div class="mainTitle"><%= mCate %>/<%= mmCate %></div>
		<select class="mainFilter">
			<option>최신순</option>
			<option>가격 높은순</option>
			<option>가격 낮은순</option>
		</select>
	</div>
	<div class="AreaLine"></div>
	
	<!-- total 콘텐츠가 존재할 시 호출 -->
	<c:if test="${pageTotalCount ne 0}">
		<div class="itemArea">
			<c:forEach items="${fleaList}" var="MainFleaMarketVO">
				<a href="fleaMarketDetail.do?fCode=${MainFleaMarketVO.f_code}" class="EachItemLinkArea">
					<input type="hidden" value="${MainFleaMarketVO.f_code}"/>
					<table class="EachItem">
						<tr class="itemImgTr"><td><div class="itemImgArea"><img src="././resources/img/DBServer/${MainFleaMarketVO.f_spname}"/></div></td></tr>
						<tr class="itemStoreTr"><td>${MainFleaMarketVO.s_name}</td></tr>
						<tr class="itemNameTr"><td>${MainFleaMarketVO.f_content}</td></tr>
						<tr class="itemPriceTr"><td><span>${MainFleaMarketVO.f_sum}</span>원</td></tr>
					</table>
				</a>
			</c:forEach>
		</div>
	</c:if>
	
	<!-- total 콘텐츠가 존재하지 않을 시 호출 -->
	<c:if test="${pageTotalCount eq 0}">
		<div class="noneItemArea">상품이 존재하지 않습니다.</div>
	</c:if>
	
	<div class="AreaLine"></div>
	
	<!-- total 콘텐츠가 존재할 시 호출 -->
	<c:if test="${pageTotalCount ne 0}">
		<div class="pageingArea">
			<a href="#"><img src="././resources/img/pageLeftBtn.png"/></a>
			<c:forEach var="i" begin="1" end="${pageTotalCount}" step="1">
				<a href="fleaMarketMain.do?page=${i}&mCate=${mCate}&mmCate=${mmCate}&orderBy=${orderBy}">${i}</a>
			</c:forEach>
			<a href="#"><img src="././resources/img/pageRightBtn.png"/></a>
		</div>
	</c:if>
</div>
</div> <!-- contentsWrap -->
<footer></footer>
</body>
</html>