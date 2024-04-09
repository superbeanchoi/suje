<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>	
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css"> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
 
 $(function() {
		 $(".storeCategoryArea>li:nth-child(1)>a").addClass("checkedStateFirstCategory");
		 $(".storeCategoryArea>li:nth-child(1) .storeSecondCategoryArea li:nth-child(2)").addClass("checkedStateSecondCategory");
	
	});

 
 $(function() {
<% if (request.getAttribute("notiComplete") != null) { %>
		var notiComplete = "<%= request.getAttribute("notiComplete") %>";
		alert(notiComplete);
<% } %>
	    $(".noticeListDetail").click(function() {
	        // 클릭한 공지 번호와 스토어 아이디를 가져옵니다.
	        const notiNum = $(this).find("td:first-child").text();
	        const id = $(this).data("s_id");  // JSP 코드를 사용하여 스토어 아이디를 가져옵니다.
	        
	        // 공지 번호와 스토어 아이디를 포함하여 URL을 구성합니다.
	        const url = "getNotiInfo.do?notiNum=" + notiNum + "&id=" + id;
	        
	        // 새로운 URL로 이동합니다.
	        location.href = url;
	    });
	    
	});
 

	  //공지사항 영역 미리보기
	   $(function() {
	    $('.notiContent').each(function() {
	        var text = $(this).text();
	        if (text.length > 50) {
	            text = text.substring(0, 25) + '...';
	            $(this).text(text);
	        }
	    });
	  });
	  
	  
</script>


<title>SUJE</title>
<link rel="stylesheet" href="./resources/css/storeAdmin/storeNotice.css" />
</head>
<body>
	<%@ include file="../../views/headerHtml/storeHeader.jsp"%>
	<div class="storeContentsWrap">
	 <jsp:include page="storeSubMenuBar.jsp"></jsp:include>
		<div class="storeContentsBox">
			<h1 class="store_mainTitle">스토어 공지 조회/수정</h1>
			<hr class="hr">
			<div class="table-wrapper" >
				<table name="noticeList">
					<thead>
						<tr>
							<th >공지 번호</th>
							<th >공지 유형</th>
							<th >공지 내용</th>
							<th >최초 등록일자</th>
							<th >최근 수정일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${StoreNoticeList }" var="listAll" >
							<tr class="noticeListDetail" data-s_id="${listAll.s_id}">
								<td>${listAll.noti_code }</td>
								<td>
								 <c:choose>
					                <c:when test="${listAll.notit_code eq '2000'}" >공지사항</c:when>
					                <c:when test="${listAll.notit_code eq '2001'}">배송안내</c:when>
					                <c:when test="${listAll.notit_code eq '2002'}">주문안내</c:when>
					                <c:otherwise>선택사항없음</c:otherwise>
					            </c:choose>
					            </td>
								<td class="notiContent">${listAll.noti_content }</td>
								<td>
									<fmt:parseDate value="${listAll.notir_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd HH:mm" />
								</td>
								<td>
									<fmt:parseDate value="${listAll.notim_date}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy/MM/dd HH:mm" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br /> <br />
			<hr class="hr">
			<h1 class="store_mainTitle">스토어 공지 수정</h1>
 
			<c:if test="${not empty getListVO}">
				<form class="store_mainInfo" action="modifyNotiInfo.do" method="post">
					<div class="store_subCategory">
						<input type="hidden" name="s_id" value= "${getListVO.s_id}">
						<input type="hidden" name="notir_date" value= "${getListVO.notir_date}">
						<input type="hidden" name="noti_code" value= "${getListVO.noti_code}">
						<label class="store_subTitle">공지 유형</label>  
						<select	class="notiInfo_selectBox" name="notit_code" id="notit_code">
							<c:choose>
			                    <c:when test="${getListVO.notit_code == '2000'}">
			                        <option value="${getListVO.notit_code}" selected>공지사항</option>
			                        <option value="2001">배송안내</option>
			                        <option value="2002">주문안내</option>
			                    </c:when>
			                    <c:when test="${getListVO.notit_code == '2001'}">
			                        <option value="${getListVO.notit_code}" selected>배송안내</option>
			                        <option value="2000">공지사항</option>
			                        <option value="2002">주문안내</option>
			                    </c:when>
			                    <c:when test="${getListVO.notit_code == '2002'}">
			                        <option value="${getListVO.notit_code}" selected>주문안내</option>
			                        <option value="2000">공지사항</option>
			                        <option value="2001">배송안내</option>
			                    </c:when>
			                     <c:otherwise>
			                     	<option value="" selected>선택사항없음</option>
						            <option value="2000">공지사항</option>
						            <option value="2001">배송안내</option>
						            <option value="2002">주문안내</option>
			                     </c:otherwise>
			                </c:choose>
						</select>
					</div>
					<div class="store_subCategory">
						<label class="store_subTitle">공지 내용</label><br />
						<textarea class="notiInfo_content" name="noti_content">${getListVO.noti_content}</textarea>
					</div>
					<!-- 수정하기 -->
					<button class="submitBtn" name="modifyBtn" id="modifyBtn" >수정하기</button>
				</form>
					<!-- 삭제하기 -->
			    <form action="deleteNotiInfo.do" method="post">
					    <input type="hidden" name="s_id" value= "${getListVO.s_id}">
						<input type="hidden" name="notir_date" value= "${getListVO.notir_date}">
						<input type="hidden" name="notim_date" value= "${getListVO.notim_date}">
						<input type="hidden" name="noti_content" value= "${getListVO.noti_content}">
					    <input type="hidden" name="notiNum" value="${getListVO.noti_code}">
					    <input type="hidden" name="notitNum" value="${getListVO.notit_code}">
			        <button class="submitBtn" type="submit" id="deleteBtn">삭제하기</button>
			    </form>
			</c:if>
			
			<c:if test="${empty getListVO}">
				<form class="store_mainInfo">
					<div class="store_subCategory">
						<label class="store_subTitle">공지 유형</label> <select
							class="notiInfo_selectBox" name="notit_code">
							<option value="">======선택======</option>
							<option value="2000">공지사항</option>
							<option value="2001">배송안내</option>
							<option value="2002">주문안내</option>
						</select>
					</div>
					<div class="store_subCategory">
						<label class="store_subTitle">공지 내용</label><br />
						<textarea class="notiInfo_content" name="noti_content" placeholder="내용을 입력하세요"></textarea>
					</div>
				</form>
			</c:if>
		</div>

	</div>
	<!-- storeContentsBox -->
	</div>
	<!-- storeContentsWrap -->
	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
</body>
</html>