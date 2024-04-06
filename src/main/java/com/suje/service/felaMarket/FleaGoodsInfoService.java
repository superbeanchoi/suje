package com.suje.service.felaMarket;


import com.suje.domain.fleaMarket.FleaGoodsVO;

public interface FleaGoodsInfoService {

	public void insertFleaInfo(FleaGoodsVO vo);
	public void insertFleaSubInfo(FleaGoodsVO vo);
	public String getFcodeSeq();
	
	  
}
