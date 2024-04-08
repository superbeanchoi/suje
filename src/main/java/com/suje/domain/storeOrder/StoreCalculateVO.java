package com.suje.domain.storeOrder;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class StoreCalculateVO {
	/*
	 * int p_code,p_sum; String p_date, p_ck, p_ck_date; int fp_code, fp_sum; String
	 * fp_date, fp_ckdate;
	 */
	String title, pdate,ckdate, s_id;
	int code,sum,commission,commission_sum,total_commission_sum;
}
