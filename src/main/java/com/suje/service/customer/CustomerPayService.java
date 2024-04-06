package com.suje.service.customer;

import java.util.List;
import java.util.Map;

import com.suje.domain.customer.PayVO;

public interface CustomerPayService {

	public Map<String,Integer> getCountPageTotal(String id);
	
	public Map<String,Object> getPayList(Map<String,Object> resultMap);
	
	public void insertFleaPayCancel(PayVO vo);
	
	public int insertOrderPayReturn(PayVO vo);
	
	public int insertOrderPayCancel(PayVO vo);  // 결제 취소 등록
	
	public int insertPurchConfirm(String id, int payNo); // 구매 확정 입력

}
