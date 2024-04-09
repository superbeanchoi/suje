<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/mainLoginStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/maincommu/commwrite.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	
	//input file 추가
	$('.imgPlusBtn').click(function() {
		event.preventDefault();
		var inputField = '<div class="inputBox">'
							+'<img src="././resources/img/cummuupload.png" alt="Uploaded Image">'
							+'<input type="file" name="comup_img" class="loadButton" accept=".jpg, .png"/>'
							+'<button class="imgMinusBtn">-</button>'
						+'</div>';
		$('.comOpenArea').append(inputField);
	});
	
	//input file 삭제
	$(document).on('click', '.imgMinusBtn', function() {
    	$(this).closest('.inputBox').remove();
	});
	
	//파일 이미지 불러오기
	$(document).on('change', '.loadButton', function(event) {
		var imgBox = $(this).closest(".inputBox").find("img");
		var reader = new FileReader();
		reader.onload = function() {
			imgBox.attr("src", reader.result);
		};
		reader.readAsDataURL(event.target.files[0]);
	});
	
	<!-- 수정 정보가 존재할시 호출 -->
	if("${commContent}" != "") {
		var selectOption = "${commContent.comuc_code}";
		//수정 게시물 카테고리 정보 받아오기
		$('.selectBox option').each(function() {
			if ($(this).val() === selectOption) {
				$(this).prop('selected', true);
			} else {
				$(this).prop('selected', false);
			}
		});
	}
	
	// 수정 프로세스
	$('.modifyBtn').click(function(event) {
		event.preventDefault();
		$('.writeForm').attr('action', 'postModify.do');
		$('.writeForm').submit();
	});
	// 작성 프로세스
	$('.insertBtn').click(function(event) {
		event.preventDefault();
		$('.writeForm').attr('action', 'postInsert.do');
		$('.writeForm').submit();
	});
	
	$('.inputField').on('input', function() {
		var text = $(this).val();
		var maxLength = 15;
		if (text.length > maxLength) {
			alert("제목의 글자 수는 15자를 초과할 수 없습니다.");
			$(this).val(text.substring(0, maxLength));
		}
	});
	$('.textField').on('input', function() {
		var text = $(this).val();
		var maxLength = 110;
		if (text.length > maxLength) {
			alert("콘텐츠의 글자 수는 110자를 초과할 수 없습니다.");
			$(this).val(text.substring(0, maxLength));
		}
	});
});
</script>
<title>SUJE</title>
<body>
<%@ include file="../../headerHtml/memberHeader.jsp"%>
<div class="contentsWrap">

	<!-- 수정 정보가 존재할시 호출 -->
	<c:if test="${commContent ne null}">
		<h2 class="writeTitle">글수정</h2>
	</c:if>
	<!-- 수정 정보가 존재하지 않을시 호출 -->
	<c:if test="${commContent eq null}">
		<h2 class="writeTitle">글쓰기</h2>
	</c:if>
	<hr class="writeHr">
	<form method="post" class="writeForm" enctype="multipart/form-data">
		<input name="comup_code" id="comup_code" type="hidden" value="${commContent.comup_code}">
		<input name="m_id" id="m_id" type="hidden" value="<%= mainId %>">
		<div class="inputGroup">
			<div class="categoryLabel inputLabel">
				<label for="category">카테고리</label> 
				<select id="category" name="comuc_code" class="selectBox">
					<option selected="selected">====== 카테고리 선택 ======</option>
					<option value="88000">궁금해요</option>
					<option value="88001">추천해요</option>
					<option value="88002">꿀팁공유</option>
					<option value="88003">비하인드</option>
					<option value="88004">일상</option>
				</select>
			</div>
			<div class="titleLabel inputLabel">
				<label for="title">제목</label>
				<input type="text" id="title" name="comup_title" class="inputField" value="${commContent.comup_title}">
			</div>
			<div class="imageContainer">
				<div class="imageNameContainer">
					<label class="imgname">사진</label> 
					<!-- 이미지 정보가 존재하지 않을시 호출 -->
					<c:if test="${commContentImgList eq null}">
						<button class="imgPlusBtn">+</button>
					</c:if>
				</div>
				<div class="imgPreview"><!-- 불러온 파일 미리보기 -->
					<!-- 이미지 정보가 존재할시 호출 -->
					<c:if test="${commContentImgList ne null}">
						<c:forEach items="${commContentImgList}" var="MainCommVO">
							<img alt="POST 사진" src="./resources/img/DBServer/${MainCommVO.cpp_spname}">
						</c:forEach>
					</c:if>
				</div>
				<div class="comOpenArea"><!-- 파일 불러오기 버튼 --></div>
				<div class="nonebox"></div>
			</div>
			<div class="contentLabel inputLabel">
				<label for="content">내용</label>
				<textarea id="content" name="comup_content" rows="10" cols="50" class="textField">${commContent.comup_content}</textarea>
			</div>
		</div>
		
		<!-- 수정 정보가 존재할시 호출 -->
		<c:if test="${commContent ne null}">
			<button type="submit" class="submitButton modifyBtn">수정하기</button>
		</c:if>
		<!-- 수정 정보가 존재하지 않을시 호출 -->
		<c:if test="${commContent eq null}">
			<button type="submit" class="submitButton insertBtn">등록하기</button>
		</c:if>
		
	</form>
	<hr class="writeHr">
</div>
<!-- contentsWrap -->
<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
</body>
</html>
