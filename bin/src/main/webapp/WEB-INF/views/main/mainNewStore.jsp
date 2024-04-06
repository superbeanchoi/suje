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
<link href="./resources/css/main/mainNewStoreStyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=27b7b792b159f35aa7d22b2aef2ebf14&libraries=services"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function() {
	$(".idCheckBtn").click(function() {
		$.ajax({
			url: "storeIdcheck.do",
			type: "post",
			data: {s_id : $("input[name=s_id]").val()},
			dataType: "text",
			contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function(result) {
				if(result=="사용중인 아이디입니다.") {
					$('input[name="s_id"]').focus();
				}
				alert(result);
			},
			error: function(err) {
				alert("통신 에러가 발생했습니다 : "+err)
			}
		})
	});
	
	$("input[name='s_addr']").click(function(){
		sample4_execDaumPostcode();
	});
	function sample4_execDaumPostcode() {
	    new daum.Postcode({        
	        oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수
				
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				    extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
				   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraRoadAddr !== ''){
				    extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("addr").value = roadAddr;
				
				var guideTextBox = document.getElementById("guide");
				// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
				if(data.autoRoadAddress) {
				    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
				    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
				    guideTextBox.style.display = 'block';
				}
	        }
	    }).open();
	    new daum.Postcode({
			onclose: function(state) {
			//state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 
				//상세 설명은 아래 목록에서 확인
				if(state === 'FORCE_CLOSE'){
				//사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 
				//실행될 코드를 작성하는 부분
				} else if(state === 'COMPLETE_CLOSE'){
				//사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 
				//실행될 코드를 작성하는 부분
				//oncomplete 콜백 함수가 실행 완료된 후에 실행
				}
			}
		});
	}
});
</script>
<title>SUJE</title>
</head>
<body>
<%@ include file="../headerHtml/memberHeader.jsp" %>
<div class="contentsWrap">
	<div class="newStoreTitle">스토어 입점신청</div>
	<div class="mainLine"></div>
	<form action="newStore.do" method="post" class="newStoreArea">
		<label class="newStoreItemTitle">아이디</label>
		<input name="s_id" type="text" required="required" autofocus="autofocus" class="newStoreInfoInput"/>
		<button class="idCheckBtn">중복확인</button>
		<label class="newStoreItemTitle">비밀번호</label>
		<input name="s_pass" type="password" required="required" class="newStoreInfoInput"/>
		<label class="newStoreItemTitle">이메일</label>
		<input name="s_email" type="text" required="required" class="newStoreInfoInput"/>
		<label class="newStoreItemTitle">전화번호</label>
		<input name="s_tel" type="text" required="required" class="newStoreInfoInput"/>
		<label class="newStoreItemTitle">스토어명</label>
		<input name="s_name" type="text" required="required" class="newStoreInfoInput"/>
		<label class="newStoreItemTitle">스토어 카테고리</label>
		<select name="catem_code" class="newStoreSelectItem">
			<option selected="selected">=== 카테고리 선택 ===</option>
			<option value="1">디저트</option>
			<option value="2">전통간식</option>
			<option value="3">반려동물식품</option>
			<option value="4">의류</option>
			<option value="5">주얼리</option>
			<option value="6">수공예품</option>
			<option value="7">잡화</option>
			<option value="8">홈리빙</option>
		</select>
		<label class="newStoreItemTitle">주소</label>
		<input id="addr" name="s_addr" type="text" required="required" class="newStoreLongInfoInput" readonly="readonly"/>
		<label class="newStoreItemTitle">사업자등록번호</label>
		<input name="s_bnum" type="text" required="required" class="newStoreLongInfoInput"/>
		<label class="newStoreItemTitle">은행명</label>
		<select name="s_bank" class="newStoreSelectItem">
			<option selected="selected">=== 은행 선택 ===</option>
			<option value="우리은행">우리은행</option>
			<option value="기업은행">기업은행</option>
			<option value="신한은행">신한은행</option>
			<option value="카카오뱅크">카카오뱅크</option>
		</select>
		<label class="newStoreItemTitle">계좌번호</label>
		<input name="s_acc" type="text" required="required" class="newStoreInfoInput"/>
		<input type="submit" value="입점신청" class="newStoreSubmitBtn" />
	</form>
	<div class="mainLine"></div>
</div> <!-- contentsWrap -->
<footer></footer>
</body>
</html>