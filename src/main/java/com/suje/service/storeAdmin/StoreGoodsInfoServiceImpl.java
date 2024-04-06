package com.suje.service.storeAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeAdmin.StoreGoodsInfoDAO;
import com.suje.domain.fleaMarket.FleaGoodsVO;
import com.suje.domain.storeAdmin.StoreGoodsSUVO;

@Service
public class StoreGoodsInfoServiceImpl implements StoreGoodsInfoService {

	@Autowired
	StoreGoodsInfoDAO dao;

	@Override
	public void insertStoreInfo(StoreGoodsSUVO vo) {
		System.out.println("=> 플리마켓 상품 등록 Service");
		dao.insertStoreInfo(vo); 
	}
	

	@Override
	public void insertStoreSubInfo(StoreGoodsSUVO vo) {
		System.out.println("=> 플리마켓 서브이미지 등록 Service");
		dao.insertStoreSubInfo(vo); 
	}
	
	@Override
	public String getGcodeSeq() {
		System.out.println("=> getFcodeSeq Service");
		return dao.getGcodeSeq(); 
	}
	
	
}
