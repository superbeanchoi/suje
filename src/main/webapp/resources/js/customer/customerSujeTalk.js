
    $(function() {
		
		
		
		// 스토어 목록에서 요청건 클릭시 실행되는 이벤트
		$(".storeSimpleInfo").parent().click(function() {
		    
		    $('#talkImgUpload').val('');
		    $(".filebox input[type='text']").val('');
		    
		    $.ajax({
				type : "post",
				url : "orderDetailContext.do",
				data : {
				    customerOrderNO : $(this).find("input").val()
				},
				dataType : "json",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				beforeSend : function(){
				    
	 			    if( $(".orderMainDetail") != ""){
						$(".orderMainDetail").remove();
				    }
				},
				success : function(data) {
				    
				    /* 상단 메인 스토어명 표기 */
				   	$(".customerInfo>div:first-child>div:nth-child(2)").text(data['etcList'][0].s_name); 
				   	
				    $(".customerInfo>div:nth-child(2)").text(data['etcList'][0].o_date); // 주문 요청일
				    $(".activeTalkTitle>div:nth-child(2) input").val(data['etcList'][0].o_code); // 주문번호
				    $(".orderNO").val(data['etcList'][0].o_code); // 주문번호
				    
				    /* 최초 주문사항 출력 */
				    firstOrder(data['etcList']);
						
				    /* 주문 요청 사항 메인 출력*/
				    $(data['etcList']).each(function(index,item){
				        if(item.etc_content != null){
				    		mainContent(item);
				    	 } 
					}); 
			    	/*최종 주문서 출력*/
			    	if(data['finalVO'] !=null){
				    	finalOrder(data['finalVO'],data['etcList'][0].s_name);
			    	}
				},
				error : function(status) {
				    console.log(status);
				}
			});
			
			// 더블 submit 방지 변수
			var doubleSubmitFlag = false;
			
			// 요청 사항 전송 버튼 눌렀을때 실행되는 이벤트
			$("#etcUploadInsert").off('submit').submit(function(){
			
				var formData = new FormData(this);
				
				if(doubleSubmitFlag){
					alert("처리중입니다! 잠시만 기달려주세요 ~");
					return false;
				}else{
				
					doubleSubmitFlag = true;
					
					$.ajax({
						type : "post",
						url : "insertEtcContent.do",
						data : formData,
						dataType : "json",
						processData: false, // 제이쿼리 자동실행 하지 않도록 설정 - formData 그대로 전송되기 위함
						contentType: false, // formData 에 저장되어 있는 헤더 설정 그대로 보내주기 위함
						beforeSend : function(){
			 			    if( $(".orderMainDetail") != ""){
								$(".orderMainDetail").remove();
						    }
						    
						    
						},
						success : function(data){
						
							if(data['state'] == '1'){alert("요청사항 등록이 등록되었습니다.")}
							else{alert("등록실패 - 내부문제 관리자 문의해주세요");}
							
						    /* 최초 주문사항 출력 */
						    firstOrder(data['etcList']);
								
						    /* 주문 요청 사항 메인 출력*/
						    $(data['etcList']).each(function(index,item){
						        if(item.etc_content != null){
						    		mainContent(item);
						    	 } 
							}); 
					    	/*최종 주문서 출력*/
					    	if(data['finalVO'] !=null){
						    	finalOrder(data['finalVO'],data['etcList'][0].s_name);
					    	}
							
							// 초기화
							$(".etcContent").val("");
							$(".filebox input[type='text']").val("");
							
						},error: function(request, status, error) {
			               alert("통신 에러가 발생했습니다 : "+request+"/"+status+"/"+error);
			            }
						
					});
					
					doubleSubmitFlag = false;
					return false;
				}
			});
			
		});
		
		
		// 결제정보 결제 방식 선택 이벤트
		$('.paySelect').change(function(){
		
			let selectValue = $(this).val();
			bankSelect(selectValue);
			
		});
		
		// 결제하기 버튼 클릭이벤트 - 결제정보 빈칸 검증
		$(".payMentinsertbtn input[type='button']").eq(0).off('click').click(function(event){
		
			event.preventDefault();
			
			var str_space =  /\s/;
			var payInfoValue = $('.payMentContentRight2 div:first-child input').eq(0).val();
			
			if(payInfoValue == 0){
				alert("결제정보가 없습니다.\n결제정보를 추가 하시거나\n다른 결제 수단을 선택 하여 주세요."); 
			}else{
				$('#payDeliveryForm').attr('action', 'payDeliveryInsert.do');
				$('#payDeliveryForm').submit();
			}
		});
	});
	
