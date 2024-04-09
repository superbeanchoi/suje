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
<link href="./resources/css/main/mainStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="./resources/js/main/mainJs.js"></script>
<script type="text/javascript">
$(function() {
	
<% if (request.getAttribute("newStoreComple") != null) { %>
	var newStoreComple = "<%= request.getAttribute("newStoreComple") %>";
	alert(newStoreComple);
<% } %>
<% if (request.getAttribute("storeAvail") != null) { %>
	var storeAvail = "<%= request.getAttribute("storeAvail") %>";
	alert("스토어 입점 상태가 "+storeAvail+" 상태입니다.");
<% } %>

	$(".categoryBtn button").click(function() {
		var categoryValue = $(this).text().trim();
		location.href="viewStoreCategory.do?page=1&mCate="+categoryValue+"&mmCate= &orderBy=1";
	})
	
    //후기 미리보기
    $('.storeReviewText').each(function() {
        var text = $(this).text();
        if (text.length > 40) {
            text = text.substring(0, 40) + '...';
            $(this).text(text);
        }
    });

});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="./headerHtml/memberHeader.jsp" %>
<div class="contentsTop">당신이 원하는 모든 것<br/>SUJE</div>
<div class="contentsWrap">
	<div class="mainTitle">카테고리</div>
	<ul class="categoryBox">
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryDessertImg.png"/>
			디저트
		</button></li>
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryTraditionImg.png"/>
			전통간식
		</button></li>
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryPetImg.png"/>
			반려동물식품
		</button></li>
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryClothImg.png"/>
			의류
		</button></li>
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryJewelryImg.png"/>
			주얼리
		</button></li>
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryCraftsImg.png"/>
			수공예품
		</button></li>
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryStuffImg.png"/>
			잡화
		</button></li>
		<li class="categoryBtn"><button>
			<img src="./resources/img/categoryHomeImg.png"/>
			홈리빙
		</button></li>
	</ul> <!-- categoryBox -->
	<div class="mainTitle">실시간 후기</div>
	<div class="storeReviewViewArea mainSlide">
		<ul class="storeReview">
			<c:forEach items="${realTimeReview}" var="review">
				<li>
					<div class="reviewArea">
						<div class="reviewMainImg"><img src="./resources/img/DBServer/${review.rvp_spname}"/></div>
						<div class="storeReviewTextArea">
							<span class="storeReviewText">${review.rv_content}</span>
							<span class="storeReviewId">${review.m_id}</span>
							<div class="reviewEvaluationArea">
								<img src="./resources/img/mainReviewStarImg.png"/>
								<span>${review.rv_star}</span>
								<img src="./resources/img/mainReviewThumbsUpImg.png"/>
								<span>${review.rv_like}</span>
							</div>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul> <!-- storeReview -->
	</div>
	<a href="viewRealTimeReview.do" class="mainMoreBtn">실시간 후기 더보기</a>
	<div class="mainTitle">실시간 스토어 피드</div>
	<div class="storeFeedViewArea mainSlide">
		<ul class="storeFeed">
			<c:forEach items="${realTimeFeed}" var="MainVO">
				<li><img src="./resources/img/DBServer/${MainVO.g_spname}"/></li>
			</c:forEach>
		</ul> <!-- "storeFeed" -->
	</div>
	<a href="viewPopularRank.do" class="mainMoreBtn">스토어 더보기</a>
</div> <!-- contentsWrap -->
<%@ include file="./headerHtml/footer.jsp" %>
</body>
</html>