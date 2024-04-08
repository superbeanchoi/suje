package com.suje.dao.storeOrder;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeOrder.StoreCalculateVO;

@Repository
public class StoreCalculateDAOImpl implements StoreCalculateDAO{
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<StoreCalculateVO> getStoreCalculate(String id, int month) { 
		System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
		System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
		System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
		System.out.println("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
		
		Map<String,Object> mapVal = new HashMap<String,Object>();
		
		mapVal.put("id", id);
		mapVal.put("month", month);
		
		return mybatis.selectList("StoreCalculateDAO.getStoreCalculate", mapVal);
		
	}
}
