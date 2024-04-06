package com.suje.service.storeOrder;

import java.util.List;

import com.suje.domain.storeOrder.FleaOrderCheckVO;
import com.suje.domain.storeOrder.StoreOrderCheckVO;

public interface FleaOrderCheckService {
	public List<FleaOrderCheckVO> getFleaOrderCheck(String id);
	public FleaOrderCheckVO getFleaDelivery(int fpCode);
	public void fleadeliverycomplete(int fpCode);
}
