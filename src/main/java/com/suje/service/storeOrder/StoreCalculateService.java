package com.suje.service.storeOrder;

import java.util.List;

import com.suje.domain.storeOrder.StoreOrderCheckVO;

public interface StoreCalculateService {
	public List<StoreOrderCheckVO> getStoreCalculate(String id);
}
