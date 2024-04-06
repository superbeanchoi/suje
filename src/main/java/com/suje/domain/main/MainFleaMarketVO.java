package com.suje.domain.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainFleaMarketVO {

	//flea
	public String f_code, s_id, catems_code, f_ck, f_sum, f_num, f_content, f_date, f_redate, f_pname, f_spname, f_ppath, f_psize;
	
	//flea_sub
	public String fs_code, fs_pname, fs_spname, fs_ppath, fs_psize;
	
	//cate_sub
	public String cates_code, cates_name;
	//cate_mid
	public String catemm_code, catemm_name;
	//cate_main
	public String catem_code, catem_name;
	
	//Store
	public String s_name, s_text, s_bnum, s_email, s_tel, s_addr,
				  s_acc, s_bank, 
				  s_pname, s_spname, s_ppath, s_psize, 
				  s_back_pname, s_back_spname, s_back_ppath, s_back_psize;

	//Page
	public int firstNum, endNum, rnum;
	
	//Limit
	public String orderBy;
	
	//Member
	public String m_id, m_name, m_tel;
	
	//card
	public String card_company, card_num;
	
	//member_acc
	public String m_acc_num, m_acc_bank;
	
	//flea_pay
	public String fp_code, pt_code, fp_sum, fp_count, fp_date, fp_ck, fp_ckdate;
	
	//flea_delivery
	public String fd_code, fd_name, fd_tel, fd_addr, fd_memo, fd_date, fd_state;
	
}
