package com.suje.service.storeOrder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeOrder.StoreCalculateDAO;
import com.suje.domain.storeOrder.StoreCalculateVO;

@Service
public class StoreCalculateServiceImpl implements StoreCalculateService {
	@Autowired
	StoreCalculateDAO dao;

	@Override
	public List<StoreCalculateVO> getStoreCalculate(String id, int month) {

		List<StoreCalculateVO> calculate = dao.getStoreCalculate(id, month); // 단일 객체 대신 리스트로 받기

		return calculate;
	}
}
