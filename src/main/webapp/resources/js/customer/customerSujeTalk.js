

var accNum;
var accBank;

var cardNum;
var cardBank;

$(function () {

    // 수제 톡톡 제작업체리스트 중 클릭시 실행되는 이벤트
    $(".storeSimpleInfo").parent().click(SujeOrderClickEvent);

    // 주문 요청 사항 입력(전송) 버튼 클릭시 시행되는 이벤트
    $("#etcUploadInsert").off('submit').submit(etcInsertClickEvent);

    // 최종 주문서 Modal 안에 있는 결제하기 버튼 클릭 이벤트
    $('.insertBtnRes').click(insertPayClickEvent);

    // 결제정보 결제 방식 선택 시 호출 되는 이벤트
    $('.paySelect').change(paySelectEvent);
    
    // 최종 결제하기 버튼 이벤트 - 결제정보 빈칸 검증
    $(".payMentinsertbtn input[type='button']").eq(0).off('click').click(payMentInsertBtnEvent);
    
    // 주소검색 API
    $("input[name='d_addr']").click(function(){
      sample4_execDaumPostcode();
   });
    

});

// 수제 톡톡 제작업체리스트 중 클릭시 실행되는 이벤트
function SujeOrderClickEvent() {

    const storeLogoImg = $(this).find('img').attr('src'); // 제작업체 프로필 사진

    $('#talkImgUpload').val(''); // 이미지 경로 입력되는 텍스트 필드 초기화
    $(".filebox input[type='text']").val(''); // 텍스트 박스 필드 초기화

    $.ajax({ //주문요청 사항 불러오는 Ajax
        type: "post",
        url: "orderDetailContext.do",
        data: {
            customerOrderNO: $(this).find("input").val()
        },
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        beforeSend: function () {

            // 입력되어 있는 주문 요청 사항이 있을 경우 초기화 실행
            if ($(".orderMainDetail") != "") {
                $(".orderMainDetail").remove();
            }
        },
        success: function (data) {

            // 주문 요청 내역 상단 스토어 정보 - 스토어명 입력
            $(".customerInfo>div:first-child>div:nth-child(2)").text(data['etcList'][0].s_name);

            // 주문 요청 내역 상단 스토어 프로필 이미지 처리
            if (storeLogoImg != null) {
                $(".customerInfo img").attr('src', storeLogoImg);
            }

            $(".customerInfo>div:nth-child(2)").text(data['etcList'][0].o_date); // 주문 요청일
            $(".activeTalkTitle>div:nth-child(2) input").val(data['etcList'][0].o_code); // 주문번호
            $(".orderNO").val(data['etcList'][0].o_code); // 주문번호
            /*상단 정보 입력 부분 End*/

            // 고객 주문 요청시 입력 되었던 요청 내역 입력 함수 호출
            firstOrder(data['etcList']);

            // 고객 추가 주문(기타) 요청 사항 입력 함수 호출
            $(data['etcList']).each(function (index, item) {
                if (item.etc_content != null) {
                    mainContent(item);
                }
            });

            // 스토어에서 최종 주문서가 입력되었을 경우 최종 주문서 확인 하는 버튼 생성 함수
            if (data['finalVO'] != null) {
                finalOrder(data['finalVO'], data['etcList'][0].s_name, storeLogoImg);
            }
        },
        error: function (request, status, error) {
            alert("통신 에러가 발생했습니다 : " + request + "/" + status + "/" + error);
        }
    });

}

// 더블 submit 방지 변수
var doubleSubmitFlag = false;

