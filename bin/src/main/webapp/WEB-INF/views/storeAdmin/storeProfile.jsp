<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css"> 
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
	$(".storeCategoryArea>li:nth-child(1) .storeSecondCategoryArea li:nth-child(1)").addClass("checkedStateSecondCategory");
	
	var cateState = ${vo.catem_code};
	
	$('.CatemSelecBox option').each(function(){
	    if($(this).val()==cateState){
			$(this).prop('selected', true);
	    }
	});
	
}); 

</script>

<title>SUJE</title>
<link rel="stylesheet" href="./resources/css/storeAdmin/storeProfile.css" />
</head>
<body>
<%@ include file="../../views/headerHtml/storeHeader.jsp" %>
<div class="storeContentsWrap">
<jsp:include page="storeSubMenuBar.jsp"></jsp:include>
		<!-- storeSubMenuBox --> 
		<div class="storeContentsBox">

			<h1 class="store_mainTitle ">스토어 페이지 관리</h1>
			<hr>

			<form action="updateStoreProfile.do" method="post" class="form-container" enctype="multipart/form-data">
				<label for="storeName">스토어명</label> 
				<input type="hidden" id="s_id" name="s_id" class="text-box" value="${vo.s_id}" />
				<input type="hidden" id="s_pass" name="s_pass" class="text-box" value="${vo.s_pass}" />
				<input type="text" id="s_name" name="s_name" class="text-box" value="${vo.s_name}" />
				<br/>
				<label for="storeCategory">스토어 카테고리</label> 
				<select id="catem_code" name="catem_code" class="CatemSelecBox">
					
					<c:forEach items="${cateMain }" var="vo">
						<option value="${vo.catem_code}">${vo.catem_name}</option>
					</c:forEach><!-- 카테고리 대분류 -->
					
				</select>


            <div class="image-container">
                <label for="storeProfile">스토어 프로필 이미지</label> 
                <!-- 프로필 이미지가 비어있을 시 노출 -->
            	<c:if test="${empty vo.s_spname}">
	                <img id="profilePreview" src="./resources/img/store_profile.png" alt="프로필 이미지 미리보기">
				</c:if>
                <!-- 프로필 이미지가 존재할 시 노출 -->
            	<c:if test="${not empty vo.s_spname}">
	                <img id="profilePreview" src="./resources/img/DBServer/${vo.s_spname}" alt="프로필 이미지 미리보기">
				</c:if>
                <input type="file" name="profileImage" class="fileInput">
                  <!-- <span class="fileLabel"></span> -->
 			</div>
                
             <div class="image-container">
             <label for="storeBackimg">스토어 배경 이미지</label>
	                <!-- 백그라운드 이미지가 비어있을 시 노출 -->
	            	<c:if test="${empty vo.s_back_spname}">
	                    <img id="backimgPreview" src="./resources/img/store_profile_back.png" alt="배경 이미지 미리보기">
					</c:if>
	                <!-- 백그라운드 이미지가 존재할 시 노출 -->
	            	<c:if test="${not empty vo.s_back_spname}">
	                    <img id="backimgPreview" src="./resources/img/DBServer/${vo.s_back_spname}" alt="배경 이미지 미리보기">
					</c:if>
                <input type="file" name="backgroundImage" class="fileInput">
                  <!-- <span class="fileLabel"></span> -->
            </div>
				<label for="storeDescription">스토어 소개문구</label> 
				<input type="text" name="s_text" class="text-box2" value="${vo.s_text}" /> 
				<span style="color: gray; font-size: 12px;" >(100자 이하)</span>
				<div class="button-container">
					<button>수정하기</button>
				</div>
			</form>
		</div> 
		<!-- storeContentsBox -->
	</div>
	<!-- storeContentsWrap -->
	<footer></footer>
</body>
<script type="text/javascript">
$(function() {
//파일 이미지 불러오기
$(document).on('change', '.fileInput', function(event) {
   var imgBox = $(this).siblings("img");
   var reader = new FileReader();
   reader.onload = function() {
      imgBox.attr("src", reader.result);
   };
   reader.readAsDataURL(event.target.files[0]);
   
   var fileName = $(this).val().split('\\').pop(); // 파일 경로에서 파일명만 추출
   $(this).siblings('.fileLabel').text(fileName); // 파일명 표시
});
})
</script>
</html>