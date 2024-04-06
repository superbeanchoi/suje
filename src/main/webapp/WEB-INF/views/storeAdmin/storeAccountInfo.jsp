<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUJE</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
<link href="./resources/css/resetStyle.css" rel="stylesheet" type="text/css">
<link href="./resources/css/menuForm/subMenuStyle.css" rel="stylesheet" type="text/css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="./resources/css/storeAdmin/storeAccountInfo.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
$(function(){
    var selectedBank = "${vo.s_bank}";
    $('#bankAccount option').each(function() {
        if ($(this).text() === selectedBank + "은행") {
            $(this).prop('selected', true);
        }
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
				document.getElementById("s_addr").value = roadAddr;
				
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
</head>
<body>
<%@ include file="../../views/headerHtml/storeHeader.jsp" %>
<div class="storeContentsWrap">
<jsp:include page="storeSubMenuBar.jsp"></jsp:include>
		<div class="storeContentsBox">
			<h1 class="store_mainTitle">계정 정보</h1>
			<hr/>

			<form action="updateAccount.do" method="POST" class="storeAcc_mainInfo">
				
				<label class="storeAcc_subTitle">아이디</label> 
				<input type="text" name="s_id"required="required" autofocus="autofocus" class="storeAcc_textbox1" value="${vo.s_id}"/>

				<label class="storeAcc_subTitle">비밀번호</label> 
				<input type="password" id="s_pass" name="s_pass" required="required" class="storeAcc_textbox1" value="${vo.s_pass}" /> 
				
				<label class="storeAcc_subTitle">이메일</label> 
				<input type="text" id="s_email" name="s_email" required="required" class="storeAcc_textbox1" value="${vo.s_email}"/> 
				
				<label class="storeAcc_subTitle">전화번호</label> 
				<input type="text" id="s_tel" name="s_tel" required="required" class="storeAcc_textbox1" value="${vo.s_tel}"/> 
				
				<label class="storeAcc_subTitle">주소</label> 
				<input type="text" id="s_addr" name="s_addr" required="required" class="storeAcc_textbox2" value="${vo.s_addr}" readonly="readonly"/> 
				
				<label class="storeAcc_subTitle">사업자등록번호</label> 
				<input type="text" id="s_bnum" name="s_bnum" required="required" class="storeAcc_textbox2" value="${vo.s_bnum}"/> 
				
				<label class="storeAcc_subTitle">은행명</label> 
					<select	id="bankAccount" name="s_bank" class="storeAcc_selectBox">
								<option value="">은행 선택</option>
								<option value="우리">우리은행</option>
								<option value="농협">농협은행</option>
								<option value="기업">기업은행</option>
								<option value="신한">신한은행</option>
								<option value="카카오">카카오은행</option>
					</select> 
				<label class="storeAcc_subTitle">계좌번호</label> 
				<input type="text" id="s_acc" name="s_acc" required="required" class="storeAcc_textbox2" value="${vo.s_acc}"/> 
				<button type="submit" class="submitBtn" name="submitBtn">수정하기</button>
			</form>
		</div> <!-- storeContentsBox -->
	</div> <!-- storeContentsWrap -->
	<footer></footer>
</body>
</html>