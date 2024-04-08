package com.suje.dao.storeOrder;

import java.util.List;

import com.suje.domain.storeOrder.StoreCalculateVO;

public interface StoreCalculateDAO {
	public List<StoreCalculateVO> getStoreCalculate(String id, int month);
}
