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
<meta charset="UTF-8" />
<title>후기작성</title>

<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet" />

<!-- css 파일 연결 -->
<link rel="stylesheet" href="./resources/css/resetStyle.css" />
<link rel="stylesheet" href="./resources/css/customer/Modal/reviewModal.css" />
</head>
<body>
	<div class="reviewInsertModal">
		<div class="reviewInsertModalBody">
			<!-- 상단 제목 부분 -->
			<div class="reviewInsertTitle">
				<div>SUJE</div>
				<div>주문제작 후기 작성</div>
				<div>
					제작주문결제번호 <input class="orderPayNO" type="text" name="p_code" readonly/>
				</div>
			</div>
			<!-- Modal 메인 Content -->
			<div class="modalMainContent">
				<!-- 메인 좌측 Content Title -->
				<div class="ContentLefit">
					<div>
						<img width="30px" height="30px" alt="" src="./resources/img/Star1Customer.png" />
					</div>
					<div>이미지 등록</div>
					<div>내용</div>
				</div>

				<!-- 메인 우측 Content -->
				<form id="formSubmit" action="reviewInsert.do" method="post" enctype="multipart/form-data">
					<div class="ContentRight">
						<!-- Content 첫번째 라인 -->
						<div>
							<div>
								<select name="rv_star" name="rv_star">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5" selected="selected">5</option>
								</select>
							</div>
							<div>점</div>
						</div>
						<!-- Content 두번째 라인 -->
						<div>
							<div>
								<input class="fileName" type="text"  readonly/>
							</div>
							<div class="filebox">
								<label for="reviewImg">불러오기</label>
								<input type="file" value="불러오기" accept=".jpg,.png,.gif" id="reviewImg" name="reviewImg"/>
							</div>
						</div>
						<!-- Content 세번째 라인 -->
						<div>
							<div>
								<textarea name="rv_content"></textarea>
							</div>
						</div>
						<input type="hidden" value="<%=request.getParameter("id")%>" name="m_id" />
						<input type="hidden" class="orderPayNO" name="p_code" />
					</div>
			</form>
			</div>

			<!-- 등록하기 버튼 -->
			<div class="insertbtn">
				<div>
					<input type="submit" value="등록하기" form="formSubmit">
				</div>
				
				<div>
						<input class="viewCancel" type="button" value="취소" />
				</div>
			</div>
		</div>
	</div>	
	
</body>
</html>