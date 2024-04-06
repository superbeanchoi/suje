package com.suje.service.customer;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.customer.CustomerPayDAO;
import com.suje.domain.customer.PayVO;


@Service
public class CustomerPayServiceImpl implements CustomerPayService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerPayServiceImpl.class);

	@Autowired
	CustomerPayDAO dao;

	@Override
	public Map<String,Integer> getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Service");
		return dao.getCountPageTotal(id);
	}
	
	@Override
	public Map<String,Object> getPayList(Map<String,Object> resultMap) {
		logger.info("getPayList // Service");
		return dao.getPayList(resultMap);
	}
	
	@Override
	public void insertFleaPayCancel(PayVO vo) {
		logger.info("=> flea결제취소요청 Service 실행");
		dao.insertFleaPayCancel(vo);
	}
	
	@Override
	public int insertOrderPayReturn(PayVO vo) {
		System.out.println("=> order 반품요청 Service 실행");
		return dao.insertOrderPayReturn(vo);
	}
	
	// 결제 취소 요청
	@Override
	public int insertOrderPayCancel(PayVO vo) {
		System.out.println("=> order 결제취소요청 Service 실행");
		return dao.insertOrderPayCancel(vo);
		
	}
	
	// 주문 제작 구매 확정 입력
	@Override
	public int insertPurchConfirm(String id, int payNo) {
		logger.info("insertPurchConfirm // Service");
		return dao.insertPurchConfirm(id,payNo);
	}
	// 플리마켓 구매 확정 입력 
	
	@Override
	public int updateFleaConfirm(String id, int payNo) {
		return dao.updateFleaConfirm(id,payNo);
	}
}
