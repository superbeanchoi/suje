package com.suje.dao.customer;

import java.util.List;
import java.util.Map;

import com.suje.domain.customer.PayVO;

public interface CustomerPayDAO {
	
	public int getCountPageTotal(String id);
	
	public int getFleaCountPageTotal(String id);
	
	public Map<String,Object> getPayList(Map<String,Object> resultMap);
	
	public void insertFleaPayCancel(PayVO vo);
	
	public void insertOrderPayReturn(PayVO vo);
	
	public void insertOrderPayCancel(PayVO vo);
	
}
