package com.suje.service.storeAdmin;

import java.util.List;

import com.suje.domain.storeAdmin.StoreGoodsSUVO;

public interface StoreGoodsSUService {

    List<StoreGoodsSUVO> storeGoodsMainPage(StoreGoodsSUVO vo);
    StoreGoodsSUVO getGoodsInfo(StoreGoodsSUVO vo);
	List<StoreGoodsSUVO> getGoodsSubImgInfo(StoreGoodsSUVO vo);
    
	int updateGoodsSU(StoreGoodsSUVO vo);
	int deleteStoreGoodsSU(StoreGoodsSUVO vo);
}
