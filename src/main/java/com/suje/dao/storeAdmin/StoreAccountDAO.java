package com.suje.dao.storeAdmin;

import com.suje.domain.storeAdmin.StoreAccountVO;

public interface StoreAccountDAO {
	
	public StoreAccountVO getAccountById(String id);
	void updateAccount(StoreAccountVO updateAccount);
}
