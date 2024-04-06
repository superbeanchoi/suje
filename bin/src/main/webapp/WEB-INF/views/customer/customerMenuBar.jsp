<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	
	// 세션 정보를 가져오는 부분
 	Object obj = session.getAttribute("mainId");
	if(obj == null){
		response.sendRedirect("LoginForm.jsp");
		return;
	}
	
	String user = (String)obj; 
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/customerMenuBar.css" />
<script type="text/javascript" src="./resources/js/customer/customerMenuBar.js"></script>
</head>
<body>
		<div class="mainContentleft">
			<div>
				<img width=120px height=120px alt="" src="./resources/img/basicProfileIconBig.png">
			</div>
			<div><%=user %></div>
		
			<div class="subTitle mypagebtn">
				<a href="customerMyPage.do?id=<%=user %>">마이페이지</a>
			</div><!-- 마이페이지 연결 -->
					
			<div class="subTitle cardInsert">
				<a href="customerCard.do?id=<%=user %>">카드 등록/수정</a>
			</div><!-- 카드 등록/ 수정 -->
			
			<div class="subTitle accountInsert">
				<a href="customerAccount.do?id=<%=user %>">계좌 등록/수정</a>
			</div><!-- 계좌 등록/ 수정 -->
			
			<div class="subTitle orderListMenubar">
				<a href="getPayList.do?id=<%=user %>&orderPage=1&fleaPage=1">주문 내역 조회</a>
			</div><!-- 주문 내역 조회-->
			
			<div class="subTitle reviews">
				<a href="getCustomerReview.do?id=<%=user%>&page=1">후기 작성</a>
			</div><!-- 후기 작성 -->
			
			<div class="subTitle sujeTalk">
				<a href="customerSujeTalk.do?id=<%=user %>&page=1">SUJE 톡톡</a>
			</div><!-- suje 톡톡 -->
			
			<div class="subTitle qna">
				<a href="getQnAList.do?id=<%=user %>&page=1">Q&A 작성</a>
			</div><!-- Q&A 작성 -->
			
<!-- 			<div class="subTitle file">
				<a href="flieUpload.do">파일 첨부 테스트 버튼</a>
			</div>Q&A 작성 -->
		</div>
</body>
</html>