// 주문 요청 사항 입력(전송) 버튼 클릭시 시행되는 이벤트
function etcInsertClickEvent() {

    var formData = new FormData(this); // 이미지 업로드를 위한 FormData 처리

    // 더블 Submit 방지 명령어
    if (doubleSubmitFlag) {
        alert("처리중입니다! 잠시만 기달려주세요 ~");
        return false;
    } else {

        doubleSubmitFlag = true;

        // 데이터 처리 하는 ajax
        $.ajax({
            type: "post",
            url: "insertEtcContent.do",
            data: formData,
            dataType: "json",
            processData: false, // 제이쿼리 자동실행 하지 않도록 설정 - formData 그대로 전송되기 위함
            contentType: false, // formData 에 저장되어 있는 헤더 설정 그대로 보내주기 위함
            beforeSend: function () {

                // 입력되어 있는 주문 요청 사항이 있을 경우 초기화 실행
                if ($(".orderMainDetail") != "") {
                    $(".orderMainDetail").remove();
                }

            },
            success: function (data) {

                if (data['state'] == '1') {
                    alert("요청사항 등록이 등록되었습니다.")
                } else {
                    alert("등록실패 - 내부문제 관리자 문의해주세요");
                }

                // 고객 주문 요청시 입력 되었던 요청 내역 입력 함수 호출
                firstOrder(data['etcList']);

                // 고객 추가 주문(기타) 요청 사항 입력 함수 호출
                $(data['etcList']).each(function (index, item) {
                    if (item.etc_content != null) {
                        mainContent(item);
                    }
                });

                // 등록된 최종 주문서가 있을 경우 버튼 생성 해주는 함수
                if (data['finalVO'] != null) {
                    finalOrder(data['finalVO'], data['etcList'][0].s_name, data['etcList'][0].s_spname);
                }

                // 이미지 필드 , 요청사항 입력 필드 초기화
                $(".etcContent").val("");
                $(".filebox input[type='text']").val("");

            }, error: function (request, status, error) {
                alert("통신 에러가 발생했습니다 : " + request + "/" + status + "/" + error);
            }

        });

        // 더블 submit 방지 관련 명령어
        doubleSubmitFlag = false;
        return false;
    }
}

// 결제정보 결제 방식 선택 시 호출 되는 이벤트
function paySelectEvent() {
    // 선택된 항목에 대한 값 불러오기
    let selectValue = $(this).val();

    // 선택박스 처리 로직
    $('.payMentContentRight2 div:first-child input').eq(0).val(""); // 이중 입력 방지를 위한 은행명 입력 필드 초기화
    $('.payMentContentRight2 div:first-child input').eq(1).val(""); // 이중 입력 방지를 위한 계좌번호 or 카드번호 입력 필드 초기화

    // 결제 방식 선택시 "=선택=" 안내 문구 삭제 명령
    if ($('.paySelect option').eq(0).text() == "=선택=") { $('.paySelect option').eq(0).remove(); }


    if (selectValue == 1) { // 결제 방식 1번 카드 선택 할 경우 실행 되는 로직
        $('.payMentContentRight2 div:first-child input').eq(0).val(cardBank);
        var no = $('.payMentContentRight2 div:first-child input').eq(1);
        if (cardNum == null) {
            no.val("");
        } else {
            no.val(cardNum);
        }
    } else { // 결제 방식 2번 계좌번호 선택 할 경우 실행 되는 로직
        $('.payMentContentRight2 div:first-child input').eq(0).val(accBank);
        var no = $('.payMentContentRight2 div:first-child input').eq(1);
        if (accNum == 0) {
            no.val("");
        } else {
            no.val(accNum);
        }
    }
}

// 주문요청시 입력된 정보 불러오는 함수
function firstOrder(data) {

    var mainDiv = $(".orderMainContentInner");
    var mainDetailDiv = $("<div class=orderMainDetail></div>");

    var chatDetail = $("<div class=charDetail></div>");

    mainDiv.append(mainDetailDiv);
    mainDetailDiv.append(chatDetail);

    chatDetail.append("	<div><img src='./resources/img/custmerLogo.png'></div>");

    chatDetail.append("<div>" + data[0].m_id + "</div>");

    mainDetailDiv.append("<div><textarea id='orderCheck'  readonly>" + data[0].o_content + "</textarea>");  // 요청 사항 텍스트 
    mainDetailDiv.append("<img src='./resources/img/wordballoon.png'>");
    mainDetailDiv.append("<div class='dateDetail'>주문 제작 요청</div>");

    $(".orderMainContent").css("overflow", "auto");
    $(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);

}

