package com.suje.dao.storeOrder;

import java.util.List;


import com.suje.domain.storeOrder.StoreOrderCheckVO;

public interface StoreOrderCheckDAO {
	public List<StoreOrderCheckVO> getStoreOrderCheck(String id);
	public List<StoreOrderCheckVO> getCancelOrderCheck(String id);
	public List<StoreOrderCheckVO> getReturnOrderCheck(String id);
	public StoreOrderCheckVO getStoreFinalOrder(int foCode); // 최종 주문서 정보 조회
	public StoreOrderCheckVO getStoreDelivery(int foCode);
	public void deliverycomplete(int pCode);
	public void updateCancelState(int cCode, String state);
	public StoreOrderCheckVO getCancel(int cCode);
}
