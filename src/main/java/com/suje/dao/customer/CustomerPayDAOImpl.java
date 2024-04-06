package com.suje.dao.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.customer.PayVO;

@Repository
public class CustomerPayDAOImpl implements CustomerPayDAO {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerPayDAOImpl.class);
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public int getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Repository");
		return mybatis.selectOne("CustomerOrderListDAO.getCountPageTotal", id);
	}
	
	@Override
	public int getFleaCountPageTotal(String id) {
		logger.info("getFleaCountPageTotal // Repository");
		return mybatis.selectOne("CustomerOrderListDAO.getFleaCountPageTotal", id);
	}
	
	@Override
	public Map<String,Object> getPayList(Map<String,Object> resultMap) {
		logger.info("getPayList // Repository");
//		return mybatis.selectList("CustomerOrderListDAO.getPayList", vo);
		Map<String,Object> finalResultMap = new HashMap<String, Object>();
		// 1. 
		List<PayVO> orderList = mybatis.selectList("CustomerOrderListDAO.getPayList", resultMap);
		// 2.
		List<PayVO> fleaList = mybatis.selectList("CustomerOrderListDAO.getFleaPayList", resultMap);
		// 3.
		// 4.
		
		// 5. 맵에 저장 하여 return
		finalResultMap.put("orderList",orderList);
		finalResultMap.put("fleaList",fleaList);
		
		return finalResultMap;
	}
	
	@Override
	public void insertFleaPayCancel(PayVO vo) {
		logger.info("flea 결제취소요청 Repository = {}",vo.getFp_code());
		mybatis.insert("CustomerOrderListDAO.insertFleaPayCancel", vo);
		logger.info("insertFleaPayCancel Repository 성공");
	}

	@Override
	public void insertOrderPayReturn(PayVO vo) {
		logger.info("order 반품요청 Repository = {}",vo.getP_code());
		mybatis.insert("CustomerOrderListDAO.insertOrderPayReturn", vo);
		logger.info("insertOrderPayReturn Repository 성공");
	}
	
	@Override
	public void insertOrderPayCancel(PayVO vo) {
		logger.info("order 결제취소요청 Repository = {}",vo.getP_code());
		mybatis.insert("CustomerOrderListDAO.insertOrderPayCancel", vo);
		logger.info("insertOrderPayCancel Repository 성공");
	}
	
	
}
