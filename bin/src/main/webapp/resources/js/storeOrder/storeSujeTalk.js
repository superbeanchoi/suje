/**
 * 
 */
$(function() {
	$(".customerInfoList").parent().off('click').click(function() {
		/* 주문 상세 요청 내역 비동기 처리 */
		$.ajax({
			type: "post",
			url: "storeSujeTalkEtc.do",
			data: {
				storeOrderNO: $(this).find("input").val()
			},
			dataType: "json",
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			beforeSend: function() {
				if ($(".orderMainDetail") != "") {
					$(".orderMainDetail").remove();
				}
			},
			success: function(data) {
				// Talk 상단 정보 표시
				$(".storeTopInfo>div:nth-child(1)>div:nth-child(2)").text(data['etcList'][0].m_name); // 고객명
				$(".storeTopInfo>div:nth-child(2)").text(data['etcList'][0].o_date); // 주문 요청일
				$(".activeTalkTitle>div:nth-child(2) input").val(data['etcList'][0].o_code); // 주문번호
				$(".orderNum").val(data['etcList'][0].o_code); // 주문번호
				// 주문 접수 요청 사항
				orderRegedit(data['etcList']);
				/* 주문 요청사항 출력 함수 */
				$(data['etcList']).each(function(index, item) {
					if (item.etc_content != null) {
						orderEtc(item);
					}
				});
				// 최종 주문서 출력
				if (data['finalOrder'] != null) {
					$(".orderInsertBtn").css("display", "none");
					finalOrderEtc(data['finalOrder'], data['etcList'][0].s_name);
				} else {
					$(".orderInsertBtn").css("display", "block");
				}
			},
			error: function(status) {}
		});
	});
	
	var doubleSubmitFlag = false;
	
	// 기타 요청 사항 답변 입력 이벤트
	$('#etcStoreInsert').off('submit').submit(function() {
		var formData = new FormData(this);
		
						if(doubleSubmitFlag){
					alert("처리중입니다! 잠시만 기달려주세요 ~");
					return false;
				}else{
				
					doubleSubmitFlag = true;
		$.ajax({
			type: "post",
			url: "insertStoreEtc.do",
			data: formData,
			dataType: "json",
			processData: false,
			contentType: false,
			beforeSend: function() {},
			success: function(data) {
				if (data['state'] == 1) {
					alert("등록이 성공 하였습니다");
				}
				// 주문 접수 요청 사항
				orderRegedit(data['etcList']);
				/* 주문 요청사항 출력 함수 */
				$(data['etcList']).each(function(index, item) {
					if (item.etc_content != null) {
						orderEtc(item);
					}
				});
				// 최종 주문서 출력
				if (data['finalOrder'] != null) {
					$(".orderInsertBtn").css("display", "none");
					finalOrderEtc(data['finalOrder'], data['etcList'][0].s_id);
				} else {
					$(".orderInsertBtn").css("display", "block");
				}
				$('#etcStoreInsert textarea').val('');
			},
			error: function(request, status, error) {
				alert("통신 에러가 발생했습니다 : " + request + "/" + status + "/" + error);
			}
			
		});
		}
		doubleSubmitFlag = false;
		return false;
	});
	
	// 최종 주문서 등록 이벤트
	$(".orderInsertBtn").click(function() {
	
		$('.storeID').val($('.s_id').val());
		
		let orderNO = $(".activeTalkTitle>div:nth-child(2) input").val();
		resetSujeTalk();
		if (orderNO != "") {
			// 모달 출력 이벤트
			$(".modalWrap").fadeIn(200);
			$(".storeOrderInsertModal").slideDown(200);
			$('.insertBtnRes').val("등록하기");
			$('.modalNo_textbox').val(orderNO);
			$('.formTagClass').attr("action", "fianlOrderController.do");
			$('.modalTitle').text("");
			$('.modalTitle').text("최종 주문서 등록");
			$(".updateBtn").css("display","none");
			$(".cateFirst").removeAttr("disabled");
			$(".cateSecond").removeAttr("disabled");
			getCateInfo();
		} else {
			alert("주문요청건을 선택하여 주세요");
		}
	});
	// 중분류 카테고리 선택 이벤트
	$(".cateFirst").change(cateSub);
	$(".updateBtn").click(updateBtn);
});
// 주문 접수 요청 사항
function orderRegedit(item) {
	/* 메인 프레임 */
	var orderDetailMainFram = $(".orderMainContentInner");
	/* 각각 서브 프레임 */
	var mainContent = $("<div class=orderMainDetail></div>");
	var chatContent = $("<div class=chatDetail></div>");
	orderDetailMainFram.append(mainContent);
	mainContent.append(chatContent);
	// 대화 사용자 사진
	chatContent.append("	<div><img src='./resources/img/custmerLogo.png'></div>");
	//대화 사용자명
	chatContent.append("	<div>" + item[0].m_name + "</div>");
	//주문 요청 접수내용
	//    mainContent.append("<div><input id='orderCheck' type='text' value='"+item[0].o_content+"' /></div>");
	mainContent.append("<div><textarea id='orderCheck'  readonly>" + item[0].o_content + "</textarea>"); // 요청 사항 텍스트
	//뒷 말풍선 배경
	mainContent.append("<img src='./resources/img/wordballoon.png'>");
	//날짜
	mainContent.append("<div class='dateDetail'>주문 제작 요청</div>");
	$(".orderMainContent").css("overflow", "auto");
	$(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);
}
/* 주문 요청 상세사항 출력 함수 */
function orderEtc(item) {
	/* 메인 프레임 */
	var orderDetailMainFram = $(".orderMainContentInner");
	/* 각각 서브 프레임 */
	var mainContent = $("<div class=orderMainDetail></div>");
	var chatContent = $("<div class=chatDetail></div>");
	orderDetailMainFram.append(mainContent);
	mainContent.append(chatContent);
	// 대화 사용자 사진
	if (item.etc_type_code == 77000) {
		chatContent.append("	<div><img src='./resources/img/custmerLogo.png'></div>");
	} else {
		chatContent.append("	<div><img alt='' src='./resources/img/sujetalkstoreimg.png'></div>");
	}
	//대화 사용자명
	if (item.etc_type_code == 77000) {
		chatContent.append("	<div>" + item.m_name + "</div>");
	} else {
		chatContent.append("<div>" + item.s_name + "</div>");
	}
	// 요청 사항 Content
	if (item.etc_spname != null) {
		mainContent.append("<img class='etcImg' src='./resources/img/DBServer/" + item.etc_spname + "' />");
	}
	//   mainContent.append("<div><input id='orderCheck' type='text' value='"+item.content+"' /></div>");
	mainContent.append("<div><textarea id='orderCheck'  readonly>" + item.content + "</textarea>"); // 요청 사항 텍스트
	//뒷 말풍선 배경
	mainContent.append("<img src='./resources/img/wordballoon.png'>");
	//날짜
	mainContent.append("<div class='dateDetail'>" + item.etc_date + "</div>");
	$(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);
}
// 최종 주문서 출력 부분
function finalOrderEtc(item, storeID) {
	/* 메인 프레임 */
	var orderDetailMainFram = $(".orderMainContentInner");
	/* 각각 서브 프레임 */
	var mainContent = $("<div class=orderMainDetail></div>");
	var chatContent = $("<div class=chatDetail></div>");
	orderDetailMainFram.append(mainContent);
	mainContent.append(chatContent);
	// 대화 사용자 사진
	chatContent.append("	<div><img alt='' src='./resources/img/sujetalkstoreimg.png'></div>");
	//대화 사용자명
	chatContent.append("<div>" + storeID + "</div>");
	//최종 주문서 확인 버튼
	mainContent.append("<div><input id='orderCheck' type='button' value='최종 주문서 확인' onclick='getFinalOrder()'/></div>");
	//뒷 말풍선 배경
	mainContent.append("<img src='./resources/img/wordballoon.png'>");
	//날짜
	mainContent.append("<div class='dateDetail'>주문 제작서 확인 요청</div>");
	$(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);
}
// 최종 주문서 정보 불러오기
function getFinalOrder() {
	resetSujeTalk(); // 모달 입력값 초기화
	$.ajax({
		type: "post",
		url: "getStoreFinalOrder.do",
		data: {
			orderNO: $('.orderNum').val()
		},
		dataType: "json",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		beforeSend: function() {
			$(".modalWrap").fadeIn(200);
			$(".storeOrderInsertModal").slideDown(200);
		},
		success: function(data) {
			// 모달 Tag 속성 정의
			$('.insertBtnRes').val("수정하기");
			$(".orderInsertBtn").css("display", "none");
			$('.storeID').val($('.idInfo').val());
			$(".modalTitle").text("최종 주문서 수정");
			$('.modalNo_textbox').val(data.fo_code); // 최종 주문서 번호 
			$("#countInput").val(data.fo_num); // 주문 수량
			$("#sizeInput").val(data.fo_size); // 주문 사이즈
			$('#price').val(data.fo_sum); // 주문 금액
			$('#content').val(data.fo_etc); // 주문 요청 사항
			//getCateInfo();
			$(".cateFirst").append("<option value=" + data.catemm_code + " >" + data.catemm_name + "</option>");
			$(".cateSecond").append("<option value=" + data.cates_code + ">" + data.cates_name + "</option>");
			$(".cateFirst").attr("disabled", "disabled");
			$(".cateSecond").attr("disabled", "disabled");
			// 각 태그 속성 부여
			$('.insertBtnRes').attr("onclick", "updateFinalOrderinfo()");
			$('.formTagClass').attr("action", "updateFinalOrderinfo.do");
			$('.modalNo_textbox').attr("name", "fo_code");
		},
		error: function(request, status, error) {
			alert("통신 에러가 발생했습니다 : " + request + "/" + status + "/" + error);
		}
	});
}

