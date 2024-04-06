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
<title>Insert title here</title>
<style type="text/css">

	form{
	
		
		margin-top:300px;
		margin-left: 300px;
		
	}


</style>
</head>
<body>

<form action="getFileValue.do" method="post" enctype="multipart/form-data">
	
	<input type="file" name="file"/>
	<input type="text" name="textTest1"/>
	<input type="text" name="textTest3"/>

	<input type="submit" value="전송 테스트"/> 
	
</form>

	<img width="300px"  height="300px" alt="" src="./resources/DB/${vo.rvp_ppath }" />

</body>
</html>