<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link href="./resources/css/admincss/adminpnt.css" rel="stylesheet" type="text/css">
<% 
String adminId = (String)session.getAttribute("mainId");
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	
<% if (request.getAttribute("degradeInfo") != null) { %>
	var degradeInfo = "<%= request.getAttribute("degradeInfo") %>";
	alert(degradeInfo);
<% } %>

	var storename;
	
	$('.adminCategoryArea li:nth-child(2) a').addClass('checkedStateFirstCategory');
	
	// 스토어명으로 스토어 아이디 검색
	$('#storeId').keyup(function() {
		//입력 정보 가져오기
		storename = $(this).val();
        $('.searchItem').css('display', 'grid');
		sandPage(storename);
	});
    
	$(document).on('click', '.searchItem input[type="button"]', function () {
		var closestGroup = $(this).closest('.searchItemGroup');
		var sId = closestGroup.find('input[name="sId"]').val();
		$('.searchResult').val(sId);
        $('.searchItem').css('display', 'none');
	});

	
	function sandPage(storename) {
		$.ajax({
			url : "storeIdSearch.do",
			type : "post",
			data: { s_name : storename },
			dataType : "json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(storeInfo){
				var searchItem = $('.searchItem');
				searchItem.empty();
				$.each(storeInfo, function(index, item) {
					var html = '<div class="searchItemGroup">'
								+ '<input type="button" name="sId" value="' + item.s_id + '">'
								+ '<input type="button" name="sName" value="' + item.s_name + '">'
								+ '</div>';
					searchItem.append(html);
			   });
			}
		});
    }
	
});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="../../views/headerHtml/adminHeader.jsp"%>
<div class="adminContentsWrap">
	<%@ include file="../../views/headerHtml/adminSubMenuForm.jsp"%>
	<div class="adminContentsBox">
		<h2 class="adminTitle">스토어 벌점 관리</h2>
		<hr class="adminHr">
		<div class="adminSection">
			<h2 class="adminSubtitle">벌점 부여</h2>
			<form action="pntInsert.do?adminId=<%= adminId %>" method="post">
				<fieldset>
					<div class="idflied">
						<label for="storeId" class="inputLabel">스토어 아이디</label>
						<div class="searchBox">
							<input type="text" id="storeId" name="storeId" class="inputField" placeholder="스토어명 검색">
							<button id="searchButton">
								<img class="searchIcon" src="./resources/img/searchIcon.png" alt="검색 아이콘" width="20" height="20">
							</button>
							<div class="searchItem"></div>
						</div>
						<input type="text" id="searchResults" name="s_id" class="searchResult" readonly="readonly"/>
					</div>
					<br> <label for="pntPoints" class="inputLabel">부여 벌점</label>
					<input type="number" id="pntPoints" name="de_score" class="pntPoints"> 점 
					<br> <label for="pntReason" class="inputLabel">벌점 사유</label> 
					<br>
					<textarea id="pntReason" name="de_why" class="pntReason" rows="4" cols="50"></textarea>
					<br><button type="submit" class="submitButton">등록하기</button>
					<hr class="adminHr">
				</fieldset>
			</form>
		</div>
		<div class="adminSection">
			<h2 class="adminSubtitle">벌점 내역</h2>
			<table class="adminTable">
				<thead>
					<tr class="adminTableRow">
						<th class="adminTableHeader">벌점 부여 번호</th>
						<th class="adminTableHeader">관리자 아이디</th>
						<th class="adminTableHeader">스토어 아이디</th>
						<th class="adminTableHeader">부여 벌점</th>
						<th class="adminTableHeader" id="pntReasonCell">벌점 사유</th>
						<th class="adminTableHeader">업데이트 일자</th>
						<th class="adminTableHeader">누적 벌점 점수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pntList}" var="adminPntVO">
						<tr class="adminTableRow">
							<td>${adminPntVO.de_code}</td>
							<td>${adminPntVO.ma_id}</td>
							<td>${adminPntVO.s_id}</td>
							<td>${adminPntVO.de_score}</td>
							<td>${adminPntVO.de_why}</td>
							<td>
								<fmt:parseDate value="${adminPntVO.de_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
							</td>
							<td>${adminPntVO.de_score_sum}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pageingArea">
				<a href="#"><img src="././resources/img/pageLeftBtn.png"/></a>
				<c:forEach var="i" begin="1" end="${pageTotalCount}" step="1">
					<a href="adminpnt.do?page=${i}">${i}</a>
				</c:forEach>
				<a href="#"><img src="././resources/img/pageRightBtn.png"/></a>
			</div>
		</div>
		<!-- adminContentsBox -->
	</div>
	<!-- adminContentsWrap -->
</div>
<footer></footer>
</body>
</html>
