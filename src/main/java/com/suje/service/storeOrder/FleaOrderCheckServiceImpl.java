package com.suje.service.storeOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeOrder.FleaOrderCheckDAO;
import com.suje.domain.storeOrder.FleaOrderCheckVO;
import com.suje.domain.storeOrder.StoreOrderCheckVO;
@Service
public class FleaOrderCheckServiceImpl implements FleaOrderCheckService {
	@Autowired
	FleaOrderCheckDAO dao;
	
	@Override
	public  List<FleaOrderCheckVO> getFleaOrderCheck(String id) {  
		
		 List<FleaOrderCheckVO> fleaorderCheck = dao.getFleaOrderCheck(id); // 단일 객체 대신 리스트로 받기
	        
	        return fleaorderCheck;
	}
	@Override
	public FleaOrderCheckVO getFleaDelivery(int fpCode) { 
		return dao.getFleaDelivery(fpCode);
	}
	@Override
	public void fleadeliverycomplete(int fpCode) {
		dao.fleadeliverycomplete(fpCode);
	}

}
