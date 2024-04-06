package com.suje.service.customer;

import java.util.List;
import java.util.Map;

import com.suje.domain.customer.EtcVO;
import com.suje.domain.customer.FinalOrderVO;
import com.suje.domain.customer.OrderListVO;
import com.suje.domain.customer.PurchaseVO;

public interface CustomerOrderService {

	public int getCountPageTotal(String id); // 전체 페이지 수를 구하는 메소드
	public List<OrderListVO> getOrderList(OrderListVO vo); // 페이지별 오더 리스트 구하는 메소드
	public List<EtcVO> getEtcList(int o_code); // 기타 요청 사항 불러오기
	public FinalOrderVO getFinalOrder(int storeOrderNO); // 최종 주문서 리스트 조회
	public FinalOrderVO getFinalOrderInfo(int foCode); // 최종 주문서 정보 조회
	public Map<String,Integer> insertPurchaseInfo(PurchaseVO vo); // 결제정보(결제방식 , 배송지) 입력
	public int insertEtcContent(EtcVO vo); // 주문 요청 사항 등록
}
