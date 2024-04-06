package com.suje.service.storeAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeAdmin.StoreProfileDAO;
import com.suje.domain.storeAdmin.StoreProfileVO;

@Service
public class StoreProfileServiceImpl implements StoreProfileService {

	@Autowired
	StoreProfileDAO dao;

	@Override
	public StoreProfileVO getStoreById(String id) {
		return dao.getStoreById(id);

	}

	@Override
	public void updateStoreProfile(StoreProfileVO updatedStoreProfile) {
		dao.updateStoreProfile(updatedStoreProfile);
	}
	
	// 스토어 카테고리 가져오기
	@Override
	public int getStoreCateCode(String id) {
		return dao.getStoreCateCode(id);
	}
}
