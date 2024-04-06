package com.suje.service.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminPntVO;

public interface AdminPntService {

	public List<AdminPntVO> getAdminPnt(AdminPntVO vo);
	public int getTotalCountPage();
	public List<AdminPntVO> getStoreIdSearch(AdminPntVO vo);
	public void pntInsert(AdminPntVO vo);
	
}
