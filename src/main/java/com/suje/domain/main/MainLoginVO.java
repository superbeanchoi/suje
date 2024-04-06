package com.suje.domain.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainLoginVO {
	public String m_id, m_pass;
	public String s_id, s_pass;
	public String ma_id, ma_pass;
	
	//Member
	public String m_name, m_tel, m_email, m_date, m_birth, m_sex;
	
	//Store
	public String catem_code, s_name, s_text, s_bnum, s_email, s_tel, s_addr,
				  s_acc, s_bank, 
				  s_pname, s_spname, s_ppath, s_psize, 
				  s_back_pname, s_back_spname, s_back_ppath, s_back_psize;
	
	//store_avail
	public String sa_code, sa_ck, sa_content, sa_date;
}
