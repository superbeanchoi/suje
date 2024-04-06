package com.suje.dao.storeAdmin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeAdmin.StoreProfileVO;

@Repository
public class StoreProfileDAOImpl implements StoreProfileDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	@Override
	public StoreProfileVO getStoreById(String id) {
		return mybatis.selectOne("storeProfileDAO.getStoreById", id);
	}

	@Override
	public void updateStoreProfile(StoreProfileVO updatedStoreProfile) {
		System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
		System.out.println(updatedStoreProfile.getS_spname());
		mybatis.update("storeProfileDAO.updateStoreProfile", updatedStoreProfile);
	}
	
	// 스토어 카테고리 가져오기
	@Override
	public int getStoreCateCode(String id) {
		return mybatis.selectOne("storeProfileDAO.getCateMianStore",id);
	}
}
