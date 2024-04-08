package com.suje.service.storeOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeOrder.StoreOrderCheckDAO;
import com.suje.domain.storeOrder.StoreOrderCheckVO;

@Service
public class StoreOrderCheckServiceImpl implements StoreOrderCheckService {
	@Autowired
	StoreOrderCheckDAO dao;
	
	@Override
	public  List<StoreOrderCheckVO> getStoreOrderCheck(String id) { 
		
		 List<StoreOrderCheckVO> orderCheck = dao.getStoreOrderCheck(id); // 단일 객체 대신 리스트로 받기
	        
	        return orderCheck;
	}
	@Override
	public  List<StoreOrderCheckVO> getCancelOrderCheck(String id) { 
		
		 List<StoreOrderCheckVO> cancel = dao.getCancelOrderCheck(id); // 단일 객체 대신 리스트로 받기
	        
	        return cancel;
	}
	@Override
	public  List<StoreOrderCheckVO> getReturnOrderCheck(String id) { 
		
		 List<StoreOrderCheckVO> returnOrder = dao.getReturnOrderCheck(id); // 단일 객체 대신 리스트로 받기
	        
	        return returnOrder;
	}
	// 최종 주문서 정보 조회
	@Override
	public StoreOrderCheckVO getStoreFinalOrder(int foCode) { 
		return dao.getStoreFinalOrder(foCode);
	}
	@Override
	public StoreOrderCheckVO getStoreDelivery(int foCode) { 
		return dao.getStoreDelivery(foCode);
	}
	
	@Override
	public void deliverycomplete(int pCode) {
		dao.deliverycomplete(pCode);
	}

	@Override
	public void updateCancelState(int cCode, String state) {
		dao.updateCancelState(cCode, state);
	}
	
	@Override
	public StoreOrderCheckVO getCancel(int cCode) { 
		return dao.getCancel(cCode);
	}
	
	
}
