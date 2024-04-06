package com.suje.domain.customer;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PurchaseVO {
	
	// pay 테이블 관련
	int p_code, fo_code, pt_code, p_sum;
	String p_date;
	
	// delivery 테이블 관련
	int d_code;
	String d_name,d_tel,d_addr,d_memo,m_id;
	
}
