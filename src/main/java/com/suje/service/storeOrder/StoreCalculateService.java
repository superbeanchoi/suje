package com.suje.service.storeOrder;

import java.util.List;

import com.suje.domain.storeOrder.StoreCalculateVO;

public interface StoreCalculateService {
	public List<StoreCalculateVO> getStoreCalculate(String id, int month);
}
