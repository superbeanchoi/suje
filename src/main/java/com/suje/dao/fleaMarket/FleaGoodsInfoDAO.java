package com.suje.dao.fleaMarket;


import com.suje.domain.fleaMarket.FleaGoodsVO;

public interface FleaGoodsInfoDAO {
	
	public void insertFleaInfo(FleaGoodsVO vo);
	public void insertFleaSubInfo(FleaGoodsVO vo);
	public String getFcodeSeq();
	
}
