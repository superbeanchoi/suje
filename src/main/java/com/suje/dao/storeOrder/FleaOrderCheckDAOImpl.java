package com.suje.dao.storeOrder;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.storeOrder.FleaOrderCheckVO;
import com.suje.domain.storeOrder.StoreOrderCheckVO;
@Repository
public class FleaOrderCheckDAOImpl implements FleaOrderCheckDAO{
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public List<FleaOrderCheckVO> getFleaOrderCheck(String id) {
		
		return mybatis.selectList("FleaOrderCheckDAO.getFleaOrderCheck", id);
	}
	
	@Override
	public FleaOrderCheckVO getFleaDelivery(int fpCode) {
		return mybatis.selectOne("FleaOrderCheckDAO.getFleaDelivery",fpCode);
	}
	@Override
	public void fleadeliverycomplete(int fpCode) {
		mybatis.update("FleaOrderCheckDAO.fleadeliverycomplete", fpCode);
	}
}
