package com.suje.domain.storeOrder;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StoreOrderListVO {

	private int o_code;
	private String o_content, m_id, o_date, s_id, m_name;
	
	// 페이징 관련 메소드
	private int totalPageCount,firstNum,endNum;
	
	//요청사항 내용 관련 메소드
	private String content;
	
//	// Final_Order 테이블 관련
//	private int fo_code, fo_sum, fo_num, cates_code, deli_code;
//	private String fo_date, fo_size,  fo_etc;
//	
//	private String catemm_name, cates_name;
}