function updateBtn() {
	$(".cateFirst option").remove();
	$(".cateSecond option").remove();
	$(".cateFirst").removeAttr("disabled");
	$(".cateSecond").removeAttr("disabled");
	getCateInfo();
}
// 중분류 카테고리 불러오기
function getCateInfo() {
	$.ajax({
		type: "post",
		url: "getCateMainName.do",
		data: {
			storeId: $(".s_id").val()
		},
		dataType: "json",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		beforeSend: function() {},
		success: function(data) {
			// 대분류 카테고리 설정
			//$(".cateFirst").append("<option value="+data['cateMainVO'].catem_code+">"+data['cateMainVO'].catem_name+"</option>");
			var cateMidList = data['cateMidList'];
			// 중분류 카테고리 설정
			for (var i = 0; i < cateMidList.length; i++) {
				$(".cateFirst").append("<option value=" + cateMidList[i].catemm_code + ">" + cateMidList[i].catemm_name + "</option>");
			}
		},
		error: function(request, status, error) {
			alert("통신 에러가 발생했습니다 : " + request + "/" + status + "/" + error);
		}
	});
	return true;
}
// 소분류 카테고리 불러오기
function cateSub() {
	var cateMidCode = $(this).val();
	$(".cateSecond option").remove();
	$.ajax({
		type: "post",
		url: "cateSubCode.do",
		data: {
			cateMidCode: cateMidCode
		},
		dataType: "json",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		beforeSend: function() {
			$(".goodsInfo_selectBox_Third").empty();
		},
		success: function(data) {
			for (var i = 0; i < data.length; i++) {
				$(".cateSecond").append("<option value=" + data[i].cates_code + ">" + data[i].cates_name + "</option>");
			}
		},
		error: function(request, status, error) {
			alert("통신 에러가 발생했습니다 : " + request + "/" + status + "/" + error);
		}
	});
}
// 모달 데이터 초기화 함수
function resetSujeTalk() {
	$(".modalTitle").text("");
	$(".modalNo_textbox").val("");
	$(".cateFirst option").remove();
	$(".cateSecond option").remove();
	$("#countInput").val("");
	$("#sizeInput").val("");
	$("#price").val("");
	$("#content").val("");
}