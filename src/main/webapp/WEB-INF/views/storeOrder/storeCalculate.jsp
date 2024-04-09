<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet"
	type="text/css">
<title>SUJE</title>
<link rel="stylesheet" href="./resources/css/storeOrder/calculate.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


$(function(){
	
	$(".storeCategoryArea>li:nth-child(4)>a").addClass("checkedStateFirstCategory");	
	
	$(".monthSelect").off('change').change(monthSelectEvent);
	
	var selectValue = "${month}";
	
	
	$(".monthSelect option").each(function(){
		if($(this).val() == selectValue){
			$(this).prop('selected', true);
		}
	});
});

function monthSelectEvent(){
	
	var monthVal = $(this).val();
	location.href = "storeCalculate.do?id=${id}&month=" + monthVal;
	
}

</script>
</head>
<body>
	<%@ include file="../../views/headerHtml/storeHeader.jsp"%>
	<div class="storeContentsWrap">
		<jsp:include page="../../views/storeAdmin/storeSubMenuBar.jsp"></jsp:include>
		<!-- storeSubMenuBox -->
		<div class="storeContentsBox">
			<h1 class="title">정산 관리</h1>
			<hr class="hr">
			<div class="month-selector" style="display: inline-block;">
				<label for="month">월별 조회</label> 
				<select id="month" class="monthSelect" name="month">
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
			</div>
			<div class="table-wrapper">
				<table>
					<thead>
						<tr>
							<th>주문유형</th>
							<th>주문번호</th>
							<th>결제금액</th>
							<th>결제일자</th>
							<th>구매확정일자</th>
							<th>수수료</th>
							<th>정산 금액</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="totalCommissionSum" value="0" />
						<c:forEach items="${calculateList}" var="calculate">
							<tr data-s_id="${calculate.s_id}">
								<td>${calculate.title}</td>
								<td>${calculate.code}</td>
								<td>${calculate.sum}</td>
								<td><fmt:parseDate value="${calculate.pdate}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
										value="${parsedDate}" pattern="yyyy/MM/dd" /></td>
								<td><fmt:parseDate value="${calculate.ckdate}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" /> <fmt:formatDate
										value="${parsedDate}" pattern="yyyy/MM/dd" /></td>
								<td>${calculate.commission}</td>
								<td>${calculate.commission_sum}</td>
							</tr>
							<c:set var="totalCommissionSum" value="${totalCommissionSum + calculate.commission_sum}" />
						</c:forEach>
						<tr>
							<td colspan="6" style="text-align: center;">
							<strong><span class="total-amount">총 정산 금액</span></strong>
							</td>
							<td>
							<strong><span class="total-amount">${totalCommissionSum}</span></strong>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


	</div>
	<!-- storeContentsBox -->
	</div>
	<!-- storeContentsWrap -->
	<%@ include file="/WEB-INF/views/headerHtml/footer.jsp" %>
</body>
</html>