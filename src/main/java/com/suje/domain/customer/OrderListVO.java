package com.suje.domain.customer;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class OrderListVO {
	
	private int o_code;
	private String o_content, m_id, o_date, s_id, s_name, s_spname;
	
	// 페이징 관련 메소드
	private int totalPageCount,firstNum,endNum;
	
	
}