// 추가 주문 요청사항(기타) 불러오는 함수
function mainContent(item) {

    $(".orderNum").val(item.o_code);

    var mainDiv = $(".orderMainContentInner");

    var mainDetailDiv = $("<div class=orderMainDetail></div>");
    var chatDetail = $("<div class=charDetail></div>");

    mainDiv.append(mainDetailDiv);
    mainDetailDiv.append(chatDetail);

    // 대화 사용자 사진
    if (item.etc_type_code == 77001) { // 사업자
        if (item.s_spname != null) {
            chatDetail.append("	<div><img alt='' src='./resources/img/DBServer/" + item.s_spname + "'></div>");
        } else {
            chatDetail.append("	<div><img alt='' src='./resources/img/faviconLogoIcon.png'></div>");
        }
    } else { // 고객
        chatDetail.append("	<div><img src='./resources/img/custmerLogo.png'></div>");
    }

    //대화 사용자명
    if (item.etc_type_code == 77001) {
        chatDetail.append("	<div>" + item.s_name + "</div>");
    } else {
        chatDetail.append("<div>" + item.m_id + "</div>");
    }

    // 요청 사항 Content
    if (item.etc_spname != null) { mainDetailDiv.append("<img class='etcImg' src='./resources/img/DBServer/" + item.etc_spname + "' />"); }
    //	   	mainDetailDiv.append("<div><input id='orderCheck' type='text' value='"+item.content+"' readonly/></div>");  // 요청 사항 텍스트
    mainDetailDiv.append("<div><textarea id='orderCheck'  readonly>" + item.content + "</textarea>");  // 요청 사항 텍스트
    mainDetailDiv.append("<img src='./resources/img/wordballoon.png'>"); // 채팅 뒷 배경
    mainDetailDiv.append("<div class='dateDetail'>" + item.etc_date + "</div>"); // 채팅 입력 날짜

    $(".orderMainContent").css("overflow", "auto");
    $(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);

}


// 입력된 최종 주문서가 있을 경우 최종 주문서 정보 확인 버튼 생성 함수
function finalOrder(data, storeID, spname) {

    var mainDiv = $(".orderMainContentInner");
    var mainDetailDiv = $("<div class=orderMainDetail></div>");

    var chatDetail = $("<div class=charDetail></div>");

    mainDiv.append(mainDetailDiv);
    mainDetailDiv.append(chatDetail);

    if (spname != null) {
        chatDetail.append("	<div><img alt='' src='" + spname + "'></div>");
    } else {
        chatDetail.append("	<div><img alt='' src='./resources/img/sujetalkstoreimg.png'></div>");
    }

    chatDetail.append("<div>" + storeID + "</div>");

    mainDetailDiv.append("<div><input id='orderCheck' type='button' value='최종 주문서 확인' onclick='finalOroderCheck()' readonly/></div>");
    mainDetailDiv.append("<img src='./resources/img/wordballoon.png'>");
    mainDetailDiv.append("<div class='dateDetail'>주문 제작서 확인 요청</div>");

    $(".dateDetail").append("<input class='finalOrderCode' type='hidden' value='" + data.fo_code + "' />");

    $(".orderMainContent").css("overflow", "auto");
    $(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);
}

// 최종 주문서 정보 조회 버튼 이벤트 함수(태그 안에 실행 명령어 입력 되어 있음)
function finalOroderCheck() {

    // 카테고리 정보 초기화
    $(".cateFirst option").remove();
    $(".cateSecond option").remove();

    $.ajax({

        type: "get",
        url: "finalOrderInfo.do",
        data: { foCode: $('.finalOrderCode').val() },
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        beforeSend: function () {
            $(".modalWrap").fadeIn(200);
            $(".orderCheckModal").slideDown(200);
        },
        success: function (data) {

            const itemInfo = data;

            // 최종 주문 번호
            $(".customerOrderListTitle input").val(data.fo_code);

            // 카테고리 정보 입력 명령어
            $(".cateFirst").append("<option value=" + data.catemm_code + " >" + data.catemm_name + "</option>");
            $(".cateSecond").append("<option value=" + data.cates_code + ">" + data.cates_name + "</option>");
            $(".cateFirst").attr("disabled", "disabled");
            $(".cateSecond").attr("disabled", "disabled");

            // 수량
            $('#countInput').val(data.fo_num);

            // 주문 사이즈
            $('#sizeInput').val(data.fo_size);

            //주문 금액
            $('#price').val(data.fo_sum);

            //배송형태
            if (data.deli_code == 7003) {
                $('#delivery').prop('selected', true);
            } else {
                $('#pickup').prop('selected', true);
            }

            //요구사항
            $('#content').val(data.fo_etc);

            // 결제 완료 여부에 따른 버튼 생성 로직
            if (data.p_code != 0) {
                $('.payComple').remove();
                $('.insertBtnRes').remove();
                $('.OrderInfomodalMainContent').after('<div class="payComple">결제완료된 주문입니다.</div>');
            } else {
                $('.payComple').remove();
                $('.insertBtnRes').remove();
                $('.OrderInfoinsertbtn div:first-child').append('<input class="insertBtnRes" type="button" value="결제하기">');
                $('.insertBtnRes').val("결제하기");
            }
            
             $('.insertBtnRes').click(insertPayClickEvent);
        }
    });
}

