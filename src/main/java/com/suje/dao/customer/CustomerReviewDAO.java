package com.suje.dao.customer;

import java.util.List;
import java.util.Map;

import com.suje.domain.customer.ReviewVO;

public interface CustomerReviewDAO {
	
	public int getCountPageTotal(String id); // 페이지 전체 행수 계산
	
	public Map<String,Object> getCustomerReview(Map<String,Object> resultMap); // 페이지 조건에 맞는 리스트 출력
	
	public Map <String,Integer> reviewInsert(ReviewVO reviewVO); // 리뷰 등록
}
