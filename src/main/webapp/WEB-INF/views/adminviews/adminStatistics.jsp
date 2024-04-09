<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SUJE</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/admincss/adminStatics.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="./resources/js/adminjs/adminStatisticJs.js"></script>
<script type="text/javascript">
$(function() {
    $('.adminCategoryArea li:nth-child(1) a').addClass('checkedStateFirstCategory');
});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="../../views/headerHtml/adminHeader.jsp"%>
<div class="adminContentsWrap">
	<%@ include file="../../views/headerHtml/adminSubMenuForm.jsp"%>
	<div class="adminContentsBox">
		<h2 class="adminTitle">통계 관리</h2>
		<hr class="adminHr">
		<div class="statisticBox">
			<div class="statisticHalfBox">
				<div class="statisticTitle">
					<div class="statisticAreaTitle">오늘의 SUJE</div>
					<div class="statisticAreaTitleDate">${todaySuje.today}</div>
				</div>
				<table class="todaySujeTable" style="display:none;">
					<thead>
						<tr>
							<td>오늘의 가입 회원</td>
							<td>오늘의 입점 스토어</td>
							<td>오늘의 결제 횟수</td>
							<td>오늘의 결제 금액</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${todaySuje.midcount}</td>
							<td>${todaySuje.sidcount}</td>
							<td>${todaySuje.psumcount}</td>
							<td>${todaySuje.psumtotal}</td>
						</tr>
					</tbody>
				</table>
				<div class="statisticAreaHalf">
					<canvas class="todaySujeChart1" style="width: 545px; height: 190px;"></canvas>
					<canvas class="todaySujeChart2" style="width: 545px; height: 90px;"></canvas>
				</div>
			</div>
			
			<div class="statisticHalfBox">	
				<div class="statisticTitle">
					<div class="statisticAreaTitle">카테고리별 SUJE 매출</div>
					<div class="statisticAreaTitleDate">${weekPeriod.weekperiod}</div>
				</div>
				<table class="catePayTable" style="display:none;">
					<thead>
						<tr>
							<c:forEach items="${catePay}" var="cate" >
								<td>${cate.catem_name}</td>
							</c:forEach>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach items="${catePay}" var="pay" >
								<td>${pay.psumtotal}</td>
							</c:forEach>
						</tr>
					</tbody>
				</table>
				<div class="statisticAreaHalf">
					<canvas class="catePayChart" style="width: 500px; height: 280px; margin: 0 auto;"></canvas>
				</div>
			</div>
		</div>
		<div class="statisticBox">
			<div class="statisticTitle">
				<div class="statisticAreaTitle">SUJE 가입 회원 통계</div>
				<div class="statisticAreaTitleDate">${weekPeriod.weekperiod}</div>
			</div>
			<table class="memberSexTable" style="display:none;">
				<thead>
					<tr>
						<td>남성</td>
						<td>여성</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${memberSex.mancount}</td>
						<td>${memberSex.womancount}</td>
					</tr>
				</tbody>
			</table>
			<table class="memberAgeTable" style="display:none;">
				<thead>
					<tr>
						<td>10대</td>
						<td>20대</td>
						<td>30대</td>
						<td>40대</td>
						<td>50대 이상</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${memberAge.agearound10}</td>
						<td>${memberAge.agearound20}</td>
						<td>${memberAge.agearound30}</td>
						<td>${memberAge.agearound40}</td>
						<td>${memberAge.agearound50}</td>
					</tr>
				</tbody>
			</table>
			<div class="statisticArea">
				<canvas class="memberSexChart" style="width: 410px; height: 280px; margin: 0 40px; float:left;"></canvas>
				<canvas class="memberAgeChart" style="width: 600px; height: 280px; margin: 0 20px; float:right;"></canvas>
			</div>
		</div>
		
		<div class="statisticBox">
			<div class="statisticTitle">
				<div class="statisticAreaTitle">SUJE 총매출 현황</div>
				<div class="statisticAreaTitleDate">${weekPeriod.weekperiod}</div>
			</div>
			<table class="totalDateSalesTable" style="display:none;">
				<thead>
					<tr>
						<td>매출 일자</td>
						<td>총 매출액</td>
						<td>총 수익</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${totalDateSales}" var="sales" >
						<tr>
							<td>${sales.paydate}</td>
							<td>${sales.psumtotal}</td>
							<td>${sales.psumsales}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<table class="totalSalesTable" style="display:none;">
				<thead>
					<tr>
						<td>총 매출액</td>
						<td>총 수익</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${totalSales.psumtotal}</td>
						<td>${totalSales.psumsales}</td>
					</tr>
				</tbody>
			</table>
			<div class="statisticArea">
				<canvas class="totalDateSalesChart" style="height: 280px; margin: 0 auto; float:left;"></canvas>
				<canvas class="totalSalesChart" style="height: 280px; margin: 0 auto; float:right;"></canvas>
			</div>
		</div>
		
	</div> <!-- adminContentsBox -->
</div> <!-- adminContentsWrap -->
<%@ include file="../../views/headerHtml/footer.jsp" %>
</body>
</html>