// 최종 주문서 Modal 안에 있는 결제하기 버튼 클릭 이벤트 함수
function insertPayClickEvent() {

    $.ajax({

        type: "post",
        type: "get",
        url: "finalOrderInfo.do",
        data: { foCode: $('.finalOrderCode').val() },
        dataType: "json",
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        beforeSend: function () {
            // 결제 Modal 호출
            $(".orderCheckModal").slideUp(200);
            $(".payResultModal").slideDown(200);
            
            // 주소 검색 텍스트 필드 초기화
            document.getElementById("deliAddr").value = "";
        },
        success: function (data) {

            if (data.m_acc_bank == null && data.card_company == null) {
                if (confirm("등록된 결제 정보가 없습니다. \n결제정보 등록 후 이용 하여주세요\n등록 페이지로 이동 하시겠습니까?")) {
                    location.href = "customerCard.do?id=" + data.m_id + ">";
                } else {
                    location.href = "customerSujeTalk.do?id=" + data.m_id + "&page=1";
                }
            } else {
                accNum = data.m_acc_num;
                accBank = data.m_acc_bank;
                cardNum = data.card_num;
                cardBank = data.card_company;
            }

            $("#foCode").val(data.fo_code); // 최종 주문 번호


            $('.cateFirst option').each(function () { //상품 카테고리 1
                if ($(this).text() == data.cates_name) {
                    $(this).prop('selected', true);
                }
            });


            $('.cateSecond option').each(function () { //상품 카테고리 2
                if ($(this).text() == data.catemm_name) {
                    $(this).prop('selected', true);
                }
            });

            $('#foCount').val(data.fo_num); // 수량
            $('#foSize').val(data.fo_size); // 주문 사이즈
            $('#foPrice').val(data.fo_sum);  //주문 금액

            if (data.deli_code == 7003) {  //배송형태
                $('#payDelivery').prop('selected', true);
            } else {
                $('#payPickup').prop('selected', true);
            }

            $('#payEtc').val(data.fo_etc); //요구사항
            $('#payMentPrice').val(data.fo_sum);

            let today = new Date();

            let year = today.getFullYear(); // 년도
            let month = today.getMonth() + 1;  // 월
            let date = today.getDate();  // 날짜
            let day = today.getDay();  // 요일

            $("#payMentDate").val(year + '/' + month + '/' + date);
            $(".idInfoPay").val($(".idInfo").val());

            if (data.deli_code == 7001) {
                $('.payMentsubtitle').eq(2).text('');
                $('.payMentContentLefit3').remove();
                $('.payMentContentRight3').remove();
            }

        }

    });

}

// 최종 결제하기 버튼 이벤트 - 결제정보 빈칸 검증
function payMentInsertBtnEvent(){

			event.preventDefault();
			
			var str_space =  /\s/;
			var payInfoValue = $('.payMentContentRight2 div:first-child input').eq(0).val();
			
			if(payInfoValue == 0){
				alert("결제정보가 없습니다.\n결제정보를 추가 하시거나\n다른 결제 수단을 선택 하여 주세요."); 
			}else{
				if (confirm("결제 하시겠습니까?")) {
				$('#payDeliveryForm').attr('action', 'payDeliveryInsert.do');
				$('#payDeliveryForm').submit();
				}else{
					
				}
			}

}

// 주소검색 APIqqqqq"?"
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
          document.getElementById("deliAddr").value = roadAddr;
          
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



