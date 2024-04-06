package com.suje.service.customer;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.customer.CustomerOrderDAO;
import com.suje.domain.customer.EtcVO;
import com.suje.domain.customer.FinalOrderVO;
import com.suje.domain.customer.OrderListVO;
import com.suje.domain.customer.PurchaseVO;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerOrderServiceImpl.class);
	
	@Autowired
	CustomerOrderDAO orderDAO;
	
	// 전체 페이지 수를 구하는 메소드
	@Override
	public int getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Service");
		return orderDAO.getCountPageTotal(id);
	}
	
	// 페이지별 오더 리스트 구하는 메소드
	@Override
	public List<OrderListVO> getOrderList(OrderListVO vo) {
		logger.info("getOrderList // Service");
		return orderDAO.getOrderList(vo);
	}
	
	// 기타 요청 사항 불러오기
	public List<EtcVO> getEtcList(int o_code){
		logger.info("getEtcList // Service");
		return  orderDAO.getEtcList(o_code);
	}
	
	// 최종 주문서 리스트 조회
	@Override
	public FinalOrderVO getFinalOrder(int storeOrderNO) {
		logger.info("getFinalOrder // Service");
		return orderDAO.getFinalOrder(storeOrderNO);
	}
	
	// 최종 주문서 정보 조회
	@Override
	public FinalOrderVO getFinalOrderInfo(int foCode) {
		logger.info("getFinalOrder // Service");
		return orderDAO.getFinalOrderInfo(foCode);
	}
	
	// 결제정보(결제방식 , 배송지) 입력
	@Override
	public Map<String,Integer> insertPurchaseInfo(PurchaseVO vo) {
		logger.info("insertPurchaseInfo // Service");
		return orderDAO.insertPurchaseInfo(vo);
	}
	
	// 주문 요청 사항 등록
	@Override
	public int insertEtcContent(EtcVO vo) {
		logger.info("insertEtcContent // Service");
		return orderDAO.insertEtcContent(vo);
	}
}
