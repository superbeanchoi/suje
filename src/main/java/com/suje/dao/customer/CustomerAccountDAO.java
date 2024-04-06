package com.suje.dao.customer;

import com.suje.domain.customer.AccountVO;
import com.suje.domain.customer.CardVO;

public interface CustomerAccountDAO {

	public AccountVO getAccount(String id);
	
	public void updateCAccount(AccountVO updateCAccount);
	
	public void insertAccount(AccountVO vo);
	
}
