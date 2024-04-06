package com.suje.dao.adminviews;

import java.util.List;

import com.suje.domain.adminviews.AdminManageVO;

public interface AdminManageDao {
	public List<AdminManageVO> getStoreList(AdminManageVO vo);
	public int getTotalCountPage();
	public AdminManageVO getStoreInfo(AdminManageVO vo);
	public void storeAvailInsert(AdminManageVO vo);
}
