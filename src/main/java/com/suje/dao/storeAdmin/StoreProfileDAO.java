package com.suje.dao.storeAdmin;

import org.apache.ibatis.annotations.Param;

import com.suje.domain.storeAdmin.StoreProfileVO;

public interface StoreProfileDAO {
	
	public StoreProfileVO getStoreById(String id);
	void updateStoreProfile(StoreProfileVO updatedStoreProfile);
	public int getStoreCateCode(String id); // 스토어 카테고리 가져오기
}
