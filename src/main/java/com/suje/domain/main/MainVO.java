package com.suje.domain.main;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MainVO {
	
	//review
	public String rvp_spname, rv_content, m_id, rv_star, rv_like;
	
	//goods
	public String g_code, s_id, catems_code, g_content, g_date, g_redate, g_pname, g_spname, g_ppath, g_psize;
}