// 최초 주문 요청서 출력 함수
function firstOrder(data){
	    
	    var mainDiv = $(".orderMainContentInner");
	    var mainDetailDiv = $("<div class=orderMainDetail></div>");
    
	    var chatDetail = $("<div class=charDetail></div>");
    
    	mainDiv.append(mainDetailDiv);
    	mainDetailDiv.append(chatDetail);
    	
    	chatDetail.append("	<div><img src='./resources/img/custmerLogo.png'></div>");
    	
    	chatDetail.append("<div>" + data[0].m_id + "</div>");    
    	
    	// mainDetailDiv.append("<div><input id='orderCheck' type='text' value='"+data[0].o_content+"'  readonly/></div>");
    	mainDetailDiv.append("<div><textarea id='orderCheck'  readonly>" + data[0].o_content + "</textarea>");  // 요청 사항 텍스트 
    	mainDetailDiv.append("<img src='./resources/img/wordballoon.png'>");
    	mainDetailDiv.append("<div class='dateDetail'>주문 제작 요청</div>");
    	
    	$(".orderMainContent").css("overflow" , "auto");
    	$(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);

 }


// 주문 요청 사항 출력함수 - 메인
function mainContent(item){
    
	    $(".orderNum").val(item.o_code);
	    
	    var mainDiv = $(".orderMainContentInner");
	    
	    var mainDetailDiv = $("<div class=orderMainDetail></div>");
	    var chatDetail = $("<div class=charDetail></div>");
    
    	mainDiv.append(mainDetailDiv);
    	mainDetailDiv.append(chatDetail);
    	
    	// 대화 사용자 사진
    	if(item.etc_type_code == 77001){
    		chatDetail.append("	<div><img alt='' src='./resources/img/sujetalkstoreimg.png'></div>");   
    	}else{
    		chatDetail.append("	<div><img src='./resources/img/custmerLogo.png'></div>");
    	}
    	
    	//대화 사용자명
    	if(item.etc_type_code == 77001){
    		chatDetail.append("	<div>" + item.s_name + "</div>");
    	}else{
    		chatDetail.append("<div>" + item.m_id + "</div>");    
    	}	
		
		// 요청 사항 Content
		if(item.etc_spname != null){mainDetailDiv.append("<img class='etcImg' src='./resources/img/DBServer/" + item.etc_spname + "' />"); }
//	   	mainDetailDiv.append("<div><input id='orderCheck' type='text' value='"+item.content+"' readonly/></div>");  // 요청 사항 텍스트
	   	mainDetailDiv.append("<div><textarea id='orderCheck'  readonly>" + item.content + "</textarea>");  // 요청 사항 텍스트
 		mainDetailDiv.append("<img src='./resources/img/wordballoon.png'>"); // 채팅 뒷 배경
    	mainDetailDiv.append("<div class='dateDetail'>" + item.etc_date + "</div>"); // 채팅 입력 날짜
    	
    	$(".orderMainContent").css("overflow" , "auto");
    	$(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);
 
	}

// 최종 주문서 확인버튼 + 최종 주문서 정보 불러오는 함수	 
function finalOrder(data,storeID){
	    
 	    var mainDiv = $(".orderMainContentInner");
	    var mainDetailDiv = $("<div class=orderMainDetail></div>");
    
	    var chatDetail = $("<div class=charDetail></div>");
    
    	mainDiv.append(mainDetailDiv);
    	mainDetailDiv.append(chatDetail);
    	
    	chatDetail.append("	<div><img alt='' src='./resources/img/sujetalkstoreimg.png'></div>"); 
    	
    	chatDetail.append("<div>" + storeID + "</div>");    
    	
    	mainDetailDiv.append("<div><input id='orderCheck' type='button' value='최종 주문서 확인' onclick='finalOroderCheck()' readonly/></div>");
    	mainDetailDiv.append("<img src='./resources/img/wordballoon.png'>");
    	mainDetailDiv.append("<div class='dateDetail'>주문 제작서 확인 요청</div>");
		
		$(".dateDetail").append("<input class='finalOrderCode' type='hidden' value='" +  data.fo_code + "' />");
		
		$(".orderMainContent").css("overflow" , "auto");
    	$(".orderMainContent").scrollTop($(".orderMainContent")[0].scrollHeight);
 }
 
 // 최종 주문서 조회 함수
