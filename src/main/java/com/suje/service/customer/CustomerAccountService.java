package com.suje.service.customer;

import com.suje.domain.customer.AccountVO;

public interface CustomerAccountService {
	
	public AccountVO getAccount(String id);
	
	public void updateCAccount(AccountVO updateCAccount);
	
	public void insertAccount(AccountVO vo);
	
}
