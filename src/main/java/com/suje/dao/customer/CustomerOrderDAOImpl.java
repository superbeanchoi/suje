package com.suje.dao.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.customer.EtcVO;
import com.suje.domain.customer.FinalOrderVO;
import com.suje.domain.customer.OrderListVO;
import com.suje.domain.customer.PurchaseVO;

@Repository
public class CustomerOrderDAOImpl implements CustomerOrderDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerOrderDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	// 전체 페이지 구하는 메소드
	@Override
	public int getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Repository");
		return mybatis.selectOne("customerOrderDAO.getOrderListCount",id);
	}
	
	// 페이지별 주문 내역 리스트
	@Override
	public List<OrderListVO> getOrderList(OrderListVO vo) {
		logger.info("getOrderList // Repository");
		return mybatis.selectList("customerOrderDAO.getOrderList",vo);
	}
	
	// 기타 요청 사항 불러오기
	@Override
	public List<EtcVO> getEtcList(int o_code) {
		logger.info("getEtcList // Repository");
		return mybatis.selectList("customerOrderDAO.getEtcList",o_code);
	}
	
	// 최종 주문서 리스트 조회
	@Override
	public FinalOrderVO getFinalOrder(int storeOrderNO) {
		logger.info("getFinalOrder // Repository");
		return mybatis.selectOne("customerOrderDAO.getFinalOrder",storeOrderNO);
	}
	
	// 최종 주문서 정보 조회
	@Override
	public FinalOrderVO getFinalOrderInfo(int foCode) {
		logger.info("getFinalOrderInfo // Repository");
		return mybatis.selectOne("customerOrderDAO.getFinalOrderInfo",foCode);
	}
	
	// 결제정보(결제방식 , 배송지) 입력
	@Override
	public Map<String,Integer> insertPurchaseInfo(PurchaseVO vo) {
		logger.info("insertPurchaseInfo // Repository");
		
		Map<String,Integer> stateMap = new HashMap<String, Integer>();
		
		if(vo.getD_name() == null) {
			int payState = mybatis.insert("customerOrderDAO.insertPayInfo",vo);
			stateMap.put("payState", payState);
		} else {
			int payState = mybatis.insert("customerOrderDAO.insertPayInfo",vo);
			int deliveryState = mybatis.insert("customerOrderDAO.insertDeliveryInfo",vo);
			stateMap.put("payState", payState);
			stateMap.put("deliveryState", deliveryState);
		}
		
		return stateMap;
	}
	
	// 주문 요청 사항 등록
	@Override
	public int insertEtcContent(EtcVO vo) {
		logger.info("insertPurchaseInfo // Repository");
		return mybatis.insert("customerOrderDAO.insertEtcContent",vo);
	}
	
	
}
