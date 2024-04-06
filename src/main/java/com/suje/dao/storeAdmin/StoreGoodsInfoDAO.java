package com.suje.dao.storeAdmin;

import com.suje.domain.storeAdmin.StoreGoodsSUVO;

public interface StoreGoodsInfoDAO {
	public void insertStoreInfo(StoreGoodsSUVO vo);
	public void insertStoreSubInfo(StoreGoodsSUVO vo);
	public String getGcodeSeq();
}
