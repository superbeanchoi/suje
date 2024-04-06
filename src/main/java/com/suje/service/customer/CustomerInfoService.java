package com.suje.service.customer;

import com.suje.domain.customer.MemberVO;

public interface CustomerInfoService {

	public MemberVO getCustomerInfo(String id);
	
	public int updateMypageInfo(MemberVO vo);
	
}
