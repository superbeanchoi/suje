package com.suje.service.customer;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.controller.customer.CustomerReviewController;
import com.suje.dao.customer.CustomerReviewDAO;
import com.suje.domain.customer.ReviewVO;

@Service
public class CustomerReviewServiceImpl implements CustomerReviewService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerReviewServiceImpl.class);
	
	@Autowired
	CustomerReviewDAO dao;
	
	@Override
	public int getCountPageTotal(String id) {
		logger.info("getCountPageTotal // Service");
		return dao.getCountPageTotal(id);
	}
	
	@Override
	public Map<String,Object> getCustomerReview(Map<String,Object> resultMap) {
		logger.info("getCustomerReview // Service");
		return dao.getCustomerReview(resultMap);
	}

	@Override
	public Map<String,Integer> reviewInsert(ReviewVO reviewVO) {
		logger.info("reviewInsert // Service");
		return dao.reviewInsert(reviewVO);
	}
	
}
