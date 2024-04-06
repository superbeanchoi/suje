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
<link href="./resources/css/main/maincommu/mainCommStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="./resources/js/main/mainCommmainNaviJs.js"></script> -->
<script type="text/javascript">
$(function() {
	
<% String cCate = (String)request.getAttribute("cCate"); %>
<% String customerId = (String)session.getAttribute("mainId"); %>
	
<% if (request.getAttribute("replyComple") != null) { %>
	var replyComple = "<%= request.getAttribute("replyComple") %>";
	alert(replyComple);
<% } %>
	
	var selectedMainNaviText;
	var selectedSubNaviText;
	
	//카테고리 선택 초기화
	$('.mainNavi li').removeClass('selectedMainNavi');
	
	//카테고리 선택상태 활성화
	$('.mainNavi li').each(function() {
		var mainNaviText = $(this).children('a').text().trim();
		if (mainNaviText === '<%= cCate %>') {
			$(this).addClass('selectedMainNavi');
			if(mainNaviText === "전체") {
	            $(".categoryArea img, .categoryArea .mainCategory").hide();
			} else {
	            $(".mainCategory").text(mainNaviText);
	            $(".categoryArea img, .categoryArea .mainCategory").show();
			}
		}
	});
	
	//카테고리 클릭 이벤트
	$('.mainNavi li').click(function() {
		// 선택된 메뉴 항목 가져오기
		selectedNaviText = $(this).children('a').text().trim();
		
    	var url = "communityMain.do?page=1&cCate="+selectedNaviText;
    	location.href = url;
    });
	
	//포스트 작성하기
	$('.contentsWriteBtn').click(function() {
		if("<%= customerId %>" == "null" ) {
			alert("로그인 후 이용 가능합니다.");
			location.href="mainLogin.do";
		} else {
			location.href="postInsertPage.do";
		}
	});
	
});
</script>
</head>
<body>
<%@ include file="../../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
<div class="subMenuArea">
	<ul class="mainNavi">
		<li><a href="viewMainComm.do">전체</a></li>
		<li><a href="#">궁금해요</a></li>
		<li><a href="#">추천해요</a></li>
		<li><a href="#">꿀팁공유</a></li>
		<li><a href="#">비하인드</a></li>
		<li><a href="#">일상</a></li>
	</ul>
</div> <!-- subMenuArea -->
<div class="mainContentsArea">
	<div class="mainTitleArea">
		<div class="mainTitle">커뮤니티 최신 글</div>
		<div class="categoryArea">
			<div class="allCategory">전체</div>
			<img src="././resources/img/mainSubMenuBtn.png">
			<div class="mainCategory">CATEGORY</div>
		</div>
		<a href="#" class="contentsWriteBtn">작성하기</a>
	</div>
	<div class="AreaLine"></div>
	<div class="contentsArea">
		
		<!-- total 콘텐츠가 존재할 시 호출 -->
		<c:if test="${pageTotalCount ne 0}">
			<c:forEach items="${commList}" var="MainCommVO">
				<a href="commuContent.do?comupCode=${MainCommVO.comup_code}" class="contentsLinkArea">
					<input class="comupCode" type="hidden" value="${MainCommVO.comup_code}">
					<table class="EachContents">
						<tr><td class="contentsCategoryTd" colspan="5">${MainCommVO.comuc_name}</td></tr>
						<tr><td class="contentsTitleTd" colspan="5">${MainCommVO.comup_title}</td></tr>
						<tr>
							<td class="contentsWriterTd">${MainCommVO.m_id}</td>
							<td class="commViewsTd"><img src="././resources/img/commViewsIcon.png">${MainCommVO.comup_count}</td>
							<td class="commLikeTd"><img src="././resources/img/commLikeBeforeIcon.png">${MainCommVO.comup_like}</td>
							<td class="commCommentTd"><img src="././resources/img/commCommentIcon.png">${MainCommVO.reCnt}</td>
							<td class="commDateTd">
								<fmt:parseDate value="${MainCommVO.comup_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
							</td>
						</tr>
					</table>
				</a>
			</c:forEach>
		</c:if>
		
		<!-- total 콘텐츠가 존재하지 않을 시 호출 -->
		<c:if test="${pageTotalCount eq 0}">
			<div class="noneItemArea">콘텐츠가 존재하지 않습니다.</div>
		</c:if>
		
	</div>
	
	<!-- total 콘텐츠가 존재할 시 호출 -->
	<c:if test="${pageTotalCount ne 0}">
		<div class="pageingArea">
			<a href="#"><img src="././resources/img/pageLeftBtn.png"/></a>
				<c:forEach var="i" begin="1" end="${pageTotalCount}" step="1">
					<a href="communityMain.do?page=${i}&cCate=${cCate}">${i}</a>
				</c:forEach>
			<a href="#"><img src="././resources/img/pageRightBtn.png"/></a>
		</div>
	</c:if>
</div>
</div> <!-- contentsWrap -->
<footer></footer>
</body>
</html>