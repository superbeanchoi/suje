package com.suje.service.felaMarket;

import java.util.List;

import com.suje.domain.fleaMarket.FleaGoodsVO;

public interface FleaGoodsSUService {
	
	
	List<FleaGoodsVO> fleaGoodsListAll(FleaGoodsVO vo);
	FleaGoodsVO getFleaInfo(FleaGoodsVO vo);
	List<FleaGoodsVO> getFleaSubImgInfo(FleaGoodsVO vo);
	int modifyGoodsSU(FleaGoodsVO vo);
	int deleteGoodsSU(FleaGoodsVO vo);
}
