package com.suje.service.storeOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeOrder.StoreCalculateDAO;
import com.suje.domain.storeOrder.StoreOrderCheckVO;

@Service
public class StoreCalculateServiceImpl implements StoreCalculateService{
	@Autowired
	StoreCalculateDAO dao;
	
	@Override
	public  List<StoreOrderCheckVO> getStoreCalculate(String id) { 
		
		 List<StoreOrderCheckVO> orderCheck = dao.getStoreCalculate(id); // 단일 객체 대신 리스트로 받기
	        
	        return orderCheck;
	}
}
