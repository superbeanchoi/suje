package com.suje.service.customer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suje.controller.customer.CustomerAccountController;
import com.suje.dao.customer.CustomerAccountDAO;
import com.suje.domain.customer.AccountVO;

@Service
public class CustomerAccountServiceImpl implements CustomerAccountService {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerAccountServiceImpl.class);
	
	@Autowired
	CustomerAccountDAO dao;
	
	@Override
	public AccountVO getAccount(String id) {
		return dao.getAccount(id);
	}
	
	@Override
	public void updateCAccount(AccountVO updateCAccount) {
		dao.updateCAccount(updateCAccount);
	}
	
	@Override
	public void insertAccount(AccountVO vo) {
		dao.insertAccount(vo);
	}
	
}
