package com.suje.dao.storeAdmin;

import java.util.List;

import com.suje.domain.storeAdmin.StoreGoodsSUVO;

public interface StoreGoodsSUDAO {

	 List<StoreGoodsSUVO> storeGoodsMainPage(StoreGoodsSUVO vo);
	 StoreGoodsSUVO getGoodsInfo(StoreGoodsSUVO vo);
	 List<StoreGoodsSUVO> getGoodsSubImgInfo(StoreGoodsSUVO vo);

	int updateGoodsSU(StoreGoodsSUVO vo);
	int deleteStoreGoodsSU(StoreGoodsSUVO vo);
}
