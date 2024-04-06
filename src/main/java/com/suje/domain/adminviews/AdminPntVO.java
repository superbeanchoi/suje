package com.suje.domain.adminviews;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AdminPntVO {

	//degrade
	public String de_code, ma_id, s_id, de_score, de_why, de_date, de_score_sum;
	
	//Page
	public int firstNum, endNum, rnum;
	
	// store
	public String s_name;
	
}
