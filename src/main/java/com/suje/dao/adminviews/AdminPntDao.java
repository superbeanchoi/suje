package com.suje.dao.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminPntVO;

public interface AdminPntDao {

	public List<AdminPntVO> getAdminPnt(AdminPntVO vo);
	public int getTotalCountPage();
	public List<AdminPntVO> getStoreIdSearch(AdminPntVO vo);
	public void pntInsert(AdminPntVO vo);
	
}
