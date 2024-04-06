package com.suje.service.storeAdmin;

import com.suje.domain.storeAdmin.StoreAccountVO;
import com.suje.domain.storeAdmin.StoreProfileVO;


public interface StoreAccountService {
	
    public StoreAccountVO getAccountById(String id);
    void updateAccount(StoreAccountVO updateAccount);
}
