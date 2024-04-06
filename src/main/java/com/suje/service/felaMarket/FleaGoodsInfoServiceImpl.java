package com.suje.service.felaMarket;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.fleaMarket.FleaGoodsInfoDAO;
import com.suje.domain.fleaMarket.FleaGoodsVO;

@Service
public class FleaGoodsInfoServiceImpl implements FleaGoodsInfoService {

	@Autowired
	FleaGoodsInfoDAO dao;

	@Override
	public void insertFleaInfo(FleaGoodsVO vo) {
		System.out.println("=> 플리마켓 상품 등록 Service");
		dao.insertFleaInfo(vo); 
	}
	

	@Override
	public void insertFleaSubInfo(FleaGoodsVO vo) {
		System.out.println("=> 플리마켓 서브이미지 등록 Service");
		dao.insertFleaSubInfo(vo); 
	}
	
	@Override
	public String getFcodeSeq() {
		System.out.println("=> getFcodeSeq Service");
		return dao.getFcodeSeq(); 
	}

}
