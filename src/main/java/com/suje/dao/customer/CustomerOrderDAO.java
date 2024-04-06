package com.suje.dao.customer;

import java.util.List;
import java.util.Map;

import com.suje.domain.customer.EtcVO;
import com.suje.domain.customer.FinalOrderVO;
import com.suje.domain.customer.OrderListVO;
import com.suje.domain.customer.PurchaseVO;

public interface CustomerOrderDAO {
	
	public int getCountPageTotal(String id);
	public List<OrderListVO> getOrderList(OrderListVO vo);
	public List<EtcVO> getEtcList(int o_code);
	public FinalOrderVO getFinalOrder(int storeOrderNO);
	public FinalOrderVO getFinalOrderInfo(int foCode); // 최종 주문서 정보 조회
	public Map<String,Integer> insertPurchaseInfo(PurchaseVO vo); // 결제정보(결제방식 , 배송지) 입력
	public int insertEtcContent(EtcVO vo); // 주문 요청 사항 등록
}
