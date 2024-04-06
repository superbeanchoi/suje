package com.suje.dao.storeOrder;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeOrder.StoreOrderCheckVO;

@Repository
public class StoreCalculateDAOImpl implements StoreCalculateDAO{
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<StoreOrderCheckVO> getStoreCalculate(String id) { 
		
		return mybatis.selectList("StoreCalculateDAO.getStoreCalculate", id);
	}
}
