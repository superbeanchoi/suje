<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벌점 관리</title>
</head>
<body>
<h1>스토어 벌점 관리</h1>

<h2>벌점 부여</h2>
<fieldset>
    <label for="storeId">스토어 아이디:</label>
    <input type="text" id="storeId" name="storeId" placeholder="아이디 검색">
    <!-- Enter 키 입력으로 검색하기 위한 폼 제출 -->
    <input type="submit" value="검색">
    <br>
    부여 벌점: <input type="number" id="penaltyPoints" name="penaltyPoints"> 점
    <br>
    벌점 사유: <br>
    <textarea id="penaltyReason" name="penaltyReason" rows="4" cols="50"></textarea>
</fieldset>

<h2>벌점 내역</h2>
<table>
    <thead>
        <tr>
            <th>관리자 아이디</th>
            <th>스토어 아이디</th>
            <th>부여 벌점</th>
            <th>벌점 사유</th>
            <th>업데이트 일자</th>
            <th>누적 벌점 점수</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>bean</td>
            <td>cake123</td>
            <td>2</td>
            <td>이유없는 환불거절</td>
            <td>XXXX/XX/XX</td>
            <td>10</td>
        </tr>
        <!-- 이하 추가적인 내역들을 추가할 수 있습니다. -->
    </tbody>
</table>

<p>벌점 내역</p>
<table>
  <thead>
    <tr>
      <th>관리자 아이디</th>
      <th>스토어 아이디</th>
      <th>부여 벌점</th>
      <th>벌점 사유</th>
      <th>업데이트 일자</th>
      <th>누적 벌점 점수</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>bean</td>
      <td>cake123</td>
      <td>2</td>
      <td>이유없는 환불거절</td>
      <td>XXXX/XX/XX</td>
      <td>10</td>
    </tr>
    
  </tbody>
</table>
</body>
</html>