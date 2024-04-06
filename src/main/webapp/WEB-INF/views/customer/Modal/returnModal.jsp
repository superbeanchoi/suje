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
<title>반품 요청</title>

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/Modal/returnModal.css" />

</head>
<body>
	<div class="returnModal">
		<form id="formSubmit" action="insertOrderPayReturn.do" method="post">
		<div class="returnBody">
			<!-- 상단 제목 부분 -->
			<div class="returnTitle">
				<div>
					<img width=62px height=20px src="./resources/img/sujeLogo.png" />
				</div>
				<div>반품 요청</div>
				<div>
					결제번호 <input class="orderPayNo" type="text" name="p_code"/>
				</div>
			</div>

			<!-- MainContent 부분 -->
			<div class="modalMainContent">
				<!-- 메인 좌측 Content Title -->
				<div class="returnContentLefit">
					<div>반품사유</div>
				</div>

				<!-- 메인 우측 Content -->
				<div class="returnContentRight">
					<!-- Content 첫번째 라인 -->
					<div>
						<div>
							<input type="text" name="rt_why"/>
						</div>
						<input type="hidden" value="<%=request.getParameter("id")%>" name="m_id"/>
					</div>

				</div>
			</div>

			<div class="returninsertbtn">
				<div>
					<input class="demandPayReturn" type="submit" value="요청하기">
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