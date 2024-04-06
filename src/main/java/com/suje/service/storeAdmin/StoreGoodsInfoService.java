package com.suje.service.storeAdmin;

import com.suje.domain.storeAdmin.StoreGoodsSUVO;

public interface StoreGoodsInfoService {

	public void insertStoreInfo(StoreGoodsSUVO vo);
	public void insertStoreSubInfo(StoreGoodsSUVO vo);
	public String getGcodeSeq();
}
