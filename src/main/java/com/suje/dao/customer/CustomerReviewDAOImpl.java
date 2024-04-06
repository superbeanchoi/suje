package com.suje.dao.customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.customer.ReviewVO;
import com.suje.service.customer.CustomerReviewServiceImpl;

@Repository
public class CustomerReviewDAOImpl implements CustomerReviewDAO {

	private static final Logger logger = LoggerFactory.getLogger(CustomerReviewServiceImpl.class);
	
	@Autowired
	SqlSessionTemplate mybatis;
	
	@Override
	public int getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Repository");
		return mybatis.selectOne("CustomerReviewDAO.getTotalPageCount", id);
	}
	
	@Override
	public Map<String,Object> getCustomerReview(Map<String,Object> resultMap) {
		logger.info("getCustomerReview // Repository");

		Map<String,Object> finalResultMap = new HashMap<String, Object>();

		List<ReviewVO> customerReview = mybatis.selectList("CustomerReviewDAO.getCustomerReview", resultMap);
	
		// 맵에 저장 하여 return
		finalResultMap.put("customerReview", customerReview);
		
		return finalResultMap;
	}
	
	@Override
	public Map <String,Integer> reviewInsert(ReviewVO reviewVO) {
		
		int reviewMainState = mybatis.insert("CustomerReviewDAO.reviewInsertMain",reviewVO);
		int reviewSubState = mybatis.insert("CustomerReviewDAO.reviewInsertSub",reviewVO);
		
		Map <String,Integer> stateMap = new HashMap<String, Integer>();
		
		stateMap.put("reviewMainState", reviewMainState);
		stateMap.put("reviewSubState", reviewSubState);
		
		return stateMap;
	}

}
