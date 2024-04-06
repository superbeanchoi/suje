package com.suje.dao.customer;

import java.util.List;

import com.suje.domain.customer.MemberVO;
import com.suje.domain.customer.ReviewVO;

public interface CustomerInfoDAO {

	public MemberVO getCustomerInfo(String id);
	
	public int updateMypageInfo(MemberVO vo);
	
	public List<ReviewVO> getCustomerReview(String id);
	
}
