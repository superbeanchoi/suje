<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>SUJE</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/main/mainNewMemberStyle.css" rel="stylesheet" type="text/css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<!-- jQuery UI -->
<link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/ui-lightness/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/i18n/jquery-ui-i18n.min.js"></script>
<script type="text/javascript">
$(function() {
	//datepicker 인풋 태그 클릭시 달력 송출
	$.datepicker.setDefaults($.datepicker.regional["ko"]);
	$("#datepicker").datepicker({
		showAnim: "slideDown",
		showOn: "button",
		buttonImage: "./resources/img/calendar.gif",
		buttonImageOnly: true,
		showButtonPanel: true,
		dateFormat: "yy/mm/dd"
	});
	
	$(".idCheckBtn").click(function() {
		$.ajax({
			url: "memberIdcheck.do",
			type: "post",
			data: {m_id : $("input[name=m_id]").val()},
			dataType: "text",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result) {
				if(result=="사용중인 아이디입니다.") {
					$('input[name="m_id"]').focus();
				}
				alert(result);
			},
			error: function(err) {
				alert("통신 에러가 발생했습니다 : "+err)
			}
		})
	});
	
});
</script>
</head>
<body>
<%@ include file="../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
	<div class="newMemberTitle">회원가입</div>
	<div class="mainLine"></div>
	<form action="newMember.do" method="post" class="newMemberArea">
		<div class="formArea">
			<label class="newMemberItemTitle">아이디</label>
			<input name="m_id" type="text" required="required" autofocus="autofocus" class="newMemberInfoInput"/>
			<button class="idCheckBtn">중복확인</button>
		</div>
		<div class="formArea">
			<label class="newMemberItemTitle">비밀번호</label>
			<input name="m_pass" type="password" required="required" class="newMemberInfoInput"/>
		</div>
		<div class="formArea">
			<label class="newMemberItemTitle">이름</label>
			<input name="m_name" type="text" required="required" class="newMemberInfoInput"/>
		</div>
		<div class="formArea">
			<label class="newMemberItemTitle">전화번호</label>
			<input name="m_tel" type="text" required="required" class="newMemberInfoInput"/>
		</div>
		<div class="formArea">
			<label class="newMemberItemTitle">이메일</label>
			<input name="m_email" type="text" required="required" class="newMemberInfoInput"/>
		</div>
		<div class="formArea">
			<label class="newMemberItemTitle">생년월일</label>
			<input id="datepicker" name="m_birth" type="text" required="required" class="newMemberInfoInput" readonly="readonly" />
		</div>
		<label class="newMemberItemTitle">성별</label>
		<div class="newMemberSexArea">
			<input type="radio" id="newMemberMan" class="newMemberSexInput" name="m_sex" value="남"><label for="newMemberMan" class="newMemberSexTitle">남성</label>
			<input type="radio" id="newMemberWoman" class="newMemberSexInput" name="m_sex" value="여"><label for="newMemberWoman" class="newMemberSexTitle">여성</label>
		</div>
		<input type="submit" value="회원가입" class="newMemberSubmitBtn" />
	</form>
	<div class="mainLine"></div>
</div> <!-- contentsWrap -->
<footer></footer>
</body>
</html>