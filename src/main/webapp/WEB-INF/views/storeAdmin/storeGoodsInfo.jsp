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
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css">
<title>SUJE</title>
<link rel="stylesheet" href="./resources/css/storeAdmin/storeGoodsInfo.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(function() {
	
	<% 
	String storeId = (String)session.getAttribute("mainId");
	%>
		<% if (request.getAttribute("insertStoreInfoSuccess") != null) { %>
		var insertStoreInfoSuccess = "<%= request.getAttribute("insertStoreInfoSuccess") %>";
		alert(insertStoreInfoSuccess);
	<% } %>
		
		// 서브 메뉴바 클래스명 추가 // CSS 적용
		$(".storeCategoryArea>li:nth-child(1)>a").addClass("checkedStateFirstCategory");	
		$(".storeCategoryArea>li:nth-child(1) .storeSecondCategoryArea li:nth-child(5)").addClass("checkedStateSecondCategory");

	
	//파일 이미지 불러오기
	  $(document).on('change', '.fileInput', function(event) {
		  var fileInput = $(this);
	        var reader = new FileReader();
	        reader.onload = function() {
	        	fileInput.closest(".goodsImg").find(".goodsImg").attr("src", reader.result);
	        };
	        reader.readAsDataURL(event.target.files[0]);
	    });

	
	
	// 중분류 처리
	$(".goodsInfo_selectBox_First").change(function(){
	    
	    let cateMidCode = $(this).val();
	    
	    $.ajax({
	       type : "post",
	       url : "getCateMidList.do",
	       data : {
	           cateMidCode : cateMidCode
	       },
	       dataType : "json",
	       contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
	       beforeSend : function(){
	          $(".goodsInfo_selectBox_Secound").empty();
	       },
	       success : function(data){
	           
	    	   console.log(data);
	           for(var i = 0; i<data.length; i++){
	             $(".goodsInfo_selectBox_Secound").append(
	                "<option value=" + data[i].catemm_code +">" + data[i].catemm_name  + "</option>"
	             );
	           }
	       },
	       error: function(request, status, error) {
	                   alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
	       }
	    });
	});
	
	$(".goodsInfo_selectBox_Secound").change(function(){
		
	      let cateMidCode = $(this).val();
	      
	      $.ajax({
	          type : "post",
	         url : "cateSubCode.do",
	         data : {
	             cateMidCode : cateMidCode
	         },
	         dataType : "json",
	         contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
	         beforeSend : function(){
	            $(".goodsInfo_selectBox_Third").empty();
	         },
	         success : function(data){
	             
	             for(var i = 0; i<data.length; i++){
	               $(".goodsInfo_selectBox_Third").append(
	                  "<option value=" + data[i].cates_code +">" + data[i].cates_name  + "</option>"
	               );
	             }
	         },
	         error: function(request, status, error) {
	                     alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
	         }
	      });

});
	
}); //function
    
</script>
</head>
<body>
<%@ include file="../../views/headerHtml/storeHeader.jsp" %>
<div class="storeContentsWrap">
<jsp:include page="storeSubMenuBar.jsp"></jsp:include>
 <!-- storeSubMenuBox -->
		<div class="storeContentsBox">
			<h1 class="store_mainTitle">스토어 작품 등록</h1>
			<hr/>

			<form class="store_mainInfo" action="insertStoreGoodsInfo.do" method="post" enctype="multipart/form-data">
			
			<input name="s_id" id="s_id" type="hidden" value="<%= storeId %>">
			
			 <div class="store_subCategory">
					<label class="store_subTitle">작품 카테고리</label>
					<!-- 대분류 --> 
					<select class="goodsInfo_selectBox_First" name="catem_name" id="catemName" >

							<option value="${store.catem_code}">${store.catem_name}</option>

					</select> 
					
					<select class="goodsInfo_selectBox_Secound" name="catemm_name" id="catemmName">
						<option>==== 선택 ====</option>
						<c:forEach items="${cateMidList}" var="vo">
							<option value="${vo.catemm_code}">${vo.catemm_name}</option>
						</c:forEach>
					</select> 
					
					<select class="goodsInfo_selectBox_Third" name="cates_code" id="catesName">
						<!-- 소분류 -->
					</select>
				</div>
				
				
				
				<div class= "store_subCategory"> 
					<label class="store_subTitle" >작품 메인 이미지</label>
					<div class="goodsMainImg goodsImg">
						<img class="goodsImg" alt="메인이미지" src="./resources/img/goodsImgArea.png">
						<input type="file" class="fileInput" name="goodsupMainimg">
					</div>
				</div>
				
				<div class= "store_subCategory">
					<label class="subImgTitle">작품 서브 이미지</label>
					<c:forEach begin="1" end="3">
						<div class="goodsSubImg goodsImg">
							<img class="goodsImg" alt="서브이미지" src="./resources/img/goodsImgArea.png">
							<input type="file" class="fileInput" name="goodsupSubimg">
						</div>
					</c:forEach>
				</div>
				
				<div class= "store_subCategory">
					<label class="store_subTitle">작품 상세 내용</label><br />
					<textarea class="goodsInfo_content" name="g_content" placeholder="내용을 입력하세요"></textarea>
				</div>
				
				<button  class="insertBtn" name="insertBtn">등록하기</button>
			</form>
		</div> <!-- storeContentsBox -->
	</div> <!-- storeContentsWrap -->
	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
</body>
</html>