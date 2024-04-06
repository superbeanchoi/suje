package com.suje.domain.customer;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PayVO {
	int p_code, fo_code, pt_code, p_sum, o_code, cates_code, deli_code, fo_sum, fo_num;
	String p_date, p_ck, p_ck_date, fo_date, fo_size, fo_etc, m_id, s_id, s_name;
	
	// 페이징 관련 메소드
	private int totalPageCount, firstNum, endNum;

	// 플리마켓 결제내역 VO
	int fp_code, f_code, fp_sum, fp_count;
	String fp_date, fp_ck, fp_ckdate, cates_name;
	
	// 플리마켓 결제취소 VO
	int pc_code;
	String pc_date, pc_why;
	
	// 주문제작 결제내역 반품 VO
	int rt_code;
	String rt_date, rt_why;
	
	// 주문제작 결제내역 결제취소 VO
	int can_code;
	String can_date, can_why;
	
}
