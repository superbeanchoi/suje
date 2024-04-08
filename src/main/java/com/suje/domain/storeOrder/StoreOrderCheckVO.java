package com.suje.domain.storeOrder;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StoreOrderCheckVO {
	int fo_code,cates_code ,deli_code,fo_sum,fo_num,o_code,catemm_code;
	String fo_date,fo_size,fo_etc,cates_name, deli_type,s_id,o_content, m_id, o_date;
	int p_code,p_sum;
	String p_date, p_ck, p_ck_date;
	int can_code;
	String can_date, can_why, can_state;
	int d_code;
	String d_name,d_tel,d_addr, d_memo,d_date,d_state;
	int rt_code;
	String rt_date, rt_why, rt_item_state, rt_state;

}
