package com.suje.dao.storeOrder;

import java.util.List;

import com.suje.domain.storeOrder.FleaOrderCheckVO;
import com.suje.domain.storeOrder.StoreOrderCheckVO;

public interface FleaOrderCheckDAO {
	public List<FleaOrderCheckVO> getFleaOrderCheck(String id);
	public FleaOrderCheckVO getFleaDelivery(int fpCode);
	public void fleadeliverycomplete(int fpCode);
}
