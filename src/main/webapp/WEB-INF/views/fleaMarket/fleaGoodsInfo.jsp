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
<link rel="stylesheet" href="./resources/css/fleaMarket/fleaGoodsInfo.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
$(function() {
	
<% 
String storeId = (String)session.getAttribute("mainId");
%>
	
	// 서브 메뉴바 클래스명 추가 // CSS 적용
	$(".storeCategoryArea>li:nth-child(2)>a").addClass("checkedStateFirstCategory");	
	$(".storeCategoryArea>li:nth-child(2) .storeSecondCategoryArea li:nth-child(2)").addClass("checkedStateSecondCategory");
	
	
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

});

</script>

</head>
<body>
<%@ include file="../../views/headerHtml/storeHeader.jsp" %>
<div class="storeContentsWrap">
<jsp:include page="../storeAdmin/storeSubMenuBar.jsp"></jsp:include>

		<div class="storeContentsBox">
			<h1 class="store_mainTitle">플리마켓 상품 등록</h1>
			<hr/>

			<form method="post"  class="store_mainInfo"  enctype="multipart/form-data" action="insertFleaGoodsInfo.do">
			
			<input name="s_id" id="s_id" type="hidden" value="<%= storeId %>">
			
			
				<div class="store_subCategory">
					<label class="store_subTitle">상품 카테고리</label>
					<!-- 대분류 --> 
					<select class="goodsInfo_selectBox_First" name="catem_name" id="catemName">
						<c:forEach items="${cateMainList}" var="vo">
							<option value="${vo.catem_code}">${vo.catem_name}</option>
						</c:forEach>
					</select> 
					
					<select class="goodsInfo_selectBox_Secound" name="catemm_name" id="catemmName">
						<!-- 중분류 -->
					</select> 
					
					<select class="goodsInfo_selectBox_Third" name="cates_code" id="catesName">
						<!-- 소분류 -->
					</select>
				</div>
				
				<div class="store_subCategory">
					<label class="store_subTitle">상품 메인 이미지</label> 
					<div class="goodsMainImg goodsImg">
						<img class="goodsImg" alt="메인이미지" src="./resources/img/goodsImgArea.png">
						<input type="file" class="fileInput" name="fleaupMainimg">
					</div>	
				</div>

				<div class="store_subCategory">
					<label class="subImgTitle">상품 서브 이미지</label>
 					<c:forEach begin="1" end="3">
						<div class="goodsSubImg goodsImg">
							<img class="goodsImg" alt="서브이미지" src="./resources/img/goodsImgArea.png">
							<input type="file" class="fileInput" name="fleaupSubimg">
						</div>
					</c:forEach>
				</div>

				<div class="store_subCategory">
					<label class="store_subTitle">상품 가격</label> 
					<input type="text" class="text-box" name="f_sum" id="goodsPrice"/>원
				</div>

				<div class="store_subCategory">
					<label class="store_subTitle">상품 총 수량</label> 
					<input type="text" class="text-box" name="f_num" id="goodsNum"/>개
				</div>

				<div class="store_subCategory">
					<label class="store_subTitle">상품 내용</label><br />
					<textarea class="goodsInfo_content" name="f_content" id="goodsInfoContent" placeholder="내용을 입력하세요"></textarea>
				</div>

				<button class="insertBtn" name="insertBtn">등록하기</button>
			</form>
		</div> <!-- storeContentsBox -->
	</div> <!-- storeContentsWrap -->
	<footer></footer>
</body>
</html>