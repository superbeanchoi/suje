package com.suje.service.customer;

import java.util.List;
import java.util.Map;

import com.suje.domain.customer.ReviewVO;

public interface CustomerReviewService {
	
	public int getCountPageTotal(String id);
	
	public Map<String,Object> getCustomerReview(Map<String,Object> resultMap);
	
	public Map<String,Integer> reviewInsert(ReviewVO reviewVO); // 리뷰 등록

}
