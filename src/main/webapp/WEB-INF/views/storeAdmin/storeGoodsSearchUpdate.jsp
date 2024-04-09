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
<link rel="stylesheet" href="./resources/css/storeAdmin/storeGoodsSearchUpdate.css" />
<title>SUJE</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/js/storeAdmin/storeGoodsSearchUpdate.js"></script>
<script>
$(function() {
    <% 
    String storeId = (String)session.getAttribute("mainId");
    %>

    //등록되었습니다 alert
    <% if (request.getAttribute("insertStoreInfoSuccess") != null) { %>
		var insertStoreInfoSuccess = "<%= request.getAttribute("insertStoreInfoSuccess") %>";
		alert(insertStoreInfoSuccess);
	<% } %>

	//삭제되었습니다 alert
    <% if (request.getAttribute("StoreInfoSuccess") != null) { %>
		var StoreInfoSuccess = "<%= request.getAttribute("StoreInfoSuccess") %>";
		alert(StoreInfoSuccess);
	<% } %>

    // 서브 메뉴바 CSS 관련 JS
    $(".storeCategoryArea>li:nth-child(1)>a").addClass("checkedStateFirstCategory");
    $(".storeCategoryArea>li:nth-child(1) .storeSecondCategoryArea li:nth-child(4)").addClass("checkedStateSecondCategory");


        $('.imgColumn-container img').click(function() {
        	
        	const idValue = $(this).data('s_id'); // id값
			const gCodeValue = $(this).data('g_code');
        	
			$.ajax({
				type : "get",
				url : "getGoodsInfo.do",
				data : {
				    id : idValue,
				    goodsNum : gCodeValue
				},
				dataType : "json",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
        	
					var firstCate = data["getGoodsListVO"].catem_code;
					var firstCateName = data["getGoodsListVO"].catem_name;
					var secondCate = data["getGoodsListVO"].catemm_code;
					var secondCateName = data["getGoodsListVO"].catemm_name;
					var thirdCate = data["getGoodsListVO"].cates_code;
					var thirdCateName = data["getGoodsListVO"].cates_name;
					
					//대분류
					$(".goodsInfo_selectBox_First option").each(function(){
						if($(this).text() == firstCateName){
							$(this).prop('selected', true);
						}
					});
					
					//중분류
					$.ajax({
				       type : "post",
				       url : "getCateMidList.do",
				       data : {
				           cateMidCode : firstCate
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
				           
			         		$(".goodsInfo_selectBox_Secound option").each(function(){
								if($(this).text() == secondCateName){
									$(this).prop('selected', true);
								}
							});
				       },
				       error: function(request, status, error) {
			                   alert("중분류 통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
				       }
				    });
					
					//소분류
					$.ajax({
			         type : "post",
			         url : "cateSubCode.do",
			         data : {
			             cateMidCode : secondCate
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
			             
						$(".goodsInfo_selectBox_Third option").each(function(){
							if($(this).text() == thirdCateName){
								$(this).prop('selected', true);
							}
						});
			             
			         },
			         error: function(request, status, error) {
			                     alert("소분류 통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
			         }
			      });
					

					 $("input[name='g_code']").val(gCodeValue);
		 			 $("input[name='s_id']").val(idValue);
					
					
            //메인 이미지
             const mainImg = data["getGoodsListVO"].g_spname;
            $(".goodsMainImg img").attr("src", "./resources/img/DBServer/" + mainImg);

            //서브 이미지
            if(data["getSubImgListVO"] != null){
	 	           // 서브 이미지가 있는 경우에만 실행
	 	           for(var i = 0; i < data["getSubImgListVO"].length; i++) {
	 	               var subImg = data["getSubImgListVO"][i].gs_spname;
	 	               $(".goodsSubImg img").eq(i).attr("src", "./resources/img/DBServer/"+subImg);  
			 	       console.log("1111111111111111111111 >>>>>>>>>>"+data["getSubImgListVO"][i].gs_spname);
	 	           }  
	 	       }

            //컨텐츠
            const gContent = data["getGoodsListVO"].g_content;
			 $("textarea[name='g_content']").val(gContent);

				} //ajax 성공 function
			}); // 이미지컨테이너 ajax
		}); // click event function
	}); //function
	
function modifyBtn() {
		
 	 	var formsId = $("#s_id").val();
	    var formCateScode = $(".goodsInfo_selectBox_Third option:selected").val();
	    var formContent = $("#g_content").val();
		var formGcode = $("#g_code").val();
        
		$.ajax({
			url : "updateGoodsSU.do",
			type : "post",
			data : {g_code : formGcode,
					s_id : formsId,
					cates_code : formCateScode,
					g_content : formContent},
					
			success : function(data){
				alert("스토어 피드가 수정되었습니다.")
				location.href = "storeGoodsMainPage.do?id=<%=(String)session.getAttribute("mainId")%>"; 
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
			}
		}); 
		
	} //modifyBtn()
	
	
	
</script>
</head>
<body>
	<%@ include file="../../views/headerHtml/storeHeader.jsp"%>
	<div class="storeContentsWrap">
		<jsp:include page="storeSubMenuBar.jsp"></jsp:include>

		<div class="storeContentsBox">
			<h1 class="store_mainTitle">스토어 작품 조회/수정</h1>
			<hr />
			<h1 class="store_mainTitle">스토어 작품 조회</h1>

			<hr class="topLine_imgColumn-container">
			<div class="imgColumn-container">
				<c:forEach items="${goodsListAllVO}" var="goodsVO">
					<div class="column">
						<img src="./resources/img/DBServer/${goodsVO.g_spname}"
							data-s_id="${goodsVO.s_id}"
							data-g_code="${goodsVO.g_code}">
					</div>
				</c:forEach>
			</div>
			<hr class="bottomLine_imgColumn-container">
			<hr />
			<h1 class="store_maintitle store_modifyTitle">스토어 작품 수정</h1>
			<form action="updateGoodsSU.do" method="post" class="store_mainInfo">
			<input type="hidden" class="sId" name="s_id" id="s_id"/>
			
				<div class="store_subCategory">
					<label class="store_subTitle">작품 등록 번호</label>
					<input class="goodsCode" type="text" name="g_code" id="g_code" readonly="readonly">
				</div>
				
				<div class="store_subCategory">
					<label class="store_subTitle">작품 카테고리</label>
					<!-- 대분류 --> 
					<select class="goodsInfo_selectBox_First" name="catem_name" id="catemName" disabled>
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
				
				<div class="store_Box">
					<label class="store_subTitle">작품 메인 이미지</label> 
					<div class="goodsMainImg goodsImg">
						<img alt="메인이미지" src="./resources/img/goodsImgArea.png">
					</div>	
				</div>

				<div class="store_Box">
					<label class="subImgTitle store_subTitle">상품 서브 이미지</label>
					<div class="goodsSubImg goodsImg">
						<img alt="서브이미지" src="./resources/img/goodsImgArea.png">
					</div>
					<div class="goodsSubImg goodsImg">
						<img alt="서브이미지" src="./resources/img/goodsImgArea.png">
					</div>
					<div class="goodsSubImg goodsImg">
						<img alt="서브이미지" src="./resources/img/goodsImgArea.png">
					</div>
				</div>

				<div class="store_subCategory">
					<label class="store_subTitle">작품 상세 내용</label><br />
					<textarea class="goodsInfo_content" name="g_content" id="g_content" ></textarea>
				</div>

				<button type="submit" class="submitBtn" onclick="modifyBtn()">수정하기</button>
			</form>
			
			<!-- 삭제하기 -->
			<form action="deleteStoreGoodsSU.do" method="post">
				<input type="hidden" name="g_code" />
				<input type="hidden" name="s_id" value="<%= mainId %>"/>
				
				<button class="submitBtn" name="deleteBtn" id="deleteBtn">삭제하기</button>
			</form>
			
			
		</div>
		<!-- storeContentsBox -->
	</div>
	<!-- storeContentsWrap -->
	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
</body>
</html>