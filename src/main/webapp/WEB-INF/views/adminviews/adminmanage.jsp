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
<link href="./resources/css/admincss/adminmanage.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<% 
String adminId = (String)session.getAttribute("mainId");
%>
<!-- <script src="./resources/js/adminjs/adminModalJs.js"></script> -->
<script type="text/javascript">
$(function() {
	
<% if (request.getAttribute("storeAvail") != null) { %>
	var storeAvail = "<%= request.getAttribute("storeAvail") %>";
	alert(storeAvail);
<% } %>

	$('.adminCategoryArea li:first-child a').addClass('checkedStateFirstCategory');
	
	var storeId;
	var adminId = "<%= adminId %>";

	// 모달창 오픈/클로즈
	$('.storeMoreInfoBtn').click(function() {
		//선택 스토어 정보 삽입
		storeId = $(this).closest('.newStoreTableRow').find('td:first').text();
		sandPage(storeId);
	});
	$('.modalCloseBtn').click(function() {
		$(".storeMoreInfoModal").slideUp(200);
		$(".storeMoreInfoModalWrap").fadeOut(200);
	});
	
	function sandPage(storeId) {
		$.ajax({
			url : "storeAvailInfo.do",
			type : "post",
			data: { s_id : storeId, ma_id : adminId },
			dataType : "json",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success : function(storeInfo){
				$('input[name=storeId]').val(storeInfo.s_id);
				$('input[name=s_id]').val(storeInfo.s_id);
				$('input[name=ma_id]').val(storeInfo.ma_id);
				$('.storeCategory').val(storeInfo.catem_name);
				$('input[name=storeName]').val(storeInfo.s_name);
				$('input[name=businessNumber]').val(storeInfo.s_bnum);
				$('input[name=email]').val(storeInfo.s_email);
				$('input[name=phoneNumber]').val(storeInfo.s_tel);
				$('input[name=address]').val(storeInfo.s_addr);
				$('.bankCategory').val(storeInfo.s_bank);
				$('input[name=accountNumber]').val(storeInfo.s_acc);
				
				$(".storeMoreInfoModalWrap").fadeIn(200);
				$(".storeMoreInfoModal").slideDown(200);
			},
			error: function(err) {
				alert("통신 에러가 발생했습니다 : "+err);
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
		<h2 class="adminQnaMainTitle">스토어 입점 관리</h2>
		<hr class="adminLine">
		<table class="newStoreTable">
			<thead>
				<tr class="newStoreTableRow">
					<th>스토어 아이디</th>
					<th>스토어 카테고리</th>
					<th>스토어명</th>
					<th>사업자등록번호</th>
					<th>스토어 상세정보</th>
					<th>입점여부</th>
					<th>입점여부 추가정보</th>
					<th>업데이트 일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${storeList}" var="AdminManageVO">
					<tr class="newStoreTableRow">
						<td>${AdminManageVO.s_id}</td>
						<td>${AdminManageVO.catem_name}</td>
						<td>${AdminManageVO.s_name}</td>
						<td>${AdminManageVO.s_bnum}</td>
						<td><button class="storeMoreInfoBtn">조회</button></td>
						<td>${AdminManageVO.sa_ck}</td>
						<td>${AdminManageVO.sa_content}</td>
						<td>
							<fmt:parseDate value="${AdminManageVO.sa_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
							<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd" />
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="pageingArea">
			<a href="#"><img src="././resources/img/pageLeftBtn.png"/></a>
			<c:forEach var="i" begin="1" end="${pageTotalCount}" step="1">
				<a href="adminmanage.do?page=${i}">${i}</a>
			</c:forEach>
			<a href="#"><img src="././resources/img/pageRightBtn.png"/></a>
		</div>
	</div> <!-- adminContentsBox -->
</div> <!-- adminContentsWrap -->
<footer></footer>

<!-- 모달 -->
<div class="storeMoreInfoModalWrap">
	<div class="storeMoreInfoModal">
		<%@ include file="./Modal/manage.jsp"%>
	</div> <!-- storeMoreInfoModal -->
</div> <!-- storeMoreInfoModalWrap -->
</body>
</html>