package com.suje.service.storeOrder;

import java.util.List;

import com.suje.domain.storeOrder.StoreOrderCheckVO;

public interface StoreOrderCheckService {
	public List<StoreOrderCheckVO> getStoreOrderCheck(String id);
	public List<StoreOrderCheckVO> getCancelOrderCheck(String id);
	public List<StoreOrderCheckVO> getReturnOrderCheck(String id);
	public StoreOrderCheckVO getStoreFinalOrder(int foCode);
	public StoreOrderCheckVO getStoreDelivery(int foCode);
	public void deliverycomplete(int pCode);
	public void updateCancelState(int cCode, String state);
	public StoreOrderCheckVO getCancel(int cCode);
	public void updateReturnState(int rtCode, String state);
	public StoreOrderCheckVO getReturn(int rtCode);
}
