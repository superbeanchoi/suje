<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap"
	rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet"
	type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css"> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUJE</title>
<link rel="stylesheet" href="./resources/css/storeOrder/calculate.css" />

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
				<select id="month" name="month">
					<option value="01">1월</option>
					<option value="02">2월</option>
					<option value="03">3월</option>
					<option value="04">4월</option>
					<option value="05">5월</option>
					<option value="06">6월</option>
					<option value="07">7월</option>
					<option value="08">8월</option>
					<option value="09">9월</option>
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
							<th>구매확정일자</th>
							<th>정산일자</th>
							<th>수수료</th>
							<th>정산 금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<tr>
							<td>123456</td>
							<td>123456</td>
							<td>11,900</td>
							<td>2024-03-16</td>
							<td>2024-03-16</td>
							<td>1,900</td>
							<td>10,000</td>
						</tr>
						<!-- 추가적인 공지사항 행을 필요한 만큼 추가할 수 있습니다 -->
						<tr>
							<td colspan="6" style="text-align: center;"><strong><span
									class="total-amount">총 정산 금액</span></strong></td>
							<td><strong><span class="total-amount">$총 금액</span></strong></td>
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