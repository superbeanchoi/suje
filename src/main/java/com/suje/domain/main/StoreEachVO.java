package com.suje.domain.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreEachVO {
	//cate_sub
	public String cates_code, cates_name;
	//cate_mid
	public String catemm_code, catemm_name;
	//cate_main
	public String catem_code, catem_name;
	
	//Store
	public String s_id, s_name, s_text, s_bnum, s_email, s_tel, s_addr,
				  s_acc, s_bank, 
				  s_pname, s_spname, s_ppath, s_psize, 
				  s_back_pname, s_back_spname, s_back_ppath, s_back_psize;

	//review
	public String rv_code, rv_content, m_id, rv_star, rv_like, rvp_spname;
	
	//goods
	public String g_code, g_content, g_date, g_spname;
	
	//goods_sub
	public String gs_code, gs_spname;
	
	//goods_img
	public String g_img;
	
	//Store_noti
	public String noti_code, notit_name, noti_content, notir_date;
	
	//OrderInfo
	public String o_code, o_content, o_date;

}
