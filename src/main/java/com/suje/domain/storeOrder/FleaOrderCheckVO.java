package com.suje.domain.storeOrder;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FleaOrderCheckVO {
	int fp_code, fp_sum,fp_count; 
	String f_content,fp_date,fp_ck,fp_ckdate,s_id;
	int fd_code;
	String fd_name,fd_tel,fd_addr,fd_memo,fd_date,fd_state;
}
