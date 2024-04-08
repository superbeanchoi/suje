<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">


$(function() {
	
<% if (request.getAttribute("notiComplete") != null) { %>
	var notiComplete = "<%= request.getAttribute("notiComplete") %>";
	alert(notiComplete);
<% } %>

	$(".storeCategoryArea>li:nth-child(1)>a").addClass("checkedStateFirstCategory");
	$(".storeCategoryArea>li:nth-child(1) .storeSecondCategoryArea li:nth-child(3)").addClass("checkedStateSecondCategory");
	
}); 


</script>
<title>SUJE</title>
<link rel="stylesheet" href="./resources/css/storeAdmin/storeNotiInfo.css" />
</head>
<body>
<%@ include file="../../views/headerHtml/storeHeader.jsp" %>
 <div class="storeContentsWrap">
 <jsp:include page="storeSubMenuBar.jsp"></jsp:include>
		<div class="storeContentsBox">
			<h1 class="store_mainTitle">스토어 공지 등록</h1>
			<hr>

			<div>
				<form class="store_mainInfo" action="insertStoreNotiInfo.do" method="post">
					<input type="hidden" value="<%=request.getParameter("id")%>" name="s_id" /> 
					<div class="store_subCategory">
						<label class="store_subTitle">공지 유형</label> 
						<select class="notiInfo_selectBox" name="notit_code" id="notit_code">
							<option value="">======= 선택 =======</option>
							<option value="2000">공지사항</option>
							<option value="2001">배송안내</option>
							<option value="2002">주문안내</option>
						</select>
					</div>
					<div class="store_subCategory">
						<label class="store_subTitle">공지 작성 내용</label><br />
						<textarea class="notiInfo_content" name="noti_content" placeholder="내용을 입력하세요"></textarea>
					</div>
						
					<button class="submitBtn" name="submitBtn">등록하기</button>
				</form>
			</div>
		</div>
		<!-- storeContentsBox -->
	</div> <!-- storeContentsWrap -->
	<footer></footer>
</body>
</html>