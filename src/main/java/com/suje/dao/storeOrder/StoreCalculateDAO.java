package com.suje.dao.storeOrder;

import java.util.List;

import com.suje.domain.storeOrder.StoreOrderCheckVO;

public interface StoreCalculateDAO {
	public List<StoreOrderCheckVO> getStoreCalculate(String id);
}
