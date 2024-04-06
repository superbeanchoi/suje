package com.suje.domain.main;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MainRealTimeReviewVO {
	// page
	private int firstNum, endNum, rnum;
	// photo_riview_test 
	private String rvp_psize, rvp_pname, rvp_spname, rvp_ppath, rvp_code, rv_code;
	// riview_test 
	private String rv_content, rv_date, rv_like, rv_star, p_code;
	// 개인회원정보
	private String m_id;
	private String m_pass;
	private String m_birth;
	private String m_sex;
	private String m_tel;
	private String m_email;
	private String m_date;
	private String m_name;

	// 업체 정보
	private String s_id;
	private String s_pass;
	private String s_name;
	private String s_bnum;
	private String s_tel;
	private String s_addr;
	private String s_email;
	private String catem_code;
	private String s_acc;
	private String s_bank;
	private String s_pname;
	private String s_spname;
	private String s_ppath;
	private String s_psize;
	private String s_back_pname;
	private String s_back_spname;
	private String s_back_ppath;
	private String s_back_psize;
	private String s_text;

	// 주문요청정보
	private String o_code;
	private String o_content;
	private String o_date;

	// 최종주문정보
	private String fo_code;
	private String fo_date;
	private String fo_sum;
	private String fo_num;
	private String fo_size;
	private String cates_code;
	private String fo_etc;
	private String deli_code;

	// 물품결제정보
	
	private String p_date;
	private String pt_code;
	private String p_sum;
	private String p_ck;
	private String p_ck_date;
}
