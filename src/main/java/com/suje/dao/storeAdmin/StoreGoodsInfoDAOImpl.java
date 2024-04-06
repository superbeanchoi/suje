package com.suje.dao.storeAdmin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeAdmin.StoreGoodsSUVO;

@Repository
public class StoreGoodsInfoDAOImpl implements StoreGoodsInfoDAO{

	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public void insertStoreInfo(StoreGoodsSUVO vo) {
		System.out.println("=> 스토어 상품 등록 Service");
		mybatis.insert("StoreGoodsInfoDAO.insertStoreInfo", vo);
	}
	

	@Override
	public void insertStoreSubInfo(StoreGoodsSUVO vo) {
		System.out.println("=> 스토어 서브이미지 등록 Service");
		mybatis.insert("StoreGoodsInfoDAO.insertStoreSubInfo", vo);
	}
	
	@Override
	public String getGcodeSeq() {
		System.out.println("=> getGcodeSeq Service");
		return mybatis.selectOne("StoreGoodsInfoDAO.getGcodeSeq");
	}
	
}