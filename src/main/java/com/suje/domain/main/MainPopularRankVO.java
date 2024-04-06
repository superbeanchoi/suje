package com.suje.domain.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainPopularRankVO {

	//cate_main
	public String catem_code, catem_name;
	
	//Store
	public String s_id, s_name, s_text, s_bnum, s_email, s_tel, s_addr,
				  s_acc, s_bank, 
				  s_pname, s_spname, s_ppath, s_psize, 
				  s_back_pname, s_back_spname, s_back_ppath, s_back_psize;

	//goods
	public String g_code, g_content, g_date, g_spname;
	
	//rank
	public String rnum, payCount;
}
