<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 제작 내역 결제취소 요청</title>

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/Modal/orderPayCancelModal.css" />

</head>
<body>
	<div class="storepayCancleModal">
	<form id="formSubmit" action="insertOrderPayCancel.do" method="post">
		<div class="storepayCancleBody">
			<!-- 상단 제목 부분 -->
			<div class="payCancleTitle">
				<div>
					<img width=62px height=20px src="./resources/img/sujeLogo.png" />
				</div>
				<div>결제 취소 요청</div>
				<div>
					결제번호 <input class="payCancelNo" type="text" name="p_code"/>
				</div>
			</div>

			<!-- MainContent 부분 -->
			<div class="modalMainContent">
				<!-- 메인 좌측 Content Title -->
				<div class="payCancleContentLefit">
					<div>취소사유</div>
				</div>

				<!-- 메인 우측 Content -->
				
				<div class="payCancleContentRight">
					<!-- Content 첫번째 라인 -->
					<div>
						<div>
							<input type="text" name="can_why"/>
						</div>
						<input type="hidden" value="<%=request.getParameter("id")%>" name="m_id"/>
					</div>

				</div>
				
			</div>

			<div class="payCancleinsertbtn">
				<div>
					<input class="demandPayCancel" type="submit" value="요청하기">
				</div>
				<div>
						<input class="viewCancel" type="button" value="취소">
				</div>
			</div>
		</div>
		</form>
	</div>

</body>

</html>