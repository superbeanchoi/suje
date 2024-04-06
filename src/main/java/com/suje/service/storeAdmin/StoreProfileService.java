package com.suje.service.storeAdmin;

import com.suje.dao.storeAdmin.StoreProfileDAO;
import com.suje.domain.storeAdmin.StoreProfileVO;


public interface StoreProfileService {
	
    public StoreProfileVO getStoreById(String id);
    void updateStoreProfile(StoreProfileVO updatedStoreProfile);
    public int getStoreCateCode(String id); // 스토어 카테고리 가져오기
}
