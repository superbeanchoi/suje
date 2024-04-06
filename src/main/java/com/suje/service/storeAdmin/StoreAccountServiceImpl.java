package com.suje.service.storeAdmin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.dao.storeAdmin.StoreAccountDAO;
import com.suje.domain.storeAdmin.StoreAccountVO;

@Service
public class StoreAccountServiceImpl implements StoreAccountService {

	@Autowired
	StoreAccountDAO dao;

	@Override
	public StoreAccountVO getAccountById(String id) {
		return dao.getAccountById(id);

	}

	@Override
	public void updateAccount(StoreAccountVO updateAccount) {
		dao.updateAccount(updateAccount);
	}
	
}