function finalOroderCheck(){
    
    $(".cateFirst option").remove();
	$(".cateSecond option").remove();
	
    $.ajax({
	
		type : "get",
		url : "finalOrderInfo.do",
		data : {foCode : $('.finalOrderCode').val()},
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		beforeSend : function(){
		    $(".modalWrap").fadeIn(200);
		    $(".orderCheckModal").slideDown(200); 
		},
		success : function(data){
		    
		    console.log(data);
		    const itemInfo = data;
		    
		    // 최종 주문 번호
		    $(".customerOrderListTitle input").val(data.fo_code);
		    
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
		    if(data.deli_code == 7003){
				$('#delivery').prop('selected', true);
		    }else{
				$('#pickup').prop('selected', true);
		    }
		    
		    //요구사항
		    $('#content').val(data.fo_etc);
		    
		    if(data.p_code != 0) {
		    	$('.payComple').remove();
		    	$('.insertBtnRes').remove();
		    	$('.OrderInfomodalMainContent').after('<div class="payComple">결제완료된 주문입니다.</div>');
		    }
		    
		    $('.insertBtnRes').val("결제하기");
		    
		    $('.insertBtnRes').click(function(){
					$(".orderCheckModal").slideUp(200);
					$(".payResultModal").slideDown(200); 
					payMent();	
		    
		    });
		}	
    });
}

var accNum;
var accBank;

var cardNum;
var cardBank;

function bankSelect(selectValue){
	
	$('.payMentContentRight2 div:first-child input').eq(0).val("");
	$('.payMentContentRight2 div:first-child input').eq(1).val("");
	if($('.paySelect option').eq(0).text() == "=선택="){$('.paySelect option').eq(0).remove();}
	
	if(selectValue == 1){
		$('.payMentContentRight2 div:first-child input').eq(0).val(cardBank);
		var no = $('.payMentContentRight2 div:first-child input').eq(1);
		if(cardNum == null){
			no.val("");
		}else{
			no.val(cardNum);
		}
	}else{
		$('.payMentContentRight2 div:first-child input').eq(0).val(accBank);
		var no = $('.payMentContentRight2 div:first-child input').eq(1);
		if(accNum == 0){
			no.val("");
		}else{
			no.val(accNum);
		}
	}

}


// 결제 하기 모달
function payMent(orderInfoList){
    $.ajax({
	
		type : "post",
		type : "get",
		url : "finalOrderInfo.do",
		data : {foCode : $('.finalOrderCode').val()},
		dataType : "json",
		contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
		success : function(data){
		    
		    if(data.m_acc_bank == null && data.card_company ==null){
		    	if(confirm("등록된 결제 정보가 없습니다. \n결제정보 등록 후 이용 하여주세요\n등록 페이지로 이동 하시겠습니까?")){
		    		location.href = "customerCard.do?id=" + data.m_id  + ">";
		    	}else{
		    		location.href = "customerSujeTalk.do?id=" + data.m_id + "&page=1";
		    	}
		    }else{
		    	accNum = data.m_acc_num;
		    	accBank = data.m_acc_bank;
		    	cardNum = data.card_num;
		    	cardBank = data.card_company;
		    }
		    
		    console.log(cardNum);
		    
		    $("#foCode").val(data.fo_code); // 최종 주문 번호
		    
		    
		    $('.cateFirst option').each(function(){ //상품 카테고리 1
				if($(this).text() == data.cates_name){
				    $(this).prop('selected', true);
				}
		    });
		    
		    
		    $('.cateSecond option').each(function(){ //상품 카테고리 2
				if($(this).text() == data.catemm_name){
				    $(this).prop('selected', true);
				}
		    });
		    
		    $('#foCount').val(data.fo_num); // 수량
		    $('#foSize').val(data.fo_size); // 주문 사이즈
		    $('#foPrice').val(data.fo_sum);  //주문 금액
		   
		    if(data.deli_code == 7003){  //배송형태
				$('#payDelivery').prop('selected', true);
		    }else{
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
		    
		    if(data.deli_code == 7001){
		    	$('.payMentsubtitle').eq(2).text('');
		    	$('.payMentContentLefit3').remove();
		    	$('.payMentContentRight3').remove();
		    }
		    
//		    $('.payMentContentRight2 div input:nth-child(2)').val(data.)
//		    $('.payMentContentRight2 div input:nth-child(3)').val()
		    
		}
	
    });
    
};
 

 
 