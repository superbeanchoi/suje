<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
<link rel="stylesheet"
	href="./resources/css/fleaMarket/fleaGoodsSearchUpdate.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">

	$(function() {
	
		//등록되었습니다. alert
		<% if (request.getAttribute("insertFleaInfoSuccess") != null) { %>
			var insertFleaInfoSuccess = "<%= request.getAttribute("insertFleaInfoSuccess") %>";
			alert(insertFleaInfoSuccess);
		<% } %>
		
		//삭제되었습니다. alert
		<% if (request.getAttribute("fleaInfoSuccess") != null) { %>
			var fleaInfoSuccess = "<%= request.getAttribute("fleaInfoSuccess") %>";
			alert(fleaInfoSuccess);
		<% } %>
	
		// 서브 메뉴바 클래스명 추가 // CSS 적용
		$(".storeCategoryArea>li:nth-child(2)>a").addClass("checkedStateFirstCategory");	
		$(".storeCategoryArea>li:nth-child(2) .storeSecondCategoryArea li:nth-child(1)").addClass("checkedStateSecondCategory");
		
		
		// 상단 공지 리스트 글자 압축 // 30글자
		$('.goodsContentList').each(function() {
			var text = $(this).text();
			if (text.length > 10) {
				text = text.substring(0, 10) + '...';
				$(this).text(text); 
			}
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
		
		// 상단 공지 행 클릭 이벤트
		$('.goodsListDetail').click(function(){
			
			const idValue = $(this).data('s_id'); // id값
			const fCodeValue = $(this).children().eq(0).text(); // 플리마켓 상품번호
			
			 $.ajax({
				type : "get",
				url : "getFleaInfo.do",
				data : {
				    id : idValue,
				    fleaNum : fCodeValue
				},
				dataType : "json",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				success : function(data) {
					
					var firstCate = data["getFleaListVO"].catem_code;
					var firstCateName = data["getFleaListVO"].catem_name;
					var secondCate = data["getFleaListVO"].catemm_code;
					var secondCateName = data["getFleaListVO"].catemm_name;
					var thirdCate = data["getFleaListVO"].cates_code;
					var thirdCateName = data["getFleaListVO"].cates_name;
					
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
					
					
					//상품 코드/아이디값(히든)
		 			 $("input[name='f_code']").val(fCodeValue);
		 			 $("input[name='s_id']").val(idValue);
		 			//상품 가격
		 			const fSum = data["getFleaListVO"].f_sum;
		 			 $("input[name='f_sum']").val(fSum);
		 			
		 			 
		 			//상품 총 수량
		 			const fNum = data["getFleaListVO"].f_num;
		 			 $("input[name='f_num']").val(fNum);
		 			
		 			 
		 			//상품내용 
		 			const fContent = data["getFleaListVO"].f_content;
		 			 $("textarea[name='f_content']").val(fContent);
		 			
		 			
		 			 // 상품 메인 이미지 설정
		 	        const mainImg = data["getFleaListVO"].f_spname;
		 	         $(".goodsMainImg img").attr("src", "./resources/img/DBServer/"+mainImg);
		 	     
		 	       
		 	        // 상품 서브 이미지 설정
		 	        if(data["getSubImgListVO"] != null){
		 	           // 서브 이미지가 있는 경우에만 실행
		 	           for(var i = 0; i < data["getSubImgListVO"].length; i++) {
		 	               var subImg = data["getSubImgListVO"][i].fs_spname;
		 	               $(".goodsSubImg img").eq(i).attr("src", "./resources/img/DBServer/"+subImg);  
				 	       console.log("1111111111111111111111 >>>>>>>>>>"+data["getSubImgListVO"][i].fs_spname);
		 	           }  
		 	       }
		 	           
		 			 
				} //ajax function
			}); //ajax
		}); // click event function
	}); //function
	
	//상품 목록 수정 버튼 이벤트
 	function modifyBtn() {
		
 		var formsId = $("#s_id").val();
	    var formCateScode = $(".goodsInfo_selectBox_Third option:selected").val();
	    var formPrice = $("#goodsPrice").val();
	    var formContent = $("#goodsInfoContent").val();
	    var formNum = $("#goodsNum").val();
		var formFcode = $("#f_code").val();
        
		$.ajax({
			url : "modifyGoodsSU.do",
			type : "post",
			data : {f_code : formFcode,
					s_id : formsId,
					cates_code : formCateScode,
					f_sum : formPrice,
					f_num : formNum,
					f_content : formContent},
					
			success : function(data){
				alert("수정되었습니다.")
				location.href = "fleaGoodsListAll.do?id=<%=(String)session.getAttribute("mainId")%>"; 
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
		<jsp:include page="../storeAdmin/storeSubMenuBar.jsp"></jsp:include>
		<div class="storeContentsBox">
			<h1 class="store_mainFistTitle">플리마켓 상품 조회/수정</h1>
			<hr />
			<h1 class="store_maintitle">상품 조회</h1>
			<div class="fleaSearch-table">
				<div class="table-wrapper">
					<table id=>
						<thead>
							<tr>
								<th>상품등록번호</th>
								<th>상품 카테고리</th>
								<th>상품 내용</th>
								<th>상품 금액</th>
								<th>상품 수량</th>
								<th>등록일자</th>
								<th>수정일자</th>
								<th>판매여부</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${fleaGoodsListAll}" var="listAll">
								<tr class="goodsListDetail" data-s_id="<%= mainId %>" data-f_code="${listAll.f_code}">
									<td>${listAll.f_code}</td>
									<td>${listAll.cates_name}</td>
									<td class="goodsContentList">${listAll.f_content}</td>
									<td>${listAll.f_sum}</td>
									<td>${listAll.f_num}</td>
									<td id="listfDate"><fmt:parseDate value="${listAll.f_date}"
											pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
											value="${parsedDate}" pattern="yyyy/MM/dd" /></td>
									<td id="listRedate"><fmt:parseDate value="${listAll.f_redate}"
											pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
											value="${parsedDate}" pattern="yyyy/MM/dd" /></td>
									<td>${listAll.f_ck}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- table-wrapper -->
			</div>
			<!-- fleaSearch-table -->


			<hr />
			<h1 class="store_maintitle">상품 수정</h1>
			<form id="modifyForm" name= "modifyForm" class="store_mainInfo" method="post">
			
			<input type="hidden" name="f_code" id="f_code" />
			<input type="hidden" name="s_id" id="s_id"/>
			
			
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


				<div class="store_Box">
					<label class="store_subTitle">상품 메인 이미지</label> 
					<div class="goodsMainImg goodsImg">
						<img alt="메인이미지" src="./resources/img/goodsImgArea.png">
					</div>	
				</div>

				<div class="store_Box">
					<label class="subImgTitle">상품 서브 이미지</label>
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
					<label class="store_subTitle">상품 가격</label> 
					<input type="text" class="text-box" name="f_sum" id="goodsPrice"/>원
				</div>

				<div class="store_subCategory">
					<label class="store_subTitle">상품 총 수량</label> 
					<input type="text" class="text-box" name="f_num" id="goodsNum"/>개
				</div>

				<div class="store_TextBox">
					<label class="store_subTitle">상품 내용</label><br />
					<textarea class="goodsInfo_content" name="f_content" id="goodsInfoContent"></textarea>
				</div>

				<button type="button" class="submitBtn" onclick="modifyBtn()">수정하기</button>
			</form>
			
			<!-- 삭제하기 -->
			<form action="deleteGoodsSU.do" >
				<input type="hidden" name="f_code"/>
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